@cls
@echo This program uses ADB to list the phones / devices connected to the computer.
@echo .
@echo Before you run this program, make sure that:
@echo * the USB drivers for the phone are installed on this computer
@echo * the phone is connected via USB
@echo * the phone has USB debugging enabled
@echo * Android Studio is installed on this computer (note that
@echo   using Android Studio as your programming environment is not required, nor
@echo   does Android Studio need to be running).
@echo .
@echo Press Ctrl-C to cancel running this program.

@SET ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb
@SET PATH=%PATH%;%LOCALAPPDATA%\Android\Sdk\platform-tools
@IF NOT EXIST %ADB% GOTO noadb

%ADB% devices

@IF ERRORLEVEL 0 GOTO done

:adbfailed
@echo The command to list the connected devices failed. Please read 
@echo the instructions above for likely causes.

GOTO done

:noadb
@echo The 'adb' command is not present in its usual location.
@echo Please make sure Android Studio is installed. Using Android
@echo Studio as the development environment is not required, nor is
@echo downloading the FTC SDK.

:done

pause
