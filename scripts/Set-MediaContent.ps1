Import-Function Edit-Item

function Set-MediaContent {
    param (
        [Parameter(Mandatory=$true)][Sitecore.Data.Items.Item]$Item,
        [Parameter(ValueFromPipeline = $true, Mandatory=$true)][string]$Content
    )

    $stream = New-Object System.IO.MemoryStream
    $writer = New-Object System.IO.StreamWriter($stream)
    
    try {
        $writer.Write($Content)
        $writer.Flush()
        $stream.Position = 0
        
        Edit-Item $Item {
            $Item.Fields["Blob"].SetBlobStream($stream)
        }
    }
    finally {
        $writer.Dispose()
        $stream.Dispose()
    }
}