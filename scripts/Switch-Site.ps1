function Switch-Site {
    param (
        [Parameter(Mandatory=$true)][string]$SiteName,
        [Parameter(Mandatory=$true)][ScriptBlock]$Block
    )

    $site = [Sitecore.Sites.SiteContext]::GetSite($SiteName)
    $switcher = New-Object Sitecore.Sites.SiteContextSwitcher($site)
    try {
        & $Block
    }
    finally {
        $switcher.Dispose()
    }
}