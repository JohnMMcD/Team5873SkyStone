# This script copies some files which are needed by volunteers at events.
# It grabs the latest version of the game-specific files, plus some files which are needed
# for FTAs, field and robot inspectors, referees, judges, etc. The URLs are taken from
## https://www.firstinspires.org/resource-library/ftc/technology-information-and-resources
## https://www.firstinspires.org/resource-library/ftc/robot-building-resources
## https://www.firstinspires.org/resource-library/ftc/volunteer-resources

# To run this script, first download the contents of the two URLs below to a Windows 10 machine
# or a Windows 7 machine with the latest version of PowerShell.
# https://raw.githubusercontent.com/JohnMMcD/Team5873SkyStone/master/doc/apk/get_latest_version.ps1
# https://raw.githubusercontent.com/JohnMMcD/Team5873SkyStone/master/doc/apk/download_files.cmd
# Then double-click the download_files.cmd file.
#
# The best time to run this script is after 3PM EST on the Friday before an event. This
# time is after the Game Design Committe updates the official forum.

$github = "https://raw.githubusercontent.com/JohnMMcD/Team5873SkyStone/master/doc/apk"
$github_urls = @("download_files.ps1")

foreach ($filename in $github_urls) { 

  $url = "$github/$filename"

  Write-Output "File: $filename"
  Invoke-WebRequest -Uri $url -OutFile $filename
}
