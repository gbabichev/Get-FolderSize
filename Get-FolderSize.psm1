<#
.SYNOPSIS
	A function to output the size of a folder, and all its children in bytes.
.DESCRIPTION
    This script will recursively scan a given folder, and output the size in bytes.
    This script ignores SYSTEM files.
.INPUTS
    -workingFolder="Path to requestedFolder"
.OUTPUTS
    Size of folder, in bytes.
.NOTES
    Version:    1.0.0
    Authors:    George Babichev
    Version History:
    1.0.0 - 1/30/2023 - Initial Script Creation
#>

function Get-FolderSize {
    
    param (
        $workingFolder,
        $fileSize
    )
    Write-Progress -Activity "Processing" $workingFolder
    foreach ($file in Get-ChildItem -Force -File $workingFolder -ErrorAction SilentlyContinue){
        if ($file.Attributes -like '*System*'){
            continue
        }
        $fileSize += (Get-Item -Force $file.FullName -ErrorAction SilentlyContinue | Measure-Object -sum Length).sum
    }
    foreach ($folder in Get-ChildItem -Force -Directory $workingFolder -ErrorAction SilentlyContinue){
        $fileSize = Get-FolderSize -workingFolder $folder.FullName -fileSize $fileSize
    }
    return $fileSize 
}