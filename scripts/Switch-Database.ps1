function Switch-Database {
    param (
        [Parameter(Mandatory=$true)][string]$Name,
        [Parameter(Mandatory=$true)][ScriptBlock]$Script
    )

    $database = [Sitecore.Data.Database]::GetDatabase($Name)
    $switcher = New-Object Sitecore.Data.DatabaseSwitcher($database)
    try {
        & $Script
    }
    finally {
        $switcher.Dispose()
    }
}