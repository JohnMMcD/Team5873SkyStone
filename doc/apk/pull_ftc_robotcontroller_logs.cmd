@cls
@echo This program pulls the logs and the FIRST directory off the robot controller phone
@echo for FIRST Tech Challenge. The FIRST directory contains all the configuration
@echo files and any on-bot programs such as Blocks and On-Bot Java.

@echo .
@echo Before you run this program, make sure that:
@echo * the USB drivers for the phone are installed on this computer
@echo * the phone is connected via USB
@echo * the phone has USB debugging enabled
@echo * Android Studio is installed on this computer (note that
@echo   using Android Studio as your programming environment is not required, nor
@echo   does Android Studio need to be running).
@echo .
@IF "x%1"=="x" ECHO Please call this script with a team number; using 9999 for now
@echo .
@echo Press Ctrl-C to cancel running this program.
@pause

@SET ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe
@SET PATH=%PATH%;%LOCALAPPDATA%\Android\Sdk\platform-tools
@IF NOT EXIST %ADB% GOTO noadb

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

  perl -V 1>NUL 2>NUL

  IF NOT ERRORLEVEL 1 FOR %%I in (logcat*.txt) DO perl clean_logcat.pl %%~nI.txt cleaned-%%~nI.txt

popd

@echo "Downloaded files for team %TEAM%"
@pause
goto done

:noadb
@echo The 'adb' command is not present in its usual location.
@echo Please make sure Android Studio is installed. Using Android
@echo Studio as the development environment is not required, nor is
@echo downloading the FTC SDK.

:done
