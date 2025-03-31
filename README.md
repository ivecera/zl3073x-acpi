# Microchip ZL3073x - ACPI integration

ZL3073x driver for the Microchip Azurite DPLL chip family uses device properties to retrieved PIN specific attributes such as label, type, allowed frequencies and esync control capability.

In case of DT platform these attributes are passed through DTB (device tree blob) according DT schema. In case of ACPI platform the system BIOS/UEFI can provide these attributes through ACPI SSDT table.

This repository contains several examples for ACPI platforms that are known they are equipped with DPLL chip.

## How to use on the Linux

### 1. Compile ACPI ASL files to SSDT AML files
```
$ make
iasl sample1.asl

Intel ACPI Component Architecture
ASL+ Optimizing Compiler/Disassembler version 20241212
Copyright (c) 2000 - 2023 Intel Corporation

ASL Input:     sample1.asl -   10012 bytes     25 keywords      0 source lines
AML Output:    sample1.aml -    1953 bytes      0 opcodes      25 named objects

Compilation successful. 0 Errors, 0 Warnings, 0 Remarks, 21 Optimizations
iasl sample2.asl

Intel ACPI Component Architecture
ASL+ Optimizing Compiler/Disassembler version 20241212
Copyright (c) 2000 - 2023 Intel Corporation

ASL Input:     sample2.asl -   21603 bytes     39 keywords      0 source lines
AML Output:    sample2.aml -    4369 bytes      0 opcodes      39 named objects

Compilation successful. 0 Errors, 0 Warnings, 0 Remarks, 45 Optimizations
```

### 2. Select the appropriate AML file for your platform and create EFI variable with the content of this AML file
```
# ./efi-set-var.sh -f sample1.aml Dpll
1+0 records in
1+0 records out
1791 bytes (1.8 kB, 1.7 KiB) copied, 0.00918816 s, 195 kB/s
# efivar -l | grep Dpll
d577ebe7-ac8d-4c1b-a533-c88b57f16f2d-Dpll
```

### 3. Update bootloader to use the `Dpll` EFI variable as SSDT table
```
# grubby --update-kernel=/boot/vmlinuz-$(uname -r) --args="efivar_ssdt=Dpll"
```
