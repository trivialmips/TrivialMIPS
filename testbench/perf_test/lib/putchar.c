int putchar(int c)
{
tgt_putchar(c);
return 0;
}

void tgt_putchar(c)
{
    asm(
        ".set noreorder\n\t"
        "lui $1, 0x8000\n\t"
        "jr $31\n\t"
        "sb %0,0x7ffc($1)\n\t"
        ".set reorder\n\t"
        :
        :"r"(c)
        :"$1");
}
