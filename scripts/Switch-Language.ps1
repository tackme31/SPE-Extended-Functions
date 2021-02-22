function Switch-Language {
    param (
        [Parameter(Mandatory=$true)][string]$Name,
        [Parameter(Mandatory=$true)][ScriptBlock]$Script
    )

    $language = [Sitecore.Globalization.Language]::Parse($Name)
    $switcher = New-Object Sitecore.Globalization.LanguageSwitcher($language)
    try {
        & $Script
    }
    finally {
        $switcher.Dispose()
    }
}