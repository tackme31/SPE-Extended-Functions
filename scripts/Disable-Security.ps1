function Disable-Security {
    param (
        [Parameter(Mandatory=$true)][ScriptBlock]$Script
    )
    
    $disabler = New-Object Sitecore.SecurityModel.SecurityDisabler
    try {
        & $Script
    }
    finally {
        $disabler.Dispose()
    }
}

Set-Alias -Name sudo -Value Disable-Security -Option None