/* multiboot_header.S
   Minimal multiboot header so GRUB will load our kernel.
*/
.section .multiboot
.align 4
.long 0x1BADB002         /* magic */
.long 0x00010003         /* flags: align modules, memory info */
.long -(0x1BADB002 + 0x00010003)

.section .text
.global kernel_main
.type kernel_main, @function

kernel_main:
    /* before calling C code, set up stack (simple static stack) */
    cli
    xor %ebp, %ebp
    mov $0x90000, %esp   /* small kernel stack at 0x90000 */
    push %esp
    call c_start

halt:
    hlt
    jmp halt

.size kernel_main, .-kernel_main
