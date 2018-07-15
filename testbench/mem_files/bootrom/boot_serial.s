	.org 0x0
	.global _start
	.set noat
_start:
    # enable the hardware interrupt 0
	mfc0 $1, $12
	ori $1, $1, 0x0401
	mtc0 $1, $12

	# use the special interrupt vector
	mfc0 $1, $13
	lui $2, 0x0080
	or $1, $2, $1
	mtc0 $1, $13

_wait_int:
	beq $0, $0, _wait_int
	nop

.org 0x400
	lui $3, 0x8000
	lui $1, 0xa300
	lw $2, 0x04($1)
	sw $2, 0x00($3)
	sw $2, 0x04($1)
	ori $2, $0, 0x0000
	eret
