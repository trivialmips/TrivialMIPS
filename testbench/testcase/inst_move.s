	.org 0x0
	.global _start
	.set noat
_start:
	ori  $1, $0, 0xff00
	mthi $1
	mfhi $2
	ori  $3, $2, 0x0000
