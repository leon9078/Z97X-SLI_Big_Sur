DefinitionBlock ("", "SSDT", 2, "OSY86", "USBW", 0x00000000)
{
    Scope (\_SB)
    {
        Device (USBW)
        {
            Name (_HID, "PNP0D10")  // _HID: Hardware ID
            Name (_UID, "WAKE")  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (Package (0x02)
                {
                    0x0D, 
                    0x04
                })
            }
        }
    }
}
