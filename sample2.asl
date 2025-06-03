DefinitionBlock ("", "SSDT", 1, "VENDOR", "VENDORID", 0x00000003)
{
    External (_SB_.DI00.SBUS, DeviceObj)

    Scope (\_SB.DI00.SBUS)
    {
        Device (MUX0)
        {
            // _HID: Hardware ID
            Name (_HID, "PRP0001")
            // _CRS: Current Resource Settings
            Name (_CRS, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0074, ControllerInitiated, 0x000186A0,
                                AddressingMode7Bit, "\\_SB_.DI00.SBUS",
                                0x00, ResourceConsumer, , Exclusive,)
            })
            // _DSD: Device-Specific Data
            Name (_DSD, Package (0x02)
            {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                // Device Properties for _DSD
                Package ()
                {
                    Package (0x02) { "compatible", "nxp,pca9546" }
                }
            })
            Device (CH04)
            {
                // _ADR: Address
                Name (_ADR, 0x03)

                // DPLL device
                Device (DPLL)
                {
                    // _HID: Hardware ID
                    Name (_HID, "PRP0001")
                    // _CRS: Current Resource Settings
                    Name (_CRS, ResourceTemplate ()
                    {
                        I2cSerialBusV2 (0x0071, ControllerInitiated, 0x000186A0,
                                        AddressingMode7Bit,
                                        "\\_SB_.DI00.SBUS.MUX0.CH04",
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
                                "reg", 0x71
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
                            Package () { "pin@4", "IP04" }, // REF2P
                            Package () { "pin@5", "IP05" }, // REF2N
                            Package () { "pin@6", "IP06" }, // REF3P
                            Package () { "pin@7", "IP07" }, // REF3N
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
                            Package () { "pin@4",  "OP04" }, // OUT2P
                            Package () { "pin@5",  "OP05" }, // OUT2N
                            Package () { "pin@6",  "OP06" }, // OUT3 (diff)
                            Package () { "pin@8",  "OP08" }, // OUT4 (diff)
                            Package () { "pin@a",  "OP10" }, // OUT5 (diff)
                            Package () { "pin@c",  "OP12" }, // OUT6P
                            Package () { "pin@d",  "OP13" }, // OUT6N
                            Package () { "pin@e",  "OP14" }, // OUT7P
                            Package () { "pin@f",  "OP15" }, // OUT7N
                            Package () { "pin@10", "OP16" }, // OUT8P
                            Package () { "pin@11", "OP17" }, // OUT8N
                            Package () { "pin@12", "OP18" }, // OUT9 (diff)
                        }
                    })
                    Name (IP00, Package () { /* REF0P */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 0 },
                            Package () { "label", "1PPS_IN1" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000,
                                    62500000, 78125000, 100000000
                                }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (IP01, Package () { /* REF0N */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 1 },
                            Package () { "label", "1PPS_IN0" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000,
                                    62500000, 78125000, 100000000
                                }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (IP02, Package () { /* REF1P */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 2 },
                            Package () { "label", "RCLKA_IN" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000,
                                    62500000, 78125000, 100000000
                                }
                            },
                            Package () { "connection-type", "synce" },
                        }
                    })
                    Name (IP03, Package () { /* REF1N */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 3 },
                            Package () { "label", "RCLKB_IN" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000,
                                    62500000, 78125000, 100000000
                                }
                            },
                            Package () { "connection-type", "synce" },
                        }
                    })
                    Name (IP04, Package () { /* REF2P */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 4 },
                            Package () { "label", "REF2P" },
                            Package () { "connection-type", "ext" },
                        }
                    })
                    Name (IP05, Package () { /* REF2N */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 5 },
                            Package () { "label", "GNSS_10M_IN" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000,
                                    62500000, 78125000, 100000000
                                }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (IP06, Package () { /* REF3P */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 6 },
                            Package () { "label", "SMA1_IN" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000,
                                    62500000, 78125000, 100000000
                                }
                            },
                            Package () { "connection-type", "ext" },
                        }
                    })
                    Name (IP07, Package () { /* REF3N */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 7 },
                            Package () { "label", "SMA3_IN" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000,
                                    62500000, 78125000, 100000000
                                }
                            },
                            Package () { "connection-type", "ext" },
                        }
                    })
                    Name (IP08, Package () { /* REF4P */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 8 },
                            Package () { "label", "GNSS_1PPS_IN" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000,
                                    62500000, 78125000, 100000000
                                }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (IP09, Package () { /* REF4P */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 9 },
                            Package () { "label", "REF4N" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000,
                                    62500000, 78125000, 100000000
                                }
                            },
                            Package () { "connection-type", "int" },
                        }
                    })
                    Name (OP00, Package () { /* OUT0P */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 0 },
                            Package () { "label", "SMA0_OUT" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000
                                }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (OP01, Package () { /* OUT0N */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 1 },
                            Package () { "label", "1PPS_OUT4" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000
                                }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (OP02, Package () { /* OUT1P */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 2 },
                            Package () { "label", "OUT1P_U_FL" },
                            Package () { "supported-frequencies-hz",
                                Package () { 10000000 }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (OP03, Package () { /* OUT1N */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 3 },
                            Package () { "label", "AIC_SCLK" },
                            Package () { "supported-frequencies-hz",
                                Package () { 10000000 }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (OP04, Package () { /* OUT2P */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 4 },
                            Package () { "label", "AIC_SCLK2" },
                            Package () { "supported-frequencies-hz",
                                Package () { 10000000 }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (OP05, Package () { /* OUT2N */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 5 },
                            Package () { "label", "SMA2_OUT" },
                            Package () { "supported-frequencies-hz",
                                Package () { 10000000 }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (OP06, Package () { /* OUT3 (diff) */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 6 },
                            Package () { "label", "SYNC_CLK1" },
                            Package () { "supported-frequencies-hz",
                                Package () { 156250000 }
                            },
                            Package () { "connection-type", "synce" },
                        }
                    })
                    Name (OP08, Package () { /* OUT4 (diff) */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 8 },
                            Package () { "label", "SYNC_CLK0" },
                            Package () { "supported-frequencies-hz",
                                Package () { 156250000 }
                            },
                            Package () { "connection-type", "synce" },
                        }
                    })
                    Name (OP10, Package () { /* OUT5 (diff) */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 10 },
                            Package () { "label", "SYNC_CLK2" },
                            Package () { "supported-frequencies-hz",
                                Package () { 156250000 }
                            },
                            Package () { "connection-type", "synce" },
                        }
                    })
                    Name (OP12, Package () { /* OUT6P */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 12 },
                            Package () { "label", "1HZ_FREQ" },
                            Package () { "supported-frequencies-hz",
                                Package () { 1 }
                            },
                            Package () { "connection-type", "synce" },
                        }
                    })
                    Name (OP13, Package () { /* OUT6N */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 13 },
                            Package () { "label", "SYNC_CLK_GD" },
                            Package () { "connection-type", "int" },
                        }
                    })
                    Name (OP14, Package () { /* OUT7P */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 14 },
                            Package () { "label", "1PPS_OUT3" },
                            Package () { "supported-frequencies-hz",
                                Package () { 1 }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (OP15, Package () { /* OUT7N */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 15 },
                            Package () { "label", "1PPS_OUT2" },
                            Package () { "supported-frequencies-hz",
                                Package () { 1 }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (OP16, Package () { /* OUT8P */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 16 },
                            Package () { "label", "1PPS_OUT1" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000
                                }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (OP17, Package () { /* OUT8N */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 17 },
                            Package () { "label", "1PPS_OUT0" },
                            Package () { "esync-control", 1},
                            Package () { "supported-frequencies-hz",
                                Package () {
                                    1, 25, 100, 1000, 10000000, 25000000
                                }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                    Name (OP18, Package () { /* OUT9 (diff) */
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "reg", 18 },
                            Package () { "label", "SYNC_25M" },
                            Package () { "supported-frequencies-hz",
                                Package () { 25000000 }
                            },
                            Package () { "connection-type", "gnss" },
                        }
                    })
                }
            }
        }
    }
}
