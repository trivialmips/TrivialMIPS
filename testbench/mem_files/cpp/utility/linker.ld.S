ENTRY(_start);
SECTIONS
{    
#ifdef BOOT_FROM_BOOTROM
    . = 0xBFC00000;
#else
    . = 0x80000000;
#endif

    .text :
    {
        _text = .;
        *(.text.startup);
        *(.text);
        _text_end = .;
    }
#ifdef BOOT_FROM_BOOTROM
#else
    . = 0x80100000;
#endif    
    .data :
    {
        _data = .;
        *(.bss);
        *(.bss*);
        *(.data);
        *(.rodata*);
        *(COMMON)
        _data_end = .;
    }    
    /DISCARD/ :
    {
        *(.note*);
        *(.iplt*);
        *(.igot*);
        *(.rel*);
        *(.comment);
        /* add any unwanted sections spewed out by your version of gcc and flags here */    
    }
}
