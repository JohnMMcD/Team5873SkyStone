@SET OLDPATH=%PATH%
@SET PATH=%LOCALAPPDATA%\Android\Sdk\platform-tools;%PATH%;

adb pull /storage/emulated/0/FIRST
@SET PATH=%OLDPATH%
