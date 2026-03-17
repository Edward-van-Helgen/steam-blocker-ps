Get-NetFirewallRule | Where-Object Group -eq 'steam-blocker' | Remove-NetFirewallRule | Out-Null
