# steam-blocker-ps
<<<<<<< HEAD

PowerShell Scripts to block Steam on Windows via Windows Firewall Rules.

## Prerequisites

You need to be able to run programs as administrator:

- Press the Windows Key to open the Windows Start Menu.
- Type `powershell`.
- Right click on `powershell` and select `Run as Administrator`.

## Usage

### Run .ps1 script files

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

- Run `AddSteamBlockerToPSProfile.ps1`.
- Restart PowerShell by closing the window and opening a new instance as described above.
- You should now be able to utilize the functions `Block-Steam` and `Unblock-Steam` from anywhere within PowerShell.
=======
PowerShell Scripts to block Steam on Windows via Windows Firewall Rules.
>>>>>>> origin/main
