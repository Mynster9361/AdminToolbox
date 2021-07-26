#Used By New-DialUPTunnelDynamic
#Used By New-DialUPTunnelStatic

Function New-StaticRouteDialupTunnel {
    <#
    .Description
    Creates Static routes for a tunnel.
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Destination Address Object or Group Name.")]
        $DestinationAddressName
    )

    Write-Output "
config router static
    edit 0
        set distance 254
        set blackhole enable
        set dstaddr ""$DestinationAddressName""
    next
end"
}