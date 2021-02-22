function Switch-Site {
    param (
        [Parameter(Mandatory=$true)][string]$Name,
        [Parameter(Mandatory=$true)][ScriptBlock]$Script
    )

    $site = [Sitecore.Sites.SiteContext]::GetSite($Name)
    $switcher = New-Object Sitecore.Sites.SiteContextSwitcher($site)
    try {
        & $Script
    }
    finally {
        $switcher.Dispose()
    }
}