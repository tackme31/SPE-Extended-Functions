function Switch-Database {
    param (
        [Parameter(Mandatory=$true)][string]$DatabaseName,
        [Parameter(Mandatory=$true)][ScriptBlock]$Block
    )

    $database = [Sitecore.Data.Database]::GetDatabase($DatabaseName)
    $switcher = New-Object Sitecore.Data.DatabaseSwitcher($database)
    try {
        & $Block
    }
    finally {
        $switcher.Dispose()
    }
}