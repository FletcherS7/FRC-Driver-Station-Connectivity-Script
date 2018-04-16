# FRC_FTA_DS-FMS_Script
A batch file that performs the most common fixes for driver station comm's issues

FRC_FMS_Firewall_fix_v2.bat must be run as admin in order for all commands to execute.
The script has pauses in it so the FTA/FTAA can read the output and check for errors, this is also so the batch can be closed if the last step that was run fixed the connection problems.

This script starts by adding the NI mDNS Responder and all the ports listed in the FMS White paper and the FTAA/CSA Troubleshooting. This is done in case the computer has other firewall software.

Then all three Windows firewall's are disabled (Public, Private, Domain)

The next step disables all network adapters. Then only enables adapters labeled as "Ethernet" (Win10) or "Local Area Connection" (Win7)
If the computer has more than 9 Ethernet adapters, you will have to enable the rest manually.

After that, the next step flushes the DNS and release all IP addresses. We then only renew IPv4.

Finally, the network adapter page is opened in case any more troubleshooting needs to be done

After that, the Windows update service is disabled to prevent Windows updating mid match.





Revert_firewall_changes.bat Removes the created rules, enables the firewall, and starts the windows update service again.

