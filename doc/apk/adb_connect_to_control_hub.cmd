@SET ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb
@SET PATH=%PATH%;%LOCALAPPDATA%\Android\Sdk\platform-tools

@echo "Make sure that you are connected via the wireless interface"
@echo "Also make sure you have Android Studio installed."

%ADB% connect 192.168.43.1:5555

@echo "The output of the above command should end with:"
@echo "connected to 192.168.43.1:5555"
