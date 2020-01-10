@cls
@echo This script has a very specific purpose and will not be useful to most teams.
@echo The script exports the profiles which are used by Windows to connect to the 
@echo phones. You would run this script on a computer which has been used to 
@echo connect to phones. Then you could import the profiles on another computer.
@echo See https://www.ghacks.net/2012/01/07/how-to-copy-wlan-profiles/ for more information
@echo .
@echo This script requires some editing before it can be useful. You
@echo have to edit the first command to your team name, and you have to edit the 
@echo later commands based on the output of the first command.
@echo .
@echo This script must be run with administrator privileges.

@echo First, show the profiles for your team (in my case, 5873)
netsh wlan show profiles | findstr 5873

@echo Next, export the profiles shown in the above command. e.g.,
netsh wlan export profile name="DIRECT-eB-5873-N-RC" folder=. key=clear
netsh wlan export profile name="DIRECT-4L-5873-N-RC" folder=. key=clear

@echo Now run
@echo netsh wlan add profile filename=".\DIRECT-eB-5873-N-RC.xml"
