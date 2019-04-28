	.org 0x0
	.global _start
	.set noat
_start:
	la $1, 0x12245678  # ans: skip
					   # ans: $1=0x12245678
	ext $2, $1, 5, 6   # ans: $2=0x00000033

	lui $4, 0xffff     # ans: $4=0xffff0000
	ext $2, $4, 16, 5  # ans: $2=0x0000001f
	ins $1, $2, 16, 5  # ans: $1=0x123f5678
	wsbh $3, $1        # ans: $3=0x3f127856
	ror $2, $3, 8     # ans: $2=0x563f1278
	ori $9, $0, 8    # ans: skip
	ror $7, $3, $9     # ans: $7=0x563f1278

	ori $1, $0, 0xff  # ans: $1=0x000000ff
	seb $2, $1        # ans: $2=0xffffffff
	seb $2, $3        # ans: $2=0x00000056
	seh $2, $3        # ans: $2=0x00007856
	ori $1, $0, 0xffff # ans: skip
	seh $2, $1        # ans: $2=0xffffffff
