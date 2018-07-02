	.org 0x0
	.global _start
	.set noat
_start:
	ori $1, $1, 0xf000
	ori $1, $1, 0x0f00
	ori $1, $1, 0x00f0
	ori $1, $1, 0x000f
