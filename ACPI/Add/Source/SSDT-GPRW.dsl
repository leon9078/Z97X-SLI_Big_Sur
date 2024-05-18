DefinitionBlock ("", "SSDT", 2, "HACK", "GPRW", 0x00000000)
{
    External (_SB_.PCI0.EH01, DeviceObj)
    External (_SB_.PCI0.EH01.ZPRW, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.EH02, DeviceObj)
    External (_SB_.PCI0.EH02.ZPRW, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GLAN, DeviceObj)
    External (_SB_.PCI0.GLAN.ZPRW, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.HDEF, DeviceObj)
    External (_SB_.PCI0.HDEF.ZPRW, MethodObj)    // 0 Arguments
    External (PRWP, PkgObj)
    External (ZPRW, MethodObj)    // 0 Arguments

    Scope (\)
    {
        Method (GPRW, 2, NotSerialized)
        {
            Store (Arg0, Index (PRWP, Zero))
            Store (Arg1, Index (PRWP, One))
            If (_OSI ("Darwin"))
            {
                Return (PRWP) /* External reference */
            }
            Else
            {
                Return (ZPRW ())
            }
        }
    }

    Scope (\_SB.PCI0.EH01)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Return (GPRW (0x0D, Zero))
            }
            Else
            {
                Return (^ZPRW ())
            }
        }
    }

    Scope (\_SB.PCI0.EH02)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Return (GPRW (0x0D, Zero))
            }
            Else
            {
                Return (^ZPRW ())
            }
        }
    }

    Scope (\_SB.PCI0.GLAN)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Return (GPRW (0x0D, Zero))
            }
            Else
            {
                Return (^ZPRW ())
            }
        }
    }

    Scope (\_SB.PCI0.HDEF)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Return (GPRW (0x0D, Zero))
            }
            Else
            {
                Return (^ZPRW ())
            }
        }
    }
}
