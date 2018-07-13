	.org 0x0
	.global _start
	.set noat
_start:
	lui $4, 0x8000
	ori $4, $4, 0x0100
	ori $1, 0x0001
	sw  $1, 0x00($4)
	add $1, $1, $1
	sw  $1, 0x04($4)
	add $1, $1, $1
	sw  $1, 0x08($4)
	add $1, $1, $1
	sw  $1, 0x0c($4)
	add $1, $1, $1
	sw  $1, 0x10($4)
	lw  $1, 0x00($4)
	lw  $1, 0x04($4)
	lw  $1, 0x08($4)
	lw  $1, 0x0c($4)
	lw  $1, 0x10($4)

	lui $4, 0x8000
	jr  $4
	nop
        
