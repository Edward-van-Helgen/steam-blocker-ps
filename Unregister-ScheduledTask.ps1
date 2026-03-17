if ($(Get-ScheduledTask -TaskName "Steam Blocker SysTray Script").TaskName -eq "Steam Blocker SysTray Script") {
    Unregister-ScheduledTask -TaskName 'Steam Blocker SysTray Script' -Confirm:$false
    Write-Output 'Scheduled Task for SteamBlocker successfully removed'
} else {
    Write-Output 'SteamBlocker is already uninstalled!'
}