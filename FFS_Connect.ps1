echo "    _________________    __________  _   ___   ____________________"
echo "   / ____/ ____/ ___/   / ____/ __ \/ | / / | / / ____/ ____/_  __/"
echo "  / /_  / /_   \__ \   / /   / / / /  |/ /  |/ / __/ / /     / /   "
echo " / __/ / __/  ___/ /  / /___/ /_/ / /|  / /|  / /___/ /___  / /    "
echo "/_/   /_/    /____/   \____/\____/_/ |_/_/ |_/_____/\____/ /_/     "
echo "                                                                   "
echo "FFS Connect (This version from 2024-10-19)"
echo "Created by Fletcher Salesky"
#A PowerShell script that performs the most common fixes for Driver Station communication issues to the FIRST Robotics Competition Field Managment System Field Network.
#Learn more about this script, get updates, and contribute at https://driverstation.app 

#Display current firewall settings.
Get-NetFirewallProfile | Format-List -Property Profile, Enabled

#DISABLE ALL WINDOWS FIREWALLS to allow communication to the FIRST Robotics Competition Field Managment System (FMS).
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
echo "Disabled Windows Firewall"

#Create Firewall allow rules for FIRST Robotics Competition Field Managment System (FMS) Ports (Ports from the Season Game Manual, FMS White Paper, WPIlib Docs and the FTAA/CSA Troubleshooting).
#Create Firewall allow rule for National Instruments mDNS Responser.
#Create Firewall allow rule for National Instruments Driver Station.
function Install-Firewall-Rules
{
  echo "Checking if Firewall Rules already exist"
  $rule = Get-NetFirewallRule -Group "Allow FRC Driver Station FMS Comms" 2> $null;
    if ($rule) {
         #enable-update rules if they exist.
         echo "Existing rules found, Updated and Enabled Firewall Rules"
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_in -Direction Inbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_in -Direction Inbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_in -Direction Inbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_DS_in -Direction Inbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files (x86)\FRC Driver Station\DriverStation.exe" -Action Allow -Enabled True -Profile Any

         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_out -Direction Outbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_out -Direction Outbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_out -Direction Outbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_DS_out -Direction Outbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files (x86)\FRC Driver Station\DriverStation.exe" -Action Allow -Enabled True -Profile Any
    }

    else {
        #create rules if they do not exist.
        echo "Rules do not exist, Creating Firewall Rules"
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms TCP" -Direction Inbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms UDP" -Direction Inbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms NI mDNS Responder" -Direction Inbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_DS_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms NI Driver Stationr" -Direction Inbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files (x86)\FRC Driver Station\DriverStation.exe" -Action Allow -Profile Any

        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms TCP" -Direction Outbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms UDP" -Direction Outbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms NI mDNS Responder" -Direction Outbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_DS_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms NI Driver Station" -Direction Outbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files (x86)\FRC Driver Station\DriverStation.exe" -Action Allow -Profile Any
    }
}

#Enable the Firewall rules to allow communications to the FIRST Robotics Competition Field Managment System (FMS) field network.
Install-Firewall-Rules
echo "Firewall Opened to FRC Protocols"

#Display current firewall settings
Get-NetFirewallProfile | Format-List -Property Profile, Enabled

#Stop Windows updates Service to prevent updates during a FIRST Robotics Competition match.
net stop wuauserv
echo "Windows Update Service Stopped"
echo " "
echo " "
echo "Reset Ethernet adapters and disable other adapters?"
pause

#Get All Adapters
$adapters = Get-NetAdapter

#Disable and reset all adapters to resolve adapter issues 
foreach ($adapter in $adapters)
{
    Disable-NetAdapter -name $adapter.Name -Confirm:$false
}

#Get Physical Adapters
$physicalAdapters = Get-NetAdapter -Physical

#Enable Physical 802.3 Adapters and Disable IPv6 on Physical 802.3 Adapters becuase devices connect to the FIRST Robotics Competition Field Managment System (FMS) field network via ethernet using IPv4.
foreach ($adapter in $physicalAdapters)
{
    if ($adapter.PhysicalMediaType -like "*802.3")
    {
        Enable-NetAdapter -name $adapter.Name -Confirm:$false
        Disable-NetAdapterBinding -name $adapter.Name -ComponentID ms_tcpip6
    }

}
echo "Wireless Adapters and IPv6 Disabled, Ethernet Adapters Reset"
#Show Status of Adapters
Get-NetAdapter | Format-List -Property Name,Status,AdminStatus,HardwareInterface

echo "Set Ethernet adapters to use DHCP?"
pause

#Set Physical 802.3 Adapters to use DHCP
foreach ($adapter in $physicalAdapters)
{
    if ($adapter.PhysicalMediaType -like "*802.3")
    {
        netsh interface ip set address $adapter.Name dhcp
        netsh interface ip set dns $adapter.Name dhcp
    }

}

#Flush DNS
Clear-DnsClientCache
echo "DNS Cache Flushed"
#Release all DCHP leases
ipconfig /release
ipconfig /release6
echo "All DHCP Leases Released"

#Ask to open Network Adapters Control Panel to allow Static IP setting instead of using DHCP
$confirmation = Read-Host "Open Network Adapters Control Panel to set Static IP? [Y/N]"
while($confirmation -ne "n")
{
    if ($confirmation -eq 'y') 
    {
        control ncpa.cpl
        echo "Opened ncpa.cpl"
        echo ""
        echo ""
        Start-Sleep -s 2
        exit
    }
    $confirmation = Read-Host "Open Network Adapters Control Panel to set Static IP? Must Answer [Y or N]"
}

echo "Geting IP Address with DHCP"

#Renew DHCP for Physical 802.3 Adapters
foreach ($adapter in $physicalAdapters)
{
    if ($adapter.PhysicalMediaType -like "*802.3")
    {
        ipconfig /renew $adapter.Name
    }

}
Echo "Ethernet Adapter DHCP Lease Renewed"

Start-Sleep -s 2

#Set Connection to Private
echo "Set Network Category as Private"
Set-NetConnectionProfile -NetworkCategory "Private"

Start-Sleep -s 2
