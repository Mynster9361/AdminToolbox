function Invoke-RWinSta {
    <#
    .DESCRIPTION
    Wrapper function for rwinsta to get rdp sessions

    .Parameter ID
    specify the id of the user account for the session being closed

    .Parameter Server
    specify the target server to run rwinsta against

    .EXAMPLE
    Find remote sessions

    Invoke-RWinSta -ID 2 -Server name.domain.tld

    .Link
    Get-TerminalSessions
    Remove-TerminalSessions
    Invoke-QWinSta
    #>

    [CmdletBinding()]
    [Alias('rwin')]
    Param (
        [Parameter(Position = 1, Mandatory = $true)]$ID,
        [Parameter(Position = 2, Mandatory = $true)]$Server
    )

    rwinsta.exe $ID /server:$Server
}