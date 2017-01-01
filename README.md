# kext-atmel-ice
Kext to be able to use Atmel-ICE with OpenOCD

This can fix the errors:
- `usbdev_open(): error claiming interface`
- `Error: unable to find CMSIS-DAP device`

## Credits
Based on:
- https://d3v0.de/2015-08-atmel-ice-unter-os-x-1/
- https://github.com/jakeh12/atmel-ice-mac-driver

## Changes
To recognize the Atmel-ICE as a HID device, the `IOProviderClass`
should not be `IOUSBInterface` but `IOHIDInterface` as OpenOCD
prefers to use `hidapi`.
