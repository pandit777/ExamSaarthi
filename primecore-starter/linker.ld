ENTRY(kernel_main)

SECTIONS
{
  . = 0x100000; /* load at 1MB when linked */

  .text : { *(.multiboot) *(.text) }
  .rodata : { *(.rodata) }
  .data : { *(.data) }
  .bss : { *(.bss) }
}
