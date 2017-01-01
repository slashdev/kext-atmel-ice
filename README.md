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

## Installation
1. Retrieve the product ID and vendor ID of your Atmel-ICE:
    - You can use `lsusb` to list it, an example output looks like this:

        ```
        Bus 020 Device 015: ID 03eb:2141 Atmel Corporation Atmel-ICE CMSIS-DAP  Serial: J41800053365
        ```

        Where `03eb` is the product ID and `2141` is the vendor ID (in hex).
    - Open `System Information`, then in `Hardware` open `USB`. Find your
        Atmel-ICE in the list and click on it. At the bottom you can find the
        `Product ID` and `Vendor ID`.

2. Use `./install.sh <productId> <vendorId>` to install the kext correctly.
3. Reboot your Mac.
