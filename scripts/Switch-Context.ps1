function Switch-Context {
    param (
        [Parameter(Mandatory=$false)][String]$Database,
        [Parameter(Mandatory=$false)][String]$Language,
        [Parameter(Mandatory=$false)][String]$Site,
        [Parameter(Mandatory=$false)][String]$User,
        [Parameter(Mandatory=$false)][switch]$NoSecurity,
        [Parameter(Mandatory=$true)][ScriptBlock]$Script
    )
    $databaseObj = if ($Database) { [Sitecore.Data.Database]::GetDatabase($Database) }
    $languageObj = if ($Language) { [Sitecore.Globalization.Language]::Parse($Language) }
    $siteObj = if ($Site) { [Sitecore.Sites.SiteContext]::GetSite($Site) }
    
    $databaseSwitcher = if ($databaseObj) { New-Object Sitecore.Data.DatabaseSwitcher($databaseObj) }
    $languageSwitcher = if ($languageObj) { New-Object Sitecore.Globalization.LanguageSwitcher($languageObj) }
    $siteSwitcher = if ($siteObj) { New-Object Sitecore.Sites.SiteContextSwitcher($siteObj) }
    $userSwitcher = if ($User) { New-Object Sitecore.Security.Accounts.UserSwitcher($User, $true) }
    $securityDisabler = if ($NoSecurity) { New-Object Sitecore.SecurityModel.SecurityDisabler }

    try {
        & $Script
    }
    finally {
        if ($databaseSwitcher) { $databaseSwitcher.Dispose() }
        if ($languageSwitcher) { $languageSwitcher.Dispose() }
        if ($siteSwitcher) { $siteSwitcher.Dispose() }
        if ($userSwitcher) { $userSwitcher.Dispose() }
        if ($securityDisabler) { $securityDisabler.Dispose() }          
    }
}