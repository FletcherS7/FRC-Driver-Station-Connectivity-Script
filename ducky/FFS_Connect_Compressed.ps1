function Install-Firewall-Rules
{
  echo "Checking if Firewall Rules already exist"
  $rule = Get-NetFirewallRule -Group "Allow FRC Driver Station FMS Comms" 2> $null;
    if ($rule) {
         #enable-update rules if they exist
         echo "Existing rules found, Updated and Enabled Firewall Rules"
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_in -Direction Inbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_in -Direction Inbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_in -Direction Inbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Enabled True -Profile Any

         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_out -Direction Outbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_out -Direction Outbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Enabled True -Profile Any
         Set-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_out -Direction Outbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Enabled True -Profile Any
    }

    else {
        #create rules if they do not exist
        echo "Rules do not exist, Creating Firewall Rules"
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms TCP" -Direction Inbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms UDP" -Direction Inbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -LocalPort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_in -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms NI mDNS Responder" -Direction Inbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Profile Any

        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_TCP_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms TCP" -Direction Outbound -Protocol TCP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_UDP_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms UDP" -Direction Outbound -Protocol UDP -RemoteAddress 10.0.0.0/8 -RemotePort 80,443,554,1110,1115,1120,1130,1140,1150,1160,1180-1190,1250,1735,1740,1750,5353,5800-5810,8080,8888 -Action Allow -Profile Any
        New-NetFirewallRule -Name FRC_Driver_Station_FMS_Comms_mDNS_out -Group "Allow FRC Driver Station FMS Comms" -DisplayName "FRC Driver Station FMS Comms NI mDNS Responder" -Direction Outbound -RemoteAddress 10.0.0.0/8 -Program "C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" -Action Allow -Profile Any
    }
}

Install-Firewall-Rules

echo "Reset Ethernet adapters? "
pause

$adapters = Get-NetAdapter

foreach ($adapter in $adapters)
{
    Disable-NetAdapter -name $adapter.Name -Confirm:$false
}

$physicalAdapters = Get-NetAdapter -Physical

foreach ($adapter in $physicalAdapters)
{
    if ($adapter.PhysicalMediaType -like "*802.3")
    {
        Enable-NetAdapter -name $adapter.Name -Confirm:$false
        Disable-NetAdapterBinding -name $adapter.Name -ComponentID ms_tcpip6
    }

}

echo "Set Ethernet adapters to use DHCP?"
pause

foreach ($adapter in $physicalAdapters)
{
    if ($adapter.PhysicalMediaType -like "*802.3")
    {
        netsh interface ip set address $adapter.Name dhcp
        netsh interface ip set dns $adapter.Name dhcp
    }

}

Clear-DnsClientCache
ipconfig /release
ipconfig /release6

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

echo "Get IP Address with DHCP?"
pause

foreach ($adapter in $physicalAdapters)
{
    if ($adapter.PhysicalMediaType -like "*802.3")
    {
        ipconfig /renew $adapter.Name
    }

}
echo "Ethernet Adapter IP Addresses Renewed"
Start-Sleep -s 2