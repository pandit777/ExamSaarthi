/* kprint.c - tiny VGA text mode printing */
#include <stdint.h>
#include "../include/kstdio.h"

static uint16_t *video = (uint16_t*)0xB8000;
static int row = 0;
static int col = 0;

static void putch(char c) {
    if (c == '\n') {
        col = 0; row++;
    } else {
        video[row*80 + col] = (uint8_t)c | (0x07 << 8);
        col++;
        if (col >= 80) { col = 0; row++; }
    }
}

void kputs(const char *s) {
    while (*s) putch(*s++);
}
