@cls
@echo This program pulls the FIRST directory off the robot controller phone
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
@echo The FIRST directory contains all the configuration files and any on-bot programs
@echo such as Blocks and On-Bot Java.
@REM echo This program has three commands. It's OK to run the commands if you're not
@REM echo sure whether the app is already on the phone. 
@REM echo The first command starts Android debugging on the phone.
@REM echo The second command uninstalls the Robot Controller app. It should report
@REM echo "Success", but if the app is not on the phone, you will see a harmless
@REM echo error message like this:
@REM echo .
@REM echo Exception occurred while dumping:
@REM echo java.lang.IllegalArgumentException: Unknown package: com.qualcomm.ftcdriverstation
@REM echo .
@REM echo The third command installs the app. It should should report lines like this:
@REM echo     Performing Streamed Install (or Streamed Install)
@REM echo     Success

@pause

%LOCALAPPDATA%\Android\Sdk\platform-tools\adb pull /storage/emulated/0/FIRST
