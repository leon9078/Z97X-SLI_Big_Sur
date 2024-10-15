DefinitionBlock ("SSDT-OEM.aml", "SSDT", 1, "SaSsdt", "SaSsdt ", 0x00003001)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.AR02, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.AR0A, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.AR0B, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.B0D3, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.PEG1, DeviceObj)
    External (_SB_.PCI0.PEG1.PEGP, DeviceObj)
    External (_SB_.PCI0.PEG2, DeviceObj)
    External (_SB_.PCI0.PEG2.PEGP, DeviceObj)
    External (_SB_.PCI0.PR02, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PR0A, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PR0B, MethodObj)    // 0 Arguments
    External (DSEN, FieldUnitObj)
    External (GPRW, MethodObj)    // 2 Arguments
    External (GUAM, MethodObj)    // 1 Arguments
    External (PICM, IntObj)
    External (PNHM, FieldUnitObj)
    External (S0ID, FieldUnitObj)
    External (SCIS, FieldUnitObj)

    OperationRegion (SANV, SystemMemory, 0xC9636E18, 0x0186)
    Field (SANV, AnyAcc, Lock, Preserve)
    {
        SARV,   32, 
        ASLB,   32, 
        IMON,   8, 
        IGDS,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        DID9,   32, 
        DIDA,   32, 
        DIDB,   32, 
        IBTT,   8, 
        IPAT,   8, 
        IPSC,   8, 
        IBLC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        IPCF,   8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        NXD1,   32, 
        NXD2,   32, 
        NXD3,   32, 
        NXD4,   32, 
        NXD5,   32, 
        NXD6,   32, 
        NXD7,   32, 
        NXD8,   32, 
        GSMI,   8, 
        PAVP,   8, 
        LIDS,   8, 
        KSV0,   32, 
        KSV1,   8, 
        BLCS,   8, 
        BRTL,   8, 
        ALSE,   8, 
        ALAF,   8, 
        LLOW,   8, 
        LHIH,   8, 
        ALFP,   8, 
        AUDA,   32, 
        AUDB,   32, 
        AUDC,   32, 
        DIDC,   32, 
        DIDD,   32, 
        DIDE,   32, 
        DIDF,   32, 
        CADR,   32, 
        CCNT,   8, 
        Offset (0xC8), 
        SGMD,   8, 
        SGFL,   8, 
        PWOK,   8, 
        HLRS,   8, 
        PWEN,   8, 
        PRST,   8, 
        CPSP,   32, 
        EECP,   8, 
        EVCP,   16, 
        XBAS,   32, 
        GBAS,   16, 
        SGGP,   8, 
        NVGA,   32, 
        NVHA,   32, 
        AMDA,   32, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
        DID6,   32, 
        DID7,   32, 
        DID8,   32, 
        OBS1,   32, 
        OBS2,   32, 
        OBS3,   32, 
        OBS4,   32, 
        OBS5,   32, 
        OBS6,   32, 
        OBS7,   32, 
        OBS8,   32, 
        LTRA,   8, 
        OBFA,   8, 
        LTRB,   8, 
        OBFB,   8, 
        LTRC,   8, 
        OBFC,   8, 
        SMSL,   16, 
        SNSL,   16, 
        P0UB,   8, 
        P1UB,   8, 
        P2UB,   8, 
        EDPV,   8, 
        NXDX,   32, 
        DIDX,   32, 
        PCSL,   8, 
        RC7A,   8, 
        PBGE,   8, 
        M64B,   64, 
        M64L,   64, 
        DLPW,   16, 
        DLHR,   16, 
        DSEL,   8, 
        ESEL,   8, 
        PSEL,   8, 
        MXD1,   32, 
        MXD2,   32, 
        MXD3,   32, 
        MXD4,   32, 
        MXD5,   32, 
        MXD6,   32, 
        MXD7,   32, 
        MXD8,   32, 
        PXFD,   8, 
        EBAS,   32, 
        DGVS,   32, 
        DGVB,   32
    }

    Scope (\_SB.PCI0)
    {
        Name (LTRS, Zero)
        Name (OBFS, Zero)
    }

    Scope (\_SB.PCI0.PEG0)
    {
        OperationRegion (PEGR, PCI_Config, 0xC0, 0x30)
        Field (PEGR, DWordAcc, NoLock, Preserve)
        {
            Offset (0x02), 
            PSTS,   1, 
            Offset (0x2C), 
            GENG,   1, 
                ,   1, 
            PMEG,   1
        }

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            Return (GPRW (0x09, 0x04))
        }

        Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
        {
            If (Arg0)
            {
                GENG = One
                PMEG = One
            }
            Else
            {
                GENG = Zero
                PMEG = Zero
            }
        }

        Method (HPME, 0, Serialized)
        {
            PSTS = One
        }

        Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
        {
            If (PICM)
            {
                Return (AR02 ())
            }

            Return (PR02 ())
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            LTRS = LTRA /* \LTRA */
            OBFS = OBFA /* \OBFA */
        }

        Name (LTRV, Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (OPTS, Zero)
        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            Switch (ToInteger (Arg0))
            {
                Case (ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */){                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            If ((Arg1 == 0x02))
                            {
                                OPTS = One
                                If (LTRS)
                                {
                                    OPTS |= 0x40
                                }

                                If (OBFS)
                                {
                                    OPTS |= 0x10
                                }

                                Return (OPTS) /* \_SB_.PCI0.PEG0.OPTS */
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Case (0x04)
                        {
                            If ((Arg1 == 0x02))
                            {
                                If (OBFS)
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                                Else
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                        }
                        Case (0x06)
                        {
                            If ((Arg1 == 0x02))
                            {
                                If (LTRS)
                                {
                                    LTRV [Zero] = ((SMSL >> 0x0A) & 0x07)
                                    LTRV [One] = (SMSL & 0x03FF)
                                    LTRV [0x02] = ((SNSL >> 0x0A) & 0x07)
                                    LTRV [0x03] = (SNSL & 0x03FF)
                                    Return (LTRV) /* \_SB_.PCI0.PEG0.LTRV */
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }
                        }

                    }
                }

            }

            Return (Buffer (One)
            {
                 0x00                                             // .
            })
        }

        PowerResource (PG00, 0x00, 0x0000)
        {
            Name (_STA, One)  // _STA: Status
            Method (_ON, 0, Serialized)  // _ON_: Power On
            {
                PGON (Zero)
                _STA = One
            }

            Method (_OFF, 0, Serialized)  // _OFF: Power Off
            {
                PGOF (Zero)
                _STA = Zero
            }
        }

        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            PG00
        })
        Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
        {
            PG00
        })
        Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
        {
            PG00
        })
        Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
        {
            Return (0x04)
        }
    }

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        OperationRegion (PCIS, PCI_Config, Zero, 0x0100)
        Field (PCIS, AnyAcc, NoLock, Preserve)
        {
            PVID,   16, 
            PDID,   16
        }

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            Return (GPRW (0x09, 0x04))
        }
    }

    Scope (\_SB.PCI0.PEG1)
    {
        OperationRegion (PEGR, PCI_Config, 0xC0, 0x30)
        Field (PEGR, DWordAcc, NoLock, Preserve)
        {
            Offset (0x02), 
            PSTS,   1, 
            Offset (0x2C), 
            GENG,   1, 
                ,   1, 
            PMEG,   1
        }

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            Return (GPRW (0x09, 0x04))
        }

        Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
        {
            If (Arg0)
            {
                GENG = One
                PMEG = One
            }
            Else
            {
                GENG = Zero
                PMEG = Zero
            }
        }

        Method (HPME, 0, Serialized)
        {
            PSTS = One
        }

        Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
        {
            If (PICM)
            {
                Return (AR0A ())
            }

            Return (PR0A ())
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            LTRS = LTRB /* \LTRB */
            OBFS = OBFB /* \OBFB */
        }

        Name (LTRV, Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (OPTS, Zero)
        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            Switch (ToInteger (Arg0))
            {
                Case (ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */){                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            If ((Arg1 == 0x02))
                            {
                                OPTS = One
                                If (LTRS)
                                {
                                    OPTS |= 0x40
                                }

                                If (OBFS)
                                {
                                    OPTS |= 0x10
                                }

                                Return (OPTS) /* \_SB_.PCI0.PEG1.OPTS */
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Case (0x04)
                        {
                            If ((Arg1 == 0x02))
                            {
                                If (OBFS)
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                                Else
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                        }
                        Case (0x06)
                        {
                            If ((Arg1 == 0x02))
                            {
                                If (LTRS)
                                {
                                    LTRV [Zero] = ((SMSL >> 0x0A) & 0x07)
                                    LTRV [One] = (SMSL & 0x03FF)
                                    LTRV [0x02] = ((SNSL >> 0x0A) & 0x07)
                                    LTRV [0x03] = (SNSL & 0x03FF)
                                    Return (LTRV) /* \_SB_.PCI0.PEG1.LTRV */
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }
                        }

                    }
                }

            }

            Return (Buffer (One)
            {
                 0x00                                             // .
            })
        }

        PowerResource (PG01, 0x00, 0x0000)
        {
            Name (_STA, One)  // _STA: Status
            Method (_ON, 0, Serialized)  // _ON_: Power On
            {
                PGON (One)
                _STA = One
            }

            Method (_OFF, 0, Serialized)  // _OFF: Power Off
            {
                PGOF (One)
                _STA = Zero
            }
        }

        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            PG01
        })
        Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
        {
            PG01
        })
        Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
        {
            PG01
        })
        Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
        {
            Return (0x04)
        }
    }

    Scope (\_SB.PCI0.PEG1.PEGP)
    {
        OperationRegion (PCIS, PCI_Config, Zero, 0x0100)
        Field (PCIS, AnyAcc, NoLock, Preserve)
        {
            PVID,   16, 
            PDID,   16
        }

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            Return (GPRW (0x09, 0x04))
        }
    }

    Scope (\_SB.PCI0.PEG2)
    {
        OperationRegion (PEGR, PCI_Config, 0xC0, 0x30)
        Field (PEGR, DWordAcc, NoLock, Preserve)
        {
            Offset (0x02), 
            PSTS,   1, 
            Offset (0x2C), 
            GENG,   1, 
                ,   1, 
            PMEG,   1
        }

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            Return (GPRW (0x09, 0x04))
        }

        Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
        {
            If (Arg0)
            {
                GENG = One
                PMEG = One
            }
            Else
            {
                GENG = Zero
                PMEG = Zero
            }
        }

        Method (HPME, 0, Serialized)
        {
            PSTS = One
        }

        Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
        {
            If (PICM)
            {
                Return (AR0B ())
            }

            Return (PR0B ())
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            LTRS = LTRC /* \LTRC */
            OBFS = OBFC /* \OBFC */
        }

        Name (LTRV, Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (OPTS, Zero)
        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            Switch (ToInteger (Arg0))
            {
                Case (ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */){                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            If ((Arg1 == 0x02))
                            {
                                OPTS = One
                                If (LTRS)
                                {
                                    OPTS |= 0x40
                                }

                                If (OBFS)
                                {
                                    OPTS |= 0x10
                                }

                                Return (OPTS) /* \_SB_.PCI0.PEG2.OPTS */
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Case (0x04)
                        {
                            If ((Arg1 == 0x02))
                            {
                                If (OBFS)
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                                Else
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                        }
                        Case (0x06)
                        {
                            If ((Arg1 == 0x02))
                            {
                                If (LTRS)
                                {
                                    LTRV [Zero] = ((SMSL >> 0x0A) & 0x07)
                                    LTRV [One] = (SMSL & 0x03FF)
                                    LTRV [0x02] = ((SNSL >> 0x0A) & 0x07)
                                    LTRV [0x03] = (SNSL & 0x03FF)
                                    Return (LTRV) /* \_SB_.PCI0.PEG2.LTRV */
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }
                        }

                    }
                }

            }

            Return (Buffer (One)
            {
                 0x00                                             // .
            })
        }

        PowerResource (PG02, 0x00, 0x0000)
        {
            Name (_STA, One)  // _STA: Status
            Method (_ON, 0, Serialized)  // _ON_: Power On
            {
                PGON (0x02)
                _STA = One
            }

            Method (_OFF, 0, Serialized)  // _OFF: Power Off
            {
                PGOF (0x02)
                _STA = Zero
            }
        }

        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            PG02
        })
        Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
        {
            PG02
        })
        Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
        {
            PG02
        })
        Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
        {
            Return (0x04)
        }
    }

    Scope (\_SB.PCI0.PEG2.PEGP)
    {
        OperationRegion (PCIS, PCI_Config, Zero, 0x0100)
        Field (PCIS, AnyAcc, NoLock, Preserve)
        {
            PVID,   16, 
            PDID,   16
        }

        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
        {
            Return (GPRW (0x09, 0x04))
        }
    }

    Scope (\_SB.PCI0.B0D3)
    {
        Name (BARA, 0x80000000)
        Name (BBAR, Zero)
        Name (TBAR, Zero)
        Name (TCMD, Zero)
        Name (MODB, Zero)
        Name (MODC, Zero)
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((AUVD != 0xFFFF))
            {
                Return (0x0F)
            }

            Return (Zero)
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If ((((ABAR & 0xFFFFC004) != 0xFFFFC004) && ((
                ABAR & 0xFFFFC000) != Zero)))
            {
                BARA = ABAR /* \_SB_.PCI0.B0D3.ABAR */
                If ((ABAH != Zero))
                {
                    BARA |= (ABAH << 0x20)
                }
            }
        }

        OperationRegion (RPCS, SystemMemory, \XBAS, 0x00018040)
        Field (RPCS, AnyAcc, NoLock, Preserve)
        {
            Offset (0x18004), 
            ACMD,   8, 
            Offset (0x18010), 
            ABAR,   32, 
            ABAH,   32
        }

        OperationRegion (RPCZ, PCI_Config, Zero, 0x40)
        Field (RPCZ, DWordAcc, Lock, Preserve)
        {
            AUVD,   16
        }

        Method (ASTR, 0, Serialized)
        {
            If ((((ABAR & 0xFFFFC004) != 0xFFFFC004) && ((
                ABAR & 0xFFFFC000) != Zero)))
            {
                BBAR = Zero
                BBAR = (ABAR & 0xFFFFFFF0)
                If ((ABAH != Zero))
                {
                    BBAR |= (ABAH << 0x20)
                }

                BBAR += 0x1000
                OperationRegion (RPCY, SystemMemory, BBAR, 0x25)
                Field (RPCY, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x0C), 
                    EM4W,   32, 
                    EMWA,   32, 
                    Offset (0x1C), 
                    ADWA,   32
                }

                EMWA = AUDA /* \AUDA */
                ADWA = AUDB /* \AUDB */
                EM4W = AUDC /* \AUDC */
            }
        }

        Method (VSTR, 1, Serialized)
        {
            Name (CONT, 0x03E8)
            Name (ADDR, 0x80000000)
            ADDR = Arg0
            OperationRegion (CCDC, SystemMemory, ADDR, 0x04)
            Field (CCDC, ByteAcc, NoLock, Preserve)
            {
                CDEC,   32
            }

            If ((((ABAR & 0xFFFFC004) != 0xFFFFC004) && ((
                ABAR & 0xFFFFC000) != Zero)))
            {
                If ((CDEC != Zero))
                {
                    BBAR = Zero
                    BBAR = (ABAR & 0xFFFFFFF0)
                    If ((ABAH != Zero))
                    {
                        BBAR |= (ABAH << 0x20)
                    }

                    OperationRegion (IPCV, SystemMemory, BBAR, 0x70)
                    Field (IPCV, DWordAcc, NoLock, Preserve)
                    {
                        Offset (0x60), 
                        AVIC,   32, 
                        Offset (0x68), 
                        AIRS,   16
                    }

                    CONT = 0x03E8
                    While ((((AIRS & One) == One) && (CONT != Zero)))
                    {
                        Stall (One)
                        CONT--
                    }

                    AIRS |= 0x02
                    AVIC = CDEC /* \_SB_.PCI0.B0D3.VSTR.CDEC */
                    AIRS |= One
                    CONT = 0x03E8
                    While ((((AIRS & One) == One) && (CONT != Zero)))
                    {
                        Stall (One)
                        CONT--
                    }
                }
            }
        }

        Method (CXDC, 0, Serialized)
        {
            Name (IDDX, 0x80000000)
            If (((CADR != Zero) && (CCNT != Zero)))
            {
                IDDX = CADR /* \CADR */
                While ((IDDX < (CADR + (CCNT * 0x04))))
                {
                    VSTR (IDDX)
                    IDDX += 0x04
                }
            }
        }

        Method (ARST, 0, Serialized)
        {
            If ((((ABAR & 0xFFFFC004) != 0xFFFFC004) && ((
                ABAR & 0xFFFFC000) != Zero)))
            {
                BBAR = (ABAR & 0xFFFFFFF0)
                OperationRegion (IPCV, SystemMemory, BBAR, 0xBF)
                Field (IPCV, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x08), 
                    CRST,   32, 
                    Offset (0x4C), 
                    CORB,   32, 
                    Offset (0x5C), 
                    RIRB,   32, 
                    Offset (0x80), 
                    OSD1,   32, 
                    Offset (0xA0), 
                    OSD2,   32
                }

                CORB &= 0xFFFFFFFD
                RIRB &= 0xFFFFFFFD
                OSD1 &= 0xFFFFFFFD
                OSD2 &= 0xFFFFFFFD
                CRST &= 0xFFFFFFFE
            }
        }

        Method (AINI, 0, Serialized)
        {
            Name (CONT, 0x03E8)
            If ((((ABAR & 0xFFFFC004) != 0xFFFFC004) && ((
                ABAR & 0xFFFFC000) != Zero)))
            {
                BBAR = Zero
                BBAR = (ABAR & 0xFFFFFFF0)
                If ((ABAH != Zero))
                {
                    BBAR |= (ABAH << 0x20)
                }

                OperationRegion (IPCV, SystemMemory, BBAR, 0x70)
                Field (IPCV, DWordAcc, NoLock, Preserve)
                {
                    GCAP,   16, 
                    Offset (0x08), 
                    GCTL,   32, 
                    Offset (0x0E), 
                    SSTS,   8, 
                    Offset (0x60), 
                    AVIC,   32, 
                    Offset (0x68), 
                    AIRS,   16
                }

                GCTL |= One
                CONT = 0x03E8
                While ((((GCTL & One) == Zero) && (CONT != Zero)))
                {
                    Stall (One)
                    CONT--
                }

                GCAP &= 0xFFFF
                SSTS |= 0x0F
                GCTL &= 0xFFFFFFFE
                CONT = 0x03E8
                While ((((GCTL & One) == One) && (CONT != Zero)))
                {
                    Stall (One)
                    CONT--
                }

                GCTL |= One
                CONT = 0x03E8
                While ((((GCTL & One) == Zero) && (CONT != Zero)))
                {
                    Stall (One)
                    CONT--
                }
            }
        }

        Method (ABWA, 1, Serialized)
        {
            If (Arg0)
            {
                If ((((ABAR & 0xFFFFC004) == 0xFFFFC004) || ((ABAR & 0xFFFFC000
                    ) == Zero)))
                {
                    If ((BARA != 0x80000000))
                    {
                        TBAR = ABAR /* \_SB_.PCI0.B0D3.ABAR */
                        TBAR |= (ABAH << 0x20)
                        TCMD = ACMD /* \_SB_.PCI0.B0D3.ACMD */
                        ABAH = (BARA >> 0x20)
                        ABAR = BARA /* \_SB_.PCI0.B0D3.BARA */
                        ACMD = 0x06
                        MODB = One
                    }
                }
                ElseIf (((ACMD & 0x06) != 0x06))
                {
                    TCMD = ACMD /* \_SB_.PCI0.B0D3.ACMD */
                    ACMD = 0x06
                    MODC = One
                }
            }
            Else
            {
                If (MODB)
                {
                    If ((ABAR == BARA))
                    {
                        ABAR = TBAR /* \_SB_.PCI0.B0D3.TBAR */
                        ABAH = (TBAR >> 0x20)
                        ACMD = TCMD /* \_SB_.PCI0.B0D3.TCMD */
                    }
                }

                If (MODC)
                {
                    ACMD = TCMD /* \_SB_.PCI0.B0D3.TCMD */
                }
            }
        }

        Method (DCCC, 1, Serialized)
        {
            If ((((ABAR & 0xFFFFC004) != 0xFFFFC004) && ((
                ABAR & 0xFFFFC000) != Zero)))
            {
                BBAR = (ABAR & 0xFFFFFFF0)
                OperationRegion (IPCV, SystemMemory, BBAR, 0x1020)
                Field (IPCV, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x100C), 
                    AEM4,   32, 
                    AEM5,   32
                }

                If ((Arg0 == Zero))
                {
                    AEM4 &= 0xFFFC0000
                    AEM4 |= 0x04
                    AEM5 &= 0xFFFC0000
                    AEM5 |= 0x4B
                }

                If ((Arg0 == One))
                {
                    AEM4 &= 0xFFFC0000
                    AEM4 |= 0x04
                    AEM5 &= 0xFFFC0000
                    AEM5 |= 0x5A
                }

                If ((Arg0 == 0x02))
                {
                    AEM4 &= 0xFFFC0000
                    AEM4 |= 0x10
                    AEM5 &= 0xFFFC0000
                    AEM5 |= 0xE1
                }

                If ((Arg0 == 0x03))
                {
                    AEM4 &= 0xFFFC0000
                    AEM4 |= 0x08
                    AEM5 &= 0xFFFC0000
                    AEM5 |= 0xE1
                }
            }
        }
    }

    Scope (\_SB.PCI0.GFX0)
    {
        Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
        {
            DSEN = (Arg0 & 0x07)
            If (((Arg0 & 0x03) == Zero)){}
        }

        Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
        {
            NDID = Zero
            If ((DIDL != Zero))
            {
                DID1 = SDDL (DIDL)
            }

            If ((DDL2 != Zero))
            {
                DID2 = SDDL (DDL2)
            }

            If ((DDL3 != Zero))
            {
                DID3 = SDDL (DDL3)
            }

            If ((DDL4 != Zero))
            {
                DID4 = SDDL (DDL4)
            }

            If ((DDL5 != Zero))
            {
                DID5 = SDDL (DDL5)
            }

            If ((DDL6 != Zero))
            {
                DID6 = SDDL (DDL6)
            }

            If ((DDL7 != Zero))
            {
                DID7 = SDDL (DDL7)
            }

            If ((DDL8 != Zero))
            {
                DID8 = SDDL (DDL8)
            }

            If ((DDL9 != Zero))
            {
                DID9 = SDDL (DDL9)
            }

            If ((DD10 != Zero))
            {
                DIDA = SDDL (DD10)
            }

            If ((DD11 != Zero))
            {
                DIDB = SDDL (DD11)
            }

            If ((DD12 != Zero))
            {
                DIDC = SDDL (DD12)
            }

            If ((DD13 != Zero))
            {
                DIDD = SDDL (DD13)
            }

            If ((DD14 != Zero))
            {
                DIDE = SDDL (DD14)
            }

            If ((DD15 != Zero))
            {
                DIDF = SDDL (DD15)
            }

            If ((NDID == One))
            {
                Name (TMP1, Package (0x01)
                {
                    Ones
                })
                TMP1 [Zero] = (0x00010000 | DID1) /* \DID1 */
                Return (TMP1) /* \_SB_.PCI0.GFX0._DOD.TMP1 */
            }

            If ((NDID == 0x02))
            {
                Name (TMP2, Package (0x02)
                {
                    Ones, 
                    Ones
                })
                TMP2 [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMP2 [One] = (0x00010000 | DID2) /* \DID2 */
                Return (TMP2) /* \_SB_.PCI0.GFX0._DOD.TMP2 */
            }

            If ((NDID == 0x03))
            {
                Name (TMP3, Package (0x03)
                {
                    Ones, 
                    Ones, 
                    Ones
                })
                TMP3 [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMP3 [One] = (0x00010000 | DID2) /* \DID2 */
                TMP3 [0x02] = (0x00010000 | DID3) /* \DID3 */
                Return (TMP3) /* \_SB_.PCI0.GFX0._DOD.TMP3 */
            }

            If ((NDID == 0x04))
            {
                Name (TMP4, Package (0x04)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                TMP4 [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMP4 [One] = (0x00010000 | DID2) /* \DID2 */
                TMP4 [0x02] = (0x00010000 | DID3) /* \DID3 */
                TMP4 [0x03] = (0x00010000 | DID4) /* \DID4 */
                Return (TMP4) /* \_SB_.PCI0.GFX0._DOD.TMP4 */
            }

            If ((NDID == 0x05))
            {
                Name (TMP5, Package (0x05)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                TMP5 [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMP5 [One] = (0x00010000 | DID2) /* \DID2 */
                TMP5 [0x02] = (0x00010000 | DID3) /* \DID3 */
                TMP5 [0x03] = (0x00010000 | DID4) /* \DID4 */
                TMP5 [0x04] = (0x00010000 | DID5) /* \DID5 */
                Return (TMP5) /* \_SB_.PCI0.GFX0._DOD.TMP5 */
            }

            If ((NDID == 0x06))
            {
                Name (TMP6, Package (0x06)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                TMP6 [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMP6 [One] = (0x00010000 | DID2) /* \DID2 */
                TMP6 [0x02] = (0x00010000 | DID3) /* \DID3 */
                TMP6 [0x03] = (0x00010000 | DID4) /* \DID4 */
                TMP6 [0x04] = (0x00010000 | DID5) /* \DID5 */
                TMP6 [0x05] = (0x00010000 | DID6) /* \DID6 */
                Return (TMP6) /* \_SB_.PCI0.GFX0._DOD.TMP6 */
            }

            If ((NDID == 0x07))
            {
                Name (TMP7, Package (0x07)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                TMP7 [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMP7 [One] = (0x00010000 | DID2) /* \DID2 */
                TMP7 [0x02] = (0x00010000 | DID3) /* \DID3 */
                TMP7 [0x03] = (0x00010000 | DID4) /* \DID4 */
                TMP7 [0x04] = (0x00010000 | DID5) /* \DID5 */
                TMP7 [0x05] = (0x00010000 | DID6) /* \DID6 */
                TMP7 [0x06] = (0x00010000 | DID7) /* \DID7 */
                Return (TMP7) /* \_SB_.PCI0.GFX0._DOD.TMP7 */
            }

            If ((NDID == 0x08))
            {
                Name (TMP8, Package (0x08)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                TMP8 [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMP8 [One] = (0x00010000 | DID2) /* \DID2 */
                TMP8 [0x02] = (0x00010000 | DID3) /* \DID3 */
                TMP8 [0x03] = (0x00010000 | DID4) /* \DID4 */
                TMP8 [0x04] = (0x00010000 | DID5) /* \DID5 */
                TMP8 [0x05] = (0x00010000 | DID6) /* \DID6 */
                TMP8 [0x06] = (0x00010000 | DID7) /* \DID7 */
                TMP8 [0x07] = (0x00010000 | DID8) /* \DID8 */
                Return (TMP8) /* \_SB_.PCI0.GFX0._DOD.TMP8 */
            }

            If ((NDID == 0x09))
            {
                Name (TMP9, Package (0x09)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                TMP9 [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMP9 [One] = (0x00010000 | DID2) /* \DID2 */
                TMP9 [0x02] = (0x00010000 | DID3) /* \DID3 */
                TMP9 [0x03] = (0x00010000 | DID4) /* \DID4 */
                TMP9 [0x04] = (0x00010000 | DID5) /* \DID5 */
                TMP9 [0x05] = (0x00010000 | DID6) /* \DID6 */
                TMP9 [0x06] = (0x00010000 | DID7) /* \DID7 */
                TMP9 [0x07] = (0x00010000 | DID8) /* \DID8 */
                TMP9 [0x08] = (0x00010000 | DID9) /* \DID9 */
                Return (TMP9) /* \_SB_.PCI0.GFX0._DOD.TMP9 */
            }

            If ((NDID == 0x0A))
            {
                Name (TMPA, Package (0x0A)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                TMPA [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMPA [One] = (0x00010000 | DID2) /* \DID2 */
                TMPA [0x02] = (0x00010000 | DID3) /* \DID3 */
                TMPA [0x03] = (0x00010000 | DID4) /* \DID4 */
                TMPA [0x04] = (0x00010000 | DID5) /* \DID5 */
                TMPA [0x05] = (0x00010000 | DID6) /* \DID6 */
                TMPA [0x06] = (0x00010000 | DID7) /* \DID7 */
                TMPA [0x07] = (0x00010000 | DID8) /* \DID8 */
                TMPA [0x08] = (0x00010000 | DID9) /* \DID9 */
                TMPA [0x09] = (0x00010000 | DIDA) /* \DIDA */
                Return (TMPA) /* \_SB_.PCI0.GFX0._DOD.TMPA */
            }

            If ((NDID == 0x0B))
            {
                Name (TMPB, Package (0x0B)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                TMPB [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMPB [One] = (0x00010000 | DID2) /* \DID2 */
                TMPB [0x02] = (0x00010000 | DID3) /* \DID3 */
                TMPB [0x03] = (0x00010000 | DID4) /* \DID4 */
                TMPB [0x04] = (0x00010000 | DID5) /* \DID5 */
                TMPB [0x05] = (0x00010000 | DID6) /* \DID6 */
                TMPB [0x06] = (0x00010000 | DID7) /* \DID7 */
                TMPB [0x07] = (0x00010000 | DID8) /* \DID8 */
                TMPB [0x08] = (0x00010000 | DID9) /* \DID9 */
                TMPB [0x09] = (0x00010000 | DIDA) /* \DIDA */
                TMPB [0x0A] = (0x00010000 | DIDB) /* \DIDB */
                Return (TMPB) /* \_SB_.PCI0.GFX0._DOD.TMPB */
            }

            If ((NDID == 0x0C))
            {
                Name (TMPC, Package (0x0C)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                TMPC [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMPC [One] = (0x00010000 | DID2) /* \DID2 */
                TMPC [0x02] = (0x00010000 | DID3) /* \DID3 */
                TMPC [0x03] = (0x00010000 | DID4) /* \DID4 */
                TMPC [0x04] = (0x00010000 | DID5) /* \DID5 */
                TMPC [0x05] = (0x00010000 | DID6) /* \DID6 */
                TMPC [0x06] = (0x00010000 | DID7) /* \DID7 */
                TMPC [0x07] = (0x00010000 | DID8) /* \DID8 */
                TMPC [0x08] = (0x00010000 | DID9) /* \DID9 */
                TMPC [0x09] = (0x00010000 | DIDA) /* \DIDA */
                TMPC [0x0A] = (0x00010000 | DIDB) /* \DIDB */
                TMPC [0x0B] = (0x00010000 | DIDC) /* \DIDC */
                Return (TMPC) /* \_SB_.PCI0.GFX0._DOD.TMPC */
            }

            If ((NDID == 0x0D))
            {
                Name (TMPD, Package (0x0D)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                TMPD [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMPD [One] = (0x00010000 | DID2) /* \DID2 */
                TMPD [0x02] = (0x00010000 | DID3) /* \DID3 */
                TMPD [0x03] = (0x00010000 | DID4) /* \DID4 */
                TMPD [0x04] = (0x00010000 | DID5) /* \DID5 */
                TMPD [0x05] = (0x00010000 | DID6) /* \DID6 */
                TMPD [0x06] = (0x00010000 | DID7) /* \DID7 */
                TMPD [0x07] = (0x00010000 | DID8) /* \DID8 */
                TMPD [0x08] = (0x00010000 | DID9) /* \DID9 */
                TMPD [0x09] = (0x00010000 | DIDA) /* \DIDA */
                TMPD [0x0A] = (0x00010000 | DIDB) /* \DIDB */
                TMPD [0x0B] = (0x00010000 | DIDC) /* \DIDC */
                TMPD [0x0C] = (0x00010000 | DIDD) /* \DIDD */
                Return (TMPD) /* \_SB_.PCI0.GFX0._DOD.TMPD */
            }

            If ((NDID == 0x0E))
            {
                Name (TMPE, Package (0x0E)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                TMPE [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMPE [One] = (0x00010000 | DID2) /* \DID2 */
                TMPE [0x02] = (0x00010000 | DID3) /* \DID3 */
                TMPE [0x03] = (0x00010000 | DID4) /* \DID4 */
                TMPE [0x04] = (0x00010000 | DID5) /* \DID5 */
                TMPE [0x05] = (0x00010000 | DID6) /* \DID6 */
                TMPE [0x06] = (0x00010000 | DID7) /* \DID7 */
                TMPE [0x07] = (0x00010000 | DID8) /* \DID8 */
                TMPE [0x08] = (0x00010000 | DID9) /* \DID9 */
                TMPE [0x09] = (0x00010000 | DIDA) /* \DIDA */
                TMPE [0x0A] = (0x00010000 | DIDB) /* \DIDB */
                TMPE [0x0B] = (0x00010000 | DIDC) /* \DIDC */
                TMPE [0x0C] = (0x00010000 | DIDD) /* \DIDD */
                TMPE [0x0D] = (0x00010000 | DIDE) /* \DIDE */
                Return (TMPE) /* \_SB_.PCI0.GFX0._DOD.TMPE */
            }

            If ((NDID == 0x0F))
            {
                Name (TMPF, Package (0x0F)
                {
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones, 
                    Ones
                })
                TMPF [Zero] = (0x00010000 | DID1) /* \DID1 */
                TMPF [One] = (0x00010000 | DID2) /* \DID2 */
                TMPF [0x02] = (0x00010000 | DID3) /* \DID3 */
                TMPF [0x03] = (0x00010000 | DID4) /* \DID4 */
                TMPF [0x04] = (0x00010000 | DID5) /* \DID5 */
                TMPF [0x05] = (0x00010000 | DID6) /* \DID6 */
                TMPF [0x06] = (0x00010000 | DID7) /* \DID7 */
                TMPF [0x07] = (0x00010000 | DID8) /* \DID8 */
                TMPF [0x08] = (0x00010000 | DID9) /* \DID9 */
                TMPF [0x09] = (0x00010000 | DIDA) /* \DIDA */
                TMPF [0x0A] = (0x00010000 | DIDB) /* \DIDB */
                TMPF [0x0B] = (0x00010000 | DIDC) /* \DIDC */
                TMPF [0x0C] = (0x00010000 | DIDD) /* \DIDD */
                TMPF [0x0D] = (0x00010000 | DIDE) /* \DIDE */
                TMPF [0x0E] = (0x00010000 | DIDF) /* \DIDF */
                Return (TMPF) /* \_SB_.PCI0.GFX0._DOD.TMPF */
            }

            Return (Package (0x01)
            {
                0x0400
            })
        }

        Device (DD01)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DID1) == 0x0400))
                {
                    EDPV = One
                    NXDX = NXD1 /* \NXD1 */
                    DIDX = DID1 /* \DID1 */
                    Return (One)
                }

                If ((DID1 == Zero))
                {
                    Return (One)
                }
                Else
                {
                    Return ((0xFFFF & DID1))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                Return (CDDS (DID1))
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD1) /* \NXD1 */
                }

                Return (NDDS (DID1))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD02)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DID2) == 0x0400))
                {
                    EDPV = 0x02
                    NXDX = NXD2 /* \NXD2 */
                    DIDX = DID2 /* \DID2 */
                    Return (0x02)
                }

                If ((DID2 == Zero))
                {
                    Return (0x02)
                }
                Else
                {
                    Return ((0xFFFF & DID2))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((LIDS == Zero))
                {
                    Return (Zero)
                }

                Return (CDDS (DID2))
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD2) /* \NXD2 */
                }

                Return (NDDS (DID2))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD03)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DID3) == 0x0400))
                {
                    EDPV = 0x03
                    NXDX = NXD3 /* \NXD3 */
                    DIDX = DID3 /* \DID3 */
                    Return (0x03)
                }

                If ((DID3 == Zero))
                {
                    Return (0x03)
                }
                Else
                {
                    Return ((0xFFFF & DID3))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DID3 == Zero))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (CDDS (DID3))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD3) /* \NXD3 */
                }

                Return (NDDS (DID3))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD04)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DID4) == 0x0400))
                {
                    EDPV = 0x04
                    NXDX = NXD4 /* \NXD4 */
                    DIDX = DID4 /* \DID4 */
                    Return (0x04)
                }

                If ((DID4 == Zero))
                {
                    Return (0x04)
                }
                Else
                {
                    Return ((0xFFFF & DID4))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DID4 == Zero))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (CDDS (DID4))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD4) /* \NXD4 */
                }

                Return (NDDS (DID4))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD05)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DID5) == 0x0400))
                {
                    EDPV = 0x05
                    NXDX = NXD5 /* \NXD5 */
                    DIDX = DID5 /* \DID5 */
                    Return (0x05)
                }

                If ((DID5 == Zero))
                {
                    Return (0x05)
                }
                Else
                {
                    Return ((0xFFFF & DID5))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DID5 == Zero))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (CDDS (DID5))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD5) /* \NXD5 */
                }

                Return (NDDS (DID5))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD06)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DID6) == 0x0400))
                {
                    EDPV = 0x06
                    NXDX = NXD6 /* \NXD6 */
                    DIDX = DID6 /* \DID6 */
                    Return (0x06)
                }

                If ((DID6 == Zero))
                {
                    Return (0x06)
                }
                Else
                {
                    Return ((0xFFFF & DID6))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DID6 == Zero))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (CDDS (DID6))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD6) /* \NXD6 */
                }

                Return (NDDS (DID6))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD07)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DID7) == 0x0400))
                {
                    EDPV = 0x07
                    NXDX = NXD7 /* \NXD7 */
                    DIDX = DID7 /* \DID7 */
                    Return (0x07)
                }

                If ((DID7 == Zero))
                {
                    Return (0x07)
                }
                Else
                {
                    Return ((0xFFFF & DID7))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DID7 == Zero))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (CDDS (DID7))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD7) /* \NXD7 */
                }

                Return (NDDS (DID7))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD08)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DID8) == 0x0400))
                {
                    EDPV = 0x08
                    NXDX = NXD8 /* \NXD8 */
                    DIDX = DID8 /* \DID8 */
                    Return (0x08)
                }

                If ((DID8 == Zero))
                {
                    Return (0x08)
                }
                Else
                {
                    Return ((0xFFFF & DID8))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DID8 == Zero))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (CDDS (DID8))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD8) /* \NXD8 */
                }

                Return (NDDS (DID8))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD09)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DID9) == 0x0400))
                {
                    EDPV = 0x09
                    NXDX = NXD8 /* \NXD8 */
                    DIDX = DID9 /* \DID9 */
                    Return (0x09)
                }

                If ((DID9 == Zero))
                {
                    Return (0x09)
                }
                Else
                {
                    Return ((0xFFFF & DID9))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DID9 == Zero))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (CDDS (DID9))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD8) /* \NXD8 */
                }

                Return (NDDS (DID9))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD0A)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DIDA) == 0x0400))
                {
                    EDPV = 0x0A
                    NXDX = NXD8 /* \NXD8 */
                    DIDX = DIDA /* \DIDA */
                    Return (0x0A)
                }

                If ((DIDA == Zero))
                {
                    Return (0x0A)
                }
                Else
                {
                    Return ((0xFFFF & DIDA))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DIDA == Zero))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (CDDS (DIDA))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD8) /* \NXD8 */
                }

                Return (NDDS (DIDA))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD0B)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DIDB) == 0x0400))
                {
                    EDPV = 0x0B
                    NXDX = NXD8 /* \NXD8 */
                    DIDX = DIDB /* \DIDB */
                    Return (0x0B)
                }

                If ((DIDB == Zero))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return ((0xFFFF & DIDB))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DIDB == Zero))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (CDDS (DIDB))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD8) /* \NXD8 */
                }

                Return (NDDS (DIDB))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD0C)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DIDC) == 0x0400))
                {
                    EDPV = 0x0C
                    NXDX = NXD8 /* \NXD8 */
                    DIDX = DIDC /* \DIDC */
                    Return (0x0C)
                }

                If ((DIDC == Zero))
                {
                    Return (0x0C)
                }
                Else
                {
                    Return ((0xFFFF & DIDC))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DIDC == Zero))
                {
                    Return (0x0C)
                }
                Else
                {
                    Return (CDDS (DIDC))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD8) /* \NXD8 */
                }

                Return (NDDS (DIDC))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD0D)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DIDD) == 0x0400))
                {
                    EDPV = 0x0D
                    NXDX = NXD8 /* \NXD8 */
                    DIDX = DIDD /* \DIDD */
                    Return (0x0D)
                }

                If ((DIDD == Zero))
                {
                    Return (0x0D)
                }
                Else
                {
                    Return ((0xFFFF & DIDD))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DIDD == Zero))
                {
                    Return (0x0D)
                }
                Else
                {
                    Return (CDDS (DIDD))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD8) /* \NXD8 */
                }

                Return (NDDS (DIDD))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD0E)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DIDE) == 0x0400))
                {
                    EDPV = 0x0E
                    NXDX = NXD8 /* \NXD8 */
                    DIDX = DIDE /* \DIDE */
                    Return (0x0E)
                }

                If ((DIDE == Zero))
                {
                    Return (0x0E)
                }
                Else
                {
                    Return ((0xFFFF & DIDE))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DIDE == Zero))
                {
                    Return (0x0E)
                }
                Else
                {
                    Return (CDDS (DIDE))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD8) /* \NXD8 */
                }

                Return (NDDS (DIDE))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD0F)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If (((0x0F00 & DIDF) == 0x0400))
                {
                    EDPV = 0x0F
                    NXDX = NXD8 /* \NXD8 */
                    DIDX = DIDF /* \DIDF */
                    Return (0x0F)
                }

                If ((DIDF == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return ((0xFFFF & DIDF))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((DIDC == Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (CDDS (DIDF))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXD8) /* \NXD8 */
                }

                Return (NDDS (DIDF))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }
        }

        Device (DD1F)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                If ((EDPV == Zero))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return ((0xFFFF & DIDX))
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If ((EDPV == Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (CDDS (DIDX))
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If ((((SGMD & 0x7F) == One) && CondRefOf (SNXD)))
                {
                    Return (NXDX) /* \NXDX */
                }

                Return (NDDS (DIDX))
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                DSST (Arg0)
            }

            Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
            {
                Return (Package (0x67)
                {
                    0x50, 
                    0x32, 
                    Zero, 
                    One, 
                    0x02, 
                    0x03, 
                    0x04, 
                    0x05, 
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0x0A, 
                    0x0B, 
                    0x0C, 
                    0x0D, 
                    0x0E, 
                    0x0F, 
                    0x10, 
                    0x11, 
                    0x12, 
                    0x13, 
                    0x14, 
                    0x15, 
                    0x16, 
                    0x17, 
                    0x18, 
                    0x19, 
                    0x1A, 
                    0x1B, 
                    0x1C, 
                    0x1D, 
                    0x1E, 
                    0x1F, 
                    0x20, 
                    0x21, 
                    0x22, 
                    0x23, 
                    0x24, 
                    0x25, 
                    0x26, 
                    0x27, 
                    0x28, 
                    0x29, 
                    0x2A, 
                    0x2B, 
                    0x2C, 
                    0x2D, 
                    0x2E, 
                    0x2F, 
                    0x30, 
                    0x31, 
                    0x32, 
                    0x33, 
                    0x34, 
                    0x35, 
                    0x36, 
                    0x37, 
                    0x38, 
                    0x39, 
                    0x3A, 
                    0x3B, 
                    0x3C, 
                    0x3D, 
                    0x3E, 
                    0x3F, 
                    0x40, 
                    0x41, 
                    0x42, 
                    0x43, 
                    0x44, 
                    0x45, 
                    0x46, 
                    0x47, 
                    0x48, 
                    0x49, 
                    0x4A, 
                    0x4B, 
                    0x4C, 
                    0x4D, 
                    0x4E, 
                    0x4F, 
                    0x50, 
                    0x51, 
                    0x52, 
                    0x53, 
                    0x54, 
                    0x55, 
                    0x56, 
                    0x57, 
                    0x58, 
                    0x59, 
                    0x5A, 
                    0x5B, 
                    0x5C, 
                    0x5D, 
                    0x5E, 
                    0x5F, 
                    0x60, 
                    0x61, 
                    0x62, 
                    0x63, 
                    0x64
                })
            }

            Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
            {
                If (((Arg0 >= Zero) && (Arg0 <= 0x64)))
                {
                    \_SB.PCI0.GFX0.AINT (One, Arg0)
                    BRTL = Arg0
                }
            }

            Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
            {
                Return (BRTL) /* \BRTL */
            }
        }

        Method (SDDL, 1, NotSerialized)
        {
            NDID++
            Local0 = (Arg0 & 0x0F0F)
            Local1 = (0x80000000 | Local0)
            If ((DIDL == Local0))
            {
                Return (Local1)
            }

            If ((DDL2 == Local0))
            {
                Return (Local1)
            }

            If ((DDL3 == Local0))
            {
                Return (Local1)
            }

            If ((DDL4 == Local0))
            {
                Return (Local1)
            }

            If ((DDL5 == Local0))
            {
                Return (Local1)
            }

            If ((DDL6 == Local0))
            {
                Return (Local1)
            }

            If ((DDL7 == Local0))
            {
                Return (Local1)
            }

            If ((DDL8 == Local0))
            {
                Return (Local1)
            }

            If ((DDL9 == Local0))
            {
                Return (Local1)
            }

            If ((DD10 == Local0))
            {
                Return (Local1)
            }

            If ((DD11 == Local0))
            {
                Return (Local1)
            }

            If ((DD12 == Local0))
            {
                Return (Local1)
            }

            If ((DD13 == Local0))
            {
                Return (Local1)
            }

            If ((DD14 == Local0))
            {
                Return (Local1)
            }

            If ((DD15 == Local0))
            {
                Return (Local1)
            }

            Return (Zero)
        }

        Method (CDDS, 1, NotSerialized)
        {
            Local0 = (Arg0 & 0x0F0F)
            If ((Zero == Local0))
            {
                Return (0x1D)
            }

            If ((CADL == Local0))
            {
                Return (0x1F)
            }

            If ((CAL2 == Local0))
            {
                Return (0x1F)
            }

            If ((CAL3 == Local0))
            {
                Return (0x1F)
            }

            If ((CAL4 == Local0))
            {
                Return (0x1F)
            }

            If ((CAL5 == Local0))
            {
                Return (0x1F)
            }

            If ((CAL6 == Local0))
            {
                Return (0x1F)
            }

            If ((CAL7 == Local0))
            {
                Return (0x1F)
            }

            If ((CAL8 == Local0))
            {
                Return (0x1F)
            }

            Return (0x1D)
        }

        Method (NDDS, 1, NotSerialized)
        {
            Local0 = (Arg0 & 0x0F0F)
            If ((Zero == Local0))
            {
                Return (Zero)
            }

            If ((NADL == Local0))
            {
                Return (One)
            }

            If ((NDL2 == Local0))
            {
                Return (One)
            }

            If ((NDL3 == Local0))
            {
                Return (One)
            }

            If ((NDL4 == Local0))
            {
                Return (One)
            }

            If ((NDL5 == Local0))
            {
                Return (One)
            }

            If ((NDL6 == Local0))
            {
                Return (One)
            }

            If ((NDL7 == Local0))
            {
                Return (One)
            }

            If ((NDL8 == Local0))
            {
                Return (One)
            }

            Return (Zero)
        }

        Method (DSST, 1, NotSerialized)
        {
            If (((Arg0 & 0xC0000000) == 0xC0000000))
            {
                CSTE = NSTE /* \NSTE */
            }
        }

        Scope (\_SB.PCI0)
        {
            OperationRegion (MCHP, PCI_Config, 0x40, 0xC0)
            Field (MCHP, AnyAcc, NoLock, Preserve)
            {
                Offset (0x14), 
                AUDE,   8, 
                Offset (0x60), 
                TASM,   10, 
                Offset (0x62)
            }
        }

        OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
        Field (IGDP, AnyAcc, NoLock, Preserve)
        {
            Offset (0x12), 
                ,   1, 
            GIVD,   1, 
                ,   2, 
            GUMA,   3, 
            Offset (0x14), 
                ,   4, 
            GMFN,   1, 
            Offset (0x18), 
            Offset (0xA4), 
            ASLE,   8, 
            Offset (0xA8), 
            GSSE,   1, 
            GSSB,   14, 
            GSES,   1, 
            Offset (0xB0), 
                ,   12, 
            CDVL,   1, 
            Offset (0xB2), 
            Offset (0xB5), 
            LBPC,   8, 
            Offset (0xBC), 
            ASLS,   32
        }

        OperationRegion (IGDM, SystemMemory, ASLB, 0x2000)
        Field (IGDM, AnyAcc, NoLock, Preserve)
        {
            SIGN,   128, 
            SIZE,   32, 
            OVER,   32, 
            SVER,   256, 
            VVER,   128, 
            GVER,   128, 
            MBOX,   32, 
            DMOD,   32, 
            PCON,   32, 
            DVER,   64, 
            Offset (0x100), 
            DRDY,   32, 
            CSTS,   32, 
            CEVT,   32, 
            Offset (0x120), 
            DIDL,   32, 
            DDL2,   32, 
            DDL3,   32, 
            DDL4,   32, 
            DDL5,   32, 
            DDL6,   32, 
            DDL7,   32, 
            DDL8,   32, 
            CPDL,   32, 
            CPL2,   32, 
            CPL3,   32, 
            CPL4,   32, 
            CPL5,   32, 
            CPL6,   32, 
            CPL7,   32, 
            CPL8,   32, 
            CADL,   32, 
            CAL2,   32, 
            CAL3,   32, 
            CAL4,   32, 
            CAL5,   32, 
            CAL6,   32, 
            CAL7,   32, 
            CAL8,   32, 
            NADL,   32, 
            NDL2,   32, 
            NDL3,   32, 
            NDL4,   32, 
            NDL5,   32, 
            NDL6,   32, 
            NDL7,   32, 
            NDL8,   32, 
            ASLP,   32, 
            TIDX,   32, 
            CHPD,   32, 
            CLID,   32, 
            CDCK,   32, 
            SXSW,   32, 
            EVTS,   32, 
            CNOT,   32, 
            NRDY,   32, 
            DDL9,   32, 
            DD10,   32, 
            DD11,   32, 
            DD12,   32, 
            DD13,   32, 
            DD14,   32, 
            DD15,   32, 
            CPL9,   32, 
            CP10,   32, 
            CP11,   32, 
            CP12,   32, 
            CP13,   32, 
            CP14,   32, 
            CP15,   32, 
            Offset (0x200), 
            SCIE,   1, 
            GEFC,   4, 
            GXFC,   3, 
            GESF,   8, 
            Offset (0x204), 
            PARM,   32, 
            DSLP,   32, 
            Offset (0x300), 
            ARDY,   32, 
            ASLC,   32, 
            TCHE,   32, 
            ALSI,   32, 
            BCLP,   32, 
            PFIT,   32, 
            CBLV,   32, 
            BCLM,   320, 
            CPFM,   32, 
            EPFM,   32, 
            PLUT,   592, 
            PFMB,   32, 
            CCDV,   32, 
            PCFT,   32, 
            SROT,   32, 
            IUER,   32, 
            FDSP,   64, 
            FDSS,   32, 
            STAT,   32, 
            Offset (0x400), 
            GVD1,   49152, 
            PHED,   32, 
            BDDC,   2048
        }

        Name (DBTB, Package (0x15)
        {
            Zero, 
            0x07, 
            0x38, 
            0x01C0, 
            0x0E00, 
            0x3F, 
            0x01C7, 
            0x0E07, 
            0x01F8, 
            0x0E38, 
            0x0FC0, 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            0x7000, 
            0x7007, 
            0x7038, 
            0x71C0, 
            0x7E00
        })
        Name (CDCT, Package (0x05)
        {
            Package (0x02)
            {
                0xE4, 
                0x0140
            }, 

            Package (0x02)
            {
                0xDE, 
                0x014D
            }, 

            Package (0x02)
            {
                0xDE, 
                0x014D
            }, 

            Package (0x02)
            {
                Zero, 
                Zero
            }, 

            Package (0x02)
            {
                0xDE, 
                0x014D
            }
        })
        Name (SUCC, One)
        Name (NVLD, 0x02)
        Name (CRIT, 0x04)
        Name (NCRT, 0x06)
        Method (GSCI, 0, Serialized)
        {
            Method (GBDA, 0, Serialized)
            {
                If ((GESF == Zero))
                {
                    PARM = 0x0659
                    GESF = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == One))
                {
                    PARM = 0x00700482
                    If ((S0ID == One))
                    {
                        PARM |= 0x0100
                    }

                    GESF = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x04))
                {
                    PARM &= 0xEFFF0000
                    PARM &= (DerefOf (DBTB [IBTT]) << 0x10)
                    PARM |= IBTT /* \IBTT */
                    GESF = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x05))
                {
                    PARM = IPSC /* \IPSC */
                    PARM |= (IPAT << 0x08)
                    PARM += 0x0100
                    PARM |= (LIDS << 0x10)
                    PARM += 0x00010000
                    PARM |= (IBIA << 0x14)
                    GESF = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x07))
                {
                    PARM = GIVD /* \_SB_.PCI0.GFX0.GIVD */
                    PARM ^= One
                    PARM |= (GMFN << One)
                    PARM |= 0x1800
                    PARM |= (IDMS << 0x11)
                    PARM |= (DerefOf (DerefOf (CDCT [HVCO]) [CDVL]) << 
                        0x15)
                    GESF = One
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x0A))
                {
                    PARM = Zero
                    If (ISSC)
                    {
                        PARM |= 0x03
                    }

                    GESF = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x0B))
                {
                    PARM = KSV0 /* \KSV0 */
                    GESF = KSV1 /* \KSV1 */
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                GESF = Zero
                Return (CRIT) /* \_SB_.PCI0.GFX0.CRIT */
            }

            Method (SBCB, 0, Serialized)
            {
                If ((GESF == Zero))
                {
                    PARM = Zero
                    PARM = 0x000F87DD
                    GESF = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == One))
                {
                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x03))
                {
                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x04))
                {
                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x05))
                {
                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x07))
                {
                    If ((S0ID == One))
                    {
                        If (((PARM & 0xFF) == One))
                        {
                            \GUAM (One)
                        }
                    }

                    If ((PARM == Zero))
                    {
                        Local0 = CLID /* \_SB_.PCI0.GFX0.CLID */
                        If ((0x80000000 & Local0))
                        {
                            CLID &= 0x0F
                            GLID (CLID)
                        }
                    }

                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x08))
                {
                    If ((S0ID == One))
                    {
                        Local0 = ((PARM >> 0x08) & 0xFF)
                        If ((Local0 == Zero))
                        {
                            \GUAM (Zero)
                        }
                    }

                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x09))
                {
                    IBTT = (PARM & 0xFF)
                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x0A))
                {
                    IPSC = (PARM & 0xFF)
                    If (((PARM >> 0x08) & 0xFF))
                    {
                        IPAT = ((PARM >> 0x08) & 0xFF)
                        IPAT--
                    }

                    IBIA = ((PARM >> 0x14) & 0x07)
                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x0B))
                {
                    IF1E = ((PARM >> One) & One)
                    If ((PARM & 0x0001E000))
                    {
                        IDMS = ((PARM >> 0x0D) & 0x0F)
                    }
                    Else
                    {
                        IDMS = ((PARM >> 0x11) & 0x0F)
                    }

                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x10))
                {
                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x11))
                {
                    PARM = (LIDS << 0x08)
                    PARM += 0x0100
                    GESF = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x12))
                {
                    If ((PARM & One))
                    {
                        If (((PARM >> One) == One))
                        {
                            ISSC = One
                        }
                        Else
                        {
                            GESF = Zero
                            Return (CRIT) /* \_SB_.PCI0.GFX0.CRIT */
                        }
                    }
                    Else
                    {
                        ISSC = Zero
                    }

                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x13))
                {
                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x14))
                {
                    PAVP = (PARM & 0x0F)
                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x15))
                {
                    If ((PARM == One))
                    {
                        \_SB.PCI0.AUDE |= 0x20
                        \_SB.PCI0.B0D3.ABWA (One)
                        \_SB.PCI0.B0D3.ARST ()
                        \_SB.PCI0.B0D3.ASTR ()
                        \_SB.PCI0.B0D3.AINI ()
                        \_SB.PCI0.B0D3.CXDC ()
                        \_SB.PCI0.B0D3.ABWA (Zero)
                        Notify (\_SB.PCI0, Zero) // Bus Check
                    }

                    If ((PARM == Zero))
                    {
                        \_SB.PCI0.AUDE &= 0xDF
                        Notify (\_SB.PCI0, Zero) // Bus Check
                    }

                    GESF = Zero
                    PARM = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                If ((GESF == 0x16))
                {
                    Local0 = (PARM & 0x03)
                    \_SB.PCI0.B0D3.DCCC (Local0)
                    GESF = Zero
                    Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                }

                GESF = Zero
                Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
            }

            If ((GEFC == 0x04))
            {
                GXFC = GBDA ()
            }

            If ((GEFC == 0x06))
            {
                GXFC = SBCB ()
            }

            GEFC = Zero
            SCIS = One
            GSSE = Zero
            SCIE = Zero
            Return (Zero)
        }

        Method (PDRD, 0, NotSerialized)
        {
            Return (!DRDY)
        }

        Method (PSTS, 0, NotSerialized)
        {
            If ((CSTS > 0x02))
            {
                Sleep (ASLP)
            }

            Return ((CSTS == 0x03))
        }

        Method (GNOT, 2, NotSerialized)
        {
            If (PDRD ())
            {
                Return (One)
            }

            CEVT = Arg0
            CSTS = 0x03
            If (((CHPD == Zero) && (Arg1 == Zero)))
            {
                Notify (\_SB.PCI0.GFX0, Arg1)
            }

            Notify (\_SB.PCI0.GFX0, 0x80) // Status Change
            Return (Zero)
        }

        Method (GHDS, 1, NotSerialized)
        {
            TIDX = Arg0
            Return (GNOT (One, Zero))
        }

        Method (GLID, 1, NotSerialized)
        {
            If ((Arg0 == One))
            {
                CLID = 0x03
            }
            Else
            {
                CLID = Arg0
            }

            If (GNOT (0x02, Zero))
            {
                CLID |= 0x80000000
                Return (One)
            }

            Return (Zero)
        }

        Method (GDCK, 1, NotSerialized)
        {
            CDCK = Arg0
            Return (GNOT (0x04, Zero))
        }

        Method (PARD, 0, NotSerialized)
        {
            If (!ARDY)
            {
                Sleep (ASLP)
            }

            Return (!ARDY)
        }

        Method (IUEH, 1, Serialized)
        {
            IUER &= 0xC0
            IUER ^= (One << Arg0)
            If ((Arg0 <= 0x04))
            {
                Return (AINT (0x05, Zero))
            }
            Else
            {
                Return (AINT (Arg0, Zero))
            }
        }

        Method (AINT, 2, NotSerialized)
        {
            If (!(TCHE & (One << Arg0)))
            {
                Return (One)
            }

            If (PARD ())
            {
                Return (One)
            }

            If (((Arg0 >= 0x05) && (Arg0 <= 0x07)))
            {
                ASLC = (One << Arg0)
                ASLE = One
                Local2 = Zero
                While (((Local2 < 0xFA) && (ASLC != Zero)))
                {
                    Sleep (0x04)
                    Local2++
                }

                Return (Zero)
            }

            If ((Arg0 == 0x02))
            {
                If (CPFM)
                {
                    Local0 = (CPFM & 0x0F)
                    Local1 = (EPFM & 0x0F)
                    If ((Local0 == One))
                    {
                        If ((Local1 & 0x06))
                        {
                            PFIT = 0x06
                        }
                        ElseIf ((Local1 & 0x08))
                        {
                            PFIT = 0x08
                        }
                        Else
                        {
                            PFIT = One
                        }
                    }

                    If ((Local0 == 0x06))
                    {
                        If ((Local1 & 0x08))
                        {
                            PFIT = 0x08
                        }
                        ElseIf ((Local1 & One))
                        {
                            PFIT = One
                        }
                        Else
                        {
                            PFIT = 0x06
                        }
                    }

                    If ((Local0 == 0x08))
                    {
                        If ((Local1 & One))
                        {
                            PFIT = One
                        }
                        ElseIf ((Local1 & 0x06))
                        {
                            PFIT = 0x06
                        }
                        Else
                        {
                            PFIT = 0x08
                        }
                    }
                }
                Else
                {
                    PFIT ^= 0x07
                }

                PFIT |= 0x80000000
                ASLC = 0x04
            }
            ElseIf ((Arg0 == One))
            {
                BCLP = ((Arg1 * 0xFF) / 0x64)
                BCLP |= 0x80000000
                ASLC = 0x02
            }
            ElseIf ((Arg0 == Zero))
            {
                ALSI = Arg1
                ASLC = One
            }
            Else
            {
                Return (One)
            }

            ASLE = One
            Return (Zero)
        }

        Device (\_SB.MEM2)
        {
            Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (CRS2, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x20000000,         // Address Base
                    0x00200000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0x40004000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (IGDS)
                {
                    If ((PNHM == 0x000306C1))
                    {
                        Return (0x0F)
                    }
                }

                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (CRS2) /* \_SB_.MEM2.CRS2 */
            }
        }
    }

    Scope (\_SB.PCI0)
    {
        Name (HBRB, Zero)
        Name (HBRD, Zero)
        Name (HBRF, Zero)
        Name (IVID, 0xFFFF)
        Name (PEBA, Zero)
        Name (PEGI, Zero)
        Name (PBUS, Zero)
        Name (PDEV, Zero)
        Name (PFUN, Zero)
        Name (EBUS, Zero)
        Name (EDEV, Zero)
        Name (EFN0, Zero)
        Name (EFN1, One)
        Name (INDX, Zero)
        Name (POFF, Zero)
        Name (PLEN, Zero)
        Name (WLSB, Zero)
        Name (WMSB, Zero)
        Name (SPGA, Zero)
        Name (SEPA, Zero)
        Name (VIOF, Zero)
        Name (DSOF, 0x06)
        Name (CPOF, 0x34)
        Name (SBOF, 0x19)
        Name (TIDX, Zero)
        Name (OTSD, Zero)
        Name (MXPG, 0x03)
        Name (FBDL, Zero)
        Name (CBDL, Zero)
        Name (MBDL, Zero)
        Name (HSTR, Zero)
        Name (LREV, Zero)
        Name (TMP0, Zero)
        Name (TMP1, Zero)
        Name (TMP2, Zero)
        Name (TCNT, Zero)
        Name (LDLY, 0x64)
        Name (DCMN, Buffer (0x035D)
        {
            /* 0000 */  0xD8, 0x0D, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0008 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x04, 0x09,  // ........
            /* 0010 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x08, 0x09, 0x04,  // ........
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x0C, 0x09, 0x04, 0x00,  // ........
            /* 0020 */  0x00, 0x00, 0x00, 0x10, 0x09, 0x04, 0x00, 0x00,  // ........
            /* 0028 */  0x00, 0x00, 0x0C, 0x08, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 0030 */  0x00, 0x20, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  // . ......
            /* 0038 */  0x24, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x28,  // $......(
            /* 0040 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x09,  // ......,.
            /* 0048 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x30, 0x09, 0x04,  // .....0..
            /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x2C, 0x08, 0x04, 0x00,  // ....,...
            /* 0058 */  0x00, 0x00, 0x00, 0x40, 0x09, 0x04, 0x00, 0x00,  // ...@....
            /* 0060 */  0x00, 0x00, 0x44, 0x09, 0x04, 0x00, 0x00, 0x00,  // ..D.....
            /* 0068 */  0x00, 0x48, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  // .H......
            /* 0070 */  0x4C, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x50,  // L......P
            /* 0078 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x4C, 0x08,  // ......L.
            /* 0080 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x60, 0x09, 0x04,  // .....`..
            /* 0088 */  0x00, 0x00, 0x00, 0x00, 0x64, 0x09, 0x04, 0x00,  // ....d...
            /* 0090 */  0x00, 0x00, 0x00, 0x68, 0x09, 0x04, 0x00, 0x00,  // ...h....
            /* 0098 */  0x00, 0x00, 0x6C, 0x09, 0x04, 0x00, 0x00, 0x00,  // ..l.....
            /* 00A0 */  0x00, 0x70, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  // .p......
            /* 00A8 */  0x6C, 0x08, 0x04, 0x00, 0x00, 0x00, 0x00, 0x80,  // l.......
            /* 00B0 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0x84, 0x09,  // ........
            /* 00B8 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x88, 0x09, 0x04,  // ........
            /* 00C0 */  0x00, 0x00, 0x00, 0x00, 0x8C, 0x09, 0x04, 0x00,  // ........
            /* 00C8 */  0x00, 0x00, 0x00, 0x90, 0x09, 0x04, 0x00, 0x00,  // ........
            /* 00D0 */  0x00, 0x00, 0x8C, 0x08, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 00D8 */  0x00, 0xA0, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 00E0 */  0xA4, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0xA8,  // ........
            /* 00E8 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0xAC, 0x09,  // ........
            /* 00F0 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xB0, 0x09, 0x04,  // ........
            /* 00F8 */  0x00, 0x00, 0x00, 0x00, 0xAC, 0x08, 0x04, 0x00,  // ........
            /* 0100 */  0x00, 0x00, 0x00, 0xC0, 0x09, 0x04, 0x00, 0x00,  // ........
            /* 0108 */  0x00, 0x00, 0xC4, 0x09, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 0110 */  0x00, 0xC8, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0118 */  0xCC, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0xD0,  // ........
            /* 0120 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0xCC, 0x08,  // ........
            /* 0128 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x09, 0x04,  // ........
            /* 0130 */  0x00, 0x00, 0x00, 0x00, 0xE4, 0x09, 0x04, 0x00,  // ........
            /* 0138 */  0x00, 0x00, 0x00, 0xE8, 0x09, 0x04, 0x00, 0x00,  // ........
            /* 0140 */  0x00, 0x00, 0xEC, 0x09, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 0148 */  0x00, 0xF0, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0150 */  0xEC, 0x08, 0x04, 0x00, 0x00, 0x00, 0x00, 0x30,  // .......0
            /* 0158 */  0x0C, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A,  // ........
            /* 0160 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x04, 0x0A, 0x04,  // ........
            /* 0168 */  0x00, 0x00, 0x00, 0x00, 0x08, 0x0A, 0x04, 0x00,  // ........
            /* 0170 */  0x00, 0x00, 0x00, 0x0C, 0x0A, 0x04, 0x00, 0x00,  // ........
            /* 0178 */  0x00, 0x00, 0xA0, 0x0A, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 0180 */  0x00, 0xA4, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0188 */  0xA8, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0xAC,  // ........
            /* 0190 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0xB0, 0x0A,  // ........
            /* 0198 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xB4, 0x0A, 0x04,  // ........
            /* 01A0 */  0x00, 0x00, 0x00, 0x00, 0xB8, 0x0A, 0x04, 0x00,  // ........
            /* 01A8 */  0x00, 0x00, 0x00, 0xBC, 0x0A, 0x04, 0x00, 0x00,  // ........
            /* 01B0 */  0x00, 0x00, 0xC0, 0x0A, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 01B8 */  0x00, 0xC4, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01C0 */  0xC8, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0xCC,  // ........
            /* 01C8 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x0A,  // ........
            /* 01D0 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xD4, 0x0A, 0x04,  // ........
            /* 01D8 */  0x00, 0x00, 0x00, 0x00, 0xD8, 0x0A, 0x04, 0x00,  // ........
            /* 01E0 */  0x00, 0x00, 0x00, 0xDC, 0x0A, 0x04, 0x00, 0x00,  // ........
            /* 01E8 */  0x00, 0x00, 0xE0, 0x0A, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 01F0 */  0x00, 0xE4, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 01F8 */  0xE8, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0xEC,  // ........
            /* 0200 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x0A,  // ........
            /* 0208 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xF4, 0x0A, 0x04,  // ........
            /* 0210 */  0x00, 0x00, 0x00, 0x00, 0xF8, 0x0A, 0x04, 0x00,  // ........
            /* 0218 */  0x00, 0x00, 0x00, 0xFC, 0x0A, 0x04, 0x00, 0x00,  // ........
            /* 0220 */  0x00, 0x00, 0x10, 0x0A, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 0228 */  0x00, 0x14, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0230 */  0x18, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x1C,  // ........
            /* 0238 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x20, 0x0A,  // ...... .
            /* 0240 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x24, 0x0A, 0x04,  // .....$..
            /* 0248 */  0x00, 0x00, 0x00, 0x00, 0x28, 0x0A, 0x04, 0x00,  // ....(...
            /* 0250 */  0x00, 0x00, 0x00, 0x2C, 0x0A, 0x04, 0x00, 0x00,  // ...,....
            /* 0258 */  0x00, 0x00, 0x30, 0x0A, 0x04, 0x00, 0x00, 0x00,  // ..0.....
            /* 0260 */  0x00, 0x34, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  // .4......
            /* 0268 */  0x38, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x3C,  // 8......<
            /* 0270 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x40, 0x0A,  // ......@.
            /* 0278 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x44, 0x0A, 0x04,  // .....D..
            /* 0280 */  0x00, 0x00, 0x00, 0x00, 0x48, 0x0A, 0x04, 0x00,  // ....H...
            /* 0288 */  0x00, 0x00, 0x00, 0x4C, 0x0A, 0x04, 0x00, 0x00,  // ...L....
            /* 0290 */  0x00, 0x00, 0x50, 0x0A, 0x04, 0x00, 0x00, 0x00,  // ..P.....
            /* 0298 */  0x00, 0x54, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  // .T......
            /* 02A0 */  0x58, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x5C,  // X......\
            /* 02A8 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x60, 0x0A,  // ......`.
            /* 02B0 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x64, 0x0A, 0x04,  // .....d..
            /* 02B8 */  0x00, 0x00, 0x00, 0x00, 0x68, 0x0A, 0x04, 0x00,  // ....h...
            /* 02C0 */  0x00, 0x00, 0x00, 0x6C, 0x0A, 0x04, 0x00, 0x00,  // ...l....
            /* 02C8 */  0x00, 0x00, 0x70, 0x0A, 0x04, 0x00, 0x00, 0x00,  // ..p.....
            /* 02D0 */  0x00, 0x74, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  // .t......
            /* 02D8 */  0x78, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x7C,  // x......|
            /* 02E0 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0A,  // ........
            /* 02E8 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x84, 0x0A, 0x04,  // ........
            /* 02F0 */  0x00, 0x00, 0x00, 0x00, 0x88, 0x0A, 0x04, 0x00,  // ........
            /* 02F8 */  0x00, 0x00, 0x00, 0x8C, 0x0A, 0x04, 0x00, 0x00,  // ........
            /* 0300 */  0x00, 0x00, 0x90, 0x0A, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 0308 */  0x00, 0x94, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0310 */  0x98, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x9C,  // ........
            /* 0318 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x18, 0x09,  // ........
            /* 0320 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x38, 0x09, 0x04,  // .....8..
            /* 0328 */  0x00, 0x00, 0x00, 0x00, 0x58, 0x09, 0x04, 0x00,  // ....X...
            /* 0330 */  0x00, 0x00, 0x00, 0x78, 0x09, 0x04, 0x00, 0x00,  // ...x....
            /* 0338 */  0x00, 0x00, 0x98, 0x09, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 0340 */  0x00, 0xB8, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0348 */  0xD8, 0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0xF8,  // ........
            /* 0350 */  0x09, 0x04, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF,  // ........
            /* 0358 */  0x04, 0xFF, 0xFF, 0xFF, 0xFF                     // .....
        })
        Name (DPG0, Buffer (0x0196)
        {
            /* 0000 */  0x24, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0xF8,  // $.......
            /* 0008 */  0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x60, 0x02,  // ......`.
            /* 0010 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x28, 0x0C, 0x04,  // .....(..
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x38, 0x0C, 0x04, 0x00,  // ....8...
            /* 0020 */  0x00, 0x00, 0x00, 0x14, 0x0D, 0x04, 0x00, 0x00,  // ........
            /* 0028 */  0x00, 0x00, 0x0C, 0x00, 0x01, 0x00, 0x19, 0x00,  // ........
            /* 0030 */  0x01, 0x00, 0x1A, 0x00, 0x01, 0x00, 0x1C, 0x00,  // ........
            /* 0038 */  0x01, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x20, 0x00,  // ...... .
            /* 0040 */  0x02, 0x00, 0x00, 0x22, 0x00, 0x02, 0x00, 0x00,  // ..."....
            /* 0048 */  0x24, 0x00, 0x02, 0x00, 0x00, 0x26, 0x00, 0x02,  // $....&..
            /* 0050 */  0x00, 0x00, 0x28, 0x00, 0x04, 0x00, 0x00, 0x00,  // ..(.....
            /* 0058 */  0x00, 0x2C, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,  // .,......
            /* 0060 */  0x3C, 0x00, 0x01, 0x00, 0x3D, 0x00, 0x01, 0x00,  // <...=...
            /* 0068 */  0x3E, 0x00, 0x02, 0x00, 0x00, 0x84, 0x00, 0x04,  // >.......
            /* 0070 */  0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x04, 0x00,  // ........
            /* 0078 */  0x00, 0x00, 0x00, 0x92, 0x00, 0x02, 0x00, 0x00,  // ........
            /* 0080 */  0x94, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x98,  // ........
            /* 0088 */  0x00, 0x02, 0x00, 0x00, 0xA2, 0x00, 0x02, 0x00,  // ........
            /* 0090 */  0x00, 0xA8, 0x00, 0x02, 0x00, 0x00, 0xAC, 0x00,  // ........
            /* 0098 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x02,  // ........
            /* 00A0 */  0x00, 0x00, 0xB4, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 00A8 */  0x00, 0xBC, 0x00, 0x02, 0x00, 0x00, 0xC8, 0x00,  // ........
            /* 00B0 */  0x02, 0x00, 0x00, 0xD0, 0x00, 0x02, 0x00, 0x00,  // ........
            /* 00B8 */  0xEC, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x14,  // ........
            /* 00C0 */  0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x44, 0x01,  // ......D.
            /* 00C8 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x50, 0x01, 0x04,  // .....P..
            /* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x58, 0x01, 0x04, 0x00,  // ....X...
            /* 00D8 */  0x00, 0x00, 0x00, 0x5C, 0x01, 0x04, 0x00, 0x00,  // ...\....
            /* 00E0 */  0x00, 0x00, 0xFC, 0x01, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 00E8 */  0x00, 0x00, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 00F0 */  0x04, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x08,  // ........
            /* 00F8 */  0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x28, 0x02,  // ......(.
            /* 0100 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x02, 0x04,  // .....,..
            /* 0108 */  0x00, 0x00, 0x00, 0x00, 0x38, 0x02, 0x04, 0x00,  // ....8...
            /* 0110 */  0x00, 0x00, 0x00, 0x40, 0x02, 0x04, 0x00, 0x00,  // ...@....
            /* 0118 */  0x00, 0x00, 0x44, 0x02, 0x04, 0x00, 0x00, 0x00,  // ..D.....
            /* 0120 */  0x00, 0x50, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00,  // .P......
            /* 0128 */  0x58, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x5C,  // X......\
            /* 0130 */  0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x0C,  // ........
            /* 0138 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x34, 0x0D, 0x04,  // .....4..
            /* 0140 */  0x00, 0x00, 0x00, 0x00, 0xF4, 0x00, 0x04, 0x00,  // ........
            /* 0148 */  0x00, 0x00, 0x00, 0xA0, 0x0D, 0x04, 0x00, 0x00,  // ........
            /* 0150 */  0x00, 0x00, 0xA4, 0x0D, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 0158 */  0x00, 0xA8, 0x0D, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0160 */  0xAC, 0x0D, 0x04, 0x00, 0x00, 0x00, 0x00, 0xB0,  // ........
            /* 0168 */  0x0D, 0x04, 0x00, 0x00, 0x00, 0x00, 0xB4, 0x0D,  // ........
            /* 0170 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xB8, 0x0D, 0x04,  // ........
            /* 0178 */  0x00, 0x00, 0x00, 0x00, 0xBC, 0x0D, 0x04, 0x00,  // ........
            /* 0180 */  0x00, 0x00, 0x00, 0xCC, 0x01, 0x04, 0x00, 0x00,  // ........
            /* 0188 */  0x00, 0x00, 0x04, 0x00, 0x02, 0x00, 0x00, 0xFF,  // ........
            /* 0190 */  0xFF, 0x04, 0xFF, 0xFF, 0xFF, 0xFF               // ......
        })
        Name (DPG1, Buffer (0x017A)
        {
            /* 0000 */  0x24, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0xF8,  // $.......
            /* 0008 */  0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x60, 0x02,  // ......`.
            /* 0010 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x28, 0x0C, 0x04,  // .....(..
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x38, 0x0C, 0x04, 0x00,  // ....8...
            /* 0020 */  0x00, 0x00, 0x00, 0x14, 0x0D, 0x04, 0x00, 0x00,  // ........
            /* 0028 */  0x00, 0x00, 0x0C, 0x00, 0x01, 0x00, 0x19, 0x00,  // ........
            /* 0030 */  0x01, 0x00, 0x1A, 0x00, 0x01, 0x00, 0x1C, 0x00,  // ........
            /* 0038 */  0x01, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x20, 0x00,  // ...... .
            /* 0040 */  0x02, 0x00, 0x00, 0x22, 0x00, 0x02, 0x00, 0x00,  // ..."....
            /* 0048 */  0x24, 0x00, 0x02, 0x00, 0x00, 0x26, 0x00, 0x02,  // $....&..
            /* 0050 */  0x00, 0x00, 0x28, 0x00, 0x04, 0x00, 0x00, 0x00,  // ..(.....
            /* 0058 */  0x00, 0x2C, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,  // .,......
            /* 0060 */  0x3C, 0x00, 0x01, 0x00, 0x3D, 0x00, 0x01, 0x00,  // <...=...
            /* 0068 */  0x3E, 0x00, 0x02, 0x00, 0x00, 0x84, 0x00, 0x04,  // >.......
            /* 0070 */  0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x04, 0x00,  // ........
            /* 0078 */  0x00, 0x00, 0x00, 0x92, 0x00, 0x02, 0x00, 0x00,  // ........
            /* 0080 */  0x94, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x98,  // ........
            /* 0088 */  0x00, 0x02, 0x00, 0x00, 0xA2, 0x00, 0x02, 0x00,  // ........
            /* 0090 */  0x00, 0xA8, 0x00, 0x02, 0x00, 0x00, 0xAC, 0x00,  // ........
            /* 0098 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x02,  // ........
            /* 00A0 */  0x00, 0x00, 0xB4, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 00A8 */  0x00, 0xBC, 0x00, 0x02, 0x00, 0x00, 0xC8, 0x00,  // ........
            /* 00B0 */  0x02, 0x00, 0x00, 0xD0, 0x00, 0x02, 0x00, 0x00,  // ........
            /* 00B8 */  0xEC, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x14,  // ........
            /* 00C0 */  0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x44, 0x01,  // ......D.
            /* 00C8 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x50, 0x01, 0x04,  // .....P..
            /* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x58, 0x01, 0x04, 0x00,  // ....X...
            /* 00D8 */  0x00, 0x00, 0x00, 0x5C, 0x01, 0x04, 0x00, 0x00,  // ...\....
            /* 00E0 */  0x00, 0x00, 0xFC, 0x01, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 00E8 */  0x00, 0x00, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 00F0 */  0x04, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x08,  // ........
            /* 00F8 */  0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x28, 0x02,  // ......(.
            /* 0100 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x02, 0x04,  // .....,..
            /* 0108 */  0x00, 0x00, 0x00, 0x00, 0x38, 0x02, 0x04, 0x00,  // ....8...
            /* 0110 */  0x00, 0x00, 0x00, 0x40, 0x02, 0x04, 0x00, 0x00,  // ...@....
            /* 0118 */  0x00, 0x00, 0x44, 0x02, 0x04, 0x00, 0x00, 0x00,  // ..D.....
            /* 0120 */  0x00, 0x50, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00,  // .P......
            /* 0128 */  0x58, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x5C,  // X......\
            /* 0130 */  0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x0C,  // ........
            /* 0138 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x34, 0x0D, 0x04,  // .....4..
            /* 0140 */  0x00, 0x00, 0x00, 0x00, 0xF4, 0x00, 0x04, 0x00,  // ........
            /* 0148 */  0x00, 0x00, 0x00, 0xA0, 0x0D, 0x04, 0x00, 0x00,  // ........
            /* 0150 */  0x00, 0x00, 0xA4, 0x0D, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 0158 */  0x00, 0xA8, 0x0D, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0160 */  0xAC, 0x0D, 0x04, 0x00, 0x00, 0x00, 0x00, 0xCC,  // ........
            /* 0168 */  0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
            /* 0170 */  0x02, 0x00, 0x00, 0xFF, 0xFF, 0x04, 0xFF, 0xFF,  // ........
            /* 0178 */  0xFF, 0xFF                                       // ..
        })
        Name (DPG2, Buffer (0x016C)
        {
            /* 0000 */  0x24, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0xF8,  // $.......
            /* 0008 */  0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x60, 0x02,  // ......`.
            /* 0010 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x28, 0x0C, 0x04,  // .....(..
            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x38, 0x0C, 0x04, 0x00,  // ....8...
            /* 0020 */  0x00, 0x00, 0x00, 0x14, 0x0D, 0x04, 0x00, 0x00,  // ........
            /* 0028 */  0x00, 0x00, 0x0C, 0x00, 0x01, 0x00, 0x19, 0x00,  // ........
            /* 0030 */  0x01, 0x00, 0x1A, 0x00, 0x01, 0x00, 0x1C, 0x00,  // ........
            /* 0038 */  0x01, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x20, 0x00,  // ...... .
            /* 0040 */  0x02, 0x00, 0x00, 0x22, 0x00, 0x02, 0x00, 0x00,  // ..."....
            /* 0048 */  0x24, 0x00, 0x02, 0x00, 0x00, 0x26, 0x00, 0x02,  // $....&..
            /* 0050 */  0x00, 0x00, 0x28, 0x00, 0x04, 0x00, 0x00, 0x00,  // ..(.....
            /* 0058 */  0x00, 0x2C, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,  // .,......
            /* 0060 */  0x3C, 0x00, 0x01, 0x00, 0x3D, 0x00, 0x01, 0x00,  // <...=...
            /* 0068 */  0x3E, 0x00, 0x02, 0x00, 0x00, 0x84, 0x00, 0x04,  // >.......
            /* 0070 */  0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x04, 0x00,  // ........
            /* 0078 */  0x00, 0x00, 0x00, 0x92, 0x00, 0x02, 0x00, 0x00,  // ........
            /* 0080 */  0x94, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x98,  // ........
            /* 0088 */  0x00, 0x02, 0x00, 0x00, 0xA2, 0x00, 0x02, 0x00,  // ........
            /* 0090 */  0x00, 0xA8, 0x00, 0x02, 0x00, 0x00, 0xAC, 0x00,  // ........
            /* 0098 */  0x04, 0x00, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x02,  // ........
            /* 00A0 */  0x00, 0x00, 0xB4, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 00A8 */  0x00, 0xBC, 0x00, 0x02, 0x00, 0x00, 0xC8, 0x00,  // ........
            /* 00B0 */  0x02, 0x00, 0x00, 0xD0, 0x00, 0x02, 0x00, 0x00,  // ........
            /* 00B8 */  0xEC, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x14,  // ........
            /* 00C0 */  0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x44, 0x01,  // ......D.
            /* 00C8 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x50, 0x01, 0x04,  // .....P..
            /* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x58, 0x01, 0x04, 0x00,  // ....X...
            /* 00D8 */  0x00, 0x00, 0x00, 0x5C, 0x01, 0x04, 0x00, 0x00,  // ...\....
            /* 00E0 */  0x00, 0x00, 0xFC, 0x01, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 00E8 */  0x00, 0x00, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 00F0 */  0x04, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x08,  // ........
            /* 00F8 */  0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x28, 0x02,  // ......(.
            /* 0100 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x02, 0x04,  // .....,..
            /* 0108 */  0x00, 0x00, 0x00, 0x00, 0x38, 0x02, 0x04, 0x00,  // ....8...
            /* 0110 */  0x00, 0x00, 0x00, 0x40, 0x02, 0x04, 0x00, 0x00,  // ...@....
            /* 0118 */  0x00, 0x00, 0x44, 0x02, 0x04, 0x00, 0x00, 0x00,  // ..D.....
            /* 0120 */  0x00, 0x50, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00,  // .P......
            /* 0128 */  0x58, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x5C,  // X......\
            /* 0130 */  0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x0C,  // ........
            /* 0138 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x34, 0x0D, 0x04,  // .....4..
            /* 0140 */  0x00, 0x00, 0x00, 0x00, 0xF4, 0x00, 0x04, 0x00,  // ........
            /* 0148 */  0x00, 0x00, 0x00, 0xA0, 0x0D, 0x04, 0x00, 0x00,  // ........
            /* 0150 */  0x00, 0x00, 0xA4, 0x0D, 0x04, 0x00, 0x00, 0x00,  // ........
            /* 0158 */  0x00, 0xCC, 0x01, 0x04, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0160 */  0x04, 0x00, 0x02, 0x00, 0x00, 0xFF, 0xFF, 0x04,  // ........
            /* 0168 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
        })
        Name (DCLR, Buffer (0x43)
        {
            /* 0000 */  0x06, 0x00, 0x02, 0xFF, 0xFF, 0x1E, 0x00, 0x02,  // ........
            /* 0008 */  0xFF, 0xFF, 0xAA, 0x00, 0x02, 0xFF, 0xFF, 0xC0,  // ........
            /* 0010 */  0x00, 0x04, 0xFF, 0xFF, 0xFF, 0xFF, 0xD2, 0x00,  // ........
            /* 0018 */  0x02, 0xFF, 0xFF, 0xC4, 0x01, 0x04, 0xFF, 0xFF,  // ........
            /* 0020 */  0xFF, 0xFF, 0xD0, 0x01, 0x04, 0xFF, 0xFF, 0xFF,  // ........
            /* 0028 */  0xFF, 0xF0, 0x01, 0x04, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
            /* 0030 */  0x9C, 0x0D, 0x04, 0xFF, 0xFF, 0xFF, 0xFF, 0xB2,  // ........
            /* 0038 */  0x00, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0x04, 0xFF,  // ........
            /* 0040 */  0xFF, 0xFF, 0xFF                                 // ...
        })
        Name (LCAP, Buffer (0x0C)
        {
            /* 0000 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
            /* 0008 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
        })
        Name (SSYS, Buffer (0x0C)
        {
            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0008 */  0x00, 0x00, 0x00, 0x00                           // ....
        })
        Name (LCTL, Buffer (0x06)
        {
             0x00, 0x00, 0x00, 0x00, 0x00, 0x00               // ......
        })
        Name (ONOF, Buffer (0x03)
        {
             0x01, 0x01, 0x01                                 // ...
        })
        Method (PGON, 1, Serialized)
        {
            PEGI = Arg0
            PEBA = \XBAS
            PDEV = GDEV (PEGI)
            PFUN = GFUN (PEGI)
            If ((CCHK (PEGI, One) == Zero))
            {
                Return (Zero)
            }

            WEPF (PEGI, One)
            GPPR (PEGI, One)
            If ((PCSL >= 0x04))
            {
                If ((RC7A == One))
                {
                    C7AD (Zero)
                }
            }

            RSPG (PEGI)
            CLPG ()
            AFES (Zero)
            If ((PBGE != Zero))
            {
                If (SBDL (PEGI))
                {
                    PUAB (PEGI)
                    CBDL = GUBC (PEGI)
                    MBDL = GMXB (PEGI)
                    If ((CBDL > MBDL))
                    {
                        CBDL = MBDL /* \_SB_.PCI0.MBDL */
                    }

                    PDUB (PEGI, CBDL)
                }
            }

            LNKD (Zero)
            TREN (One)
            TCNT = Zero
            While ((TCNT < LDLY))
            {
                If ((VCNP () == Zero))
                {
                    Break
                }

                Sleep (0x10)
                TCNT += 0x10
            }

            RSEP (PEGI)
            Return (Zero)
        }

        Method (PGOF, 1, Serialized)
        {
            PEGI = Arg0
            PEBA = \XBAS
            PDEV = GDEV (PEGI)
            PFUN = GFUN (PEGI)
            If ((CCHK (PEGI, Zero) == Zero))
            {
                Return (Zero)
            }

            WEPF (PEGI, Zero)
            SVEP (PEGI)
            SVPG (PEGI)
            LNKD (One)
            TCNT = Zero
            While ((TCNT < LDLY))
            {
                If ((LNKS () == Zero))
                {
                    Break
                }

                Sleep (0x10)
                TCNT += 0x10
            }

            AFES (0x02)
            If ((PBGE != Zero))
            {
                If (SBDL (PEGI))
                {
                    MBDL = GMXB (PEGI)
                    PDUB (PEGI, MBDL)
                }
            }

            If ((PCSL >= 0x04))
            {
                If ((RC7A == One))
                {
                    C7AD (One)
                }
            }

            GPPR (PEGI, Zero)
            Return (Zero)
        }

        Method (OTSV, 0, Serialized)
        {
            If ((OTSD == Zero))
            {
                TIDX = Zero
                While ((TIDX < MXPG))
                {
                    PEBA = \XBAS
                    PDEV = GDEV (TIDX)
                    PFUN = GFUN (TIDX)
                    Local7 = MMRW (PEBA, PBUS, PDEV, PFUN, VIOF)
                    If ((Local7 != IVID))
                    {
                        SVEP (TIDX)
                        SVPG (TIDX)
                    }

                    TIDX++
                }

                OTSD = One
            }

            Return (Zero)
        }

        Method (MMRB, 5, NotSerialized)
        {
            Local7 = Arg0
            Local7 |= (Arg1 << 0x14)
            Local7 |= (Arg2 << 0x0F)
            Local7 |= (Arg3 << 0x0C)
            Local7 |= Arg4
            OperationRegion (PCI0, SystemMemory, Local7, One)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                TEMP,   8
            }

            Return (TEMP) /* \_SB_.PCI0.MMRB.TEMP */
        }

        Method (MMWB, 6, NotSerialized)
        {
            Local7 = Arg0
            Local7 |= (Arg1 << 0x14)
            Local7 |= (Arg2 << 0x0F)
            Local7 |= (Arg3 << 0x0C)
            Local7 |= Arg4
            OperationRegion (PCI0, SystemMemory, Local7, One)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                TEMP,   8
            }

            TEMP = Arg5
        }

        Method (MMRW, 5, NotSerialized)
        {
            Local7 = Arg0
            Local7 |= (Arg1 << 0x14)
            Local7 |= (Arg2 << 0x0F)
            Local7 |= (Arg3 << 0x0C)
            Local7 |= Arg4
            OperationRegion (PCI0, SystemMemory, Local7, 0x02)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                TEMP,   16
            }

            Return (TEMP) /* \_SB_.PCI0.MMRW.TEMP */
        }

        Method (MMWW, 6, NotSerialized)
        {
            Local7 = Arg0
            Local7 |= (Arg1 << 0x14)
            Local7 |= (Arg2 << 0x0F)
            Local7 |= (Arg3 << 0x0C)
            Local7 |= Arg4
            OperationRegion (PCI0, SystemMemory, Local7, 0x02)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                TEMP,   16
            }

            TEMP = Arg5
        }

        Method (MMRD, 5, NotSerialized)
        {
            Local7 = Arg0
            Local7 |= (Arg1 << 0x14)
            Local7 |= (Arg2 << 0x0F)
            Local7 |= (Arg3 << 0x0C)
            Local7 |= Arg4
            OperationRegion (PCI0, SystemMemory, Local7, 0x04)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                TEMP,   32
            }

            Return (TEMP) /* \_SB_.PCI0.MMRD.TEMP */
        }

        Method (MMWD, 6, NotSerialized)
        {
            Local7 = Arg0
            Local7 |= (Arg1 << 0x14)
            Local7 |= (Arg2 << 0x0F)
            Local7 |= (Arg3 << 0x0C)
            Local7 |= Arg4
            OperationRegion (PCI0, SystemMemory, Local7, 0x04)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                TEMP,   32
            }

            TEMP = Arg5
        }

        Method (SCAP, 5, NotSerialized)
        {
            Local7 = MMRW (Arg0, Arg1, Arg2, Arg3, VIOF)
            If ((Local7 == IVID))
            {
                Return (Zero)
            }

            TMP0 = MMRW (Arg0, Arg1, Arg2, Arg3, DSOF)
            If (((TMP0 & 0x10) == Zero))
            {
                Return (Zero)
            }

            TMP2 = MMRB (Arg0, Arg1, Arg2, Arg3, CPOF)
            While (One)
            {
                TMP2 &= 0xFC
                If ((TMP2 == Zero))
                {
                    Return (Zero)
                }

                TMP1 = MMRB (Arg0, Arg1, Arg2, Arg3, TMP2)
                If ((Arg4 == TMP1))
                {
                    Return (TMP2) /* \_SB_.PCI0.TMP2 */
                }

                TMP2 = MMRB (Arg0, Arg1, Arg2, Arg3, (TMP2 + One))
            }
        }

        Method (SLCA, 1, NotSerialized)
        {
            INDX = Zero
            PLEN = 0x04
            INDX += (Arg0 * PLEN)
            Local7 = MMRB (PEBA, PBUS, PDEV, PFUN, SBOF)
            POFF = SCAP (PEBA, Local7, EDEV, EFN0, 0x10)
            POFF += 0x0C
            While ((PLEN > Zero))
            {
                Local7 = MMRB (PEBA, PBUS, PDEV, PFUN, SBOF)
                LCAP [INDX] = MMRB (PEBA, Local7, EDEV, EFN0, POFF)
                INDX++
                POFF++
                PLEN--
            }
        }

        Method (RLCA, 1, NotSerialized)
        {
            Local7 = Zero
            PLEN = 0x04
            INDX = (PLEN - One)
            INDX += (Arg0 * PLEN)
            While ((PLEN > Zero))
            {
                Local7 <<= 0x08
                Local0 = DerefOf (LCAP [INDX])
                Local7 |= Local0
                INDX--
                PLEN--
            }

            Return (Local7)
        }

        Method (GULC, 1, NotSerialized)
        {
            Local7 = MMRD (PEBA, PBUS, PDEV, PFUN, 0xAC)
            Local7 >>= 0x04
            Local7 &= 0x3F
            Local6 = Arg0
            Local6 >>= 0x04
            Local6 &= 0x3F
            If ((Local7 > Local6))
            {
                Local0 = (Local7 - Local6)
            }
            Else
            {
                Local0 = Zero
            }

            Return (Local0)
        }

        Method (GMXB, 1, NotSerialized)
        {
            HSTR = MMRD (PEBA, PBUS, PDEV, PFUN, 0x0504)
            HSTR >>= 0x10
            HSTR &= 0x03
            If ((Arg0 == Zero))
            {
                If ((HSTR == 0x03))
                {
                    Local0 = 0x08
                }
                Else
                {
                    Local0 = 0x04
                }
            }
            ElseIf ((Arg0 == One))
            {
                If ((HSTR == 0x02))
                {
                    Local0 = 0x04
                }
                ElseIf ((HSTR == Zero))
                {
                    Local0 = 0x02
                }
            }
            ElseIf ((Arg0 == 0x02))
            {
                If ((HSTR == Zero))
                {
                    Local0 = 0x02
                }
            }

            Return (Local0)
        }

        Method (PUAB, 1, NotSerialized)
        {
            FBDL = Zero
            CBDL = Zero
            HSTR = MMRD (PEBA, PBUS, PDEV, PFUN, 0x0504)
            HSTR >>= 0x10
            HSTR &= 0x03
            LREV = MMRD (PEBA, PBUS, PDEV, PFUN, 0x0D0C)
            LREV >>= 0x14
            LREV &= One
            If ((Arg0 == Zero))
            {
                If ((HSTR == 0x03))
                {
                    FBDL = Zero
                    CBDL = 0x08
                }
                ElseIf ((LREV == Zero))
                {
                    FBDL = Zero
                    CBDL = 0x04
                }
                Else
                {
                    FBDL = 0x04
                    CBDL = 0x04
                }
            }
            ElseIf ((Arg0 == One))
            {
                If ((HSTR == 0x02))
                {
                    If ((LREV == Zero))
                    {
                        FBDL = 0x04
                        CBDL = 0x04
                    }
                    Else
                    {
                        FBDL = Zero
                        CBDL = 0x04
                    }
                }
                ElseIf ((HSTR == Zero))
                {
                    If ((LREV == Zero))
                    {
                        FBDL = 0x04
                        CBDL = 0x02
                    }
                    Else
                    {
                        FBDL = 0x02
                        CBDL = 0x02
                    }
                }
            }
            ElseIf ((Arg0 == 0x02))
            {
                If ((HSTR == Zero))
                {
                    If ((LREV == Zero))
                    {
                        FBDL = 0x06
                        CBDL = 0x02
                    }
                    Else
                    {
                        FBDL = Zero
                        CBDL = 0x02
                    }
                }
            }

            INDX = One
            If ((CBDL != Zero))
            {
                While ((INDX <= CBDL))
                {
                    BSPR (FBDL, Zero)
                    FBDL++
                    INDX++
                }
            }
        }

        Method (PDUB, 2, NotSerialized)
        {
            FBDL = Zero
            CBDL = Arg1
            If ((CBDL == Zero))
            {
                Return (Zero)
            }

            HSTR = MMRD (PEBA, PBUS, PDEV, PFUN, 0x0504)
            HSTR >>= 0x10
            HSTR &= 0x03
            LREV = MMRD (PEBA, PBUS, PDEV, PFUN, 0x0D0C)
            LREV >>= 0x14
            LREV &= One
            If ((Arg0 == Zero))
            {
                If ((HSTR == 0x03))
                {
                    If ((LREV == Zero))
                    {
                        FBDL = (0x08 - CBDL) /* \_SB_.PCI0.CBDL */
                    }
                    Else
                    {
                        FBDL = Zero
                    }
                }
                ElseIf ((LREV == Zero))
                {
                    FBDL = (0x04 - CBDL) /* \_SB_.PCI0.CBDL */
                }
                Else
                {
                    FBDL = 0x04
                }
            }
            ElseIf ((Arg0 == One))
            {
                If ((HSTR == 0x02))
                {
                    If ((LREV == Zero))
                    {
                        FBDL = (0x08 - CBDL) /* \_SB_.PCI0.CBDL */
                    }
                    Else
                    {
                        FBDL = Zero
                    }
                }
                ElseIf ((HSTR == Zero))
                {
                    If ((LREV == Zero))
                    {
                        FBDL = (0x06 - CBDL) /* \_SB_.PCI0.CBDL */
                    }
                    Else
                    {
                        FBDL = 0x02
                    }
                }
            }
            ElseIf ((Arg0 == 0x02))
            {
                If ((HSTR == Zero))
                {
                    If ((LREV == Zero))
                    {
                        FBDL = (0x08 - CBDL) /* \_SB_.PCI0.CBDL */
                    }
                    Else
                    {
                        FBDL = Zero
                    }
                }
            }

            INDX = One
            While ((INDX <= CBDL))
            {
                BSPR (FBDL, One)
                FBDL++
                INDX++
            }
        }

        Method (SBDL, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                If ((P0UB == Zero))
                {
                    Return (Zero)
                }
            }
            ElseIf ((Arg0 == One))
            {
                If ((P1UB == Zero))
                {
                    Return (Zero)
                }
            }
            ElseIf ((Arg0 == 0x02))
            {
                If ((P2UB == Zero))
                {
                    Return (Zero)
                }
            }
            Else
            {
                Return (Zero)
            }

            Return (One)
        }

        Method (BSPR, 2, NotSerialized)
        {
            Local7 = MMRW (PEBA, PBUS, GDEV (Zero), GFUN (Zero), VIOF)
            If ((Local7 == IVID))
            {
                Return (Zero)
            }

            Local7 = PEBA /* \_SB_.PCI0.PEBA */
            Local7 |= (PBUS << 0x14)
            Local7 |= (GDEV (Zero) << 0x0F)
            Local7 |= (GFUN (Zero) << 0x0C)
            Local7 |= 0x091C
            Local7 += (Arg0 * 0x20)
            OperationRegion (PCI0, SystemMemory, Local7, 0x04)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                    ,   31, 
                TEMP,   1
            }

            TEMP = Arg1
        }

        Method (GUBC, 1, NotSerialized)
        {
            Local7 = Zero
            Local6 = RLCA (Arg0)
            If ((Arg0 == Zero))
            {
                If ((P0UB == 0xFF))
                {
                    Local5 = GULC (Local6)
                    Local7 = (Local5 / 0x02)
                }
                ElseIf ((P0UB != Zero))
                {
                    Local7 = P0UB /* \P0UB */
                }
            }
            ElseIf ((Arg0 == One))
            {
                If ((P1UB == 0xFF))
                {
                    Local5 = GULC (Local6)
                    Local7 = (Local5 / 0x02)
                }
                ElseIf ((P1UB != Zero))
                {
                    Local7 = P1UB /* \P1UB */
                }
            }
            ElseIf ((Arg0 == 0x02))
            {
                If ((P2UB == 0xFF))
                {
                    Local5 = GULC (Local6)
                    Local7 = (Local5 / 0x02)
                }
                ElseIf ((P2UB != Zero))
                {
                    Local7 = P2UB /* \P2UB */
                }
            }

            Return (Local7)
        }

        Method (AFES, 1, NotSerialized)
        {
            Local7 = PEBA /* \_SB_.PCI0.PEBA */
            Local7 |= (PBUS << 0x14)
            Local7 |= (PDEV << 0x0F)
            Local7 |= (PFUN << 0x0C)
            Local7 |= 0x0C20
            OperationRegion (PCI0, SystemMemory, Local7, 0x04)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                    ,   4, 
                TEMP,   2
            }

            TEMP = Arg0
        }

        Method (LNKD, 1, NotSerialized)
        {
            Local7 = PEBA /* \_SB_.PCI0.PEBA */
            Local7 |= (PBUS << 0x14)
            Local7 |= (PDEV << 0x0F)
            Local7 |= (PFUN << 0x0C)
            Local7 |= 0xB0
            OperationRegion (PCI0, SystemMemory, Local7, 0x04)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                    ,   4, 
                TEMP,   1
            }

            TEMP = Arg0
        }

        Method (LNKS, 0, NotSerialized)
        {
            Local7 = PEBA /* \_SB_.PCI0.PEBA */
            Local7 |= (PBUS << 0x14)
            Local7 |= (PDEV << 0x0F)
            Local7 |= (PFUN << 0x0C)
            Local7 |= 0x0214
            OperationRegion (PCI0, SystemMemory, Local7, 0x04)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                Offset (0x02), 
                TEMP,   4
            }

            Return (TEMP) /* \_SB_.PCI0.LNKS.TEMP */
        }

        Method (VCNP, 0, NotSerialized)
        {
            Local7 = PEBA /* \_SB_.PCI0.PEBA */
            Local7 |= (PBUS << 0x14)
            Local7 |= (PDEV << 0x0F)
            Local7 |= (PFUN << 0x0C)
            Local7 |= 0x011A
            OperationRegion (PCI0, SystemMemory, Local7, 0x02)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                    ,   1, 
                TEMP,   1
            }

            Return (TEMP) /* \_SB_.PCI0.VCNP.TEMP */
        }

        Method (TREN, 1, NotSerialized)
        {
            Local7 = PEBA /* \_SB_.PCI0.PEBA */
            Local7 |= (PBUS << 0x14)
            Local7 |= (PDEV << 0x0F)
            Local7 |= (PFUN << 0x0C)
            Local7 |= 0x0508
            OperationRegion (PCI0, SystemMemory, Local7, 0x04)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                TEMP,   1
            }

            TEMP = Arg0
        }

        Method (MCHA, 0, NotSerialized)
        {
            Local7 = PEBA /* \_SB_.PCI0.PEBA */
            Local7 |= (HBRB << 0x14)
            Local7 |= (HBRD << 0x0F)
            Local7 |= (HBRF << 0x0C)
            Local7 |= 0x48
            OperationRegion (PCI0, SystemMemory, Local7, 0x08)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                    ,   15, 
                TEMP,   24
            }

            Return (TEMP) /* \_SB_.PCI0.MCHA.TEMP */
        }

        Method (C7AD, 1, NotSerialized)
        {
            Local7 = MCHA ()
            Local7 <<= 0x0F
            Local7 += 0x5DA8
            OperationRegion (PCI0, SystemMemory, Local7, 0x04)
            Field (PCI0, ByteAcc, NoLock, Preserve)
            {
                    ,   2, 
                TEMP,   1
            }

            TEMP = Arg0
        }

        Method (GDEV, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Local0 = One
            }
            ElseIf ((Arg0 == One))
            {
                Local0 = One
            }

            If ((Arg0 == 0x02))
            {
                Local0 = One
            }

            Return (Local0)
        }

        Method (GFUN, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Local0 = Zero
            }
            ElseIf ((Arg0 == One))
            {
                Local0 = One
            }

            If ((Arg0 == 0x02))
            {
                Local0 = 0x02
            }

            Return (Local0)
        }

        Method (CCHK, 2, NotSerialized)
        {
            Local7 = MMRW (PEBA, PBUS, PDEV, PFUN, VIOF)
            If ((Local7 == IVID))
            {
                Return (Zero)
            }

            If ((Arg0 != Zero))
            {
                Local7 = MMRW (PEBA, PBUS, GDEV (Zero), GFUN (Zero), VIOF)
                If ((Local7 == IVID))
                {
                    Return (Zero)
                }
            }

            If ((Arg1 == Zero))
            {
                If ((REPF (Arg0) == Zero))
                {
                    Return (Zero)
                }
            }
            ElseIf ((Arg1 == One))
            {
                If ((REPF (Arg0) == One))
                {
                    Return (Zero)
                }
            }

            Return (One)
        }

        Method (SSUB, 1, NotSerialized)
        {
            INDX = Zero
            PLEN = 0x04
            INDX += (Arg0 * PLEN)
            POFF = 0x2C
            While ((PLEN > Zero))
            {
                Local7 = MMRB (PEBA, PBUS, PDEV, PFUN, SBOF)
                SSYS [INDX] = MMRB (PEBA, Local7, EDEV, EFN0, POFF)
                INDX++
                POFF++
                PLEN--
            }
        }

        Method (RSUB, 1, NotSerialized)
        {
            INDX = Zero
            PLEN = 0x04
            INDX += (Arg0 * PLEN)
            POFF = 0x2C
            While ((PLEN > Zero))
            {
                Local7 = MMRB (PEBA, PBUS, PDEV, PFUN, SBOF)
                MMWB (PEBA, Local7, EDEV, EFN0, POFF, DerefOf (SSYS [INDX]))
                INDX++
                POFF++
                PLEN--
            }
        }

        Method (SLCT, 1, NotSerialized)
        {
            INDX = Zero
            PLEN = 0x02
            INDX += (Arg0 * PLEN)
            Local7 = MMRB (PEBA, PBUS, PDEV, PFUN, SBOF)
            POFF = SCAP (PEBA, Local7, EDEV, EFN0, 0x10)
            POFF += 0x10
            While ((PLEN > Zero))
            {
                Local7 = MMRB (PEBA, PBUS, PDEV, PFUN, SBOF)
                LCTL [INDX] = MMRB (PEBA, Local7, EDEV, EFN0, POFF)
                INDX++
                POFF++
                PLEN--
            }
        }

        Method (RLCT, 1, NotSerialized)
        {
            INDX = Zero
            PLEN = 0x02
            INDX += (Arg0 * PLEN)
            Local7 = MMRB (PEBA, PBUS, PDEV, PFUN, SBOF)
            POFF = SCAP (PEBA, Local7, EDEV, EFN0, 0x10)
            POFF += 0x10
            Local7 = MMRB (PEBA, PBUS, PDEV, PFUN, SBOF)
            Local0 = MMRW (PEBA, Local7, EDEV, EFN0, POFF)
            Local0 &= 0xFFBC
            Local1 = DerefOf (LCTL [INDX])
            Local2 = DerefOf (LCTL [(INDX + One)])
            Local2 <<= 0x08
            Local1 |= Local2
            Local1 &= 0x43
            Local0 |= Local1
            Local7 = MMRB (PEBA, PBUS, PDEV, PFUN, SBOF)
            MMWW (PEBA, Local7, EDEV, EFN0, POFF, Local0)
            Local7 = MMRB (PEBA, PBUS, PDEV, PFUN, SBOF)
            Local6 = MMRW (PEBA, Local7, EDEV, EFN1, VIOF)
            If ((Local6 != IVID))
            {
                Local7 = MMRB (PEBA, PBUS, PDEV, PFUN, SBOF)
                Local0 = MMRW (PEBA, Local7, EDEV, EFN1, POFF)
                Local0 &= 0xFFBC
                Local1 = DerefOf (LCTL [INDX])
                Local2 = DerefOf (LCTL [(INDX + One)])
                Local2 <<= 0x08
                Local1 |= Local2
                Local1 &= 0x43
                Local0 |= Local1
                Local7 = MMRB (PEBA, PBUS, PDEV, PFUN, SBOF)
                MMWW (PEBA, Local7, EDEV, EFN1, POFF, Local0)
            }
        }

        Method (SVPG, 1, NotSerialized)
        {
            SCPG ()
            If ((Arg0 == Zero))
            {
                SPG0 ()
            }
            ElseIf ((Arg0 == One))
            {
                SPG1 ()
            }
            ElseIf ((Arg0 == 0x02))
            {
                SPG2 ()
            }

            SPGA |= (One << Arg0)
        }

        Method (RSPG, 1, NotSerialized)
        {
            Local0 = (SPGA & (One << Arg0))
            If ((Local0 == Zero))
            {
                Return (Zero)
            }

            RCPG ()
            If ((Arg0 == Zero))
            {
                RPG0 ()
            }
            ElseIf ((Arg0 == One))
            {
                RPG1 ()
            }
            ElseIf ((Arg0 == 0x02))
            {
                RPG2 ()
            }
        }

        Method (CLPG, 0, NotSerialized)
        {
            INDX = Zero
            While (One)
            {
                WLSB = DerefOf (DCLR [INDX])
                INDX++
                WMSB = DerefOf (DCLR [INDX])
                POFF = ((WMSB << 0x08) | WLSB) /* \_SB_.PCI0.WLSB */
                INDX++
                PLEN = DerefOf (DCLR [INDX])
                INDX++
                If ((POFF == 0xFFFF))
                {
                    Break
                }

                While ((PLEN > Zero))
                {
                    MMWB (PEBA, PBUS, PDEV, PFUN, POFF, DerefOf (DCLR [INDX]))
                    INDX++
                    POFF++
                    PLEN--
                }
            }
        }

        Method (SCPG, 0, NotSerialized)
        {
            Local7 = MMRW (PEBA, PBUS, GDEV (Zero), GFUN (Zero), VIOF)
            If ((Local7 == IVID))
            {
                Return (Zero)
            }

            INDX = Zero
            While (One)
            {
                WLSB = DerefOf (DCMN [INDX])
                INDX++
                WMSB = DerefOf (DCMN [INDX])
                POFF = ((WMSB << 0x08) | WLSB) /* \_SB_.PCI0.WLSB */
                INDX++
                PLEN = DerefOf (DCMN [INDX])
                INDX++
                If ((POFF == 0xFFFF))
                {
                    Break
                }

                While ((PLEN > Zero))
                {
                    DCMN [INDX] = MMRB (PEBA, PBUS, GDEV (Zero), GFUN (Zero), 
                        POFF)
                    INDX++
                    POFF++
                    PLEN--
                }
            }
        }

        Method (RCPG, 0, NotSerialized)
        {
            Local7 = MMRW (PEBA, PBUS, GDEV (Zero), GFUN (Zero), VIOF)
            If ((Local7 == IVID))
            {
                Return (Zero)
            }

            INDX = Zero
            While (One)
            {
                WLSB = DerefOf (DCMN [INDX])
                INDX++
                WMSB = DerefOf (DCMN [INDX])
                POFF = ((WMSB << 0x08) | WLSB) /* \_SB_.PCI0.WLSB */
                INDX++
                PLEN = DerefOf (DCMN [INDX])
                INDX++
                If ((POFF == 0xFFFF))
                {
                    Break
                }

                While ((PLEN > Zero))
                {
                    MMWB (PEBA, PBUS, GDEV (Zero), GFUN (Zero), POFF, DerefOf (DCMN [INDX]
                        ))
                    INDX++
                    POFF++
                    PLEN--
                }
            }
        }

        Method (SPG0, 0, NotSerialized)
        {
            INDX = Zero
            While (One)
            {
                WLSB = DerefOf (DPG0 [INDX])
                INDX++
                WMSB = DerefOf (DPG0 [INDX])
                POFF = ((WMSB << 0x08) | WLSB) /* \_SB_.PCI0.WLSB */
                INDX++
                PLEN = DerefOf (DPG0 [INDX])
                INDX++
                If ((POFF == 0xFFFF))
                {
                    Break
                }

                While ((PLEN > Zero))
                {
                    DPG0 [INDX] = MMRB (PEBA, PBUS, PDEV, PFUN, POFF)
                    INDX++
                    POFF++
                    PLEN--
                }
            }
        }

        Method (RPG0, 0, NotSerialized)
        {
            INDX = Zero
            While (One)
            {
                WLSB = DerefOf (DPG0 [INDX])
                INDX++
                WMSB = DerefOf (DPG0 [INDX])
                POFF = ((WMSB << 0x08) | WLSB) /* \_SB_.PCI0.WLSB */
                INDX++
                PLEN = DerefOf (DPG0 [INDX])
                INDX++
                If ((POFF == 0xFFFF))
                {
                    Break
                }

                While ((PLEN > Zero))
                {
                    MMWB (PEBA, PBUS, PDEV, PFUN, POFF, DerefOf (DPG0 [INDX]))
                    INDX++
                    POFF++
                    PLEN--
                }
            }
        }

        Method (SPG1, 0, NotSerialized)
        {
            INDX = Zero
            While (One)
            {
                WLSB = DerefOf (DPG1 [INDX])
                INDX++
                WMSB = DerefOf (DPG1 [INDX])
                POFF = ((WMSB << 0x08) | WLSB) /* \_SB_.PCI0.WLSB */
                INDX++
                PLEN = DerefOf (DPG1 [INDX])
                INDX++
                If ((POFF == 0xFFFF))
                {
                    Break
                }

                While ((PLEN > Zero))
                {
                    DPG1 [INDX] = MMRB (PEBA, PBUS, PDEV, PFUN, POFF)
                    INDX++
                    POFF++
                    PLEN--
                }
            }
        }

        Method (RPG1, 0, NotSerialized)
        {
            INDX = Zero
            While (One)
            {
                WLSB = DerefOf (DPG1 [INDX])
                INDX++
                WMSB = DerefOf (DPG1 [INDX])
                POFF = ((WMSB << 0x08) | WLSB) /* \_SB_.PCI0.WLSB */
                INDX++
                PLEN = DerefOf (DPG1 [INDX])
                INDX++
                If ((POFF == 0xFFFF))
                {
                    Break
                }

                While ((PLEN > Zero))
                {
                    MMWB (PEBA, PBUS, PDEV, PFUN, POFF, DerefOf (DPG1 [INDX]))
                    INDX++
                    POFF++
                    PLEN--
                }
            }
        }

        Method (SPG2, 0, NotSerialized)
        {
            INDX = Zero
            While (One)
            {
                WLSB = DerefOf (DPG2 [INDX])
                INDX++
                WMSB = DerefOf (DPG2 [INDX])
                POFF = ((WMSB << 0x08) | WLSB) /* \_SB_.PCI0.WLSB */
                INDX++
                PLEN = DerefOf (DPG2 [INDX])
                INDX++
                If ((POFF == 0xFFFF))
                {
                    Break
                }

                While ((PLEN > Zero))
                {
                    DPG2 [INDX] = MMRB (PEBA, PBUS, PDEV, PFUN, POFF)
                    INDX++
                    POFF++
                    PLEN--
                }
            }
        }

        Method (RPG2, 0, NotSerialized)
        {
            INDX = Zero
            While (One)
            {
                WLSB = DerefOf (DPG2 [INDX])
                INDX++
                WMSB = DerefOf (DPG2 [INDX])
                POFF = ((WMSB << 0x08) | WLSB) /* \_SB_.PCI0.WLSB */
                INDX++
                PLEN = DerefOf (DPG2 [INDX])
                INDX++
                If ((POFF == 0xFFFF))
                {
                    Break
                }

                While ((PLEN > Zero))
                {
                    MMWB (PEBA, PBUS, PDEV, PFUN, POFF, DerefOf (DPG2 [INDX]))
                    INDX++
                    POFF++
                    PLEN--
                }
            }
        }

        Method (SVEP, 1, NotSerialized)
        {
            SLCT (Arg0)
            SSUB (Arg0)
            SLCA (Arg0)
            SEPA |= (One << Arg0)
        }

        Method (RSEP, 1, NotSerialized)
        {
            Local0 = (SEPA & (One << Arg0))
            If ((Local0 == Zero))
            {
                Return (Zero)
            }

            RSUB (Arg0)
            RLCT (Arg0)
        }

        Method (NTFY, 2, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                Notify (\_SB.PCI0.PEG0, Arg1)
            }
            ElseIf ((Arg0 == One))
            {
                Notify (\_SB.PCI0.PEG1, Arg1)
            }
            ElseIf ((Arg0 == 0x02))
            {
                Notify (\_SB.PCI0.PEG2, Arg1)
            }
        }

        Method (GPPR, 2, NotSerialized)
        {
            If ((Arg1 == Zero))
            {
                If ((Arg0 == Zero)){}
            }
            ElseIf ((Arg1 == One))
            {
                If ((Arg0 == Zero)){}
            }
        }

        Method (WEPF, 2, NotSerialized)
        {
            INDX = Zero
            PLEN = One
            INDX += (Arg0 * PLEN)
            While ((PLEN > Zero))
            {
                ONOF [INDX] = Arg1
                INDX++
                PLEN--
            }
        }

        Method (REPF, 1, NotSerialized)
        {
            INDX = Zero
            PLEN = One
            INDX += (Arg0 * PLEN)
            While ((PLEN > Zero))
            {
                Local0 = DerefOf (ONOF [INDX])
                INDX++
                PLEN--
            }

            Return (Local0)
        }

        Method (EPON, 0, NotSerialized)
        {
            TIDX = Zero
            While ((TIDX < MXPG))
            {
                INDX = Zero
                PLEN = One
                INDX += (TIDX * PLEN)
                While ((PLEN > Zero))
                {
                    ONOF [INDX] = One
                    INDX++
                    PLEN--
                }

                TIDX++
            }
        }
    }
}
