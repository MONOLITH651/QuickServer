param (
    [int]$Port = 8000
)

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://*:$Port/")
$listener.Start()
Write-Output "HTTP server running on port $Port"

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $response = $context.Response
    $filePath = Join-Path -Path (Get-Location) -ChildPath $context.Request.Url.LocalPath.TrimStart('/')
    
    if (Test-Path $filePath) {
        $bytes = [System.IO.File]::ReadAllBytes($filePath)
        $response.ContentType = "application/octet-stream"
        $response.OutputStream.Write($bytes, 0, $bytes.Length)
    } else {
        $response.StatusCode = 404
        $response.StatusDescription = "Not Found"
        $error = [System.Text.Encoding]::UTF8.GetBytes("404 - Not Found")
        $response.OutputStream.Write($error, 0, $error.Length)
    }
    
    $response.OutputStream.Close()
}

$listener.Stop()
