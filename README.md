# Microchip M.2 module - GNR-D ACPI integration

ZL3073x driver for the Microchip Azurite DPLL chip family uses device properties to retrieved PIN specific attributes such as label, type, allowed frequencies and esync control capability.

In case of DT platform these attributes are passed through DTB (device tree blob) according DT schema. In case of ACPI platform the system BIOS/UEFI can provide these attributes through ACPI SSDT table.

This repository contains a build infrastructure for generating valid SSDT ASL file for GNR-D platform using Microchip M.2 timing module.

## How to use

### 0. Prerequisities

- C preprocessor (included in gcc or clang)
- iasl compiler (included in acpica-tools)

### 1. Compile ACPI ASL files to SSDT AML files
```
$ make
cc -E -x c -P -o gnr-d.asli gnr-d.asl
iasl gnr-d.asli

Intel ACPI Component Architecture
ASL+ Optimizing Compiler/Disassembler version 20241212
Copyright (c) 2000 - 2023 Intel Corporation

ASL Input:     gnr-d.asli -    9161 bytes     37 keywords      0 source lines
AML Output:    gnr-d.aml -    4043 bytes      0 opcodes      37 named objects

Compilation successful. 0 Errors, 0 Warnings, 0 Remarks, 35 Optimizations
rm gnr-d.asli
```

Resulting `gnr-d.aml` file can be used as ACPI SSDT table in the system

### 2. Testing on Linux
```
# mkdir /lib/acpi
# cp gnr-d.aml /lib/acpi/
# cat > /etc/dracut.conf.d/dpll.conf <<EOF
acpi_table_dir="/lib/acpi"
acpi_override="yes"
EOF
# dracut -f
# systemctl reboot
