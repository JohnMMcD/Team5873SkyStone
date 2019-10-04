@SET OLDPATH=%PATH%
@SET PATH=%LOCALAPPDATA%\Android\Sdk\platform-tools;%PATH%;

adb pull /storage/emulated/0/robotControllerLog.txt robotControllerLog.txt
adb pull /storage/emulated/0/robotControllerLog.txt.1 robotControllerLog.txt.1
adb pull /storage/emulated/0/robotControllerLog.txt.2 robotControllerLog.txt.2
adb pull /storage/emulated/0/robotControllerLog.txt.3 robotControllerLog.txt.3
adb pull /storage/emulated/0/robotControllerLog.txt.4 robotControllerLog.txt.4
@SET PATH=%OLDPATH%

@echo If you have Perl installed and on your path, you can use these command to clean up the files a bit
@echo If you don't have Perl installed, press Ctrl-C
pause
perl clean_logcat.pl robotControllerLog.txt   cleaned-robotControllerLog.txt
perl clean_logcat.pl robotControllerLog.txt.1 cleaned-robotControllerLog1.txt
perl clean_logcat.pl robotControllerLog.txt.2 cleaned-robotControllerLog2.txt
perl clean_logcat.pl robotControllerLog.txt.3 cleaned-robotControllerLog3.txt
perl clean_logcat.pl robotControllerLog.txt.4 cleaned-robotControllerLog4.txt
