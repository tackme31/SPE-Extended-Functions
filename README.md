# SPE Extended Functions
The utility functions for Sitecore PowerShell.

## Usage
1. Download the package from [here](https://github.com/xirtardauq/SPE-Extended-Functions/releases) and install it.
1. Declare `Import-Function SpeExtendedFunctions` in the top of you script.
1. Now you can use the additional functions.

## Functions
### Disable-Security (Alias: sudo)
Apply the `SecurityDisabler` in the specified script block.

```powershell
Disable-Security {
    # Able to call unauthorized process here.
}
```

### Edit-Item (Alias: edit)
Allow item editing in the specified script block.

```powershell
$item = Get-Item "/sitecore/content/Home"

Edit-Item $item {
    $item["Title"] = "New Title"
}

echo $item["Title"] # => Returns "New Title".
```

### Get-ItemOrAdd
Get an item by path if exist. When the item is not found, create the item with specified template.

```powershell
$template = Get-Item "/sitecore/templates/Sample/Sample Item"

Get-ItemOrAdd -Path "/sitecore/content/Home/New Item" -TemplateID $template.ID
```

### Get-MediaContent
Get the `Media` field value of a media item as string.

```powershell
$media = Get-Item "/sitecore/media library/My CSV file"

Get-MediaContent -Item $media # => Returns the csv content attached to $media.
```

### Get-SitecoreService (Alias: di)
Resolve an instance from interface registered in service provider.

```powershell
Get-SitecoreService -Type ([Sitecore.XA.Foundation.Search.Services.IIndexResolver])
# => Returns an instance of the IndexResolver.
```

### Set-FinalWorkflow
Assign a final workflow to a specified item.

```powershell
$item = Get-Item "/sitecore/content/Home"

Set-FinalWorkflow -Item $item # => Assigned the Approved state.
```

### Set-InitialWorkflow
Assign a initial workflow to a specified item.

```powershell
$item = Get-Item "/sitecore/content/Home"

Set-FinalWorkflow -Item $item # => Assigned the Draft state.
```

### Set-MediaContent
Set a string value to the `Media` field of a media item.

```powershell
$media = Get-Item "/sitecore/media library/My CSV file"

Set-MediaContent -Item $media -Content "New Content"

Get-MediaContent -Item $media # => Returns "New Content"
```

### Switch-Database
Apply the `DatabaseSwitcher` in the specified script block.

```powershell
[Sitecore.Context]::Database.Name # => Returns "master"

Switch-Database "web" {
    [Sitecore.Context]::Database.Name # => Returns "web"
}
```

### Switch-Language
Apply the `LanguageSwitcher` in the specified script block.

```powershell
[Sitecore.Context]::Language.Name # => Returns "en"

Switch-Database "ja-JP" {
    [Sitecore.Context]::Language.Name # => Returns "ja-JP"
}
```

### Switch-Site
Apply the `SiteContextSwitcher` in the specified script block.

```powershell
[Sitecore.Context]::Site.Name # => Returns "shell"

Switch-Database "website" {
    [Sitecore.Context]::Site.Name # => Returns "website"
}
```

### Switch-User
Apply the `UserSwitcher` in the specified script block.

```powershell
[Sitecore.Context]::User.Name # => Returns "sitecore\Admin"

Switch-Database "sitecore\Author" {
    [Sitecore.Context]::User.Name # => Returns "sitecore\Author"
}
```
