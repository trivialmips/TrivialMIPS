OUTPUT_ARCH(mips)
ENTRY(_start)
SECTIONS
{
  . = MEMSTART;
  .text : 
  {
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

  .data : AT(rodata_end)
  {
    *(.got.plt) *(.got)
    *(.sdata) 
    *(.lit8) 
    *(.lit4) 
  }

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
