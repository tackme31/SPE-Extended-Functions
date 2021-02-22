function Disable-Security {
    [alias("sudo")]
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