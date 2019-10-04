@cls
@echo This program uninstalls the Robot Controller and Driver Station apps used by
@echo phones for FIRST Tech Challenge. Press Ctrl-C to cancel running this program.
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

@pause

%LOCALAPPDATA%\Android\Sdk\platform-tools\adb start-server

%LOCALAPPDATA%\Android\Sdk\platform-tools\adb uninstall com.qualcomm.ftcrobotcontroller

%LOCALAPPDATA%\Android\Sdk\platform-tools\adb uninstall com.qualcomm.ftcdriverstation

@pause
