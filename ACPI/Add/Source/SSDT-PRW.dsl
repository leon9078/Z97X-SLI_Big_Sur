DefinitionBlock ("", "SSDT", 2, "HACK", "_PRW", 0x00000000)
{
    External (\_SB_.PCI0.EH01, DeviceObj)
    External (\_SB_.PCI0.EH01.XPRW, MethodObj)    // 0 Arguments
    External (\_SB_.PCI0.EH02, DeviceObj)
    External (\_SB_.PCI0.EH02.XPRW, MethodObj)    // 0 Arguments
    External (\_SB_.PCI0.GLAN, DeviceObj)
    External (\_SB_.PCI0.GLAN.XPRW, MethodObj)    // 0 Arguments
    External (\_SB_.PCI0.HDEF, DeviceObj)
    External (\_SB_.PCI0.HDEF.XPRW, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.GLAN)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Store (^XPRW (), Local0)
                Store (Zero, Index (Local0, One))
                Return (Local0)
            }

            Return (^XPRW ())
        }
    }

    Scope (\_SB.PCI0.EH01)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Store (^XPRW (), Local0)
                Store (Zero, Index (Local0, One))
                Return (Local0)
            }

            Return (^XPRW ())
        }
    }

    Scope (\_SB.PCI0.EH02)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Store (^XPRW (), Local0)
                Store (Zero, Index (Local0, One))
                Return (Local0)
            }

            Return (^XPRW ())
        }
    }

    Scope (\_SB.PCI0.HDEF)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Store (^XPRW (), Local0)
                Store (Zero, Index (Local0, One))
                Return (Local0)
            }

            Return (^XPRW ())
        }
    }
}
