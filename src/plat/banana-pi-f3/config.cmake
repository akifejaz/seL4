#
# Copyright 2020, DornerWorks
# Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: GPL-2.0-only
#

declare_platform(banana-pi-f3 KernelPlatformBananaPiF3 PLAT_BANANAPIF3 KernelSel4ArchRiscV64)

if(KernelPlatformBananaPiF3)
    declare_seL4_arch(riscv64)
    config_set(KernelRiscVPlatform RISCV_PLAT "banana-pi-f3")
    config_set(KernelPlatformFirstHartID FIRST_HART_ID 0)
    config_set(KernelOpenSBIPlatform OPENSBI_PLATFORM "generic")
    list(APPEND KernelDTSList "tools/dts/banana-pi-f3.dts")
    list(APPEND KernelDTSList "src/plat/banana-pi-f3/overlay-banana-pi-f3.dts")
    declare_default_headers(
        TIMER_FREQUENCY 12800000
        MAX_IRQ 256
        INTERRUPT_CONTROLLER drivers/irq/riscv_plic0.h
    )
else()
    unset(KernelPlatformFirstHartID CACHE)
endif()
