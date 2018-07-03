	.org 0x0
	.global _start
	.set noat
_start:
	ori $1, $0, 0x0001
	ori $2, $0, 0x2345
	mthi $1
	mtlo $2
	ori $3, $0, 0xffff
	maddu $3, $3
	mfhi $1
	mflo $2
