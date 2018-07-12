	.org 0x0
	.global _start
	.set noat
_start:
	lui $4, 0x8000
        jr  $4
        nop
        
