rem Created by Fletcher Salesky
rem FFS Connect (This verson from 2019-09-28)

@echo off
Title FRC   Open Firewall for FMS
rem fancy color
color 06
cls
rem Display current firewall settings
Netsh Advfirewall show allprofiles state
rem DISABLE ALL WINDOWS FIREWALLS
NetSh Advfirewall set allprofiles state off
echo Windows Firewall off
rem add NI mDNS Responser rule
netsh advfirewall firewall add rule name="NI mDNS Responder" dir=in action=allow program="C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe" enable=yes
rem add FRC FMS Ports (Ports from FMS White paper and FTAA/CSA Troubleshooting)
netsh advfirewall firewall add rule name="Open Port UDP 80" dir=in action=allow protocol=UDP localport=80
netsh advfirewall firewall add rule name="Open Port TCP 80" dir=in action=allow protocol=TCP localport=80
netsh advfirewall firewall add rule name="Open Port UDP 443" dir=in action=allow protocol=UDP localport=443
netsh advfirewall firewall add rule name="Open Port TCP 443" dir=in action=allow protocol=TCP localport=443
netsh advfirewall firewall add rule name="Open Port UDP 554" dir=in action=allow protocol=UDP localport=554
netsh advfirewall firewall add rule name="Open Port TCP 554" dir=in action=allow protocol=TCP localport=554
netsh advfirewall firewall add rule name="Open Port UDP 1110" dir=in action=allow protocol=UDP localport=1110
netsh advfirewall firewall add rule name="Open Port TCP 1110" dir=in action=allow protocol=TCP localport=1110
netsh advfirewall firewall add rule name="Open Port UDP 1115" dir=in action=allow protocol=UDP localport=1115
netsh advfirewall firewall add rule name="Open Port TCP 1115" dir=in action=allow protocol=TCP localport=1115
netsh advfirewall firewall add rule name="Open Port UDP 1120" dir=in action=allow protocol=UDP localport=1120
netsh advfirewall firewall add rule name="Open Port TCP 1120" dir=in action=allow protocol=TCP localport=1120
netsh advfirewall firewall add rule name="Open Port UDP 1130" dir=in action=allow protocol=UDP localport=1130
netsh advfirewall firewall add rule name="Open Port TCP 1130" dir=in action=allow protocol=TCP localport=1130
netsh advfirewall firewall add rule name="Open Port UDP 1140" dir=in action=allow protocol=UDP localport=1140
netsh advfirewall firewall add rule name="Open Port TCP 1140" dir=in action=allow protocol=TCP localport=1140
netsh advfirewall firewall add rule name="Open Port UDP 1150" dir=in action=allow protocol=UDP localport=1150
netsh advfirewall firewall add rule name="Open Port TCP 1150" dir=in action=allow protocol=TCP localport=1150
netsh advfirewall firewall add rule name="Open Port UDP 1160" dir=in action=allow protocol=UDP localport=1160
netsh advfirewall firewall add rule name="Open Port TCP 1160" dir=in action=allow protocol=TCP localport=1160
netsh advfirewall firewall add rule name="Open Port UDP 1180" dir=in action=allow protocol=UDP localport=1180
netsh advfirewall firewall add rule name="Open Port TCP 1180" dir=in action=allow protocol=TCP localport=1180
netsh advfirewall firewall add rule name="Open Port UDP 1181" dir=in action=allow protocol=UDP localport=1181
netsh advfirewall firewall add rule name="Open Port TCP 1181" dir=in action=allow protocol=TCP localport=1181
netsh advfirewall firewall add rule name="Open Port UDP 1182" dir=in action=allow protocol=UDP localport=1182
netsh advfirewall firewall add rule name="Open Port TCP 1182" dir=in action=allow protocol=TCP localport=1182
netsh advfirewall firewall add rule name="Open Port UDP 1183" dir=in action=allow protocol=UDP localport=1183
netsh advfirewall firewall add rule name="Open Port TCP 1183" dir=in action=allow protocol=TCP localport=1183
netsh advfirewall firewall add rule name="Open Port UDP 1184" dir=in action=allow protocol=UDP localport=1184
netsh advfirewall firewall add rule name="Open Port TCP 1184" dir=in action=allow protocol=TCP localport=1184
netsh advfirewall firewall add rule name="Open Port UDP 1185" dir=in action=allow protocol=UDP localport=1185
netsh advfirewall firewall add rule name="Open Port TCP 1185" dir=in action=allow protocol=TCP localport=1185
netsh advfirewall firewall add rule name="Open Port UDP 1186" dir=in action=allow protocol=UDP localport=1186
netsh advfirewall firewall add rule name="Open Port TCP 1186" dir=in action=allow protocol=TCP localport=1186
netsh advfirewall firewall add rule name="Open Port UDP 1187" dir=in action=allow protocol=UDP localport=1187
netsh advfirewall firewall add rule name="Open Port TCP 1187" dir=in action=allow protocol=TCP localport=1187
netsh advfirewall firewall add rule name="Open Port UDP 1188" dir=in action=allow protocol=UDP localport=1188
netsh advfirewall firewall add rule name="Open Port TCP 1188" dir=in action=allow protocol=TCP localport=1188
netsh advfirewall firewall add rule name="Open Port UDP 1189" dir=in action=allow protocol=UDP localport=1189
netsh advfirewall firewall add rule name="Open Port TCP 1189" dir=in action=allow protocol=TCP localport=1189
netsh advfirewall firewall add rule name="Open Port UDP 1190" dir=in action=allow protocol=UDP localport=1190
netsh advfirewall firewall add rule name="Open Port TCP 1190" dir=in action=allow protocol=TCP localport=1190
netsh advfirewall firewall add rule name="Open Port UDP 1250" dir=in action=allow protocol=UDP localport=1250
netsh advfirewall firewall add rule name="Open Port TCP 1250" dir=in action=allow protocol=TCP localport=1250
netsh advfirewall firewall add rule name="Open Port UDP 1735" dir=in action=allow protocol=UDP localport=1735
netsh advfirewall firewall add rule name="Open Port TCP 1735" dir=in action=allow protocol=TCP localport=1735
netsh advfirewall firewall add rule name="Open Port UDP 1740" dir=in action=allow protocol=UDP localport=1740
netsh advfirewall firewall add rule name="Open Port TCP 1740" dir=in action=allow protocol=TCP localport=1740
netsh advfirewall firewall add rule name="Open Port UDP 1750" dir=in action=allow protocol=UDP localport=1750
netsh advfirewall firewall add rule name="Open Port TCP 1750" dir=in action=allow protocol=TCP localport=1750
netsh advfirewall firewall add rule name="Open Port UDP 5353" dir=in action=allow protocol=UDP localport=5353
netsh advfirewall firewall add rule name="Open Port TCP 5353" dir=in action=allow protocol=TCP localport=5353
netsh advfirewall firewall add rule name="Open Port UDP 5800" dir=in action=allow protocol=UDP localport=5800
netsh advfirewall firewall add rule name="Open Port TCP 5800" dir=in action=allow protocol=TCP localport=5800
netsh advfirewall firewall add rule name="Open Port UDP 5801" dir=in action=allow protocol=UDP localport=5801
netsh advfirewall firewall add rule name="Open Port TCP 5801" dir=in action=allow protocol=TCP localport=5801
netsh advfirewall firewall add rule name="Open Port UDP 5802" dir=in action=allow protocol=UDP localport=5802
netsh advfirewall firewall add rule name="Open Port TCP 5802" dir=in action=allow protocol=TCP localport=5802
netsh advfirewall firewall add rule name="Open Port UDP 5803" dir=in action=allow protocol=UDP localport=5803
netsh advfirewall firewall add rule name="Open Port TCP 5803" dir=in action=allow protocol=TCP localport=5803
netsh advfirewall firewall add rule name="Open Port UDP 5804" dir=in action=allow protocol=UDP localport=5804
netsh advfirewall firewall add rule name="Open Port TCP 5804" dir=in action=allow protocol=TCP localport=5804
netsh advfirewall firewall add rule name="Open Port UDP 5805" dir=in action=allow protocol=UDP localport=5805
netsh advfirewall firewall add rule name="Open Port TCP 5805" dir=in action=allow protocol=TCP localport=5805
netsh advfirewall firewall add rule name="Open Port UDP 5806" dir=in action=allow protocol=UDP localport=5806
netsh advfirewall firewall add rule name="Open Port TCP 5806" dir=in action=allow protocol=TCP localport=5806
netsh advfirewall firewall add rule name="Open Port UDP 5807" dir=in action=allow protocol=UDP localport=5807
netsh advfirewall firewall add rule name="Open Port TCP 5807" dir=in action=allow protocol=TCP localport=5807
netsh advfirewall firewall add rule name="Open Port UDP 5808" dir=in action=allow protocol=UDP localport=5808
netsh advfirewall firewall add rule name="Open Port TCP 5808" dir=in action=allow protocol=TCP localport=5808
netsh advfirewall firewall add rule name="Open Port UDP 5809" dir=in action=allow protocol=UDP localport=5809
netsh advfirewall firewall add rule name="Open Port TCP 5809" dir=in action=allow protocol=TCP localport=5809
netsh advfirewall firewall add rule name="Open Port UDP 5810" dir=in action=allow protocol=UDP localport=5810
netsh advfirewall firewall add rule name="Open Port TCP 5810" dir=in action=allow protocol=TCP localport=5810
netsh advfirewall firewall add rule name="Open Port UDP 8080" dir=in action=allow protocol=UDP localport=8080
netsh advfirewall firewall add rule name="Open Port TCP 8080" dir=in action=allow protocol=TCP localport=8080
netsh advfirewall firewall add rule name="Open Port UDP 8888" dir=in action=allow protocol=UDP localport=8888
netsh advfirewall firewall add rule name="Open Port TCP 8888" dir=in action=allow protocol=TCP localport=8888

echo FRC ports opened
rem Display current firewall settings
Netsh Advfirewall show allprofiles state
pause

rem Disable all adapters
wmic path win32_networkadapter where "NetEnabled='false'" call disable
wmic path win32_networkadapter where "NetEnabled='true'" call disable
rem Magic (enable Ethernet adapters and set DHCP)
set LIST="Ethernet" "Ethernet 1" "Ethernet 2" "Ethernet 3" "Ethernet 4" "Ethernet 5" "Ethernet 6" "Ethernet 7" "Ethernet 8" "Ethernet 9" "Local Area Connection" "Local Area Connection 1" "Local Area Connection 2" "Local Area Connection 3" "Local Area Connection 4" "Local Area Connection 5" "Local Area Connection 6" "Local Area Connection 7" "Local Area Connection 8" "Local Area Connection 9" 
FOR %%A IN (%LIST%) DO (
	netsh interface show interface | FIND "%%A" /I /C
		IF %ERRORLEVEL% equ 0 (
		netsh interface ip set address %%A dhcp
		netsh interface ip set dns %%A dhcp
		netsh interface set interface %%A admin=enable
		)		
)

echo Wireless Disabled, Ethernet Reset
rem Show Status of Interfaces
netsh interface show interface
pause
rem release everything and flush DNS
ipconfig /flushdns
ipconfig /release
ipconfig /release6
echo dns flushed
echo relesed IP's
rem Stop Windows Update Service
net stop wuauserv
rem open Network Adapters just in case
control ncpa.cpl
echo Get IP with DHCP?
pause
rem renew IP for all adapters containing Ethernet
ipconfig /renew *Ethernet*
rem renew IP for all adapters containing Local
ipconfig /renew *Local*
rem ipconfig /renew6 (Don't need to do this)
echo IP's Renewed