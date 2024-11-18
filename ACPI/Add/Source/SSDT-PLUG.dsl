DefinitionBlock ("", "SSDT", 2, "HACK", "CpuPlug", 0x00000000)
{
    External (\_PR_.CPU0, ProcessorObj)

    Scope (\_PR.CPU0)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (_OSI ("Darwin"))
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03
                    })
                }

                Return (Package (0x02)
                {
                    "plugin-type", 
                    One
                })
            }

            Return (Zero)
        }
    }
}