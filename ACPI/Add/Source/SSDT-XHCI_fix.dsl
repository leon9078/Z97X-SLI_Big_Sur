DefinitionBlock ("", "SSDT", 2, "HACK", "XHCI_fix", 0x00000000)
{
    External (\_SB_.PCI0.XHC0, DeviceObj)
    External (\_SB_.PCI0.XHC0.ESEX, MethodObj)    // 0 Arguments
    External (\_SB_.PCI0.XHC0.XSEX, MethodObj)    // 0 Arguments
    External (\_SB_.PCI0.XHC0.XWAX, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.XHC0)
    {
        Method (XSEL, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }

            Return (^XSEX ())
        }

        Method (ESEL, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }

            Return (^ESEX ())
        }

        Method (XWAK, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }

            Return (^XWAX ())
        }
    }
}
