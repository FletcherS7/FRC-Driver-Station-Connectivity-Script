echo "    _________________    __________  _   ___   ____________________"
echo "   / ____/ ____/ ___/   / ____/ __ \/ | / / | / / ____/ ____/_  __/"
echo "  / /_  / /_   \__ \   / /   / / / /  |/ /  |/ / __/ / /     / /   "
echo " / __/ / __/  ___/ /  / /___/ /_/ / /|  / /|  / /___/ /___  / /    "
echo "/_/   /_/    /____/   \____/\____/_/ |_/_/ |_/_____/\____/ /_/     "
echo "                                                                   "
echo "FFS Connect (This version from 2023-11-26)"
echo "Created by Fletcher Salesky"
#Display current firewall settings
Get-NetFirewallProfile | Format-List -Property Profile, Enabled

#DISABLE ALL WINDOWS FIREWALLS
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
echo "Disabled Windows Firewall"

#Create Firewall allow rules for FRC FMS Ports (Ports from FMS White Paper, WPIlib and The FTAA/CSA Troubleshooting)
#Create Firewall allow rule for NI mDNS Responser
function Install-Firewall-Rules
{
  echo "Checking if Firewall Rules already exist"
  $rule = Get-NetFirewallRule -Group "Allow FRC Driver Station FMS Comms" 2> $null;
    if ($rule) {
         #enable-update rules if they exist
         echo "Existing rules found, Updated and Enabled Firewall Rules"
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_in -Direction Inbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_in -Direction Inbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_in -Direction Inbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Enabled True -Profile Any

         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_out -Direction Outbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_out -Direction Outbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_out -Direction Outbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Enabled True -Profile Any
    }

    else {
        #create rules if they do not exist
        echo "Rules do not exist, Creating Firewall Rules"
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms TCP" -Direction Inbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms UDP" -Direction Inbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms NI mDNS Responder" -Direction Inbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Profile Any

        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms TCP" -Direction Outbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms UDP" -Direction Outbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1122,1130,1140,1150,1160,1180-1190,1250,1735,1740,1741,1750,5353,5800-5810,6666,8080,8888 -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms NI mDNS Responder" -Direction Outbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Profile Any
    }
}

#Enable the Firewall rules to allow comms to the field network
Install-Firewall-Rules
echo "Firewall Opened to FRC Protocols"

#Display current firewall settings
Get-NetFirewallProfile | Format-List -Property Profile, Enabled

#Stop Windows updates
net stop wuauserv
echo "Windows Update Service Stopped"
echo " "
echo " "
echo "Reset Ethernet adapters and disable other adapters?"
pause

#Get All Adapters
$adapters = Get-NetAdapter

#Disable all adapters
foreach ($adapter in $adapters)
{
    Disable-NetAdapter -name $adapter.Name -Confirm:$false
}

#Get Physical Adapters
$physicalAdapters = Get-NetAdapter -Physical

#Enable Physical 802.3 Adapters and Disable IPv6 on Physical 802.3 Adapters
foreach ($adapter in $physicalAdapters)
{
    if ($adapter.PhysicalMediaType -like "*802.3")
    {
        Enable-NetAdapter -name $adapter.Name -Confirm:$false
        Disable-NetAdapterBinding -name $adapter.Name -ComponentID ms_tcpip6
    }

}
echo "Wireless Adapters Disabled, Ethernet Adapters Reset"
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
echo "DNS Flushed"
#Release everything
ipconfig /release
ipconfig /release6
echo "IP Addresses Released"

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
Echo "Ethernet Adapter IP Addresses Renewed"

Start-Sleep -s 2

#Set Connection to Private
echo "Set Network Category as Private"
Set-NetConnectionProfile -NetworkCategory "Private"

Start-Sleep -s 2
