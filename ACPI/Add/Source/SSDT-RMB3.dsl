DefinitionBlock ("", "SSDT", 2, "hack", "RMB3", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.B0D3, DeviceObj)
    External (_SB_.PCI0.B0D3.RPCZ, OpRegionObj)
    External (_SB_.PCI0.HBUS, OpRegionObj)
    External (HBUS, OpRegionObj)
    External (RPCZ, OpRegionObj)

    Scope (_SB.PCI0)
    {
        Field (HBUS, DWordAcc, NoLock, Preserve)
        {
            Offset (0x54),
                ,   5,
            D3EN,   1
        }
    }

    Scope (_SB.PCI0.B0D3)
    {
        Field (RPCZ, DWordAcc, Lock, Preserve)
        {
            Offset (0x54),
            D3HT,   2
        }
    }

    Device (_SB.PCI0.RMB3)
    {
        Name (_HID, "RMB30000")  // _HID: Hardware ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (0x03, ^^B0D3.D3HT) /* \_SB_.PCI0.B0D3.D3HT */
            Store (Zero, ^^D3EN) /* \_SB_.PCI0.D3EN */
        }
    }
}
