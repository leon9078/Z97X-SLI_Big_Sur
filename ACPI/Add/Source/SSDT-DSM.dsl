DefinitionBlock ("", "SSDT", 2, "HACK", "DSM", 0x00000000)
{
    External (_SB_.PCI0.EH01, DeviceObj)
    External (_SB_.PCI0.EH02, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.SAT0, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)

    Scope (\_SB.PCI0.LPCB)
    {
        If (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "IOName", 
                    "pci8086,9cc3", 
                    "compatible", 
                    Buffer (0x0D)
                    {
                        "pci8086,9cc3"
                    }, 

                    "device-id", 
                    Buffer (0x04)
                    {
                         0xC3, 0x9C, 0x00, 0x00                           // ....
                    }, 

                    "name", 
                    Buffer (0x0D)
                    {
                        "pci8086,9cc3"
                    }
                })
            }
        }
    }

    Scope (\_SB.PCI0.EH01)
    {
        If (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x0F)
                {
                    "AAPL,slot-name", 
                    "Built In", 
                    "model", 
                    Buffer (0x35)
                    {
                        "Intel 9 Series Chipset Family USB EHCI Controller #1"
                    }, 

                    "AAPL,current-available", 
                    0x0834, 
                    "AAPL,current-extra", 
                    0x0A8C, 
                    "AAPL,current-in-sleep", 
                    0x03E8, 
                    "AAPL,current-extra-in-sleep", 
                    0x0834, 
                    "AAPL,max-port-current-in-sleep", 
                    0x0A8C, 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }
                })
            }
        }
    }

    Scope (\_SB.PCI0.EH02)
    {
        If (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x0F)
                {
                    "AAPL,slot-name", 
                    "Built In", 
                    "model", 
                    Buffer (0x35)
                    {
                        "Intel 9 Series Chipset Family USB EHCI Controller #2"
                    }, 

                    "AAPL,current-available", 
                    0x0834, 
                    "AAPL,current-extra", 
                    0x0A8C, 
                    "AAPL,current-in-sleep", 
                    0x03E8, 
                    "AAPL,current-extra-in-sleep", 
                    0x0834, 
                    "AAPL,max-port-current-in-sleep", 
                    0x0A8C, 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }
                })
            }
        }
    }

    Scope (\_SB.PCI0.XHC)
    {
        If (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x0D)
                {
                    "AAPL,slot-name", 
                    "Built In", 
                    "model", 
                    Buffer (0x32)
                    {
                        "Intel 9 Series Chipset Family USB xHCI Controller"
                    }, 

                    "AAPL,current-available", 
                    0x0834, 
                    "AAPL,current-extra", 
                    0x0898, 
                    "AAPL,current-extra-in-sleep", 
                    0x0640, 
                    "AAPL,max-port-current-in-sleep", 
                    0x0834, 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }
                })
            }
        }
    }

    Scope (\_SB.PCI0.SAT0)
    {
        If (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "IOName", 
                    "pci8086,8c83", 
                    "compatible", 
                    Buffer (0x0D)
                    {
                        "pci8086,8c83"
                    }, 

                    "device-id", 
                    Buffer (0x04)
                    {
                         0x83, 0x8C, 0x00, 0x00                           // ....
                    }, 

                    "name", 
                    Buffer (0x0D)
                    {
                        "pci8086,8c83"
                    }
                })
            }
        }
    }
}
