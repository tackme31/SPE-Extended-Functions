function Edit-Item {
    param (
        [Parameter(Mandatory=$true)][Sitecore.Data.Items.Item]$Item,
        [Parameter(Mandatory=$true)][ScriptBlock]$Script
    )
    
    try {
        $Item.Editing.BeginEdit()
        & $Script
        $Item.Editing.EndEdit()
    }
    catch {
        $Item.Editing.CancelEdit()
    }
}

Set-Alias -Name edit -Value Edit-Item -Option None