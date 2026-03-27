#include "config.inc"
#include "defaults.inc"
#include "asl.inc"

#define DEV_FULL(DEV)           DEV##_DEV_FULL
#define DEV_FULL_STR(DEV)       STR(\DEV##_DEV_FULL)

#define SMBUS_DEV_FULL          SMBUS_PARENT.SMBUS_DEV
#define MUX_DEV_FULL            SMBUS_DEV_FULL.MUX_DEV
#define MUX_CHAN_DEV            CAT(CH0, MUX_CHAN_NUM)
#define MUX_CHAN_DEV_FULL       MUX_DEV_FULL.MUX_CHAN_DEV

#define REF0_SUBNODES           PIN_SUBNODES(REF0, 0, 1, IP00, IP01)
#define REF1_SUBNODES           PIN_SUBNODES(REF1, 2, 3, IP02, IP03)
#define REF2_SUBNODES           PIN_SUBNODES(REF2, 4, 5, IP04, IP05)
#define REF3_SUBNODES           PIN_SUBNODES(REF3, 6, 7, IP06, IP07)
#define REF4_SUBNODES           PIN_SUBNODES(REF4, 8, 9, IP08, IP09)

#define OUT0_SUBNODES           PIN_SUBNODES(OUT0,  0,  1, OP00, OP01)
#define OUT1_SUBNODES           PIN_SUBNODES(OUT1,  2,  3, OP02, OP03)
#define OUT2_SUBNODES           PIN_SUBNODES(OUT2,  4,  5, OP04, OP05)
#define OUT3_SUBNODES           PIN_SUBNODES(OUT3,  6,  7, OP06, OP07)
#define OUT4_SUBNODES           PIN_SUBNODES(OUT4,  8,  9, OP08, OP09)
#define OUT5_SUBNODES           PIN_SUBNODES(OUT5,  a,  b, OP10, OP11)
#define OUT6_SUBNODES           PIN_SUBNODES(OUT6,  c,  d, OP12, OP13)
#define OUT7_SUBNODES           PIN_SUBNODES(OUT7,  e,  f, OP14, OP15)
#define OUT8_SUBNODES           PIN_SUBNODES(OUT8, 10, 11, OP16, OP17)
#define OUT9_SUBNODES           PIN_SUBNODES(OUT9, 12, 13, OP18, OP19)

#define REF0_NODES              PIN_NODES(REF0, 0, 1, IP00, IP01)
#define REF1_NODES              PIN_NODES(REF1, 2, 3, IP02, IP03)
#define REF2_NODES              PIN_NODES(REF2, 4, 5, IP04, IP05)
#define REF3_NODES              PIN_NODES(REF3, 6, 7, IP06, IP07)
#define REF4_NODES              PIN_NODES(REF4, 8, 9, IP08, IP09)

#define OUT0_NODES              PIN_NODES(OUT0,  0,  1, OP00, OP01)
#define OUT1_NODES              PIN_NODES(OUT1,  2,  3, OP02, OP03)
#define OUT2_NODES              PIN_NODES(OUT2,  4,  5, OP04, OP05)
#define OUT3_NODES              PIN_NODES(OUT3,  6,  7, OP06, OP07)
#define OUT4_NODES              PIN_NODES(OUT4,  8,  9, OP08, OP09)
#define OUT5_NODES              PIN_NODES(OUT5,  a,  b, OP10, OP11)
#define OUT6_NODES              PIN_NODES(OUT6,  c,  d, OP12, OP13)
#define OUT7_NODES              PIN_NODES(OUT7,  e,  f, OP14, OP15)
#define OUT8_NODES              PIN_NODES(OUT8, 10, 11, OP16, OP17)
#define OUT9_NODES              PIN_NODES(OUT9, 12, 13, OP18, OP19)

DefinitionBlock ("", "SSDT", SSDT_REV, SSDT_OEM_ID, SSDT_OEM_TABLE, SSDT_OEM_REV)
{
    External (DEV_FULL(SMBUS), DeviceObj)

    /*
     * I2C Mux Device
     */
    Scope (DEV_FULL(SMBUS)) {
        Device (MUX_DEV) {
            Name (_HID, "PRP0001")
            Name (_CRS, ResourceTemplate () {
                I2cSerialBusV2 (MUX_ADDR, ControllerInitiated, 0x000186A0,
                                AddressingMode7Bit, DEV_FULL_STR(SMBUS), 0x00,
                                ResourceConsumer, , Exclusive,)
            })
            Name (_DSD, Package () {
                PROPS {
                    PROP("compatible", "nxp,pca9546"),
                    PROP("reg", MUX_ADDR),
                }
            })
            /*
             * I2C Mux Channel
             */
            Device (MUX_CHAN_DEV) {
                Name (_ADR, MUX_CHAN_NUM)
            }
        }
    }

    Scope (DEV_FULL(MUX_CHAN)) {
        Device (DPLL_DEV) {
            Name (_HID, "PRP0001")
            Name (_CRS, ResourceTemplate () {
                I2cSerialBusV2 (DPLL_ADDR, ControllerInitiated, 0x000186A0,
                                AddressingMode7Bit, DEV_FULL_STR(MUX_CHAN),
                                0x00, ResourceConsumer, , Exclusive,)
            })
            Name (_DSD, Package () {
                PROPS {
                    PROP("compatible", "microchip,zl30732")
                    PROP("reg", DPLL_ADDR)
                    PROP("dpll-types", LIST(DPLL_TYPES))
                },
                SUBNODES {
                    SUBNODE("input-pins", "IPNS")
                    SUBNODE("output-pins", "OPNS")
                }
            })
            Name (IPNS, Package () {
                SUBNODES {
                    REF0_SUBNODES
                    REF1_SUBNODES
                    REF2_SUBNODES
                    REF3_SUBNODES
                    REF4_SUBNODES
                }
            })
            Name (OPNS, Package () {
                SUBNODES {
                    OUT0_SUBNODES
                    OUT1_SUBNODES
                    OUT2_SUBNODES
                    OUT3_SUBNODES
                    OUT4_SUBNODES
                    OUT5_SUBNODES
                    OUT6_SUBNODES
                    OUT7_SUBNODES
                    OUT8_SUBNODES
                    OUT9_SUBNODES
                }
            })
            
            REF0_NODES
            REF1_NODES
            REF2_NODES
            REF3_NODES
            REF4_NODES

            OUT0_NODES
            OUT1_NODES
            OUT2_NODES
            OUT3_NODES
            OUT4_NODES
            OUT5_NODES
            OUT6_NODES
            OUT7_NODES
            OUT8_NODES
            OUT9_NODES
        }
    }
}
