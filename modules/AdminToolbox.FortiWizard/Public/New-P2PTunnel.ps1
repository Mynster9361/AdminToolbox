#Required by functions
#New-FormTunnel

Function New-P2PTunnel {
    <#
    .Description
    This is a CLI wizard that generates a new IPSec Tunnel Config and related objects.

    .Parameter dhgroups
    This is the Diffie-Hellman group or groups used by the Phase 1 and Phase 2 interfaces. If providing multiple values input them in comma delimited format.

    ex: "5", "14"

    *These are the available DH Groups
    32 31 30 29 28 27
    21 20 19 18 17 16
    15 14 5 2 1

    .Parameter LANInterface
    This is the name of the local or lan interface.

    .Parameter LocalAddressCIDRs
    This is the Address Object CIDRs that will be created for the local side of the tunnel.

    ex: "192.168.1.0/24", "10.100.0/24"

    .Parameter PeerAddress
    This is the public IP Address for the remote side of the tunnel.

    .Parameter Proposal
    This is the encryption proposal or proposals for the Phase 1 and Phase 2 interfaces. Provide in space delimited format.

    ex: aes256-sha512 aes256-sha1

    *These are the available proposals that can be used.
    des-md5          des-md5
    des-sha1         des-sha1
    des-sha256       des-sha256
    des-sha384       des-sha384
    des-sha512       des-sha512
    3des-md5         3des-md5
    3des-sha1        3des-sha1
    3des-sha256      3des-sha256
    3des-sha384      3des-sha384
    3des-sha512      3des-sha512
    aes128-md5       aes128-md5
    aes128-sha1      aes128-sha1
    aes128-sha256    aes128-sha256
    aes128-sha384    aes128-sha384
    aes128-sha512    aes128-sha512
    aes192-md5       aes192-md5
    aes192-sha1      aes192-sha1
    aes192-sha256    aes192-sha256
    aes192-sha384    aes192-sha384
    aes192-sha512    aes192-sha512
    aes256-md5       aes256-md5
    aes256-sha1      aes256-sha1
    aes256-sha256    aes256-sha256
    aes256-sha384    aes256-sha384
    aes256-sha512    aes256-sha512

    .Parameter PSK
    This is the Private Shared Key for the Phase 1 and Phase 2 interfaces.

    .Parameter RemoteAddressCIDRs
    This is the Address Object CIDRs that will be created for the remote side of the tunnel.

    ex: "192.168.1.0/24", "10.100.10.0/24"

    .Parameter Services
    Specify the Service or services that will be applied to the Firewall Policy for this tunnel.

    ex: "RDP/3389/TCP", "piov/5060-5061/UDP"

    .Parameter TTL
    This is the Time to Live for the Phase 1 and Phase 2 proposals.

    .Parameter TunnelName
    This is the name for the VPN Tunnel. Maximum 15 Alphanumeric characters.

    .Parameter WANInterface
    This is the name of the WAN interface that the tunnel will be built on.

    .Example
    $params = @{
        dhgroups           = "5", "14"
        LANInterface       = "port1"
        LocalAddressCIDRs  = "192.168.10.0/24", "192.168.11.0/24", "192.168.12.0/24"
        PeerAddress        = "56.98.75.32"
        Proposal           = "aes256-sha512"
        PSK                = "dfdayb%^4356456"
        RemoteAddressCIDRs = "10.10.240.0/24", "10.10.241.0/24", "10.10.242.0/24"
        Services           = "RDP/3389/TCP", "DNS/53/UDP"
        TTL                = "28800"
        TunnelName         = "TestTunnel"
        WANInterface       = "wan3"
    }
    New-P2PTunnel @params

        This example will generate a VPN tunnel config.

    .Example
    New-SSHSession -computername 192.168.0.1
    $params = @{
        dhgroups           = "5", "14"
        LANInterface       = "port1"
        LocalAddressCIDRs  = "192.168.10.0/24", "192.168.11.0/24", "192.168.12.0/24"
        PeerAddress        = "56.98.75.32"
        Proposal           = "aes256-sha512"
        PSK                = "dfdayb%^4356456"
        RemoteAddressCIDRs = "10.10.240.0/24", "10.10.241.0/24", "10.10.242.0/24"
        Services           = "RDP/3389/TCP", "DNS/53/UDP"
        TTL                = "28800"
        TunnelName         = "TestTunnel"
        WANInterface       = "wan3"
    }
    $command = New-P2PTunnel @params
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    This example generates an SSH session and invokes the output of this function against that session.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
    #>

    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Provide the DH Group or Groups in space delimeted format for the Phase 1 and Phase 2 proposals.")]
        [string[]]$dhgroups,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Lan Interface Name")]
        $LANInterface,
        [Parameter(Mandatory = $true, HelpMessage = "Provide an array of CIDR Addresses that will be used by this Tunnel. ex: ""192.168.1.0/24"", ""10.100.12.0/24""")]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        [string[]]$LocalAddressCIDRs,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Public IP for the Tunnel Peer")]
        $PeerAddress,
        [Parameter(Mandatory = $true, HelpMessage = "
des-md5          des-md5
des-sha1         des-sha1
des-sha256       des-sha256
des-sha384       des-sha384
des-sha512       des-sha512
3des-md5         3des-md5
3des-sha1        3des-sha1
3des-sha256      3des-sha256
3des-sha384      3des-sha384
3des-sha512      3des-sha512
aes128-md5       aes128-md5
aes128-sha1      aes128-sha1
aes128-sha256    aes128-sha256
aes128-sha384    aes128-sha384
aes128-sha512    aes128-sha512
aes192-md5       aes192-md5
aes192-sha1      aes192-sha1
aes192-sha256    aes192-sha256
aes192-sha384    aes192-sha384
aes192-sha512    aes192-sha512
aes256-md5       aes256-md5
aes256-sha1      aes256-sha1
aes256-sha256    aes256-sha256
aes256-sha384    aes256-sha384
aes256-sha512    aes256-sha512

Type in the encryption selection to use for the Phase 1 and Phase 2 Proposals in a space delimited format.
")]
        $Proposal,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Private Key for the Tunnel")]
        $PSK,
        [Parameter(Mandatory = $true, HelpMessage = "Provide an array of CIDR Addresses that will be used by this Tunnel. ex: ""192.168.1.0/24"", ""10.100.12.0/24""")]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        [string[]]$RemoteAddressCIDRs,
        [Parameter(Mandatory = $false, HelpMessage = "Specify services in the following format. ex: ""RDP/3389/TCP"", ""piov/5060-5061/UDP""")]
        [string[]]$Services,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the Phase 1 and Phase 2 Time to Live.")]
        $TTL,
        [Parameter(Mandatory = $true, HelpMessage = "Provide a VPN Tunnel Name with a maximum 15 AlphaNumeric characters.")]
        [ValidateLength(1, 15)]
        $TunnelName,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the name of the public interface for this tunnel.")]
        $WANInterface
    )

    begin {
        $ErrorActionPreference = 'Stop'
        $dhgroups = $dhgroups -join " "
    }

    process {
        #Create Local Address Objects
        [int]$max = $LocalAddressCIDRs.Count
        $script:LocalAddressObjects = for ($i = 0; $i -lt $max; $i++) {
            [PSCustomObject]@{
                Name = "VPN_" + $TunnelName + "_Local_" + $i
                CIDR = $LocalAddressCIDRs[$i]
            }
        }

        $ConfLocalAddressObjects = Foreach ($AddressObject in $script:LocalAddressObjects) {
            New-AddressObject -AddressName $AddressObject.Name -CIDR $AddressObject.CIDR
        }

        #Create Remote Address Objects
        [int]$max = $RemoteAddressCIDRs.Count
        $script:RemoteAddressObjects = for ($i = 0; $i -lt $max; $i++) {
            [PSCustomObject]@{
                Name = "VPN_" + $TunnelName + "_Remote_" + $i
                CIDR = $RemoteAddressCIDRs[$i]
            }
        }

        $ConfRemoteAddressObjects = Foreach ($AddressObject in $script:RemoteAddressObjects) {
            New-AddressObject -AddressName $AddressObject.Name -CIDR $AddressObject.CIDR
        }

        #Create Local Address Group
        $LocNames = ($script:LocalAddressObjects).name -join " "
        $LocalGroupName = "vpn_" + "$TunnelName" + "_Local"
        $ConfLocalAddressGroups = New-AddressGroup -AddressNames $LocNames -GroupName $LocalGroupName

        #Create Remote Address Group
        $RemNames = ($script:RemoteAddressObjects).name -join " "
        $RemoteGroupName = "vpn_" + "$TunnelName" + "_Remote"
        $ConfRemoteAddressGroups = New-AddressGroup -AddressNames $RemNames -GroupName $RemoteGroupName

        #Create Phase 1 Proposal
        $params = @{
            TunnelName  = $TunnelName
            Interface   = $WanInterface
            Proposal    = $Proposal
            dhgroups    = $dhgroups
            PeerAddress = $PeerAddress
            PSK         = $PSK
            TTL         = $TTL
        }
        $ConfPhase1 = New-P2PPhase1Interface @params

        #Create Phase 2 Proposals
        [int]$localcount = $script:LocalAddressObjects.count
        [int]$remotecount = $script:RemoteAddressObjects.count
        [int]$Script:PhaseCount = 0

        $ConfPhase2 = for ($i = 0; $i -lt $localcount; $i++) {
            $locals = ($script:LocalAddressObjects).name
            $sourceaddressname = $locals[$i]
            for ($ii = 0; $ii -lt $remotecount; $ii++) {
                $remotes = ($script:RemoteAddressObjects).name
                $params = @{
                    DestinationAddressName = $remotes[$ii]
                    dhgroups               = $dhgroups
                    PhaseName              = $TunnelName + " P2 " + $Script:PhaseCount
                    Proposal               = $Proposal
                    SourceAddressName      = $sourceaddressname
                    TTL                    = $TTL
                    TunnelName             = $TunnelName
                }
                New-P2PPhase2Interface @params
                $Script:phasecount++
            }
        }

        #Create Static Routes
        $ConfStaticRoute = New-StaticRouteTunnel -TunnelName $TunnelName -DestinationAddressName $RemoteGroupName

        #Create Services
        $ConfService = if ($services) {

            foreach ($service in $services) {
                $split = $service -split "/"

                if ($split[2] -eq 'TCP') {
                    $Params = @{
                        ServiceName  = [string]"vpn_" + $tunnelname + [string]"_" + $split[0]
                        TCPPortRange = $split[1]
                    }
                }

                if ($split[2] -eq 'UDP') {
                    $Params = @{
                        ServiceName  = [string]"vpn_" + $tunnelname + [string]"_" + $split[0]
                        UDPPortRange = $split[1]
                    }
                }
                New-ServiceObject @Params
            }
        }

        #Create Service Groups
        $ConfServiceGroup = if ($services) {
            $proc = $services -split "/"
            [int]$count = $proc.count
            $svcs = for ($i = 0; $i -lt $count) {
                [string]"vpn_" + $tunnelname + [string]"_" + $proc[$i]
                $i = $i + [int]3
            }
            $svcresult = $svcs -join " "
            $svcgroupname = "vpn_" + $tunnelname
            New-ServiceGroup -ServiceGroupName $svcgroupname -Members $svcresult
        }

        #Create Firewall Policies
        if ($null -eq $svcresult) {
            $svcgroupname = [string]"ALL"
        }
        $ConfFirewallPolicy = New-FirewallPolicyTunnel -TunnelName $TunnelName -SourceInterfaceName $LANInterface -SourceAddress $LocalGroupName -DestinationAddress $RemoteGroupName -service $svcgroupname
    }

    end {
        Write-Host "If there is no text between the Omission lines, then you have redirected the output." -ForegroundColor Green
        Write-Host "----------OMIT THE ABOVE FROM USE IN YOUR CONFIG SCRIPT----------" -ForegroundColor Magenta
        Write-Output $ConfLocalAddressObjects
        Write-Output $ConfRemoteAddressObjects
        Write-Output $ConfLocalAddressGroups
        Write-Output $ConfRemoteAddressGroups
        Write-Output $ConfPhase1
        Write-Output $ConfPhase2
        Write-Output $ConfStaticRoute
        Write-Output $ConfService
        Write-Output $ConfServiceGroup
        Write-Output $ConfFirewallPolicy
        Write-Host "----------OMIT THE BELOW FROM USE IN YOUR CONFIG SCRIPT----------" -ForegroundColor Magenta
        Write-Host "DON'T FORGET TO ADD ANY REQUIRED CORE ROUTES!" -ForegroundColor Yellow

        $ErrorActionPreference = 'continue'
    }
}