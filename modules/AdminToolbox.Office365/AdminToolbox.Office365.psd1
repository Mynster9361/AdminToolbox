#
# Module manifest for module 'AdminToolbox.Office365'
#
# Generated by: Taylor Lee
#
# Generated on: 4/20/2023
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'AdminToolbox.Office365Manifest.psm1'

# Version number of this module.
ModuleVersion = '3.0.13'

# Supported PSEditions
CompatiblePSEditions = 'Desktop', 'Core'

# ID used to uniquely identify this module
GUID = 'd8b7f255-6910-4eed-a8c1-ccff79d036bb'

# Author of this module
Author = 'Taylor Lee'

# Company or vendor of this module
CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) Taylor Lee. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Functions for working with Office365 and Azure modules'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(@{ModuleName = 'ImportExcel'; ModuleVersion = '7.0.1'; })

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Get-Office365', 'Connect-Office365', 'Convert-MailboxToShared', 
               'Get-AuthPolicy', 'New-AuthPolicy', 'Set-AuthPolicy', 'Invoke-Sync365', 
               'Set-365GroupVisibility', 'Unblock-Quarantine', 'Get-Quarantine', 
               'Set-Subscription', 'Invoke-PowerState', 'Get-VMDetails', 
               'Get-TenantDiagrams', 'Invoke-EXOSharedSession', 
               'Enable-MailboxAccess', 'Clear-TeamsCache', 
               'Get-DistributionGroupMembers'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Office365', 'Office', '365'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/TheTaylorLee/AdminToolbox/'

        # A URL to an icon representing this module.
        IconUri = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'

        # ReleaseNotes of this module
        ReleaseNotes = 'Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt'

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

