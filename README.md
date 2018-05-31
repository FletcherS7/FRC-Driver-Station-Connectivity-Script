# FRC_FTA_DS-FMS_Script
A batch file that performs the most common fixes for driver station comm's issues

FRC_FMS_Firewall_fix_v2.bat must be run as admin in order for all commands to execute. The script has pauses in it so the FTA/FTAA can read the output and check for errors, this is also so the batch can be closed if the last step that was run fixed the connection problems.

This script starts by adding the NI mDNS Responder and all the ports listed in the FMS White paper and the FTAA/CSA Troubleshooting. This is done in case the computer has other firewall software.

All three Windows firewall's are then disabled (Public, Private, Domain).

The next step is a bit of magic. All network adapters are disabled. Adapters labeled as "Ethernet" (Win10) or "Local Area Connection" (Win7) are enabled again. If the computer has more than 9 Ethernet adapters, you will have to enable the rest manually.

The next step flushes the DNS and releases all IP addresses. We then only renew IPv4 (on Ethernet adapters).

Finally, the network adapter page is opened in case any more troubleshooting needs to be done

The Windows update service is disabled to prevent Windows updating mid match.







Revert_firewall_changes.bat Removes the created rules, enables the firewall, and starts the windows update service again.

