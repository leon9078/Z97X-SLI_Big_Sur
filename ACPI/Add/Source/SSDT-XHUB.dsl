DefinitionBlock ("", "SSDT", 2, "HACK", "XHUB", 0x00000000)
{
    External (\_SB_.PCI0.XHC_, DeviceObj)
    External (\_SB_.PCI0.XHC_.RHUB, DeviceObj)

    Scope (\_SB.PCI0.XHC.RHUB)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }

            Return (0x0F)
        }
    }

    Scope (\_SB.PCI0.XHC)
    {
        Device (XHUB)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (PLD1, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x69, 0x0C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLD2, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x69, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLD3, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x71, 0x0C, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLD4, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x71, 0x0C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLD5, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x71, 0x0C, 0x80, 0x02, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLD6, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x69, 0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLD7, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x71, 0x0C, 0x80, 0x03, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLD8, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x71, 0x0C, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLD9, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x71, 0x0C, 0x80, 0x04, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLDA, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x71, 0x0C, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLDB, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x31, 0x1C, 0x80, 0x05, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLDC, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x31, 0x1C, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLDD, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x31, 0x1C, 0x80, 0x06, 0x00, 0x00, 0x00, 0x00
                }
            })
            Name (PLDE, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x31, 0x1C, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00
                }
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (GUPC, 2, Serialized)
            {
                Name (PCKG, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Store (Arg0, Index (PCKG, Zero))
                Store (Arg1, Index (PCKG, One))
                Return (PCKG)
            }

            Device (HS01)
            {
                Name (_ADR, One)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (Zero, 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD1)
                }
            }

            Device (HS02)
            {
                Name (_ADR, 0x02)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (Zero, 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD2)
                }
            }

            Device (HS03)
            {
                Name (_ADR, 0x03)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD3)
                }
            }

            Device (HS04)
            {
                Name (_ADR, 0x04)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD4)
                }
            }

            Device (HS05)
            {
                Name (_ADR, 0x05)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD5)
                }
            }

            Device (HS06)
            {
                Name (_ADR, 0x06)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD6)
                }
            }

            Device (HS07)
            {
                Name (_ADR, 0x07)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD7)
                }
            }

            Device (HS08)
            {
                Name (_ADR, 0x08)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD8)
                }
            }

            Device (HS09)
            {
                Name (_ADR, 0x09)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD9)
                }
            }

            Device (HS10)
            {
                Name (_ADR, 0x0A)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLDA)
                }
            }

            Device (HS11)
            {
                Name (_ADR, 0x0B)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, 0xFF))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLDB)
                }
            }

            Device (HS12)
            {
                Name (_ADR, 0x0C)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (Zero, Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLDC)
                }
            }

            Device (HS13)
            {
                Name (_ADR, 0x0D)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLDD)
                }
            }

            Device (HS14)
            {
                Name (_ADR, 0x0E)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, Zero))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLDE)
                }
            }

            Device (SSP1)
            {
                Name (_ADR, 0x10)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (Zero, 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD1)
                }
            }

            Device (SSP2)
            {
                Name (_ADR, 0x11)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (Zero, 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD2)
                }
            }

            Device (SSP3)
            {
                Name (_ADR, 0x12)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD3)
                }
            }

            Device (SSP4)
            {
                Name (_ADR, 0x13)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD4)
                }
            }

            Device (SSP5)
            {
                Name (_ADR, 0x14)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLD9)
                }
            }

            Device (SSP6)
            {
                Name (_ADR, 0x15)  // _ADR: Address
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (GUPC (One, 0x03))
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Device Location
                {
                    Return (PLDA)
                }
            }
        }
    }
}
