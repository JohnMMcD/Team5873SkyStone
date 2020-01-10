
adb start-server

@rem adb uninstall com.qualcomm.ftcdriverstation

adb install FtcDriverStation-release.apk

pause
goto done

:noadb
@echo The 'adb' command is not present in its usual location.
@echo Please make sure Android Studio is installed. Using Android
@echo Studio as the development environment is not required, nor is
@echo downloading the FTC SDK.

:done
