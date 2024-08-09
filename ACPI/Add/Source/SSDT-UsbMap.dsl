DefinitionBlock ("", "SSDT", 2, "HACK", "UsbMap", 0x00000000)
{
    External (_SB_.PCI0.XHC_.RHUB, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS01, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS01.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS02, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS02.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS03, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS03.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS04, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS04.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS05, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS05.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS06, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS06.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS07, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS07.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS08, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS08.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS09, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS09.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS10, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS10.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS11, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS11.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS12, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS12.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS13, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS13.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.HS14, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS14.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.SSP1, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.SSP1.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.SSP2, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.SSP2.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.SSP3, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.SSP3.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.SSP4, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.SSP4.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.SSP5, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.SSP5.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.SSP6, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.SSP6.ZUPC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.UPCN, PkgObj)

    Scope (\_SB.PCI0.XHC.RHUB)
    {
        Method (GUPC, 2, NotSerialized)
        {
            Store (Arg0, Index (UPCN, Zero))
            Store (Arg1, Index (UPCN, One))
            If (_OSI ("Darwin"))
            {
                Return (^UPCN) /* External reference */
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS01)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            If (_OSI ("Darwin"))
            {
                Return (GUPC (Zero, 0x03))
            }
            Else
            {
                Return (ZUPC ())
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS02)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            If (_OSI ("Darwin"))
            {
                Return (GUPC (Zero, 0x03))
            }
            Else
            {
                Return (ZUPC ())
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS03)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            If (_OSI ("Darwin"))
            {
                Return (GUPC (0xFF, 0x03))
            }
            Else
            {
                Return (ZUPC ())
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS04)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            If (_OSI ("Darwin"))
            {
                Return (GUPC (0xFF, 0x03))
            }
            Else
            {
                Return (ZUPC ())
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS05)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            If (_OSI ("Darwin"))
            {
                Return (GUPC (0xFF, Zero))
            }
            Else
            {
                Return (ZUPC ())
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS06)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            If (_OSI ("Darwin"))
            {
                Return (GUPC (0xFF, Zero))
            }
            Else
            {
                Return (ZUPC ())
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS07)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            If (_OSI ("Darwin"))
            {
                Return (GUPC (0xFF, Zero))
            }
            Else
            {
                Return (ZUPC ())
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.HS08)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            If (_OSI ("Darwin"))
            {
                Return (GUPC (0xFF, Zero))
            }
            Else
            {
                Return (ZUPC ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.HS09))
    {
        Scope (\_SB.PCI0.XHC.RHUB.HS09)
        {
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                If (_OSI ("Darwin"))
                {
                    Return (GUPC (0xFF, 0x03))
                }
                Else
                {
                    Return (ZUPC ())
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.HS10))
    {
        Scope (\_SB.PCI0.XHC.RHUB.HS10)
        {
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                If (_OSI ("Darwin"))
                {
                    Return (GUPC (0xFF, 0x03))
                }
                Else
                {
                    Return (ZUPC ())
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.HS11))
    {
        Scope (\_SB.PCI0.XHC.RHUB.HS11)
        {
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                If (_OSI ("Darwin"))
                {
                    Return (GUPC (0xFF, 0xFF))
                }
                Else
                {
                    Return (ZUPC ())
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.HS12))
    {
        Scope (\_SB.PCI0.XHC.RHUB.HS12)
        {
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                If (_OSI ("Darwin"))
                {
                    Return (GUPC (Zero, Zero))
                }
                Else
                {
                    Return (ZUPC ())
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.HS13))
    {
        Scope (\_SB.PCI0.XHC.RHUB.HS13)
        {
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                If (_OSI ("Darwin"))
                {
                    Return (GUPC (0xFF, Zero))
                }
                Else
                {
                    Return (ZUPC ())
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.HS14))
    {
        Scope (\_SB.PCI0.XHC.RHUB.HS14)
        {
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                If (_OSI ("Darwin"))
                {
                    Return (GUPC (0xFF, Zero))
                }
                Else
                {
                    Return (ZUPC ())
                }
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.SSP1)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            If (_OSI ("Darwin"))
            {
                Return (GUPC (Zero, 0x03))
            }
            Else
            {
                Return (ZUPC ())
            }
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB.SSP2)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            If (_OSI ("Darwin"))
            {
                Return (GUPC (Zero, 0x03))
            }
            Else
            {
                Return (ZUPC ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.SSP3))
    {
        Scope (\_SB.PCI0.XHC.RHUB.SSP3)
        {
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                If (_OSI ("Darwin"))
                {
                    Return (GUPC (0xFF, 0x03))
                }
                Else
                {
                    Return (ZUPC ())
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.SSP4))
    {
        Scope (\_SB.PCI0.XHC.RHUB.SSP4)
        {
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                If (_OSI ("Darwin"))
                {
                    Return (GUPC (0xFF, 0x03))
                }
                Else
                {
                    Return (ZUPC ())
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.SSP5))
    {
        Scope (\_SB.PCI0.XHC.RHUB.SSP5)
        {
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                If (_OSI ("Darwin"))
                {
                    Return (GUPC (0xFF, 0x03))
                }
                Else
                {
                    Return (ZUPC ())
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.SSP6))
    {
        Scope (\_SB.PCI0.XHC.RHUB.SSP6)
        {
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                If (_OSI ("Darwin"))
                {
                    Return (GUPC (0xFF, 0x03))
                }
                Else
                {
                    Return (ZUPC ())
                }
            }
        }
    }
}
