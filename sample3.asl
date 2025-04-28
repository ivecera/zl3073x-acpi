DefinitionBlock ("", "SSDT", 1, "VENDOR", "VENDORID", 0x00000003)
{
    External (_SB_.DI00.SBUS, DeviceObj)

    Scope (\_SB.DI00.SBUS)
    {
        // DPLL device
        Device (DPLL)
        {
            // _HID: Hardware ID
            Name (_HID, "PRP0001")
            // _CRS: Current Resource Settings
            Name (_CRS, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0070, ControllerInitiated, 0x000186A0,
                                AddressingMode7Bit,
                                "\\_SB_.DI00.SBUS",
                                0x00, ResourceConsumer, , Exclusive,)
            })
            // _DSD: Device-Specific Data
            Name (_DSD, Package ()
            {
                // Device Properties for _DSD
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () {
                        "compatible", "microchip,zl3073x-i2c"
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
                    Package () { "pin@0", "IP00" }, // REF0P
                    Package () { "pin@1", "IP01" }, // REF0N
                    Package () { "pin@2", "IP02" }, // REF1P
                    Package () { "pin@3", "IP03" }, // REF1N
                    Package () { "pin@5", "IP05" }, // REF2N
                    Package () { "pin@6", "IP06" }, // REF3P
                    Package () { "pin@8", "IP08" }, // REF4P
                    Package () { "pin@9", "IP09" }, // REF4N
                }
            })
            Name (OPNS, Package () {
                ToUUID ("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
                Package () {
                    Package () { "pin@0",  "OP00" }, // OUT0P
                    Package () { "pin@1",  "OP01" }, // OUT0N
                    Package () { "pin@2",  "OP02" }, // OUT1P
                    Package () { "pin@3",  "OP03" }, // OUT1N
                    Package () { "pin@4",  "OP04" }, // OUT2 (diff)
                    Package () { "pin@6",  "OP06" }, // OUT3 (diff)
                    Package () { "pin@8",  "OP08" }, // OUT4 (diff)
                    Package () { "pin@10", "OP10" }, // OUT5 (diff)
                    Package () { "pin@12", "OP12" }, // OUT6P
                    Package () { "pin@13", "OP13" }, // OUT6N
                    Package () { "pin@14", "OP14" }, // OUT7P
                    Package () { "pin@15", "OP15" }, // OUT7N
                    Package () { "pin@16", "OP16" }, // OUT8P
                    Package () { "pin@17", "OP17" }, // OUT8N
                    Package () { "pin@18", "OP18" }, // OUT9 (diff)
                }
            })
            Name (IP00, Package () { /* REF0P */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 0 },
                    Package () { "label", "SDP2-REF0P" },
                    Package () { "supported-frequencies",
                        Package () {
                            1000,
                        }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (IP01, Package () { /* REF0N */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 1 },
                    Package () { "label", "SDP0-REF0N" },
                    Package () { "supported-frequencies",
                        Package () {
                            1,
                        }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (IP02, Package () { /* REF1P */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 2 },
                    Package () { "label", "SYNCE0-REF1P" },
                    Package () { "supported-frequencies",
                        Package () {
                            78125000,
                        }
                    },
                    Package () { "type", "synce" },
                }
            })
            Name (IP03, Package () { /* REF1N */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 3 },
                    Package () { "label", "SYNCE0-REF1N" },
                    Package () { "supported-frequencies",
                        Package () {
                            78125000,
                        }
                    },
                    Package () { "type", "synce" },
                }
            })
            Name (IP05, Package () { /* REF2N */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 5 },
                    Package () { "label", "GNSS10M-REF2N" },
                    Package () { "supported-frequencies",
                        Package () {
                            10000000,
                        }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (IP06, Package () { /* REF3P */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 6 },
                    Package () { "label", "SMAIN-REF3P" },
                    Package () { "supported-frequencies",
                        Package () {
                            10000000,
                        }
                    },
                    Package () { "type", "ext" },
                }
            })
            Name (IP08, Package () { /* REF4P */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 8 },
                    Package () { "label", "GNSS1PPS-REF4P" },
                    Package () { "supported-frequencies",
                        Package () {
                            1,
                        }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (IP09, Package () { /* REF4N */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 9 },
                    Package () { "label", "OCXO-REF4N" },
                    Package () { "supported-frequencies",
                        Package () {
                            10000000,
                        }
                    },
                    Package () { "type", "int" },
                }
            })
            Name (OP00, Package () { /* OUT0P */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 0 },
                    Package () { "label", "OUT0P-RJ45" },
                    Package () { "supported-frequencies",
                        Package () {
                            10000000,
                        }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (OP01, Package () { /* OUT0N */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 1 },
                    Package () { "label", "OUT0N-RJ45" },
                    Package () { "supported-frequencies",
                        Package () {
                            10000000,
                        }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (OP02, Package () { /* OUT1P */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 2 },
                    Package () { "label", "OUT1P-SMA" },
                    Package () { "supported-frequencies",
                        Package () { 10000000 }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (OP03, Package () { /* OUT1N */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 3 },
                    Package () { "label", "OUT1N-R2A" },
                    Package () { "supported-frequencies",
                        Package () { 10000000 }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (OP04, Package () { /* OUT2 (diff) */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 4 },
                    Package () { "label", "OUT2PN-R1A" },
                    Package () { "esync-control", 1},
                    Package () { "supported-frequencies",
                        Package () { 10000000 }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (OP06, Package () { /* OUT3 (diff) */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 6 },
                    Package () { "label", "OUT3PN-SYNCEREF" },
                    Package () { "supported-frequencies",
                        Package () { 156250000 }
                    },
                    Package () { "type", "synce" },
                }
            })
            Name (OP08, Package () { /* OUT4 (diff) */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 8 },
                    Package () { "label", "OUT4PN-TIMEREF" },
                    Package () { "supported-frequencies",
                        Package () { 156250000 }
                    },
                    Package () { "type", "synce" },
                }
            })
            Name (OP10, Package () { /* OUT5 (diff) */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 10 },
                    Package () { "label", "OUT5PN-R1A" },
                    Package () { "esync-control", 1},
                    Package () { "supported-frequencies",
                        Package () { 10000000 }
                    },
                    Package () { "type", "synce" },
                }
            })
            Name (OP12, Package () { /* OUT6P */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 12 },
                    Package () { "label", "OUT6P-OCXO" },
                    Package () { "supported-frequencies",
                        Package () { 1 }
                    },
                    Package () { "type", "synce" },
                }
            })
            Name (OP14, Package () { /* OUT7P */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 14 },
                    Package () { "label", "OUT7P-R1A" },
                    Package () { "supported-frequencies",
                        Package () { 1 }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (OP15, Package () { /* OUT7N */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 15 },
                    Package () { "label", "OUT7N-R1A" },
                    Package () { "supported-frequencies",
                        Package () { 1 }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (OP16, Package () { /* OUT8P */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 16 },
                    Package () { "label", "OUT8P-SDP3" },
                    Package () { "supported-frequencies",
                        Package () {
                            1000,
                        }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (OP17, Package () { /* OUT8N */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 17 },
                    Package () { "label", "OUT8N-SDP1" },
                    Package () { "supported-frequencies",
                        Package () {
                            1,
                        }
                    },
                    Package () { "type", "gnss" },
                }
            })
            Name (OP18, Package () { /* OUT9 (diff) */
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "reg", 18 },
                    Package () { "label", "OUT9PN-XTAL" },
                    Package () { "supported-frequencies",
                        Package () { 25000000 }
                    },
                    Package () { "type", "gnss" },
                }
            })
        }
    }
}
