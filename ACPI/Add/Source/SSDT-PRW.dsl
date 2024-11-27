DefinitionBlock ("", "SSDT", 2, "HACK", "_PRW", 0x00000000)
{
    External (\_SB_.PCI0.EH01, DeviceObj)
    External (\_SB_.PCI0.EH02, DeviceObj)
    External (\_SB_.PCI0.GLAN, DeviceObj)
    External (\_SB_.PCI0.HDEF, DeviceObj)

    Scope (\_SB.PCI0.GLAN)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Return (Package (0x02)
                {
                    0x0D, 
                    Zero
                })
            }

            Return (Package (0x02)
            {
                0x0D, 
                0x04
            })
        }
    }

    Scope (\_SB.PCI0.EH01)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Return (Package (0x02)
                {
                    0x0D, 
                    Zero
                })
            }

            Return (Package (0x02)
            {
                0x0D, 
                0x04
            })
        }
    }

    Scope (\_SB.PCI0.EH02)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Return (Package (0x02)
                {
                    0x0D, 
                    Zero
                })
            }

            Return (Package (0x02)
            {
                0x0D, 
                0x04
            })
        }
    }

    Scope (\_SB.PCI0.HDEF)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Return (Package (0x02)
                {
                    0x0D, 
                    Zero
                })
            }

            Return (Package (0x02)
            {
                0x0D, 
                0x04
            })
        }
    }
}
