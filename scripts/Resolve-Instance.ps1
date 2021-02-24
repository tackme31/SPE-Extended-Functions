function Resolve-Instance {
    param (
        [Parameter(Mandatory=$true)][string]$TypeName
    )
    
    $block = if ($TypeName.StartsWith("[") -and $TypeName.EndsWith("]")) {
        [ScriptBlock]::Create($TypeName)
    }
    else {
        [ScriptBlock]::Create("[$TypeName]")
    }

    $type = & $block
    
    [Sitecore.DependencyInjection.ServiceLocator]::ServiceProvider.GetService($type)
}