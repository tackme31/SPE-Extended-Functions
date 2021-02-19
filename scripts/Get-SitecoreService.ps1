function Get-SitecoreService {
    param (
        [Parameter(Mandatory=$true)][System.Reflection.TypeInfo]$Type
    )
    
    [Sitecore.DependencyInjection.ServiceLocator]::ServiceProvider.GetService($Type)
}

Set-Alias -Name di -Value Get-SitecoreService -Option None