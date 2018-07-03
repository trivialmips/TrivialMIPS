#!/bin/bash

. /etc/os-release

case $NAME in
"Arch Linux")
    ARCH=mips-elf make
    ;;
"Ubuntu")
    ARCH=mipsel-linux-gnu make
    ;;
esac