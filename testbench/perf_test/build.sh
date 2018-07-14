#!/bin/bash

. /etc/os-release

case $NAME in
"Arch Linux")
    CROSS_COMPILE=mips-elf- make all
    ;;
"Ubuntu")
    CROSS_COMPILE=mipsel-linux-gnu- make all
    ;;
esac

