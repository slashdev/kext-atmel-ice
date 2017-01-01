#!/bin/sh
set -o nounset
set -o errexit

# Require sudo
if [[ $UID != 0 ]]; then
  echo "Please run this script with sudo:"
  echo "sudo $0 $*"
  exit 1
fi

# Check arguments
if [[ $# < 2 ]]; then
  echo "Usage: $0 <productId> <vendorId>"
  exit 1
fi

PID="$1"
VID="$2"
K_DIR="/System/Library/Extensions/AtmelICE.kext"

# Create required directories
mkdir -p ${K_DIR}/Contents/

# Copy KEXT into the Contents directory
cp Info.plist ${K_DIR}/Contents/

# Change ProductId and VendorId
sed -i "s/{{PID}}/${PID}/" ${K_DIR}/Contents/Info.plist
sed -i "s/{{VID}}/${VID}/" ${K_DIR}/Contents/Info.plist

# Change ownership and rights
chown -R root:wheel ${K_DIR}
chmod -R 755 ${K_DIR}

# Reload Kext cache
kextcache -system-caches

# Urge to reboot
echo "Please reboot to load this kext correctly."
