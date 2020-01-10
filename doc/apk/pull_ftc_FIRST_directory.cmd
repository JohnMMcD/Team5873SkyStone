@cls
@echo This program pulls the FIRST directory off the robot controller phone
@echo for FIRST Tech Challenge.
@echo The FIRST directory contains all the configuration files and any on-bot programs
@echo such as Blocks and On-Bot Java.
@echo .
@echo Press Ctrl-C to cancel running this program.
@echo .
@echo Before you run this program, make sure that:
@echo * the USB drivers for the phone are installed on this computer
@echo * the phone is connected via USB
@echo * the phone has USB debugging enabled
@echo * Android Studio is installed on this computer (note that
@echo   using Android Studio as your programming environment is not required, nor
@echo   does Android Studio need to be running).
@echo .
@SET ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb
@SET PATH=%PATH%;%LOCALAPPDATA%\Android\Sdk\platform-tools
@IF NOT EXIST %ADB% GOTO noadb

@pause

%ADB% pull /storage/emulated/0/FIRST

goto done

:noadb
@echo The 'adb' command is not present in its usual location.
@echo Please make sure Android Studio is installed. Using Android
@echo Studio as the development environment is not required, nor is
@echo downloading the FTC SDK.

:done
