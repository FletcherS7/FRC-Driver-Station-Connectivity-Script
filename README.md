# FRC-Driver-Station-Connectivity-Script

## PowerShell Version
A PowerShell script that performs the most common fixes for Driver Station comm's issues to the FRC Field Network

Because of the default PowerShell restrictions in Windows. The FFS_Connect.ps1 is run by Launch_FFS_ConnectPS.bat

The PowerShell script and the Batch file must be in the same directory

Launch_FFS_ConnectPS.bat must be run as admin in order for all commands to execute. It is recommended you create a shortcut and add the option "Run as Administrator".

The script has pauses in it so the FTA/FTAA can read the output and check for errors, this is also so the script can be closed if the last function fixes the connection problems to the field

### Disable Windows Firewall
Disables all three Windows Firewalls (Public, Private, Domain).

### Enable Firewall rules to allow comms to the field network
Firewall rules are created for the NI mDNS Responder and all the ports listed in the FMS White paper, Season Manual, and FTAA/CSA Troubleshooting. This is done in case the computer has other firewall software.

### Stop Windows updates
The Windows Update Service is stopped

### Disable All Network Adapters and Reset Physical 802.3 (Ethernet) Adapters
All Network Adapters (Including Bluetooth and Cellular) are Disabled. Physical 802.3 (Ethernet) Adapters are then reenabled.
IPv6 is also disabled on all Physical 802.3 (Ethernet) Adapters.

### Set Physical 802.3 (Ethernet) Adapters to use DHCP
Physical 802.3 (Ethernet) Adapters are set to use DHCP for IP Addresses and DNS. 
The DNS Cache is then flushed and all IP addresses released.

### Network Adapter Control Panel opens
ncpa.cpl is opened to allow ease to set a static IP for the connected Ethernet Adapter

### Renew DHCP for Physical 802.3 (Ethernet) Adapters
The renew command is issued for Physical 802.3 (Ethernet) Adapters.

end

#### Domain managed devices with Powershell GPO restrictions.
If the device has a GPO applied that blocks unsigned Powershell, you can run the script by opening it in Powershell ISE launched as admin, selecting the lines of the script, and pressing F8 (Run Selection)




Launch_Revert_FFS_Connect_ChangesPS.bat launches Revert_FFS_Connect_Changes.ps1 (Must be in the same directory, and the batch file must be run as admin)
This Script disables the created rules, enables the Firewall, and starts the Windows update service again.



## Acknowledgements
[Ed Jordan](https://github.com/ejordan376)

[Eric Fletcher](https://github.com/fletch3555)

Doug Frisk
