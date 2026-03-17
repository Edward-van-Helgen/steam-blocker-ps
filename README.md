# <img src="Assets/Icon.png" style="vertical-align: bottom" width="64"> steam-blocker-ps

PowerShell Scripts to block Steam on Windows via Windows Firewall Rules.

## Prerequisites

You need to be able to run programs as administrator:

- Press the Windows Key to open the Windows Start Menu.
- Type `powershell`.
- Right click on `powershell` and select `Run as Administrator`.

## Usage

### Run .ps1 script files manually

- Open a PowerShell instance as described in [Prerequisites](#prerequisites).
- Navigate to the directory with the .ps1 script files:

```shell
cd c:\Users\YourUsername\Downloads\steam-blocker-ps
```

- Run `Block-Steam.ps1` or `Unblock-Steam.ps1` to block/unblock steam internet access.

### Register as Profile functions for easier access

- Open a PowerShell instance as described in [Prerequisites](#prerequisites).
- Navigate to the directory with the .ps1 script files:

```shell
cd c:\Users\YourUsername\Downloads\steam-blocker-ps
```

- Run `Add-To-PSProfile.ps1`.
- Restart PowerShell by closing the window and opening a new instance as described above.
- You should now be able to utilize the functions `Block-Steam` and `Unblock-Steam` from anywhere within PowerShell.

### Run as SysTray Icon

You can add a little icon to easily block/unblock Steam with a simple click:

- Open a PowerShell instance as described in [Prerequisites](#prerequisites).
- Navigate to the directory with the .ps1 script files:

```shell
cd c:\Users\YourUsername\Downloads\steam-blocker-ps
```

- Run `SysTray-SteamBlocker.ps1`

You should now see the Steam Blocker Icon in your SysTray.

#### Automatically start with Windows

Additionally you can register a scheduled task to run the Steam Blocker SysTray Icon on Windows startup:

- Open a PowerShell instance as described in [Prerequisites](#prerequisites).
- Navigate to the directory with the .ps1 script files:

```shell
cd c:\Users\YourUsername\Downloads\steam-blocker-ps
```

- Run `Register-ScheduledTask.ps1`

If you want to remove it again, simply run: `Unregister-ScheduledTask.ps1` from your elevated powershell window.
