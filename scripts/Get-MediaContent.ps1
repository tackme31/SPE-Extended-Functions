function Get-MediaContent {
    param (
        [Parameter(Mandatory=$true)][Sitecore.Data.Items.Item]$Item
    )
    
    [System.IO.Stream]$stream = $Item.Fields["Blob"].GetBlobStream()
    try {
        $content = New-Object byte[] $stream.Length
        $stream.Read($content, 0, $stream.Length) | Out-Null
    }
    finally {
        $stream.Dispose()
    }
    
    [System.Text.Encoding]::Default.GetString($content)
}