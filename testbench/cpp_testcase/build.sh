#!/bin/bash

. /etc/os-release

case $NAME in
"Arch Linux")
    ARCH=mips-elf make coe
    ;;
"Ubuntu")
    ARCH=mipsel-linux-gnu make coe
    ;;
esac

