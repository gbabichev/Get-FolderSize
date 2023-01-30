
Import-Module "Get-FolderSize.psd1"

$checkFolder = "C:\Users\"

foreach ($folder in Get-ChildItem -Directory $checkFolder){
    $result = [math]::Round((Get-FolderSize -workingFolder $folder.FullName)/1mb,2)
    Write-Host "Size of $folder is $result MB"
}