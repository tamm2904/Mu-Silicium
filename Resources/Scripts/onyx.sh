#!/bin/bash
FDDIR="./Build/onyxPkg/${TARGET_BUILD_MODE}_CLANGPDB/FV"
cat ./BootShim/BootShim.bin "${FDDIR}/ONYX_UEFI.fd" > "${FDDIR}/onyx-shim"||exit 1
gzip -c < "${FDDIR}/onyx-shim" > "${FDDIR}/onyx-shim.gz"||exit 1
cat "${FDDIR}/onyx-shim.gz" ./Resources/DTBs/onyx.dtb > ./Resources/bootpayload.bin||exit 1
python3 ./Resources/Scripts/mkbootimg.py --kernel ./Resources/bootpayload.bin --ramdisk ./Resources/ramdisk --kernel_offset 0x00000000 --ramdisk_offset 0x00000000 --tags_offset 0x00000000 --os_version 15.0.0 --header_version 4 -o "Mu-onyx${MODEL_NAME}.img" ||_error "Failed!"