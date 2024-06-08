# Z97X-SLI_Big_Sur
hackintosh stuff

Pre requirement: Update to the latest beta BIOS (F10b), because it has this important bug fix: "Fix memory compatibility"

BIOS settings:

- Extreme Memory Profile(X.M.P.): Profile1
- Bootup NumLock State: Disabled
- Full Screen LOGO Show: Disabled
- Windows 8 Features: Windows 8
- CSM Support: Always
- Boot Mode Selection: UEFI Only
- Storage Boot Option Control: UEFI Only
- Ipv4 PXE Support: Disabled
- Ipv6 PXE Support: Disabled
- Secure Boot: Disabled
- Legacy USB Support: Disabled
- Serial Port A: Disabled
- Parallel Port: Disabled
- Intel(R) Ethernet Network Connection i217-V => NIC Configuration => Wake on LAN: Disabled
- Wake on LAN: Disabled
- RC6(Render Standby): Disabled

For USB installer, in OC config.plist change Misc > Security > ScanPolicy value to 0.

To flash the FPT bootable file

In macOS/Linux

1. sudo cp "path/to/Z97XSLI.img" /dev/sdX
2. sudo sync

In Windows flash it with Rufus, select Z97XSLI.vhd file



Post install

In Terminal, type

% sudo pmset womp 0 autopoweroff 0 ttyskeepawake 0
