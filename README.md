# Get-FolderSize

This is a custom PS module to get the sizes of folders. 

### Installation
1) Download both files. 

2) ``` Import-Module Get-FolderSize.psd1  ```


### Usage Examples
Get the size of the folder, in bytes

```powershell
PS C:\Users\George\> Get-FolderSize .\ISO\
57566464000
```
Get the size of a folder, in MB
```powershell
PS C:\Users\George\> (Get-FolderSize .\ISO\) / 1mb
54899.658203125
```
Get the size of a folder, in GB
```powershell
PS C:\Users\George\> (Get-FolderSize .\ISO\) / 1gb
53.6129474639893
```
Get the size of a list of folders
```powershell
Import-Module "C:\Users\George\PowerShell\Modules\Get-FolderSize\Get-FolderSize.psd1"

$checkFolder = "C:\Users\"

foreach ($folder in Get-ChildItem -Directory $checkFolder){
    $result = [math]::Round((Get-FolderSize -workingFolder $folder.FullName)/1mb,2)
    Write-Host "Size of $folder is $result MB"
}
Output:
Size of George is 93852.85 MB
Size of Public is 156941.57 MB
Size of User is 0 MB        
```
