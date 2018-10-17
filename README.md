# FRC-Driver-Station-Connectivity-Script

A batch file that performs the most common fixes for driver station comm's issues

FFS_Connect.bat must be run as admin in order for all commands to execute. It is recomended you create a shortcut and add the option "Run as Administrator".

The script has pauses in it so the FTA/FTAA can read the output and check for errors, this is also so the batch can be closed if the last step that was run fixed the connection problems.

This script starts by adding the NI mDNS Responder and all the ports listed in the FMS White paper and the FTAA/CSA Troubleshooting. This is done in case the computer has other firewall software.

All three Windows firewall's are then disabled (Public, Private, Domain).

All network adapters are then disabled. Adapters labeled as "Ethernet" (Win10) or "Local Area Connection" (Win7) are enabled again. If the computer has more than 9 Ethernet adapters, you will have to enable the rest manually.

The next step flushes the DNS and releases all IP addresses. We then only renews IPv4 on Ethernet adapters.

The network adapter page is opened in case any more troubleshooting needs to be done


The Windows update service is also disabled to prevent Windows updating mid match.







Revert_firewall_changes.bat Removes the created rules, enables the firewall, and starts the windows update service again.


Thank You to (Ed Jordan)[https://github.com/ejordan376] and (Eric Fletcher)[https://github.com/fletch3555]
