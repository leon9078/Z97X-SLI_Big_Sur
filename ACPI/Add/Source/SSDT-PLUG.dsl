DefinitionBlock ("", "SSDT", 2, "HACK", "PLUG", 0x00000000)
{
    External (_PR_.CPU0, ProcessorObj)

    If (CondRefOf (\_PR.CPU0))
    {
        If ((ObjectType (\_PR.CPU0) == 0x0C))
        {
            Scope (\_PR.CPU0)
            {
                If (_OSI ("Darwin"))
                {
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x02)
                        {
                            "plugin-type", 
                            One
                        })
                    }
                }
            }
        }
    }
}
