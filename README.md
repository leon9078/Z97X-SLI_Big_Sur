# Z97X-SLI_Big_Sur
hackintosh stuff

Pre requirement: Update the BIOS with my custom modifications "Z97XSLI.fd". Find the guide in Bios_mod_guide.txt

BIOS settings:

- Extreme Memory Profile(X.M.P.): Profile1
- Bootup NumLock State: Disabled
- Full Screen LOGO Show: Disabled
- Windows 8 Features: Windows 8
- Boot Mode Selection: UEFI Only
- Storage Boot Option Control: UEFI Only
- Ipv4 PXE Support: Disabled
- Ipv6 PXE Support: Disabled
- Secure Boot: Disabled
- Legacy USB Support: Disabled
- Serial Port A: Disabled
- Parallel Port: Disabled

Post install:

Insert Arch Linux USB installer, boot from it F12 key

- setfont ter-i16b
- lsblk
- mount /dev/sdX1 /mnt
- nano -c /mnt/EFI/OC/config.plist

1. Misc > Boot > "LauncherOption" from "Disabled" to "Full"
2. Misc > Security > "ScanPolicy" from 0 to 65795
3. Misc > Tools > [1] (UEFI Shell) > Enabled from YES to NO
4. UEFI > Drivers > [1] (ResetNvramEntry) > Enabled from YES to NO

Save (Ctrl+O), then exit (Ctrl+X)
- sync
- umount /mnt
- systemctl reboot

Unplug the Arch installer USB drive, boot to OpenCore, but at the menu press TAB key twice to select Restart

Reinsert to Arch USB drive, now F12 key > boot back to the Arch USB

- setfont ter-i16b
- efibootmgr

You should have three entries:
1. Boot0001 is "UEFI OS" (EFI\BOOT\BOOTx64.efi)
2. Boot0002 is "OpenCore" (EFI\OC\OpenCore.efi)
3. Boot0003 is "UEFI:" (Arch USB)

What we need to do is manually change the order of those entries to have OpenCore first, then UEFI OS:

- efibootmgr -O
- cp /sys/firmware/efi/efivars/Boot000{1,4}-8be4df61-93ca-11d2-aa0d-00e098032b8c
- efibootmgr
- efibootmgr -Bb 1
- cp /sys/firmware/efi/efivars/Boot000{2,1}-8be4df61-93ca-11d2-aa0d-00e098032b8c
- efibootmgr
- efibootmgr -Bb 2
- cp /sys/firmware/efi/efivars/Boot000{4,2}-8be4df61-93ca-11d2-aa0d-00e098032b8c
- efibootmgr
- for x in 4 3; do echo && efibootmgr -Bb $x; done && echo
- efibootmgr -o 1,2
- efibootmgr -t 0

Update the CMOS system clock

- hwclock -r

Connect to internet, then issue the same command multiple times until the system clock updates to the current date.

- hwclock -r

Reboot
- systemctl reboot

Unplug Arch Linux USB installer drive, done. Enojy your new hackintosh!



SSDTs that I'm no longer using are:

- SSDT-NVAU. This creates a fake "class-code" 0xFFFFFFFF to the NVIDIA HDMI Audio device, in order to completely disable dGPU audio in macOS and prevent Kernel Panic.
- SSDT-RMB3. Disable Intel HDMI audio, when running without dGPU. ! WARNING ! if you use 2 monitors this SSDT will disable the second one, so I don't recommend using this SSDT.
