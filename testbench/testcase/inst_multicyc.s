	.org 0x0
	.global _start
	.set noat
_start:
	ori $1, $0, 0x0001  # ans: $1=0x00000001
	ori $2, $0, 0x2345  # ans: $2=0x00002345
	mthi $1 # ans: $hilo=0x0000000100000000
	mtlo $2 # ans: $hilo=0x0000000100002345
	ori $3, $0, 0xffff # ans: $3=0x0000ffff
	maddu $3, $3 # ans: $hilo=0x00000001fffe2346
	mfhi $1 # ans: $1=0x00000001
	mflo $2 # ans: $2=0xfffe2346
