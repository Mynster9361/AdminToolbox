function Join-Domain {
    <#
    .DESCRIPTION
    Joins pc to a domain

    .PARAMETER Domain
    Domain the computer or server is being joined to

    .EXAMPLE
    Join-Domain -domain company.com

    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]$domain
    )

    Add-Computer -DomainName $domain -Credential $credentials
}