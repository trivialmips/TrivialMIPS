	.org 0x0
	.global _start
	.set noreorder
	.set nomacro
	.set noat
_start:
	ori $1, $0, 0xf000  # $1 = 0xf000
	j   0x40
	ori $1, $1, 0x0f00  # $1 = 0xff00
	ori $1, $1, 0x00f0  # not reached
	ori $1, $1, 0x000f  # not reached

	.org 0x40
	ori $1, $1, 0x0010  # $1 = 0xff10
	jal 0x80

	.org 0x80
	j   0x00
