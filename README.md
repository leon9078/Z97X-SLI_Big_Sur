# Z97X-SLI_Big_Sur
hackintosh stuff

Pre requirement: Update to the latest beta BIOS (F10b), because it has this important bug fix: "Fix memory compatibility"

The provided .img/.vhd image files have the following edits, done by me using UEFITool software:

1) Updated the CPU microcode version to the latest revision: 0x28
2) Updated Intel GbE region with the my specific MAC Address

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

To flash the FPT bootable file

In macOS/Linux

1. sudo cp "path/to/Z97XSLI.img" /dev/sdX
2. sudo sync

In Windows flash it with Rufus, select Z97XSLI.vhd file

Post install:

Insert Arch Linux USB installer, boot from it F12 key

- setfont ter-i16b
- lsblk
- mount /dev/sdX1 /mnt
- nano -c /mnt/EFI/OC/config.plist

Replace "LauncherOption" value from "Disabled" to "Full"
Replace "ScanPolicy" value  from "0" to "65795"

Save (Ctrl+O), then exit (Ctrl+X)
- systemctl reboot

Unplug the Arch installer USB drive, boot to OpenCore, but at the menu press TAB key twice to select Reboot

Reinsert to Arch USB drive, now F12 key > boot back to the Arch USB

- setfont ter-i16b
- efibootmgr

You should have three entries:
Boot0001 is "UEFI OS" (EFI\BOOT\BOOTx64.efi)
Boot0002 is "OpenCore" (EFI\OC\OpenCore.efi)
Boot0003 is "UEFI:" (Arch USB)

What we need to do is manually change the order of those entries to have OpenCore first, then UEFI OS:

- efibootmgr -O #Delete Boot Order
- cp /sys/firmware/efi/efivars/Boot0001* /sys/firmware/efi/efivars/Boot0004*
- efibootmgr #Verify duplicate entry has been added
- efibootmgr -Bb 0001
- cp /sys/firmware/efi/efivars/Boot0002* /sys/firmware/efi/efivars/Boot0001*
- efibootmgr
- efibootmgr -Bb 0002
- cp /sys/firmware/efi/efivars/Boot0004* /sys/firmware/efi/efivars/Boot0002*
- efibootmgr
- efibootmgr -Bb 0004
- efibootmgr -Bb 0003
- efibootmgr -o 0001,0002
- systemctl reboot

Unplug Arch Linux USB installer drive, done. Enojy your new hackintosh
