# Invoke with
# powershell.exe -executionpolicy bypass -File download_files.ps1

# URLs from
## https://www.firstinspires.org/resource-library/ftc/technology-information-and-resources
## https://www.firstinspires.org/resource-library/ftc/robot-building-resources
## https://www.firstinspires.org/resource-library/ftc/volunteer-resources
## 

$urls = @("https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/game-manual-part-1.pdf")
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/game-manual-part-2.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/forum-answered-questions.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/field-inspection-checklist.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/field-setup-guide.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/control-system-advisor-manual.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/control-system-troubleshooting-guide.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/analysis-esd-mitigation-echin.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/field-manager-manual.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/field-reset-guide.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/field-inspector-manual.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/field-technical-advisor-manual.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/scorekeeper-manual.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/ftc-scorekeeper-quickstartguide.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/wi-fi-technical-advisor-manual.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/wi-fi-event-guide.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/wi-fi-event-checklist.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/robot-reliability-checklist.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/robot-wiring-guide.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/control-hub-game-manual-addendum.pdf"
$urls += "https://www.firstinspires.org/sites/default/files/uploads/resource_library/ftc/managing-your-control-system.pdf"

# These are pretty large
$urls += "https://www.revrobotics.com/content/sw/REVHubFirmware_1_08_02.bin"
$urls += "https://www.revrobotics.com/content/sw/chv1/REV-31-1595-FW-1.0.1-ota.zip"


foreach ($url in $urls) { 

  # Use the last part of the path as the filename
  $filename = $url -replace '.*/'

  Write-Output "URL:  $url"
  Write-Output "File: $filename"
  Invoke-WebRequest -Uri $url -OutFile $filename
}

# This array should hold all the URLs that need to be renamed to avoid conflicts or because the names in their URLs are unhelpful
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