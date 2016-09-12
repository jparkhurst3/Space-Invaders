	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"bullet.c"
	.global	bulletBitmap
	.section	.rodata
	.align	2
	.type	bulletBitmap, %object
	.size	bulletBitmap, 20
bulletBitmap:
	.short	512
	.short	0
	.short	514
	.short	2
	.short	512
	.short	0
	.short	512
	.short	0
	.short	512
	.short	0
	.ident	"GCC: (devkitARM release 31) 4.5.0"
