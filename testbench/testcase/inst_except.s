	.org 0x0
	.global _start
	.set noreorder
	.set nomacro
	.set noat
_start:
	ori $1, $0, 0x7000
	teqi $1, 0x7f00
	ori $1, $1, 0x0f00
	teqi $1, 0x7f00
	ori $1, $1, 0x00f0

	.org 0x180   # exception handler
	ori $1, $1, 0x000f
	eret

# ans: $1=0x00007000
# ans: $1=0x00007f00
# ans: $1=0x00007f0f
# ans: $1=0x00007fff
