Example run 1: Folder Date format "20230723"

```
./cleanup.ps1 -path "C:\Users\320178017\folderCleanupExamples\format1" -deleteIfDateIsBefore "20230725" -dontDelete
```
Output:
```
Would have deleted: C:\Users\320178017\folderCleanupExamples\format1\20230723
Would have deleted: C:\Users\320178017\folderCleanupExamples\format1\20230724
Would have deleted: C:\Users\320178017\folderCleanupExamples\format1\20230725
```

Example run 2: Folder Date format "Jul_03_2023"
```
./cleanup.ps1 -path "C:\Users\320178017\folderCleanupExamples\format2" -deleteIfDateIsBeforeIncluding "20230725" -dontDelete
```
Output:
```
Would have deleted: C:\Users\320178017\folderCleanupExamples\format2\Jul_03_2023
Would have deleted: C:\Users\320178017\folderCleanupExamples\format2\Jul_06_2023
Would have deleted: C:\Users\320178017\folderCleanupExamples\format2\Jul_12_2023
Would have deleted: C:\Users\320178017\folderCleanupExamples\format2\Jul_15_2023
```

This script is a PowerShell script that can be used to clean up folders in specified paths. The script takes in several parameters:

-path: This parameter specifies the paths to the folders that you want to clean up. You can pass in multiple -path parameters to specify multiple paths.

-deleteIfDateIsBefore: This parameter specifies the date before which folders should be deleted. The date should be in the format yyyyMMdd.

-dontDelete: This is an optional flag that, if present, will prevent the script from actually deleting any folders. Instead, the script will print out the names of the folders that would have been deleted if this flag was not present.

-deleteIfDateIsBeforeIncluding: This is an optional flag that, if present, will change the behavior of the script so that it will delete (or print out the names of) folders that have a date before or equal to the date specified by the -deleteIfDateIsBefore parameter. If this flag is not present, the script will only delete (or print out the names of) folders that have a date strictly before the date specified by the 

-deleteIfDateIsBefore parameter.