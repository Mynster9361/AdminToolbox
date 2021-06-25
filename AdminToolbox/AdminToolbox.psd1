#
# Module manifest for module 'AdminToolbox'
#
# Generated by: Taylor Lee
#
# Generated on: 6/25/2021
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'AdminToolboxManifest.psm1'

# Version number of this module.
ModuleVersion = '8.5.1.0'

# Supported PSEditions
CompatiblePSEditions = 'Desktop', 'Core'

# ID used to uniquely identify this module
GUID = '012e042a-bcab-400b-b8be-affeab1e3ec8'

# Author of this module
Author = 'Taylor Lee'

# Company or vendor of this module
CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) Taylor Lee. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Parent module for a collection of modules. These modules are varied in their tasks. Review required modules or the project site to better understand this modules capabilities.'

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
RequiredModules = @(@{ModuleName = 'AdminToolbox.ActiveDirectory'; ModuleVersion = '1.4.0.0'; }, 
               @{ModuleName = 'AdminToolbox.EndpointManagement'; ModuleVersion = '4.5.0.0'; }, 
               @{ModuleName = 'AdminToolbox.Exchange'; ModuleVersion = '1.6.0.0'; }, 
               @{ModuleName = 'AdminToolbox.FFTools'; ModuleVersion = '4.5.0.0'; }, 
               @{ModuleName = 'AdminToolbox.FileManagement'; ModuleVersion = '1.5.0.0'; }, 
               @{ModuleName = 'AdminToolbox.Fun'; ModuleVersion = '1.3.1.0'; }, 
               @{ModuleName = 'AdminToolbox.Networking'; ModuleVersion = '2.7.0.0'; }, 
               @{ModuleName = 'AdminToolbox.Office365'; ModuleVersion = '2.3.0.1'; }, 
               @{ModuleName = 'AdminToolbox.Remoting'; ModuleVersion = '1.6.1.0'; }, 
               @{ModuleName = 'AdminToolbox.VMWareAutomate'; ModuleVersion = '4.4.0.0'; }, 
               @{ModuleName = 'ImportExcel'; ModuleVersion = '7.0.1'; }, 
               @{ModuleName = 'PSEventViewer'; ModuleVersion = '1.0.17'; }, 
               @{ModuleName = 'PSNmap'; ModuleVersion = '1.3.1'; })

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
FunctionsToExport = 'Get-All', 'Get-Info', 'Get-Full', 'Start-Application', 
               'Get-ModuleAliases', 'Invoke-Show', 'Open-AdminMMC', 'Start-Cmder', 
               'Install-PSPortableLight', 'Install-PSPortable'

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
        Tags = '365', 'Active', 'ActiveDirectory', 'Automate', 'Application', 'Directory', 
               'Exchange', 'FileManagement', 'Iperf', 'Network', 'Networking', 
               'NetworkScan', 'Office', 'Office365', 'OpenSSH', 'PC', 'PCSetup', 'Print', 
               'Printer', 'Remoting', 'Robocopy', 'Setup', 'SSH', 'vmware', 'Windows'

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/TheTaylorLee/AdminToolbox'

        # A URL to an icon representing this module.
        IconUri = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'

        # ReleaseNotes of this module
        ReleaseNotes = 'The release notes can be found in the ChangeLog.md file at the scriptroot path.'

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://github.com/TheTaylorLee/AdminToolbox/issues'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

