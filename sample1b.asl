DefinitionBlock ("", "SSDT", 1, "VENDOR", "VENDORID", 0x00000003)
{
    External (_SB_.DI00.SBUS.MUX0.CH03, DeviceObj)
    External (_SB_.DI00.SBUS.MUX0.CH03.DPLL, DeviceObj)

    Scope (\_SB.DI00.SBUS.MUX0.CH03)
    {
        // Existing DPLL device
        Scope (DPLL)
        {
            Name (_STA, 0x00) // Disable
        }

        // DPLL device
        Device (DPL2)
        {
            // _HID: Hardware ID
            Name (_HID, "PRP0001")
            // _CRS: Current Resource Settings
            Name (_CRS, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0070, ControllerInitiated, 0x000186A0,
                                AddressingMode7Bit,
                                "\\_SB_.DI00.SBUS.MUX0.CH03",
                                0x00, ResourceConsumer, , Exclusive,)
            })
            // _DSD: Device-Specific Data
            Name (_DSD, Package ()
            {
                // Device Properties for _DSD
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () {
                        "compatible", "microchip,zl30732"
                    },
                    Package () {
                        "reg", 0x70
                    },
                    Package () {
                        "dpll-types", Package () { "eec", "pps" }
                    },
                },

                ToUUID ("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
                Package () {
                    Package () { "input-pins",  "IPNS" },
                    Package () { "output-pins", "OPNS" },
                }
            })
            Name (IPNS, Package () {
                ToUUID ("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
                Package () {
                    Package () { "pin@0", "IP00" }, // REF0 diff (P&N)
                    Package () { "pin@2", "IP02" }, // REF1 diff (P&N)
                    Package () { "pin@4", "IP04" }, // REF2P
                    Package () { "pin@5", "IP05" }, // REF2N
                    Package () { "pin@7", "IP07" }, // REF3N
                    Package () { "pin@8", "IP08" }, // REF4P
                }
            })
            Name (OPNS, Package () {
                ToUUID ("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
                Package () {
                    Package () { "pin@0",  "OP00" }, // OUT0 diff (P&N)
                    Package () { "pin@2",  "OP02" }, // OUT1 diff (P&N)
                    Package () { "pin@8",  "OP08" }, // OUT4P
                    Package () { "pin@9",  "OP09" }, // OUT4N
                    Package () { "pin@a",  "OP10" }, // OUT5P
                    Package () { "pin@e",  "OP14" }, // OUT7P
                }
            })
            Name (IP00, Package () {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 0 },
                    Package () { "label", "SyncE_RClk0" },
                    Package () { "supported-frequencies-hz",
                        Package () { 78125000 }
                    },
                }
            })
            Name (IP02, Package () {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 2 },
                    Package () { "label", "SyncE_RClk1" },
                    Package () { "supported-frequencies-hz",
                        Package () { 78125000 }
                    },
                }
            })
            Name (IP04, Package () {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 4 },
                    Package () { "label", "U.FL1" },
                    Package () { "esync-control", 1},
                    Package () { "supported-frequencies-hz",
                        Package () { 1, 10000000 }
                    },
                }
            })
            Name (IP05, Package () {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 5 },
                    Package () { "label", "U.FL2" },
                    Package () { "esync-control", 1},
                    Package () { "supported-frequencies-hz",
                        Package () { 1, 10000000 }
                    },
                }
            })
            Name (IP07, Package () {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 7 },
                    Package () { "label", "SDP0" },
                    Package () { "supported-frequencies-hz",
                        Package () { 1 }
                    },
                }
            })
            Name (IP08, Package () {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 8 },
                    Package () { "label", "TCX0" },
                    Package () { "supported-frequencies-hz",
                        Package () { 20000000 }
                    },
                }
            })
            Name (OP00, Package () {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 0 },
                    Package () { "label", "SyncE_Ref" },
                    Package () { "supported-frequencies-hz",
                        Package () { 1 }
                    },
                }
            })
            Name (OP02, Package () {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 2 },
                    Package () { "label", "Time_Ref" },
                    Package () { "supported-frequencies-hz",
                        Package () { 1 }
                    },
                }
            })
            Name (OP08, Package () {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 8 },
                    Package () { "label", "CONN1" },
                    Package () { "esync-control", 1},
                    Package () { "supported-frequencies-hz",
                        Package () { 1, 156250000 }
                    },
                }
            })
            Name (OP09, Package () {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 9 },
                    Package () { "label", "SDP1" },
                    Package () { "supported-frequencies-hz",
                        Package () { 1 }
                    },
                }
            })
            Name (OP10, Package () {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 10 },
                    Package () { "label", "CONN2" },
                    Package () { "esync-control", 1},
                    Package () { "supported-frequencies-hz",
                        Package () { 1, 156250000 }
                    },
                }
            })
            Name (OP14, Package () {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 14 },
                    Package () { "label", "TP7P" },
                    Package () { "supported-frequencies-hz",
                        Package () { 1 }
                    },
                }
            })
        }
    }
}