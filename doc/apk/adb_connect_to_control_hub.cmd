@SET ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb
@SET PATH=%PATH%;%LOCALAPPDATA%\Android\Sdk\platform-tools
@IF NOT EXIST %ADB% GOTO noadb


@echo "Make sure that you are connected via the wireless interface"
@echo "Also make sure you have Android Studio installed."

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
