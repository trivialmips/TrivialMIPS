#!/bin/bash

. /etc/os-release

case $NAME in
"Arch Linux")
    CROSS_COMPILE=mips-elf- make
    ;;
"Ubuntu")
    CROSS_COMPILE-=mipsel-linux-gnu- make
    ;;
esac

