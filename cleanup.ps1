# This script can be used to delete folders that are older than a specified number of days.
# To run the script, use the following command:
# ./cleanup.ps1 -retentionPolicyDays "7" -path "C:\path\to\folder"
# The -retentionPolicyDays parameter specifies the number of days after which folders should be deleted.
# The -path parameter specifies the path to the folder containing the folders to be deleted.
# If you want to see which folders would be deleted without actually deleting them, you can add the -dontDelete switch to the command.

param(
    [string[]]$path,
    [int]$retentionPolicyDays,
    [switch]$dontDelete
)

foreach ($p in $path) {
    $folders = Get-ChildItem -Path $p | Where-Object { $_.PSIsContainer }
    foreach ($folder in $folders) {
        if ($folder.LastWriteTime -le (Get-Date).AddDays(-$retentionPolicyDays)) {
            if ($dontDelete) {
                Write-Output "Would have deleted: $($folder.FullName)"
            } else {
                Remove-Item -Recurse -Force $folder.FullName
            }
        }
    }
}