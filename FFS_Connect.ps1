# Created by Fletcher Salesky
# FFS Connect (This verson from 2021-10-06)

#Display current firewall settings
Get-NetFirewallProfile | Format-List -Property Profile, Enabled

#DISABLE ALL WINDOWS FIREWALLS
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
echo "Disabled Windows Firewall"

#Create Firewall allow rules for FRC FMS Ports (Ports from FMS White Paper, WPIlib and The FTAA/CSA Troubleshooting)
#Create Firwall allow rule for NI mDNS Responser
function Install-Firewall-Rules
{
  $rule = Get-NetFirewallRule -Group "Allow FRC Driver Station FMS Comms" 2> $null;
    if ($rule) {
         #enable-update rules if they exist    
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_in -Direction Inbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_in -Direction Inbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_in -Direction Inbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Enabled True -Profile Any

         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_out -Direction Outbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_out -Direction Outbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_out -Direction Outbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Enabled True -Profile Any
    }

    else {
        #create rules if they do not exist
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms TCP" -Direction Inbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms UDP" -Direction Inbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms NI mDNS Responder" -Direction Inbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow

        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms TCP" -Direction Outbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms UDP" -Direction Outbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms NI mDNS Responder" -Direction Outbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow
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
echo ""
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

#flush DNS
Clear-DnsClientCache
echo "DNS Flushed"
#Release everything
ipconfig /release
ipconfig /release6
echo "IP Addresses Released"

#open Network Adapters Conntrol Panel to allow Static IP setting
control ncpa.cpl

echo "Get IP Address with DHCP?"
pause

#Renew DHCP for Physical 802.3 Adapters
foreach ($adapter in $physicalAdapters)
{
    if ($adapter.PhysicalMediaType -like "*802.3")
    {
		ipconfig /renew $adapter.Name
    }

}
Echo "Ethernet Adapter IP Addresses Renewed"

