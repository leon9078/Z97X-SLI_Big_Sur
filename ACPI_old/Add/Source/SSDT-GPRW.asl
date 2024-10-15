DefinitionBlock ("SSDT-GPRW.aml", "SSDT", 2, "HACK", "GPRW", 0x00000000)
{
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PCI0.XHC_.XPRW, MethodObj)    // 0 Arguments
    External (XPRW, MethodObj)    // 2 Arguments

    Scope (\_SB.PCI0.XHC)
    {
        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            If (_OSI ("Darwin"))
            {
                Return (Package (0x02)
                {
                    0x0D, 
                    0x04
                })
            }

            Return (XPRW ())
        }
    }

    Method (GPRW, 2, NotSerialized)
    {
        If ((_OSI ("Darwin") && (Arg0 == 0x0D)))
        {
            Return (Package (0x02)
            {
                0x0D, 
                Zero
            })
        }

        Return (XPRW (Arg0, Arg1))
    }
}
