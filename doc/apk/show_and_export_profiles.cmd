
@echo This script requires some editing before it can be useful. You
@echo have to edit it to your team name, and you have to edit the 
@echo last commands based on output of the earlier commands.
@echo ....
@echo This script must be run with administrator privileges.

@echo First, show the profiles for your team (in my case, 5873)
netsh wlan show profiles | findstr 5873

@echo Next, export the profiles shown in the above command
netsh wlan export profile name="DIRECT-eB-5873-N-RC" folder=. key=clear
netsh wlan export profile name="DIRECT-4L-5873-N-RC" folder=. key=clear
