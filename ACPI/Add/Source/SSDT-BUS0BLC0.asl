DefinitionBlock ("SSDT-BUS0BLC0.aml", "SSDT", 2, "HACK", "BUS0BLC0", 0x00000000)
{
    External (_SB_.PCI0.SBUS, DeviceObj)

    Scope (\_SB.PCI0.SBUS)
    {
        Device (BUS0)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_CID, "smbus")  // _CID: Compatible ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Device (BLC0)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_CID, "smbus-blc")  // _CID: Compatible ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
            }
        }
    }
}
