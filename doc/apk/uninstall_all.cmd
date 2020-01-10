@cls
@echo This program uninstalls the Robot Controller and Driver Station apps used by
@echo phones for FIRST Tech Challenge.
@echo .
@echo Before you run this program, make sure that:
@echo * the USB drivers for the phone are installed on this computer
@echo * the phone is connected via USB
@echo * the phone has USB debugging enabled
@echo * Android Studio is installed on this computer (note that
@echo   using Android Studio as your programming environment is not required, nor
@echo   does Android Studio need to be running).
@echo .
@echo This program has three commands. The first starts Android debugging on the phone.
@echo The second and third commands uninstall the apps. It's OK to run the commands
@echo if you're not sure whether the apps are actually on the phone. If the
@echo apps are not on the phone, you will see a harmless error message like this:
@echo Exception occurred while dumping:
@echo java.lang.IllegalArgumentException: Unknown package: com.qualcomm.ftcrobotcontroller
@echo .
@echo Press Ctrl-C to cancel running this program.
@pause

@SET ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe
@SET PATH=%PATH%;%LOCALAPPDATA%\Android\Sdk\platform-tools
@IF NOT EXIST %ADB% GOTO noadb

%ADB% start-server

%ADB% uninstall com.qualcomm.ftcrobotcontroller

%ADB% uninstall com.qualcomm.ftcdriverstation

goto done

:noadb
@echo The 'adb' command is not present in its usual location.
@echo Please make sure Android Studio is installed. Using Android
@echo Studio as the development environment is not required, nor is
@echo downloading the FTC SDK.

:done
@pause
