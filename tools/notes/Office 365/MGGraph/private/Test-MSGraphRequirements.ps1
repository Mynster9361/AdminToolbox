<#
.DESCRIPTION
Test and verify that Microsoft Graph requirements are met for the Admintoolbox.Office365 Module

.PARAMETER Scopes
Specify an array of scopes that must be imported prior to the function continueing.

.EXAMPLE
Test-MSGraphRequirements -scopes 'Reports.Read.All'

Used in the function Get-msgMFAStatus
#>

function Test-MSGraphRequirements {

    [CmdletBinding()]
    Param (
        [string[]]$scopes
    )

    # Test for required module and prompt for install
    $query = Get-Module Microsoft.Graph -ListAvailable
    if ($null -eq $query) {
        try {
            Import-Module Microsoft.Graph.Authentication
        }
        catch {
            Write-Warning "Required Microsoft Graph Module not found. First install the needed module or abort the function using ctrl + c"
            Install-Module -Name Microsoft.Graph -AllowPrerelease -Force -AllowClobber
        }
    }

    # Sets the MSGraph profile to beta if not already set. This is required by some functions
    if ((get-mgprofile).name -ne 'beta') {
        Select-MgProfile -Name "beta" -verbose
    }

    # Test that required scopes are imported and import them if they are not.
    $importedscopes = (Get-MgContext).scopes
    foreach ($scope in $scopes) {
        if ($importedscopes -notcontains $scope) {
            Connect-MgGraph -Scopes $scopes
        }
    }
}