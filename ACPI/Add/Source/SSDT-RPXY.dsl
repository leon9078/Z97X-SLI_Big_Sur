DefinitionBlock ("", "SSDT", 2, "HACK", "RPXY", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.RP01.D3HT, FieldUnitObj)
    External (_SB_.PCI0.RP04.D3HT, FieldUnitObj)
    External (RP1D, FieldUnitObj)
    External (RP4D, FieldUnitObj)

    Scope (\_SB.PCI0)
    {
        Device (RPXY)
        {
            Name (_HID, "RPXY0000")  // _HID: Hardware ID
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

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Store (0x03, ^^RP04.D3HT) /* External reference */
                Store (One, \RP4D) /* External reference */
                Store (0x03, ^^RP01.D3HT) /* External reference */
                Store (One, \RP1D) /* External reference */
            }
        }
    }
}
