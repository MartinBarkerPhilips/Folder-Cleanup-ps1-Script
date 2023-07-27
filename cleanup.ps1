param(
    [string[]]$path,
    [string]$deleteIfDateIsBefore,
    [switch]$dontDelete,
    [switch]$deleteIfDateIsBeforeIncluding
)

foreach ($p in $path) {
    $folders = Get-ChildItem -Path $p | Where-Object { $_.PSIsContainer }
    foreach ($folder in $folders) {
        $folderName = $folder.Name
        if ($folderName -match "^\d{8}$") {
            $folderDate = [datetime]::ParseExact($folderName, "yyyyMMdd", $null)
        } elseif ($folderName -match "^[A-Z][a-z]{2}_\d{2}_\d{4}$") {
            $folderDate = [datetime]::ParseExact($folderName, "MMM_dd_yyyy", $null)
        } else {
            continue
        }
        if ($deleteIfDateIsBeforeIncluding) {
            if ($folderDate -le [datetime]::ParseExact($deleteIfDateIsBefore, "yyyyMMdd", $null)) {
                if ($dontDelete) {
                    Write-Output "Would have deleted: $($folder.FullName)"
                } else {
                    Remove-Item -Recurse -Force $folder.FullName
                }
            }
        } else {
            if ($folderDate -lt [datetime]::ParseExact($deleteIfDateIsBefore, "yyyyMMdd", $null)) {
                if ($dontDelete) {
                    Write-Output "Would have deleted: $($folder.FullName)"
                } else {
                    Remove-Item -Recurse -Force $folder.FullName
                }
            }
        }
    }
}
