# PrimeCore OS — Starter

This is a tiny starter kernel that boots under GRUB and prints text using VGA text mode. It's intentionally simple so you can understand each piece.

## Requirements (on Linux)
- nasm
- gcc (with -m32 multilib) or cross compiler
- ld (binutils)
- grub-mkrescue (grub-pc-bin / grub2-common)
- xorriso (if grub-mkrescue requires it)
- qemu for testing

Ubuntu/Debian quick install example:

```
sudo apt-get update
sudo apt-get install build-essential nasm grub-pc-bin grub-common xorriso qemu-system-x86
sudo apt-get install gcc-multilib g++-multilib
```

## Build
```
make
make run    # runs QEMU with the created ISO
```

## Next steps
- Add keyboard input and a tiny shell
- Implement basic memory manager
- Add FAT12-based filesystem support
- Add simple device drivers
- Replace GRUB flow with your own bootloader when ready
