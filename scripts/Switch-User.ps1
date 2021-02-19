function Switch-User {
    param (
        [Parameter(Mandatory=$true)][string]$UserName,
        [Parameter(Mandatory=$true)][ScriptBlock]$Block
    )

    $switcher = New-Object Sitecore.Security.Accounts.UserSwitcher($UserName, $true)
    try {
        & $Block
    }
    finally {
        $switcher.Dispose()
    }
}