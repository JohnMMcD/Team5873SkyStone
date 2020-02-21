@REM # See instructions and explanation in get_latest_version.ps1 .
powershell.exe -executionpolicy bypass -File get_latest_version.ps1
powershell.exe -executionpolicy bypass -File download_files.ps1
