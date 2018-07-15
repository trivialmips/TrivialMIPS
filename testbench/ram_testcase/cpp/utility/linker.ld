ENTRY(_start);
SECTIONS
{    
    . = 0x80000000;    
    .text :  AT(0x80000000)
    {
        _text = .;
        *(.text.startup);
        *(.text);
        _text_end = .;
    }

    . = 0x80100000;    
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
