# SPE Extended Functions
The utility functions for Sitecore PowerShell.

## Usage
1. Download the package from [here](https://github.com/xirtardauq/SPE-Extended-Functions/releases) and install it.
1. Declare `Import-Function SpeExtendedFunctions` in the top of your script.
1. Now you can use the additional functions.

## Functions

- [Disable-Security](#user-content-disable-security-alias-sudo)
- [Edit-Item](#user-content-edit-item-alias-edit)
- [Get-MediaContent](#user-content-get-mediacontent)
- [New-ItemIfNotExists](#user-content-new-itemifnotexists)
- [Resolve-Instance](#user-content-resolve-instance)
- [Set-FinalWorkflow](#user-content-set-finalworkflow)
- [Set-InitialWorkflow](#user-content-set-initialworkflow)
- [Set-MediaContent](#user-content-set-mediacontent)
- [Switch-Context](#user-content-switch-context-alias-sctx)
- [Switch-Database](#user-content-switch-database)
- [Switch-Language](#user-content-switch-language)
- [Switch-Site](#user-content-switch-site)
- [Switch-User](#user-content-switch-user)

### Disable-Security (Alias: sudo)
Apply the `SecurityDisabler` in a specified script block.

```powershell
Disable-Security {
    # Able to call unauthorized process here.
}
```

### Edit-Item (Alias: edit)
Allow item editing in a specified script block.

```powershell
$item = Get-Item "/sitecore/content/Home"

Edit-Item $item {
    $item["Title"] = "New Title"
}

echo $item["Title"] # => Returns "New Title".
```

### Get-MediaContent
Get the `Media` field value of a media item as string.

```powershell
$media = Get-Item "/sitecore/media library/My CSV file"

Get-MediaContent -Item $media # => Returns the csv content attached to $media.
```

### New-ItemIfNotExists
If an item does not exist in a specified path, it will be created with a specified template. If the item exists, it will be returned.

```powershell
$template = Get-Item "/sitecore/templates/Sample/Sample Item"

New-ItemIfNotExists -Path "/sitecore/content/Home/New Item" -TemplateID $template.ID
# => The item will always be returned.
```

### Resolve-Instance
Resolve an instance by interface registered in the DI container.

```powershell
Resolve-Instance -TypeName Sitecore.XA.Foundation.Search.Services.IIndexResolver
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

Set-InitialWorkflow -Item $item # => Assigned the Draft state.
```

### Set-MediaContent
Set a string value to the `Media` field of a media item.

```powershell
$media = Get-Item "/sitecore/media library/My CSV file"

Set-MediaContent -Item $media -Content "New Content"

Get-MediaContent -Item $media # => Returns "New Content"
```

### Switch-Context (Alias: sctx)
Switch Site/Database/Language/User context in a specified block. When `-NoSecurity` is passed, apply the `SecurityDisabler`.

```powershell
$context = @{
    Database = "web"
    Language = "ja-JP"
    Site = "website"
    User = "sitecore\Author"
    NoSecurity = $true
}

Switch-Context @context -Script {
    [Sitecore.Context]::Database.Name # => Returns "web"
    [Sitecore.Context]::Language.Name # => Returns "ja-JP"
    [Sitecore.Context]::Site.Name     # => Returns "website"
    [Sitecore.Context]::User.Name     # => Returns "sitecore\Author"
}
```

### Switch-Database
Apply the `DatabaseSwitcher` in a specified script block.

```powershell
[Sitecore.Context]::Database.Name # => Returns "master"

Switch-Database "web" {
    [Sitecore.Context]::Database.Name # => Returns "web"
}
```

### Switch-Language
Apply the `LanguageSwitcher` in a specified script block.

```powershell
[Sitecore.Context]::Language.Name # => Returns "en"

Switch-Language "ja-JP" {
    [Sitecore.Context]::Language.Name # => Returns "ja-JP"
}
```

### Switch-Site
Apply the `SiteContextSwitcher` in a specified script block.

```powershell
[Sitecore.Context]::Site.Name # => Returns "shell"

Switch-Site "website" {
    [Sitecore.Context]::Site.Name # => Returns "website"
}
```

### Switch-User
Apply the `UserSwitcher` in a specified script block.

```powershell
[Sitecore.Context]::User.Name # => Returns "sitecore\Admin"

Switch-User "sitecore\Author" {
    [Sitecore.Context]::User.Name # => Returns "sitecore\Author"
}
```

## Author
- Takumi Yamada (xirtardauq@gmail.com)

## License
*Cairngorm* is licensed under the MIT license. See LICENSE.txt.