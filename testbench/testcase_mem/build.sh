#!/bin/bash

. /etc/os-release

case $NAME in
"Arch Linux")
    ARCH=mips-elf make sram
    ;;
"Ubuntu")
    ARCH=mipsel-linux-gnu make sram
    ;;
esac
