function Disable-Security {
    param (
        [Parameter(Mandatory=$true)][ScriptBlock]$Block
    )
    
    $disabler = New-Object Sitecore.SecurityModel.SecurityDisabler
    try {
        & $Block
    }
    finally {
        $disabler.Dispose()
    }
}

Set-Alias -Name sudo -Value Disable-Security -Option None