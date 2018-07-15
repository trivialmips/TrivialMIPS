	.org 0x0
	.global _start
	.set noat
_start:
	lui $4, 0xbfc0
	lui $3, 0x8000
	lui $1, 0xa600
	lw $2, 0x0($1)
	or $2, $2, $3
	sw $2, 0x4($1)
	sw $2, 0x8($1)
	jr $4
	nop
