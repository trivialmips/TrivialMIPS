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
	nop

	.org 0x80
	ori $2, $0, 0x0001
	
# ans: $1=0x0000f000
# ans: $1=0x0000ff00
# ans: $1=0x0000ff10
# ans: $31=0x0000004c
# ans: $2=0x00000001
