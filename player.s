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
	.file	"player.c"
	.global	playerBitmap
	.global	playerPal
	.section	.rodata
	.align	2
	.type	playerBitmap, %object
	.size	playerBitmap, 96
playerBitmap:
	.short	0
	.short	1
	.short	0
	.short	0
	.short	256
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	256
	.short	0
	.short	257
	.short	1
	.short	0
	.short	0
	.short	256
	.short	257
	.short	0
	.short	1
	.short	257
	.short	257
	.short	256
	.short	0
	.short	0
	.short	256
	.short	256
	.short	1
	.short	1
	.short	0
	.short	0
	.short	256
	.short	257
	.short	257
	.short	1
	.short	0
	.short	0
	.short	256
	.short	1
	.short	256
	.short	1
	.short	0
	.short	0
	.short	0
	.short	257
	.short	257
	.short	0
	.short	0
	.type	playerPal, %object
	.size	playerPal, 32
playerPal:
	.short	0
	.short	992
	.short	31
	.short	31744
	.short	32767
	.short	1023
	.short	32736
	.short	31775
	.short	14799
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.ident	"GCC: (devkitARM release 31) 4.5.0"
