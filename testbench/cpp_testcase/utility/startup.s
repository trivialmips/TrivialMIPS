	.set	nomips16
	.set	nomicromips
	.text
	.extern _Z6_entryv
	.section .text.startup
	.globl _start
	.type _start, @function
_start:
	# setup stack pointer
	la $sp, 0x807ffff0
	jal _Z6_entryv
	nop

_loop0:
	b _loop0
	nop
