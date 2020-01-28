@cls
@echo This program installs the Driver Station app used by phones
@echo for FIRST Tech Challenge. @echo for FIRST Tech Challenge. The file DS54.apk
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
@echo This program has three commands. It's OK to run the commands if you're not
@echo sure whether the app is already on the phone. 
@echo The first command starts Android debugging on the phone.
@echo The second command uninstalls the Driver Station app. It should report
@echo "Success", but if the app is not on the phone, you will see a harmless
@echo error message like this:
@echo .
@echo Exception occurred while dumping:
@echo java.lang.IllegalArgumentException: Unknown package: com.qualcomm.ftcdriverstation
@echo .
@echo The third command installs the app. It should should report lines like this:
@echo     Performing Streamed Install (or Streamed Install)
@echo     Success
@echo .
@echo Press Ctrl-C to cancel running this program.
@pause

@SET ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe
@SET PATH=%PATH%;%LOCALAPPDATA%\Android\Sdk\platform-tools
@IF NOT EXIST %ADB% GOTO noadb

%ADB% start-server

%ADB% uninstall com.qualcomm.ftcdriverstation

%ADB% install DS54.apk

pause

goto done

:noadb
@echo The 'adb' command is not present in its usual location.
@echo Please make sure Android Studio is installed. Using Android
@echo Studio as the development environment is not required, nor is
@echo downloading the FTC SDK.

:done
