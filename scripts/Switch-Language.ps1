function Switch-Language {
    param (
        [Parameter(Mandatory=$true)][string]$LanguageName,
        [Parameter(Mandatory=$true)][ScriptBlock]$Block
    )

    $language = [Sitecore.Globalization.Language]::Parse($LanguageName)
    $switcher = New-Object Sitecore.Globalization.LanguageSwitcher($language)
    try {
        & $Block
    }
    finally {
        $switcher.Dispose()
    }
}