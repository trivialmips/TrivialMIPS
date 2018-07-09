	.org 0x0
	.global _start
	.set noreorder
	.set nomacro
	.set noat
_start:
	# data-related (MUL)
	ori $1, $0, 0xffff     # ans: $1=0x0000ffff
	ori $2, $0, 0x0029     # ans: $2=0x00000029
	mul $3, $1, $2         # ans: $3=0x0028ffd7
	mul $3, $3, $3         # ans: $3=0xf2de0691
	nop
	mul $4, $1, $2         # ans: $4=0x0028ffd7
	add $4, $4, $4         # ans: $4=0x0051ffae

	# data-not-related (MUL)
	mul $3, $1, $2         # ans: $3=0x0028ffd7
	mul $3, $1, $1         # ans: $3=0xfffe0001
