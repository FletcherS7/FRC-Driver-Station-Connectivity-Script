# Created by Fletcher Salesky
# This Script undoes the changes made by FFS Connect (This verson from 2021-10-06)

#Display current firewall settings
Get-NetFirewallProfile | Format-List -Property Profile, Enabled

#Enable ALL WINDOWS FIREWALLS
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
echo "Enabled Windows Firewall"

#Disable Field Netowrk comms rules
Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_in -Direction Inbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Enabled False -Profile Any
Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_in -Direction Inbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Enabled False -Profile Any
Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_in -Direction Inbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Enabled False -Profile Any

Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_out -Direction Outbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Enabled False -Profile Any
Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_out -Direction Outbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Enabled False -Profile Any
Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_out -Direction Outbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Enabled False -Profile Any

#Display current firewall settings
Get-NetFirewallProfile | Format-List -Property Profile, Enabled

#Start Windows updates
Set-Service -Name wuauserv -Status Running
echo "Windows Update Service Started"

#Get Adapters
$adapters = Get-NetAdapter

#Enable all adapters
foreach ($adapter in $adapters)
{
    Enable-NetAdapter -name $adapter.Name -Confirm:$false
}

#Enable  IPv6 on 802.3 Adapters
foreach ($adapter in $adapters)
{
    if ($adapter.PhysicalMediaType -like "*802.3")
    {
        Disable-NetAdapterBinding -name $adapter.Name -ComponentID ms_tcpip6
    }

}
echo "Adapters Enabled, IPv6 Enabled"
#Show Status of Adapters
Get-NetAdapter | Format-List -Property Name,Status,AdminStatus

