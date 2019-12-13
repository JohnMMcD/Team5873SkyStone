@SET ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb
@IF "x%1"=="x" ECHO Please call this script with a team number; using 9999 for now
@SET PATH=%PATH%;%LOCALAPPDATA%\Android\Sdk\platform-tools

@IF "x%1"=="x" SET TEAM=9999
@IF NOT "x%1"=="x" SET TEAM=%1
mkdir %TEAM%
copy clean_logcat.pl %TEAM%
pushd %TEAM%
  %ADB% start-server
  
  %ADB% pull /storage/emulated/0/driverStationLog.txt     logcat-ds.txt
  %ADB% pull /storage/emulated/0/driverStationLog.txt.1   logcat-ds-1.txt
  %ADB% pull /storage/emulated/0/driverStationLog.txt.2   logcat-ds-2.txt
  %ADB% pull /storage/emulated/0/driverStationLog.txt.3   logcat-ds-3.txt
  %ADB% pull /storage/emulated/0/driverStationLog.txt.4   logcat-ds-4.txt

  %ADB% pull /storage/emulated/0/robotControllerLog.txt   logcat-rc.txt
  %ADB% pull /storage/emulated/0/robotControllerLog.txt.1 logcat-rc-1.txt
  %ADB% pull /storage/emulated/0/robotControllerLog.txt.2 logcat-rc-2.txt
  %ADB% pull /storage/emulated/0/robotControllerLog.txt.3 logcat-rc-3.txt
  %ADB% pull /storage/emulated/0/robotControllerLog.txt.4 logcat-rc-4.txt
  %ADB% pull /storage/emulated/0/FIRST

  FOR %%I in (logcat*.txt) DO perl clean_logcat.pl %%~nI.txt cleaned-%%~nI.txt

popd

@echo "Downloaded files for team %TEAM%"
@pause
