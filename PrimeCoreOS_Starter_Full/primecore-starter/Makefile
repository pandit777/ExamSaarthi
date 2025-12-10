# Simple Makefile to build kernel binary and create bootable ISO using grub-mkrescue
AS = nasm
CC = gcc
LD = ld
CFLAGS = -m32 -ffreestanding -O2 -Wall -Wextra -nostdlib
LDFLAGS = -m elf_i386 -T linker.ld

.PHONY: all clean iso run

all: iso

kernel.bin: boot/multiboot_header.S kernel/kernel.c kernel/kprint.c include/kstdio.h
	# assemble header
	nasm -f elf32 boot/multiboot_header.S -o boot/multiboot_header.o
	# compile C
	gcc -m32 -ffreestanding -c kernel/kernel.c -o kernel/kernel.o
	gcc -m32 -ffreestanding -c kernel/kprint.c -o kernel/kprint.o
	# link
	ld -m elf_i386 -T linker.ld boot/multiboot_header.o kernel/kernel.o kernel/kprint.o -o kernel.bin

iso: kernel.bin
	mkdir -p iso/boot/grub
	cp kernel.bin iso/boot/kernel.bin
	cp grub/grub.cfg iso/boot/grub/grub.cfg
	grub-mkrescue -o primecore.iso iso

clean:
	rm -f boot/*.o kernel/*.o kernel.bin
	rm -rf iso primecore.iso

run: iso
	qemu-system-i386 -cdrom primecore.iso -m 512
