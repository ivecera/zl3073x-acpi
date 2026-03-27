#define SSDT_REV                1               /* SSDT revision        */
#define SSDT_OEM_ID             "REDHAT"        /* SSDT OEM ID          */
#define SSDT_OEM_TABLE          "DPLLNIC "      /* SSDT OEM Table       */
#define SSDT_OEM_REV            1               /* SSDT OEM revision    */

#define SMBUS_PARENT            \_SB_.DI00      /* SMBUS parent reference       */
#define SMBUS_DEV               SBUS            /* SMBUS device node name       */

/*
 * I2C mux config
 */
#define MUX_DEV                 MUX0            /* I2C-mux device node name     */
#define MUX_ADDR                0x0074          /* I2C-mux address              */
#define MUX_CHAN_NUM            3               /* I2C-mux channel              */

/*
 * DPLL device config
 */
#define DPLL_DEV                DPLL            /* DPLL device node name        */
#define DPLL_ADDR               0x0071          /* DPLL device I2C address      */
#define DPLL_TYPES              "eec", "pps"    /* DPLL device types            */

/*
 * Input references
 */
#define REF0P_PRESENT           1                       /* Pin is present in ACPI                       */
#define REF0P_LABEL             "1PPS_IN1"              /* Pin board label                              */
#define REF0P_TYPE              "ext"                   /* Pin type (gnss, ext, synce, mux or int       */
//#define REF0P_ESYNC           1                       /* Pin supports esync control                   */
#define REF0P_REFSYNC           "^DPLL.IP00"            /* Pin ref-sync reference to SYNC pin           */
#define REF0P_FREQS             1, 25, 100, 1000        /* Pin supported frequencies                    */

#define REF0N_PRESENT           1
#define REF0N_LABEL             "1PPS_IN0"
#define REF0N_TYPE              "ext"
#define REF0N_FREQS             1, 25, 100, 1000

#define REF1P_PRESENT           1
#define REF1P_LABEL             "RCLKA_IN"
#define REF1P_TYPE              "synce"
#define REF1P_FREQS             62500000, 78125000, 100000000

#define REF1N_PRESENT           1
#define REF1N_LABEL             "RCLKB_IN"
#define REF1N_TYPE              "synce"
#define REF1N_FREQS             62500000, 78125000, 100000000

#define REF2N_PRESENT           1
#define REF2N_LABEL             "GNSS_10M_IN"
#define REF2N_TYPE              "gnss"
#define REF2N_REFSYNC           "^DPLL.IP08"
#define REF2N_FREQS             10000000

#define REF3P_PRESENT           1
#define REF3P_LABEL             "SMA1_IN"
#define REF3P_TYPE              "ext"
#define REF3P_ESYNC             1
#define REF3P_FREQS             1, 25, 100, 1000, 10000000, 25000000

#define REF3N_PRESENT           1
#define REF3N_LABEL             "SMA3_IN"
#define REF3N_TYPE              "ext"
#define REF3N_ESYNC             1
#define REF3N_REFSYNC           "^DPLL.IP06"
#define REF3N_FREQS             1, 25, 100, 1000, 10000000, 25000000

#define REF4P_PRESENT           1
#define REF4P_LABEL             "GNSS_1_PPS_IN"
#define REF4P_TYPE              "gnss"
#define REF4P_FREQS             1

#define REF4N_PRESENT           1
#define REF4N_LABEL             "OCXO"
#define REF4N_TYPE              "int"
#define REF4N_FREQS             10000000

/*
 * Output pin config
 */
#define OUT0P_PRESENT           1
#define OUT0P_LABEL             "SMA0_OUT"
#define OUT0P_TYPE              "ext"
#define OUT0P_FREQS             1, 25, 100, 1000, 10000000, 25000000

#define OUT0N_PRESENT           1
#define OUT0N_LABEL             "1PPS_OUT4"
#define OUT0N_TYPE              "ext"
#define OUT0N_FREQS             1

#define OUT1P_PRESENT           0
#define OUT1P_LABEL             "U_FL"
#define OUT1P_TYPE              "ext"

#define OUT1N_PRESENT           1
#define OUT1N_LABEL             "AIC_SCLK"
#define OUT1N_TYPE              "ext"
#define OUT1N_FREQS             10000000

#define OUT2P_PRESENT           1
#define OUT2P_LABEL             "AIC_SCLK2"
#define OUT2P_TYPE              "ext"
#define OUT2P_FREQS             10000000

#define OUT2N_PRESENT           1
#define OUT2N_PRESENT           1
#define OUT2N_LABEL             "SMA2_OUT"
#define OUT2N_TYPE              "ext"
#define OUT2N_ESYNC             1
#define OUT2N_FREQS             1, 25, 100, 1000, 10000000, 25000000

#define OUT3_PRESENT            1
#define OUT3_LABEL              "SYNC_CLK1"
#define OUT3_TYPE               "synce"
#define OUT3_FREQ               156250000

#define OUT4_PRESENT            1
#define OUT4_LABEL              "SYNC_CLK0"
#define OUT4_TYPE               "synce"
#define OUT4_FREQ               156250000

#define OUT5_PRESENT            1
#define OUT5_LABEL              "SYNC_CLK2"
#define OUT5_TYPE               "synce"
#define OUT5_FREQ               156250000

#define OUT6P_PRESENT           1
#define OUT6P_LABEL             "1Hz_FREQ"
#define OUT6P_TYPE              "synce"
#define OUT6P_FREQS             1

#define OUT7P_PRESENT           1
#define OUT7P_LABEL             "1PPS_OUT3"
#define OUT7P_TYPE              "ext"
#define OUT7P_FREQS             1

#define OUT7N_PRESENT           1
#define OUT7N_LABEL             "1PPS_OUT2"
#define OUT7N_TYPE              "ext"
#define OUT7N_FREQS             1

#define OUT8P_PRESENT           1
#define OUT8P_LABEL             "1PPS_OUT1"
#define OUT8P_TYPE              "ext"
#define OUT8P_ESYNC             1
#define OUT8P_FREQS             1, 25, 100, 1000, 10000000, 25000000

#define OUT8N_PRESENT           1
#define OUT8N_LABEL             "1PPS_OUT0"
#define OUT8N_TYPE              "ext"
#define OUT8N_ESYNC             1
#define OUT8N_FREQS             1, 25, 100, 1000, 10000000, 25000000

#define OUT9_PRESENT            1
#define OUT9_LABEL              "SYNC_25M"
#define OUT9_TYPE               "synce"
#define OUT9_FREQS              25000000
