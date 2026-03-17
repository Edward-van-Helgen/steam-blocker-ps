$currentFolder = split-path $MyInvocation.MyCommand.Path
$pathToScriptFile = $currentFolder + '\SysTray-SteamBlocker.ps1'
$psArgs = '-NoProfile -ExecutionPolicy Bypass -File "' + $pathToScriptFile + '" -Output "HTML"'

$taskTriggers = @(
    New-ScheduledTaskTrigger -AtStartup
    New-ScheduledTaskTrigger -AtLogOn
)
$taskAction = New-ScheduledTaskAction -Execute 'PowerShell' -Argument $psArgs

if ($(Get-ScheduledTask -TaskName "Steam Blocker SysTray Script").TaskName -eq "Steam Blocker SysTray Script") {
    return
}

Register-ScheduledTask -TaskName 'Steam Blocker SysTray Script' -TaskPath 'SteamBlocker' -Action $taskAction -Trigger $taskTriggers -RunLevel Highest