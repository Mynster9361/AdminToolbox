Function New-DialUPTunnelRemoteNAT {
    <#
    .Description
    This is a CLI wizard that generates a new Dialup IPSec Tunnel Config and related objects. This will be for the firewall whose public IP is static and whose end does not sit behind another NAT firewall.

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

    .Parameter PeerID
    This is a unique 3 numeric character long Identifer for this tunnel.

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

    ex: "192.168.1.0/24", "10.100.0/24"

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
       PeerID             = "187"
       Proposal           = "aes256-sha512"
       PSK                = "dfdayb%^4356456"
       RemoteAddressCIDRs = "10.10.240.0/24", "10.10.241.0/24", "10.10.242.0/24"
       Services           = "RDP/3389/TCP", "DNS/53/UDP"
       TTL                = "28800"
       TunnelName         = "TestTunnel"
       WANInterface       = "wan3"
    }
    New-DialUPTunnelRemoteNAT @params

    This example will generate a Dial-up VPN tunnel config.

    .Example
    New-SSHSession -computername 192.168.0.1
    $params = @{
       dhgroups           = "5", "14"
       LANInterface       = "port1"
       LocalAddressCIDRs  = "192.168.10.0/24", "192.168.11.0/24", "192.168.12.0/24"
       PeerID             = "187"
       Proposal           = "aes256-sha512"
       PSK                = "dfdayb%^4356456"
       RemoteAddressCIDRs = "10.10.240.0/24", "10.10.241.0/24", "10.10.242.0/24"
       Services           = "RDP/3389/TCP", "DNS/53/UDP"
       TTL                = "28800"
       TunnelName         = "TestTunnel"
       WANInterface       = "wan3"
    }
    $command = New-DialUPTunnelRemoteNAT @params
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
        [Parameter(Mandatory = $true, HelpMessage = "Specify a unique 3 digit numeric peer ID to use for the tunnel.")]
        $PeerID,
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
        $ErrorActionPreference = 'stop'
        $dhgroups = $dhgroups -join " "
    }

    process {
        #        #Create Address Objects
        #        Write-Host "Creating Address Objects Config" -ForegroundColor Cyan
        #        $query = Read-Host "Do you want to create one or more Address Objects? (yes/no)"
        #        $AddressObjects = while ($query -eq 'yes') {
        #            if ($query -eq 'yes') {
        #                New-AddressObject
        #            }
        #            $query = Read-Host "Do you want to create more Address Objects? (yes/no)"
        #        }
        #        Write-Host $AddressObjects
        #
        #        #Create Address Group
        #        Write-Host "Creating Address Groups Config" -ForegroundColor Cyan
        #        $query2 = Read-Host "Do you want to create one or more Address Groups? (yes/no)"
        #        $AddressGroups = while ($query2 -eq 'yes') {
        #            if ($query2 -eq 'yes') {
        #                New-AddressGroup
        #            }
        #            $query2 = Read-Host "Do you want to create more Address Groups? (yes/no)"
        #        }
        #        Write-Host $AddressGroups
        #
        #        #Create Phase 1 Interface
        #        Write-Host "Creating Phase 1 Interface Config" -ForegroundColor Cyan
        #        $Phase1 = New-P2PPhase1InterfaceDialUp -Static
        #        Write-Host $Phase1
        #
        #        #Create Phase 2 Interfaces
        #        Write-Host "Creating Phase 2 Interfaces Config" -ForegroundColor Cyan
        #        $query3 = 'yes'
        #        $Phase2 = while ($query3 -eq 'yes') {
        #            if ($query3 -eq 'yes') {
        #                New-P2PPhase2Interface
        #            }
        #            $query3 = Read-Host "Do you want to create more Phase 2 Interfaces? (yes/no)"
        #        }
        #        Write-Host $Phase2
        #
        #        #Create Static Routes
        #        Write-Host "Creating Blackhole Static Routes" -ForegroundColor Cyan
        #        $query4 = 'yes'
        #        $StaticRoute = while ($query4 -eq 'yes') {
        #            if ($query4 -eq 'yes') {
        #                New-StaticRouteDialupTunnel
        #            }
        #            $query4 = Read-Host "Do you want to create more static routes? (yes/no)"
        #        }
        #        Write-Host $StaticRoute
        #
        #        #Create Services
        #        Write-Host "Creating Services Config" -ForegroundColor Cyan
        #        $query5 = Read-Host "Do you need to create new service objects for use with the firewall policies? (yes/no)"
        #        $Service = while ($query5 -eq 'yes') {
        #            if ($query5 -eq 'yes') {
        #                $Protocol = Read-Host "Specify if this is a TCP or UDP Service (TCP/UDP)"
        #
        #                if ($Protocol -eq 'TCP') {
        #                    $Params = @{
        #                        ServiceName  = Read-Host "Specify the ServiceName (Service Name)"
        #                        TCPPortRange = Read-Host "Specify the port or Port range. eg 443 or 443-445 (Port)"
        #                    }
        #                }
        #                if ($Protocol -eq 'UDP') {
        #                    $Params = @{
        #                        ServiceName  = Read-Host "Specify the ServiceName (Service Name)"
        #                        UDPPortRange = Read-Host "Specify the port or Port range. eg 443 or 443-445 (Port)"
        #                    }
        #                }
        #
        #                New-ServiceObject @Params
        #            }
        #            $query5 = Read-Host "Do you want to create more services? (yes/no)"
        #        }
        #        Write-Host $Service
        #
        #        #Create Service Groups
        #        Write-Host "Creating Service Groups Config" -ForegroundColor Cyan
        #        $query6 = Read-Host "Do you need to create a service group for use with Firewall Policies? (yes/no)"
        #        $ServiceGroup = while ($query6 -eq 'yes') {
        #            if ($query6 -eq 'yes') {
        #                New-ServiceGroup
        #            }
        #            $query6 = Read-Host "Do you want to create more service groups? (yes/no)"
        #        }
        #        Write-Host $ServiceGroup
        #
        #        #Create Firewall Policies
        #        Write-Host "Creating Firewall Policy Config" -ForegroundColor Cyan
        #        $FirewallPolicy = New-FirewallPolicyTunnel
        #        Write-Host $FirewallPolicy
    }

    end {
        Write-Host "If there is no output between the Omission delimiters, that is because you redirected the output elsewhere. Like into a variable." -ForegroundColor Green
        Write-Host "----------OMIT THE ABOVE FROM USE IN YOUR CONFIG SCRIPT----------" -ForegroundColor Magenta
        #Write-Output $AddressObjects
        #Write-Output $AddressGroups
        #Write-Output $Phase1
        #Write-Output $Phase2
        #Write-Output $StaticRoute
        #Write-Output $Service
        #Write-Output $ServiceGroup
        #Write-Output $FirewallPolicy
        Write-Host "----------OMIT THE BELOW FROM USE IN YOUR CONFIG SCRIPT----------" -ForegroundColor Magenta
        Write-Host "DON'T FORGET TO ADD ANY REQUIRED CORE ROUTES!" -ForegroundColor Yellow

        $ErrorActionPreference = 'continue'
    }
}