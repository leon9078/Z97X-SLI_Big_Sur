DefinitionBlock ("", "SSDT", 2, "LEON", "RMB3", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.B0D3, DeviceObj)

    Scope (_SB.PCI0)
    {
        OperationRegion (ZBUS, PCI_Config, 0x54, 0x04)
        Field (ZBUS, DWordAcc, NoLock, Preserve)
        {
                ,   5, 
            D3EN,   1
        }
    }

    Scope (_SB.PCI0.B0D3)
    {
        OperationRegion (ZPCZ, PCI_Config, 0x54, 0x04)
        Field (ZPCZ, DWordAcc, Lock, Preserve)
        {
            D3HT,   2
        }
    }

    Device (_SB.PCI0.RMB3)
    {
        Name (_HID, "RMB30000")  // _HID: Hardware ID
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (0x03, ^^B0D3.D3HT) /* \_SB_.PCI0.B0D3.D3HT */
            Store (Zero, ^^D3EN) /* \_SB_.PCI0.D3EN */
        }
    }
}
