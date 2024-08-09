DefinitionBlock ("", "SSDT", 2, "HACK", "XHCfixes", 0x00000000)
{
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PCI0.XHC_.ESEZ, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.XSEZ, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.XWAZ, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.XHC)
    {
        Method (XSEL, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (XSEZ ())
            }
        }

        Method (ESEL, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (ESEZ ())
            }
        }

        Method (XWAK, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (XWAZ ())
            }
        }
    }
}
