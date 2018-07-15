	.org 0x0
	.global _start
	.set noat
_start:
	# enter normal mode
	mfc0 $4, $12
	la $3, 0x0fbfffff
	and $4, $4, $3
	mtc0 $4, $12

	lui $4, 0x8000
	jr  $4
	nop
        
