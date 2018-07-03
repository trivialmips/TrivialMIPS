	.org 0x0
	.global _start
	.set noat
_start:
	ori  $3, $0, 0x1000
	ori  $2, $0, 0x0001
	ori  $4, $0, 0x1004
	ori  $1, $0, 0xff00
	sw   $1, 0x4($3)
	lw   $2, 0x4($4)  # not-load-related

	lw   $2, 0x0($4)  # load-related
	ori  $2, $2, 0x0001  

	lw   $1, 0x4($3)  # load-related
	sw   $1, 0x8($3) 
	lw   $3, 0x8($3) 
