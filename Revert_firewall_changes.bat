@echo off
Title Enable Windows Firewall
cls
rem enable firewall
NetSh Advfirewall set allprofiles state on
Netsh Advfirewall show allprofiles state
pause
rem remove NI mDNS Responser rule
netsh advfirewall firewall delete rule name="NI mDNS Responder" program="C:\Program Files\National Instruments\Shared\mDNS Responder\nimdnsResponder.exe"
rem remove port rules
netsh advfirewall firewall delete rule name="Open Port UDP 80" protocol=UDP localport=80
netsh advfirewall firewall delete rule name="Open Port TCP 80" protocol=TCP localport=80
netsh advfirewall firewall delete rule name="Open Port UDP 443" protocol=UDP localport=443
netsh advfirewall firewall delete rule name="Open Port TCP 443" protocol=TCP localport=443
netsh advfirewall firewall delete rule name="Open Port UDP 554" protocol=UDP localport=554
netsh advfirewall firewall delete rule name="Open Port TCP 554" protocol=TCP localport=554
netsh advfirewall firewall delete rule name="Open Port UDP 1110" protocol=UDP localport=1110
netsh advfirewall firewall delete rule name="Open Port TCP 1110" protocol=TCP localport=1110
netsh advfirewall firewall delete rule name="Open Port UDP 1115" protocol=UDP localport=1115
netsh advfirewall firewall delete rule name="Open Port TCP 1115" protocol=TCP localport=1115
netsh advfirewall firewall delete rule name="Open Port UDP 1120" protocol=UDP localport=1120
netsh advfirewall firewall delete rule name="Open Port TCP 1120" protocol=TCP localport=1120
netsh advfirewall firewall delete rule name="Open Port UDP 1130" protocol=UDP localport=1130
netsh advfirewall firewall delete rule name="Open Port TCP 1130" protocol=TCP localport=1130
netsh advfirewall firewall delete rule name="Open Port UDP 1140" protocol=UDP localport=1140
netsh advfirewall firewall delete rule name="Open Port TCP 1140" protocol=TCP localport=1140
netsh advfirewall firewall delete rule name="Open Port UDP 1150" protocol=UDP localport=1150
netsh advfirewall firewall delete rule name="Open Port TCP 1150" protocol=TCP localport=1150
netsh advfirewall firewall delete rule name="Open Port UDP 1160" protocol=UDP localport=1160
netsh advfirewall firewall delete rule name="Open Port TCP 1160" protocol=TCP localport=1160
netsh advfirewall firewall delete rule name="Open Port UDP 1180" protocol=UDP localport=1180
netsh advfirewall firewall delete rule name="Open Port TCP 1180" protocol=TCP localport=1180
netsh advfirewall firewall delete rule name="Open Port UDP 1181" protocol=UDP localport=1181
netsh advfirewall firewall delete rule name="Open Port TCP 1181" protocol=TCP localport=1181
netsh advfirewall firewall delete rule name="Open Port UDP 1182" protocol=UDP localport=1182
netsh advfirewall firewall delete rule name="Open Port TCP 1182" protocol=TCP localport=1182
netsh advfirewall firewall delete rule name="Open Port UDP 1183" protocol=UDP localport=1183
netsh advfirewall firewall delete rule name="Open Port TCP 1183" protocol=TCP localport=1183
netsh advfirewall firewall delete rule name="Open Port UDP 1184" protocol=UDP localport=1184
netsh advfirewall firewall delete rule name="Open Port TCP 1184" protocol=TCP localport=1184
netsh advfirewall firewall delete rule name="Open Port UDP 1185" protocol=UDP localport=1185
netsh advfirewall firewall delete rule name="Open Port TCP 1185" protocol=TCP localport=1185
netsh advfirewall firewall delete rule name="Open Port UDP 1186" protocol=UDP localport=1186
netsh advfirewall firewall delete rule name="Open Port TCP 1186" protocol=TCP localport=1186
netsh advfirewall firewall delete rule name="Open Port UDP 1187" protocol=UDP localport=1187
netsh advfirewall firewall delete rule name="Open Port TCP 1187" protocol=TCP localport=1187
netsh advfirewall firewall delete rule name="Open Port UDP 1188" protocol=UDP localport=1188
netsh advfirewall firewall delete rule name="Open Port TCP 1188" protocol=TCP localport=1188
netsh advfirewall firewall delete rule name="Open Port UDP 1189" protocol=UDP localport=1189
netsh advfirewall firewall delete rule name="Open Port TCP 1189" protocol=TCP localport=1189
netsh advfirewall firewall delete rule name="Open Port UDP 1190" protocol=UDP localport=1190
netsh advfirewall firewall delete rule name="Open Port TCP 1190" protocol=TCP localport=1190
netsh advfirewall firewall delete rule name="Open Port UDP 1250" protocol=UDP localport=1250
netsh advfirewall firewall delete rule name="Open Port TCP 1250" protocol=TCP localport=1250
netsh advfirewall firewall delete rule name="Open Port UDP 1735" protocol=UDP localport=1735
netsh advfirewall firewall delete rule name="Open Port TCP 1735" protocol=TCP localport=1735
netsh advfirewall firewall delete rule name="Open Port UDP 1740" protocol=UDP localport=1740
netsh advfirewall firewall delete rule name="Open Port TCP 1740" protocol=TCP localport=1740
netsh advfirewall firewall delete rule name="Open Port UDP 1750" protocol=UDP localport=1750
netsh advfirewall firewall delete rule name="Open Port TCP 1750" protocol=TCP localport=1750
netsh advfirewall firewall delete rule name="Open Port UDP 5353" protocol=UDP localport=5353
netsh advfirewall firewall delete rule name="Open Port TCP 5353" protocol=TCP localport=5353
netsh advfirewall firewall delete rule name="Open Port UDP 5800" protocol=UDP localport=5800
netsh advfirewall firewall delete rule name="Open Port TCP 5800" protocol=TCP localport=5800
netsh advfirewall firewall delete rule name="Open Port UDP 5801" protocol=UDP localport=5801
netsh advfirewall firewall delete rule name="Open Port TCP 5801" protocol=TCP localport=5801
netsh advfirewall firewall delete rule name="Open Port UDP 5802" protocol=UDP localport=5802
netsh advfirewall firewall delete rule name="Open Port TCP 5802" protocol=TCP localport=5802
netsh advfirewall firewall delete rule name="Open Port UDP 5803" protocol=UDP localport=5803
netsh advfirewall firewall delete rule name="Open Port TCP 5803" protocol=TCP localport=5803
netsh advfirewall firewall delete rule name="Open Port UDP 5804" protocol=UDP localport=5804
netsh advfirewall firewall delete rule name="Open Port TCP 5804" protocol=TCP localport=5804
netsh advfirewall firewall delete rule name="Open Port UDP 5805" protocol=UDP localport=5805
netsh advfirewall firewall delete rule name="Open Port TCP 5805" protocol=TCP localport=5805
netsh advfirewall firewall delete rule name="Open Port UDP 5806" protocol=UDP localport=5806
netsh advfirewall firewall delete rule name="Open Port TCP 5806" protocol=TCP localport=5806
netsh advfirewall firewall delete rule name="Open Port UDP 5807" protocol=UDP localport=5807
netsh advfirewall firewall delete rule name="Open Port TCP 5807" protocol=TCP localport=5807
netsh advfirewall firewall delete rule name="Open Port UDP 5808" protocol=UDP localport=5808
netsh advfirewall firewall delete rule name="Open Port TCP 5808" protocol=TCP localport=5808
netsh advfirewall firewall delete rule name="Open Port UDP 5809" protocol=UDP localport=5809
netsh advfirewall firewall delete rule name="Open Port TCP 5809" protocol=TCP localport=5809
netsh advfirewall firewall delete rule name="Open Port UDP 5810" protocol=UDP localport=5810
netsh advfirewall firewall delete rule name="Open Port TCP 5810" protocol=TCP localport=5810
netsh advfirewall firewall delete rule name="Open Port UDP 8080" protocol=UDP localport=8080
netsh advfirewall firewall delete rule name="Open Port TCP 8080" protocol=TCP localport=8080
netsh advfirewall firewall delete rule name="Open Port UDP 8888" protocol=UDP localport=8888
netsh advfirewall firewall delete rule name="Open Port TCP 8888" protocol=TCP localport=8888
rem enable Windows Update Service
echo Turn Windows Update Service On
net start wuauserv
pause
