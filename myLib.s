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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	mov	r3, r0, asl #3
	ldr	r0, .L4
	add	ip, r1, r1, lsr #31
	add	r3, r3, ip, asr #1
	ldr	ip, [r0, #0]
	mov	r3, r3, asl #1
	tst	r1, #1
	ldrh	r1, [ip, r3]
	andne	r1, r1, #255
	biceq	r1, r1, #255
	orrne	r2, r1, r2, asl #8
	orreq	r2, r2, r1
	strneh	r2, [ip, r3]	@ movhi
	streqh	r2, [ip, r3]	@ movhi
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	ldrb	r4, [sp, #72]	@ zero_extendqisi2
	cmp	r2, #0
	str	r2, [sp, #0]
	orr	r2, r4, r4, asl #8
	str	r4, [sp, #8]
	str	r1, [sp, #12]
	strh	r2, [sp, #30]	@ movhi
	ble	.L6
	ldr	r4, [sp, #12]
	add	r8, r1, #1
	rsb	r5, r0, r0, asl #4
	add	ip, r3, r3, lsr #31
	add	r2, r1, r1, lsr #31
	mov	r5, r5, asl #3
	mov	ip, ip, asr #1
	add	r8, r8, r8, lsr #31
	add	r8, r5, r8, asr #1
	sub	r1, ip, #1
	add	r5, r5, r2, asr #1
	sub	r2, r4, #1
	mov	r8, r8, asl #1
	orr	ip, ip, #-2130706432
	orr	r1, r1, #-2130706432
	add	r2, r2, r3
	and	r9, r4, #1
	ldr	sl, .L15
	str	ip, [sp, #4]
	str	r1, [sp, #20]
	mov	r6, r0
	mov	r5, r5, asl #1
	mov	r7, r8
	mov	r4, #0
	and	fp, r3, #1
	str	r2, [sp, #16]
	b	.L11
.L8:
	ldmia	sl, {r1, r2}	@ phole ldm
	ldr	r0, [sp, #4]
	add	r3, r2, #36
	add	r1, r1, r5
	add	ip, sp, #30
	cmp	fp, #0
	str	ip, [r2, #36]
	str	r1, [r3, #4]
	str	r0, [r3, #8]
	bne	.L14
.L10:
	ldr	r1, [sp, #0]
	add	r4, r4, #1
	cmp	r1, r4
	add	r8, r8, #240
	add	r6, r6, #1
	add	r5, r5, #240
	add	r7, r7, #240
	ble	.L6
.L11:
	cmp	r9, #0
	beq	.L8
	mov	r0, r6
	ldr	r1, [sp, #12]
	ldr	r2, [sp, #8]
	bl	setPixel4
	cmp	fp, #0
	beq	.L9
	ldmia	sl, {r1, r2}	@ phole ldm
	add	r1, r1, r7
	add	r3, r2, #36
	add	ip, sp, #30
	str	ip, [r2, #36]
	str	r1, [r3, #4]
	ldr	r1, [sp, #0]
	ldr	r0, [sp, #4]
	add	r4, r4, #1
	cmp	r1, r4
	str	r0, [r3, #8]
	add	r8, r8, #240
	add	r6, r6, #1
	add	r5, r5, #240
	add	r7, r7, #240
	bgt	.L11
.L6:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L14:
	mov	r0, r6
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #8]
	bl	setPixel4
	b	.L10
.L9:
	ldr	r1, [sl, #4]
	ldr	r2, [sl, #0]
	add	r3, r1, #36
	add	r2, r2, r8
	add	ip, sp, #30
	str	ip, [r1, #36]
	str	r2, [r3, #4]
	ldr	r2, [sp, #20]
	mov	r0, r6
	str	r2, [r3, #8]
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #8]
	bl	setPixel4
	b	.L10
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L18
	sub	sp, sp, #8
	add	r3, sp, #8
	ldr	r2, [r1, #4]
	orr	r0, r0, r0, asl #8
	strh	r0, [r3, #-2]!	@ movhi
	ldr	ip, [r1, #0]
	mov	r1, #-2130706432
	add	r0, r2, #36
	add	r1, r1, #19200
	str	r3, [r2, #36]
	str	ip, [r0, #4]
	str	r1, [r0, #8]
	add	sp, sp, #8
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawBackgroundImage4
	.type	drawBackgroundImage4, %function
drawBackgroundImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L21
	ldr	r1, [r3, #4]
	ldr	ip, [r3, #0]
	mov	r3, #-2147483648
	add	r2, r1, #36
	add	r3, r3, #19200
	str	r0, [r1, #36]
	str	ip, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LANCHOR0
	.size	drawBackgroundImage4, .-drawBackgroundImage4
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	tst	r2, #1
	stmfd	sp!, {r4, r5, r6}
	addne	r2, r2, #1
	cmp	r3, #0
	ldr	r4, [sp, #12]
	ble	.L23
	ldr	r5, .L28
	rsb	r1, r1, r1, asl #4
	ldr	ip, [r5, #4]
	mov	r6, r1, asl #3
	add	r4, r4, r4, lsr #31
	ldr	r1, [r5, #0]
	add	r2, r2, r2, lsr #31
	mov	r4, r4, asr #1
	add	r2, r6, r2, asr #1
	orr	r5, r4, #-2147483648
	add	r2, r1, r2, asl #1
	add	ip, ip, #36
	mov	r4, r4, asl #1
	mov	r1, #0
.L26:
	add	r1, r1, #1
	cmp	r1, r3
	str	r0, [ip, #0]
	str	r2, [ip, #4]
	add	r0, r0, r4
	str	r5, [ip, #8]
	add	r2, r2, #240
	bne	.L26
.L23:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L29:
	.align	2
.L28:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L31
	ldr	r1, [r3, #4]
	mov	r3, #-2147483648
	add	r2, r1, #36
	str	r0, [r1, #36]
	add	r3, r3, #256
	mov	r1, #83886080
	str	r1, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L32:
	.align	2
.L31:
	.word	.LANCHOR0
	.size	loadPalette, .-loadPalette
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L34
	str	r4, [sp, #-4]!
	ldr	ip, [ip, #4]
	add	r0, r0, r0, asl #1
	add	r4, ip, r0, asl #2
	orr	r3, r3, #-2147483648
	str	r1, [ip, r0, asl #2]
	str	r2, [r4, #4]
	str	r3, [r4, #8]
	ldmfd	sp!, {r4}
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L37:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L37
	mov	r2, #67108864
.L39:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L39
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r2, [r3, #0]
	tst	r2, #16
	ldrne	r1, .L45
	ldreq	r1, .L45
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r2, r2, #16
	orreq	r2, r2, #16
	strneh	r2, [r3, #0]	@ movhi
	streqh	r2, [r3, #0]	@ movhi
	strne	r0, [r1, #0]
	streq	r0, [r1, #0]
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.global	videoBuffer
	.global	frontBuffer
	.global	backBuffer
	.global	dma
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 31) 4.5.0"
