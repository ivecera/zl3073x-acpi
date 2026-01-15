/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20241212 (64-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt6.dat
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00001228 (4648)
 *     Revision         0x02
 *     Checksum         0xC7
 *     OEM ID           "REDHAT"
 *     OEM Table ID     "DPLLNIC "
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20241212 (539234834)
 */
DefinitionBlock ("", "SSDT", 2, "REDHAT", "DPLLNIC ", 0x00000001)
{
    External (_SB_, DeviceObj)
    External (_SB_.DI04, DeviceObj)
    External (_SB_.DI00.SBUS.MUX0.CH03.DPLL, DeviceObj)

    Scope (_SB.DI04)
    {
        Device (D040)
        {
            Name (_ADR, 0x00040000)  // _ADR: Address
            Device (D000)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_DSD, Package ()  // _DSD: Device-Specific Data
                {
                    ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */, 
                    Package ()
                    {
                        Package ()
                        {
                            "dpll-pin-names", 
                            Package ()
                            {
                                "rclk0", "rclk1", "clk_ref_synce", "time_ref",
                            }
                        }, 

                        Package ()
                        {
                            "dpll-pins", 
                            Package ()
                            {
			        /* input pin 0 */
                                \_SB_.DI00.SBUS.MUX0.CH03.DPLL, 0, 0,
				/* input pin 2 */
                                \_SB_.DI00.SBUS.MUX0.CH03.DPLL, 2, 0,
				/* output pin 0 */
                                \_SB_.DI00.SBUS.MUX0.CH03.DPLL, 0, 1,
				/* output pin 2 */
                                \_SB_.DI00.SBUS.MUX0.CH03.DPLL, 2, 1,
                            }
                        }
                    }
                })
            }

            Device (D001)
            {
                Name (_ADR, One)  // _ADR: Address
                Name (_DSD, Package ()  // _DSD: Device-Specific Data
                {
                    ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */, 
                    Package ()
                    {
                        Package ()
                        {
                            "dpll-pin-names", 
                            Package ()
                            {
                                "rclk0", "rclk1", "clk_ref_synce",
                            }
                        }, 

                        Package ()
                        {
                            "dpll-pins", 
                            Package ()
                            {
			        /* input pin 0 */
                                \_SB_.DI00.SBUS.MUX0.CH03.DPLL, 0, 0,
				/* input pin 2 */
                                \_SB_.DI00.SBUS.MUX0.CH03.DPLL, 2, 0,
				/* output pin 0 */
                                \_SB_.DI00.SBUS.MUX0.CH03.DPLL, 0, 1,
                            }
                        }
                    }
                })
            }
        }
    }
}

