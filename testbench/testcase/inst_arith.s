	.org 0x0
	.global _start
	.set noreorder
	.set nomacro
	.set noat
_start:
	# === ADD, ADDI, ADDIU, ADDU, SUB, SUBU ===
	lui $1, 0x8000      # ans: $1=0x80000000
	ori $1, 0x0010      # ans: $1=0x80000010
	lui $2, 0x8000      # ans: $2=0x80000000
	ori $2, 0x0001      # ans: $2=0x80000001

	addu $3, $2, $1     # ans: $3=0x00000011
	add  $1, $2, $1     # overflow, $1 unchanged
	# ans: skip
	# ans: skip
	ori $1, $1, 0x0000  # ans: $1=0x80000010
	ori $1, $1, 0xffff  # ans: $1=0x8000ffff

	sub $3, $1, $3      # ans: $3=0x8000ffee
	subu $3, $3, $2     # ans: $3=0x0000ffed

	addi $3, $3, 0x0002 # ans: $3=0x0000ffef
	ori $3, $0, 0x0000  # ans: $3=0x00000000
	addiu $3, $3, 0x8000 # ans: $3=0xffff8000

	lui $1, 0x7fff       # ans: $1=0x7fff0000
	ori $2, $0, 0x0000   # ans: $2=0x00000000
	lui $2, 0xff00       # ans: $2=0xff000000
	sub $2, $2, $1   # underflow, $2 unchanged
	# ans: skip
	# ans: skip
	ori $2, $2, 0x0000  # ans: $2=0xff000000

.org 0x180
    # exception handler
	# return to next instruction
	mfc0 $30, $14
	addi $30, $30, 0x4
	mtc0 $30, $14
	eret
