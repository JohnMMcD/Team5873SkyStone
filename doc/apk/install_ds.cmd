@cls
@echo This program installs the Driver Station app used by phones
@echo for FIRST Tech Challenge. The file FtcDriverStation-release.apk
@echo will be used for the installation.
@echo .
@echo Before you run this program, make sure that:
@echo * the USB drivers for the phone are installed on this computer
@echo * the phone is connected via USB
@echo * the phone has USB debugging enabled
@echo * Android Studio is installed on this computer (note that
@echo   using Android Studio as your programming environment is not required, nor
@echo   does Android Studio need to be running).
@echo .
@echo This program has two commands. It's OK to run the commands if you're not
@echo sure whether the app is already on the phone. 
@echo The first command starts Android debugging on the phone.
@echo .
@echo The second command installs the app. It should should report lines like this:
@echo     Performing Streamed Install (or Streamed Install)
@echo     Success
@echo .
@echo Press Ctrl-C to cancel running this program.
@pause

@SET ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe
@SET PATH=%PATH%;%LOCALAPPDATA%\Android\Sdk\platform-tools
@IF NOT EXIST %ADB% GOTO noadb

%ADB% devices

%ADB% install FtcDriverStation-release.apk

pause

goto done

:noadb
@echo The 'adb' command is not present in its usual location.
@echo Please make sure Android Studio is installed. Using Android
@echo Studio as the development environment is not required, nor is
@echo downloading the FTC SDK.

:done
