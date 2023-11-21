DefinitionBlock ("", "SSDT", 2, "hack", "XWAK", 0x00000000)
{
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PCI0.XHC_.ZWAK, MethodObj)    // 0 Arguments

    Scope (_SB.PCI0.XHC)
    {
        Method (XWAK, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (^ZWAK ())
            }
        }
    }
}
