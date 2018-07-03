	.org 0x0
	.global _start
	.set noat
_start:
	ori $1, $1, 0xf000  # ans: $1=0x0000f000
	ori $1, $1, 0x0f00  # ans: $1=0x0000ff00
	ori $1, $1, 0x00f0  # ans: $1=0x0000fff0
	ori $1, $1, 0x000f  # ans: $1=0x0000ffff
