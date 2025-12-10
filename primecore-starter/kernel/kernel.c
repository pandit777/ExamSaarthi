/* kernel.c - minimal kernel entry (C) */
#include "../include/kstdio.h"

void c_start(void) {
    kputs("\nWelcome to PrimeCore OS (starter)\n");
    kputs("Booted by GRUB. This is a minimal kernel.\n\n");

    kputs("Detecting CPU: ");
    kputs("x86 (protected mode)\n");

    kputs("\nAvailable commands:\n");
    kputs(" - Press any key (not implemented)\n\n");

    for(;;) {
        asm volatile ("hlt");
    }
}
