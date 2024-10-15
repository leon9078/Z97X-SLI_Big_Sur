DefinitionBlock ("SSDT-UMethods.aml", "SSDT", 2, "HACK", "UMethods", 0x00000000)
{
    External (_SB_.PCI0.I2C0.SHUB, DeviceObj)
    External (_SB_.PCI0.PAUD, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.RP05.PEGP, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.TPM_, DeviceObj)

    Scope (\_SB.PCI0.I2C0.SHUB)
    {
        Method (PS0X, 0, NotSerialized)
        {
        }

        Method (PS3X, 0, NotSerialized)
        {
        }
    }

    Scope (\_SB.PCI0.PAUD)
    {
        Method (PUAM, 0, NotSerialized)
        {
        }
    }

    Scope (\_SB.PCI0.RP05.PEGP)
    {
        Method (EPON, 0, NotSerialized)
        {
        }
    }

    Scope (\_SB.PCI0.XHC)
    {
        Method (DUAM, 0, NotSerialized)
        {
        }
    }

    Scope (\_SB.TPM)
    {
        Method (PTS, 1, NotSerialized)
        {
        }
    }

    Method (PS0X, 0, NotSerialized)
    {
    }

    Method (PS2X, 0, NotSerialized)
    {
    }

    Method (PS3X, 0, NotSerialized)
    {
    }

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        Method (SGPO, 2, NotSerialized)
        {
        }
    }

    Method (HDOS, 0, NotSerialized)
    {
    }

    Method (HNOT, 1, NotSerialized)
    {
    }
}
