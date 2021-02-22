function Switch-User {
    param (
        [Parameter(Mandatory=$true)][string]$Name,
        [Parameter(Mandatory=$true)][ScriptBlock]$Script
    )

    $switcher = New-Object Sitecore.Security.Accounts.UserSwitcher($Name, $true)
    try {
        & $Script
    }
    finally {
        $switcher.Dispose()
    }
}