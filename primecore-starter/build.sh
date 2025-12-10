#!/usr/bin/env bash
set -e

# quick build script (linux)
make clean
make iso

echo "ISO created: primecore.iso"
