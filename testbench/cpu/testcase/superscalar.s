	.org 0x0
	.global _start
	.set noreorder
	.set nomacro
	.set noat
_start:
	# data-related (MUL)
	ori $1, $0, 0xffff     # ans: [+1]$1=0x0000ffff
	ori $2, $0, 0x0029     # ans: [+0]$2=0x00000029
	mul $3, $1, $2         # ans: [+2]$3=0x0028ffd7
	mul $3, $3, $3         # ans: [+2]$3=0xf2de0691
	nop
	mul $4, $1, $2         # ans: [+2]$4=0x0028ffd7
	add $4, $4, $4         # ans: [+1]$4=0x0051ffae
	nop

	# data-not-related (MUL)
	mul $3, $1, $2         # ans: [+2]$3=0x0028ffd7
	mul $3, $1, $1         # ans: [+0]$3=0xfffe0001

	# data-related 
	ori $5, $5, 0x8000     # ans: [+1]$5=0x00008000
	ori $5, $5, 0x0800     # ans: [+0]$5=0x00008800
	ori $5, $5, 0x0080     # ans: [+1]$5=0x00008880
	ori $5, $5, 0x0008     # ans: [+0]$5=0x00008888
	ori $5, $5, 0x1000     # ans: [+1]$5=0x00009888
	ori $5, $5, 0x0100     # ans: [+0]$5=0x00009988
	ori $5, $5, 0x0010     # ans: [+1]$5=0x00009998
	ori $5, $5, 0x0001     # ans: [+0]$5=0x00009999

	# load-related
	lui $5, 0xa000         # ans: [+1]$5=0xa0000000
	ori $5, $5, 0x1000     # ans: [+0]$5=0xa0001000
	lw  $1, 0x0($5)        # ans: [+2]$1=0x00000000
	addi $1, $1, 0x1       # ans: [+2]$1=0x00000001
	addi $1, $1, 0x1       # ans: [+0]$1=0x00000002

	# mutex memory instructions
	sw $1, 0x0($5)         # ans: [+1][0x1000]=0x00000002
	lw $2, 0x0($5)         # ans: [+2]$2=0x00000002
	sw $2, 0x4($5)         # ans: [+2][0x1004]=0x00000002
	lw $3, 0x0($5)         # ans: [+2]$3=0x00000002
	lw $4, 0x4($5)         # ans: [+2]$4=0x00000002
	nop

	# multi-cycle instructions
	lui $3, 0x0080      # ans: [+1]$3=0x00800000
	nop
	ori $3, $3, 0xffff  # ans: [+1]$3=0x0080ffff
	lui $4, 0xffff      # ans: [+0]$4=0xffff0000
	ori $4, $4, 0xfff1  # ans: [+1]$4=0xfffffff1
	ori $5, $0, 0x0011  # ans: [+0]$5=0x00000011
	mult $3, $3         # ans: [+18]$hilo=0x00004100fefe0001
	div  $zero, $4, $5  # ans: [+0]$hilo=0xfffffff100000000
