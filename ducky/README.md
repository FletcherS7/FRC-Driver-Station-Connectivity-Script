# Ducky Script Version of the FRC-Driver-Station-Connectivity-Script

This version of the script is functionally equivalent to the version provided in the main folder of this repository. However, several commands have been moved out of the powershell script and moved into separate Ducky Script commands to minimize the amount of data encoded in the base64 binary. 

## Execution and Resources

This script leverages base64 encoding to compress the powershell script. During execution, the script is typed out by the USB Rubber Ducky, decompressed, and immediately executed. The following resources are required to re-encode a new powershell script and build a Rubber Ducky binary:

- [thisismyrobot/loaduck](https://github.com/thisismyrobot/loaduck) - Compression utility used to encode a powershell script into Ducky Script
- [kevinthehermit/DuckToolkit](https://github.com/kevthehermit/DuckToolkit) - Encoding tools for Rubber Ducky
- [Hak5 Payload Studio](https://payloadstudio.hak5.org/community/) - Alternative tools for encoding Rubber Ducky Scripts

## Build Your Own

- USB Rubber Ducky hardware can be purchased directly from Hak5 ([link](https://shop.hak5.org/products/usb-rubber-ducky))
- A Raspberry Pi Pico can also be programmed to operate as a USB Rubber Ducky: [dbisu/pico-ducky](https://github.com/dbisu/pico-ducky)