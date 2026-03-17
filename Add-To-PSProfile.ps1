if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType File -Path $PROFILE -Force
}

Add-Content -Path $PROFILE -Value "
function Block-Steam {New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Common Files\Steam\steamservice.exe' -Profile any -Direction Outbound -Displayname 'Block steamservice.exe' -Group 'steam-blocker' | Out-Null
New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Common Files\Steam\SteamServiceTmp.exe' -Profile any -Direction Outbound -Displayname 'Block SteamServiceTmp.exe' -Group 'steam-blocker' | Out-Null
New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Steam\bin\cef\cef.win64\steamwebhelper.exe' -Profile any -Direction Outbound -Displayname 'Block steamwebhelper.exe' -Group 'steam-blocker' | Out-Null
New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Steam\steam.exe' -Profile any -direction Outbound -Displayname 'Block steam.exe' -Group 'steam-blocker' | Out-Null
New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Common Files\Steam\steamservice.exe' -Profile any -Direction Inbound -Displayname 'Block steamservice.exe' -Group 'steam-blocker' | Out-Null
New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Common Files\Steam\SteamServiceTmp.exe' -Profile any -Direction Inbound -Displayname 'Block SteamServiceTmp.exe' -Group 'steam-blocker' | Out-Null
New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Steam\bin\cef\cef.win64\steamwebhelper.exe' -Profile any -Direction Inbound -Displayname 'Block steamwebhelper.exe' -Group 'steam-blocker' | Out-Null
New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Steam\steam.exe' -Profile any -direction Inbound -Displayname 'Block steam.exe' -Group 'steam-blocker' | Out-Null}
function Unblock-Steam {Get-NetFirewallRule | Where-Object Group -eq 'steam-blocker' | Remove-NetFirewallRule | Out-Null}"