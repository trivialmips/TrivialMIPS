	.org 0x0
	.global _start
	.set noat
_start:
	lui $7, 0xa300  # serial
	nop
	lui $8, 0x8000  # memory
	nop
	lui $9, 0xa600  # GPIO
	nop
_wait_data:
	jr $8
	nop
# 	lw $1, 0x00($7)
# 	andi $1, 0x0002
# 	beq $1, $0, _wait_data
# 	nop
# 
# 	lw $2, 0x04($7)
# 	sw $2, 0x04($7)
# 	or $2, $8, $2
# 	sw $2, 0x04($9)
# 
# 	beq $0, $0, _wait_data
# 	nop
