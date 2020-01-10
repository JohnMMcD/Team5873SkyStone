@cls
@echo This program connects to the Control Hub used in 
@echo the FIRST Tech Challenge.
@echo .
@echo Before you run this program, make sure that:
@echo * the computer has connected to the Control Hub over WiFi
@echo * Android Studio is installed on this computer (note that
@echo   using Android Studio as your programming environment is not required, nor
@echo   does Android Studio need to be running).
@echo .
@echo This program has one command, adb connect .
@echo Other commands may be useful, such as adb logcat .
@echo .
@echo Press Ctrl-C to cancel running this program.
@pause

@SET ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe
@SET PATH=%PATH%;%LOCALAPPDATA%\Android\Sdk\platform-tools
@IF NOT EXIST %ADB% GOTO noadb

%ADB% connect 192.168.43.1:5555

@echo "The output of the above command should end with:"
@echo "connected to 192.168.43.1:5555"

goto done

:noadb
@echo The 'adb' command is not present in its usual location.
@echo Please make sure Android Studio is installed. Using Android
@echo Studio as the development environment is not required, nor is
@echo downloading the FTC SDK.

:done
