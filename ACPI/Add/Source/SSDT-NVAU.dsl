DefinitionBlock ("", "SSDT", 2, "ACDT", "NVAU", 0x00000000)
{
    External (_SB_.PCI0.PEG0, DeviceObj)

    Scope (\_SB.PCI0.PEG0)
    {
        Device (NVAU)
        {
            Name (_ADR, One)  // _ADR: Address
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

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x02)
                {
                    "class-code", 
                    Buffer (0x04)
                    {
                         0xFF, 0xFF, 0xFF, 0xFF                           // ....
                    }
                })
            }
        }
    }
}
