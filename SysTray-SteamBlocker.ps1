$Display_Name = 'Steam Blocker'
$Current_Folder = split-path $MyInvocation.MyCommand.Path
$Asset_Folder = Join-Path $Current_Folder 'Assets'

# Add assemblies for WPF
[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')           | out-null
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework')          | out-null
[System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')                 | out-null
[System.Reflection.Assembly]::LoadWithPartialName('WindowsFormsIntegration')        | Out-Null

function Block-Steam {
    New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Common Files\Steam\steamservice.exe' -Profile any -Direction Outbound -Displayname 'Block steamservice.exe' -Group 'steam-blocker' | Out-Null
    New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Common Files\Steam\SteamServiceTmp.exe' -Profile any -Direction Outbound -Displayname 'Block SteamServiceTmp.exe' -Group 'steam-blocker' | Out-Null
    New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Steam\bin\cef\cef.win64\steamwebhelper.exe' -Profile any -Direction Outbound -Displayname 'Block steamwebhelper.exe' -Group 'steam-blocker' | Out-Null
    New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Steam\steam.exe' -Profile any -direction Outbound -Displayname 'Block steam.exe' -Group 'steam-blocker' | Out-Null
    New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Common Files\Steam\steamservice.exe' -Profile any -Direction Inbound -Displayname 'Block steamservice.exe' -Group 'steam-blocker' | Out-Null
    New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Common Files\Steam\SteamServiceTmp.exe' -Profile any -Direction Inbound -Displayname 'Block SteamServiceTmp.exe' -Group 'steam-blocker' | Out-Null
    New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Steam\bin\cef\cef.win64\steamwebhelper.exe' -Profile any -Direction Inbound -Displayname 'Block steamwebhelper.exe' -Group 'steam-blocker' | Out-Null
    New-NetFirewallRule -Action block -Program '%ProgramFiles% (x86)\Steam\steam.exe' -Profile any -direction Inbound -Displayname 'Block steam.exe' -Group 'steam-blocker' | Out-Null
}
function Unblock-Steam {
    Get-NetFirewallRule | Where-Object Group -eq 'steam-blocker' | Remove-NetFirewallRule | Out-Null
}

function IsBlocking {
    $RuleExists = Get-NetFirewallRule | Where-Object Group -eq 'steam-blocker';
    if ($RuleExists) {
        return $true
    }

    return $false
}

# Choose an icon to display in the systray
$Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($Asset_Folder + "\Icon.ico")

# Add the systray icon
$Main_Tool_Icon = New-Object System.Windows.Forms.NotifyIcon
$Main_Tool_Icon.Text = $Display_Name
$Main_Tool_Icon.Icon = $Icon
$Main_Tool_Icon.Visible = $true

$Menu_Start = New-Object System.Windows.Forms.MenuItem
$Menu_Start.Enabled = !(IsBlocking)
$Menu_Start.Text = "Block"

$Menu_Stop = New-Object System.Windows.Forms.MenuItem
$Menu_Stop.Enabled = IsBlocking
$Menu_Stop.Text = "Unblock"

# Add menu exit
$Menu_Exit = New-Object System.Windows.Forms.MenuItem
$Menu_Exit.Text = "Exit"

# Add all menus as context menus
$contextmenu = New-Object System.Windows.Forms.ContextMenu
$Main_Tool_Icon.ContextMenu = $contextmenu
$Main_Tool_Icon.contextMenu.MenuItems.AddRange($Menu_Start)
$Main_Tool_Icon.contextMenu.MenuItems.AddRange($Menu_Stop)
$Main_Tool_Icon.contextMenu.MenuItems.AddRange($Menu_Exit)

# When Exit is clicked, close everything and kill the PowerShell process
$Menu_Exit.add_Click({
    $Main_Tool_Icon.Visible = $false
    $window.Close()
    Stop-Process $pid
})

$Menu_Start.add_Click({
    Block-Steam
    $Menu_Start.Enabled = !(IsBlocking)
    $Menu_Stop.Enabled = IsBlocking
})

$Menu_Stop.add_Click({
    Unblock-Steam
    $Menu_Start.Enabled = !(IsBlocking)
    $Menu_Stop.Enabled = IsBlocking
})

# Make PowerShell Disappear
$windowcode = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
$asyncwindow = Add-Type -MemberDefinition $windowcode -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
$null = $asyncwindow::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle, 0)

# Use a Garbage colection to reduce Memory RAM
# https://dmitrysotnikov.wordpress.com/2012/02/24/freeing-up-memory-in-powershell-using-garbage-collector/
[System.GC]::Collect()

# Create an application context for it to all run within
# This helps with responsiveness, especially when clicking Exit
$appContext = New-Object System.Windows.Forms.ApplicationContext
[void][System.Windows.Forms.Application]::Run($appContext)
