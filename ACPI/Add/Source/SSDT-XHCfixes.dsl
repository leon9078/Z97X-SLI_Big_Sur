DefinitionBlock ("", "SSDT", 2, "HACK", "XHCfixes", 0x00000000)
{
    External (\_SB_.PCI0.XHC_, DeviceObj)
    External (\_SB_.PCI0.XHC_.ESEX, MethodObj)    // 0 Arguments
    External (\_SB_.PCI0.XHC_.XSEX, MethodObj)    // 0 Arguments
    External (\_SB_.PCI0.XHC_.XWAX, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.XHC)
    {
        Method (XSEL, 0, Serialized)
        {
            If (_OSI ("Darwin")) {}
            Else
            {
                ^XSEX ()
            }
        }

        Method (ESEL, 0, Serialized)
        {
            If (_OSI ("Darwin")) {}
            Else
            {
                ^ESEX ()
            }
        }

        Method (XWAK, 0, Serialized)
        {
            If (_OSI ("Darwin")) {}
            Else
            {
                ^XWAX ()
            }
        }
    }
}
