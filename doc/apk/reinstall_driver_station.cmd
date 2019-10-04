@cls
@echo This program installs the Driver Station app used by phones
@echo for FIRST Tech Challenge. Press Ctrl-C to cancel running this program.
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
@echo The second command uninstalls the Robot Controller app. It should report
@echo "Success", but if the app is not on the phone, you will see a harmless
@echo error message like this:
@echo .
@echo Exception occurred while dumping:
@echo java.lang.IllegalArgumentException: Unknown package: com.qualcomm.ftcdriverstation
@echo .
@echo The third command installs the app. It should should report lines like this:
@echo     Performing Streamed Install (or Streamed Install)
@echo     Success

@pause

%LOCALAPPDATA%\Android\Sdk\platform-tools\adb start-server

%LOCALAPPDATA%\Android\Sdk\platform-tools\adb uninstall com.qualcomm.ftcdriverstation

%LOCALAPPDATA%\Android\Sdk\platform-tools\adb install FtcDriverStation-release.apk

pause
