#!/bin/bash

. /etc/os-release

case $NAME in
"Arch Linux")
    ARCH=mips-elf make mem
    ;;
"Ubuntu")
    ARCH=mipsel-linux-gnu make mem
    ;;
esac