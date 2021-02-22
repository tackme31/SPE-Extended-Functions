function Get-ItemOrAdd {
    param (
        [Parameter(Mandatory=$true)][string]$Path,
        [Parameter(Mandatory=$true)][Sitecore.Data.ID]$TemplateID
    )
    
    if (Test-Path $Path) {
        return Get-Item $Path
    }
    
    $parentPath = $Path -replace "/[^/]+$",""
    if (-not (Test-Path $parentPath)) {
        return $null
    }
    
    $parentItem = Get-Item $parentPath
    $itemName = $Path -replace "^.+/",""
    $template = New-Object Sitecore.Data.TemplateID($TemplateID)
    return $parentItem.Add($itemName, $template)
}