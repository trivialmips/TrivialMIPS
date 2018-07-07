	.org 0x0
	.global _start
	.set noat
_start:
	ori  $3, $0, 0x1000 # ans: $3=0x00001000
	ori  $2, $0, 0x0001 # ans: $2=0x00000001
	ori  $4, $0, 0x1004 # ans: $4=0x00001004
	ori  $1, $0, 0xff00 # ans: $1=0x0000ff00
	sw   $1, 0x4($3)    # ans: [0x1004]=0x0000ff00

	# not-load-related
	lw   $2, 0x4($4)    # ans: $2=0x00000000

	# load-related
	lw   $2, 0x0($4)    # ans: $2=0x0000ff00
	ori  $2, $2, 0x0001 # ans: $2=0x0000ff01

	# load-related
	lw   $1, 0x4($3)    # ans: $1=0x0000ff00
	sw   $1, 0x8($3)    # ans: [0x1008]=0x0000ff00
	lw   $3, 0x8($3)    # ans: $3=0x0000ff00
