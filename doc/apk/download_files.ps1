# Invoke with
# powershell.exe -executionpolicy bypass -File download_files.ps1
# Latest version at 
# https://raw.githubusercontent.com/JohnMMcD/Team5873SkyStone/master/doc/apk/download_files.ps1

# URLs from
## https://www.firstinspires.org/resource-library/ftc/technology-information-and-resources
## https://www.firstinspires.org/resource-library/ftc/robot-building-resources
## https://www.firstinspires.org/resource-library/ftc/volunteer-resources

$ftc_library = "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc"
$ftc_library_urls = @("game-manual-part-1.pdf")
$ftc_library_urls += "game-manual-part-2.pdf"
$ftc_library_urls += "forum-answered-questions.pdf"
$ftc_library_urls += "field-inspection-checklist.pdf"
$ftc_library_urls += "field-setup-guide.pdf"
$ftc_library_urls += "field-manager-manual.pdf"
$ftc_library_urls += "field-reset-guide.pdf"
$ftc_library_urls += "field-inspector-manual.pdf"
$ftc_library_urls += "field-technical-advisor-manual.pdf"
$ftc_library_urls += "wi-fi-technical-advisor-manual.pdf"
$ftc_library_urls += "wi-fi-event-guide.pdf"
$ftc_library_urls += "wi-fi-event-checklist.pdf"
$ftc_library_urls += "control-system-advisor-manual.pdf"
$ftc_library_urls += "control-system-troubleshooting-guide.pdf"
$ftc_library_urls += "managing-your-control-system.pdf"
$ftc_library_urls += "analysis-esd-mitigation-echin.pdf"
$ftc_library_urls += "control-hub-game-manual-addendum.pdf"
$ftc_library_urls += "robot-reliability-checklist.pdf"
$ftc_library_urls += "robot-wiring-guide.pdf"
$ftc_library_urls += "scorekeeper-manual.pdf"
$ftc_library_urls += "ftc-scorekeeper-quickstartguide.pdf"
$ftc_library_urls += "referee-and-head-referee-manual.pdf"
$ftc_library_urls += "dean's-list-interviewer-and-reviewer-manual.pdf"

foreach ($filename in $ftc_library_urls) { 

  $url = "$ftc_library/$filename"

#  Write-Output "URL:  $url"
  Write-Output "File: $filename"
  Invoke-WebRequest -Uri $url -OutFile $filename
}

$github = "https://raw.githubusercontent.com/JohnMMcD/Team5873SkyStone/master/doc/apk"
$github_urls = @("adb_connect_to_control_hub.cmd")
$github_urls += "connect_to_programming.cmd"
$github_urls += "install_ds.cmd"
$github_urls += "pull_ftc_FIRST_directory.cmd"
$github_urls += "pull_ftc_robotcontroller_logs.cmd"
$github_urls += "reinstall_driver_station.cmd"
$github_urls += "reinstall_rc.cmd"
$github_urls += "show_and_export_profiles.cmd"
$github_urls += "uninstall_all.cmd"
$github_urls += "reinstall_driver_station_52.cmd"
$github_urls += "reinstall_driver_station_53.cmd"
$github_urls += "reinstall_rc_52-32.cmd"
$github_urls += "reinstall_rc_53.cmd"

foreach ($filename in $github_urls) { 

  $url = "$github/$github_filename"

#  Write-Output "URL:  $url"
  Write-Output "File: $filename"
  Invoke-WebRequest -Uri $url -OutFile $filename
}

# The files at these URLs are large, don't change frequently, and have a version number embedded in them,
# so we check to see if the files already exist before downloading them again.
$urls_large = @("https://www.revrobotics.com/content/sw/REVHubFirmware_1_08_02.bin")
$urls_large += "https://www.revrobotics.com/content/sw/chv1/REV-31-1595-FW-1.0.1-ota.zip";

foreach ($url in $urls_large) { 
  # Use the last part of the path as the filename
  $filename = $url -replace '.*/'
  
  if (Test-Path $filename) {
    Write-Output "Skipping download of $url because it has already been downloaded."
  } else {
    Write-Output "URL:  $url"
    Write-Output "File: $filename"
    Invoke-WebRequest -Uri $url -OutFile $filename
  }
}

# This array should hold all the URLs that need to be renamed to avoid conflicts or because the names in their URLs are unhelpful.
# The first element is the URL, and the next is the new name.
$urls_to_rename = @(
             "https://github.com/FIRST-Tech-Challenge/SkyStone/releases/download/v5.3/FtcDriverStation-release.apk",
             "DS53.apk",
             "https://github.com/FIRST-Tech-Challenge/SkyStone/releases/download/v5.3/FtcRobotController-release.apk",
             "RC53.apk",
             "https://github.com/FIRST-Tech-Challenge/SkyStone/releases/download/v5.2/FtcDriverStation-release.apk",
             "DS52.apk",
             "https://github.com/FIRST-Tech-Challenge/SkyStone/releases/download/v5.2/FtcRobotController-release.apk",
             "RC52.apk",
             "https://github.com/FIRST-Tech-Challenge/SkyStone/releases/download/v5.2/FtcRobotController-release_32bit_v5_2.apk",
             "RC52-32bit.apk",
             "https://firstinspiresst01.blob.core.windows.net/ftc/2020/fi-led-sembg-udie.pdf",
             "field-assembly-guide.pdf",
             "https://www.revrobotics.com/content/docs/REV-31-1153-GS.pdf",
             "rev-expansion-hub-guide.pdf"
             "https://github.com/ftctechnh/ftc_app/wiki/Managing-a-Control-Hub",
             "Managing-a-Control-Hub.html",
             "http://www.revrobotics.com/software/",
             "Expansion-Hub-Firmware-Update.html"
            )

for ([int]$i=0; $i -lt $urls_to_rename.Count; $i++)
{
  $url = $urls_to_rename[$i]
  $filename = $urls_to_rename[++$i]
  Write-Output "URL:  $url"
  Write-Output "File: $filename"
  Invoke-WebRequest -Uri $url -OutFile $filename
}
