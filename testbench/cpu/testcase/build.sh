#!/bin/bash

. /etc/os-release

case $NAME in
"Arch Linux")
    ARCH=mipsel-linux-gnu make mem
    ;;
"Ubuntu")
    ARCH=mipsel-linux-gnu make mem
    ;;
esac
