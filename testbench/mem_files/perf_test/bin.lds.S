OUTPUT_ARCH(mips)
ENTRY(_start)
SECTIONS
{
  . = MEMSTART;
  .text : 
  {
    _ftext = . ;
    *(.text)
    *(.rodata*)
    *(.reginfo)
    *(.init)
    *(.stub)
    *(.gnu.warning)
    *(.MIPS.abiflags)
    . = ALIGN(0x1000);
    *(.text.ebase)
    rodata_end = .;
  } =0

  .data :
  {
    _fdata = . ;
    _stack = _fdata + MEMSIZE -32;
    *(.data)
    *(.data*) 
    _gp = ALIGN(16) + 0x7ff0;
    *(.got.plt) *(.got)
    *(.sdata) 
    *(.lit8) 
    *(.lit4)
  }
  
  .sbss : 
  { 
    *(.sbss)
    *(.scommon)
  }
  
  .bss :
  {
    *(.dynbss)
    *(.bss)
    *(COMMON)
  }
  
  .MIPS.abiflags : {}
  
  /DISCARD/ :
  {
    *(.debug*);
    *(.note*);
    *(.iplt*);
    *(.igot*);
    *(.rel*);
    *(.comment);
  }

}
