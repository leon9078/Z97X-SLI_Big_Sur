# Z97X-SLI_Big_Sur
hackintosh stuff
Update to the latest beta BIOS (F10b), because it has this important bug fix: "Fix memory compatibility"

BIOS settings:

Intel(R) Turbo Boost Technology: Enabled
Extreme Memory Profile(X.M.P.): Profile1
Bootup NumLock State: Disabled
Full Screen LOGO Show: Disabled
Windows 8 Features: Windows 8 WHQL
CSM Support: Never
Boot Mode Selection: UEFI Only
Storage Boot Option Control: UEFI Only
Ipv4 PXE Support: Disabled
Ipv6 PXE Support: Disabled
Secure Boot: Disabled
Initial Display Output: IGFX
XHCI Mode: Enabled
Legacy USB Support: Disabled
Serial Port A: Disabled
Parallel Port: Disabled
Intel(R) Ethernet Network Connection i217-V - 74:D4:35:E6:42:2C => NIC Configuration => Wake on LAN: Disabled
Wake on LAN: Disabled
RC6(Render Standby): Disabled

For USB installer use EFI_USB.zip, for Target SATA drive use EFI.zip

To flash the FPT bootable file

In macOS/Linux

$ sudo cp "path/to/Z97XSLI.img" /dev/sdX
$ sudo sync

In Windows flash it with Rufus, select Z97XSLI.vhd file



Post install

In Terminal, type

% sudo pmset womp 0 (Disable Wake on LAN in macOS)
% sudo pmset autopoweroff 0 (Disable a lower power chipset sleep. Put the PC in ACPI S5...)
% sudo pmset ttyskeepawake 0 (Disable idle system sleep when any tty (e.g. remote login session) is 'active')
