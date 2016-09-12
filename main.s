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
	.file	"main.c"
	.text
	.align	2
	.global	drawNewBombs
	.type	drawNewBombs, %function
drawNewBombs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r4, .L7
	sub	sp, sp, #12
	ldr	r7, .L7+4
	add	r5, r4, #200
	mov	r6, #2
	b	.L3
.L2:
	add	r4, r4, #20
	cmp	r4, r5
	beq	.L6
.L3:
	ldr	r3, [r4, #0]
	cmp	r3, #1
	bne	.L2
	sub	r0, r4, #12
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r2, #5
	mov	r3, #3
	add	r4, r4, #20
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r7
	cmp	r4, r5
	bne	.L3
.L6:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	bombs+12
	.word	drawRect4
	.size	drawNewBombs, .-drawNewBombs
	.align	2
	.global	drawOldBombs
	.type	drawOldBombs, %function
drawOldBombs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r4, #0
	ldr	r5, .L12
	ldr	r7, .L12+4
	sub	sp, sp, #12
	mov	r6, r4
.L10:
	add	r3, r5, r4
	ldr	r1, [r3, #4]
	ldr	r0, [r5, r4]
	sub	r1, r1, #1
	sub	r0, r0, #3
	mov	r2, #9
	mov	r3, #4
	add	r4, r4, #20
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r7
	cmp	r4, #200
	bne	.L10
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	oldBombs
	.word	drawRect4
	.size	drawOldBombs, .-drawOldBombs
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1024
	mov	ip, #67108864
	add	r1, r1, #4
	stmfd	sp!, {r3, r4, r5, lr}
	strh	r1, [ip, #0]	@ movhi
	ldr	lr, [ip, #304]
	ldr	r1, .L23
	str	lr, [r1, #0]
	ldr	r1, .L23+4
	ldr	r2, .L23+8
	mov	r3, #0
	str	r3, [r1, #0]
	mov	r1, #150
	str	r1, [r2, #0]
	mov	r0, #2
	mov	r1, #110
	mov	r5, #1
	stmib	r2, {r1, r3}	@ phole stm
	str	r0, [r2, #12]
	str	r5, [r2, #16]
	ldr	r2, .L23+12
	mov	r1, #32
	mov	ip, #20
.L17:
	cmp	r3, #29
	cmpne	r3, #39
	movne	r4, #0
	moveq	r4, #1
	cmp	r3, #49
	orreq	r4, r4, #1
	cmp	r3, #59
	orreq	r4, r4, #1
	cmp	r3, #9
	cmpne	r3, #19
	movne	lr, #0
	moveq	lr, #1
	orrs	lr, r4, lr
	add	r3, r3, #1
	str	r1, [r2, #-12]
	str	ip, [r2, #-16]
	addeq	r1, r1, #18
	addne	ip, ip, #12
	movne	r1, #32
	cmp	r3, #60
	str	r0, [r2, #-8]
	str	r0, [r2, #-4]
	str	r5, [r2], #20
	bne	.L17
	ldr	r2, .L23+16
	ldr	r3, .L23+20
	mov	r4, #0
	str	r4, [r2, #0]
	add	ip, r3, #400
	mov	r1, #150
	mov	r2, #70
.L18:
	str	r1, [r3, #-16]
	str	r2, [r3, #-12]
	stmdb	r3, {r0, r4}	@ phole stm
	strh	r4, [r3], #20	@ movhi
	cmp	r3, ip
	bne	.L18
	ldr	r2, .L23+24
	ldr	r3, .L23+28
	str	r4, [r2, #0]
	add	r2, r3, #200
.L19:
	str	r0, [r3, #8]
	str	r4, [r3, #12]
	strh	r4, [r3, #16]	@ movhi
	add	r3, r3, #20
	cmp	r3, r2
	bne	.L19
	ldr	r3, .L23+32
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+36
	mov	lr, pc
	bx	r3
	ldr	r0, .L23+40
	ldr	r3, .L23+44
	mov	r1, #130
	str	r4, [r0, #0]
	mov	r0, #50
	mov	r2, #3
	str	r1, [r3, #0]
	str	r0, [r3, #4]
	str	r1, [r3, #16]
	str	r1, [r3, #32]
	mov	r0, #110
	mov	r1, #170
	str	r2, [r3, #8]
	str	r2, [r3, #24]
	str	r2, [r3, #40]
	str	r0, [r3, #20]
	str	r1, [r3, #36]
	ldr	r3, .L23+48
	str	r4, [r3, #0]
	ldr	r3, .L23+52
	str	r2, [r3, #0]
	ldr	r3, .L23+56
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	buttons
	.word	seed
	.word	player
	.word	enemies+16
	.word	updateE
	.word	bullets+16
	.word	activeBullets
	.word	bombs
	.word	time
	.word	srand
	.word	updateB
	.word	bricks
	.word	enemiesKilled
	.word	lives
	.word	needToDrawText
	.size	initialize, .-initialize
	.align	2
	.global	initSplash
	.type	initSplash, %function
initSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, .L26
	ldr	r3, .L26+4
	ldr	r0, .L26+8
	ldr	r6, .L26+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L26+16
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L26+20
	mov	r2, #0
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	splashBitmap
	.word	loadPalette
	.word	splashPal
	.word	flipPage
	.word	drawBackgroundImage4
	.word	state
	.size	initSplash, .-initSplash
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L29
	ldr	r3, .L29+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+8
	ldr	r0, [r3, #0]
	ldr	r3, .L29+12
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L29+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	playerPal
	.word	loadPalette
	.word	seed
	.word	state
	.word	srand
	.size	initGame, .-initGame
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L33
	ldr	r1, .L33+4
	ldr	r2, [r3, #0]
	ldr	r1, [r1, #0]
	add	r2, r2, #1
	tst	r1, #8
	str	r2, [r3, #0]
	bxeq	lr
	ldr	r3, .L33+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	initGame
.L34:
	.align	2
.L33:
	.word	seed
	.word	oldButtons
	.word	buttons
	.size	splash, .-splash
	.align	2
	.global	initPause
	.type	initPause, %function
initPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, .L36
	ldr	r3, .L36+4
	ldr	r0, .L36+8
	ldr	r6, .L36+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L36+16
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+20
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	pauseBitmap
	.word	loadPalette
	.word	splashPal
	.word	flipPage
	.word	drawBackgroundImage4
	.word	state
	.size	initPause, .-initPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L40
	ldr	r3, [r3, #0]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L40+4
	ldr	r3, [r3, #0]
	tst	r3, #1
	bxne	lr
	b	initGame
.L41:
	.align	2
.L40:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	initWin
	.type	initWin, %function
initWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L43
	ldr	r3, .L43+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L43+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L43+12
	ldr	r0, .L43+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L43+20
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	winPal
	.word	loadPalette
	.word	flipPage
	.word	drawBackgroundImage4
	.word	winBitmap
	.word	state
	.size	initWin, .-initWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L48
	ldr	r3, .L48+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+8
	ldr	r0, .L48+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+16
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L45
	ldr	r3, .L48+20
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L47
.L45:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L47:
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	initSplash
.L49:
	.align	2
.L48:
	.word	winPal
	.word	loadPalette
	.word	drawBackgroundImage4
	.word	winBitmap
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	initLose
	.type	initLose, %function
initLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L51
	ldr	r3, .L51+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+12
	ldr	r0, .L51+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+20
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	losePal
	.word	loadPalette
	.word	flipPage
	.word	drawBackgroundImage4
	.word	loseBitmap
	.word	state
	.size	initLose, .-initLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L56
	ldr	r3, .L56+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+8
	ldr	r0, .L56+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+16
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L53
	ldr	r3, .L56+20
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L55
.L53:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L55:
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	initSplash
.L57:
	.align	2
.L56:
	.word	losePal
	.word	loadPalette
	.word	drawBackgroundImage4
	.word	loseBitmap
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	drawEnemies
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r4, #0
	sub	sp, sp, #12
	ldr	r5, .L72
	ldr	r6, .L72+4
	ldr	r8, .L72+8
	ldr	sl, .L72+12
	mov	r7, r4
	mov	r9, #12
	b	.L60
.L59:
	cmp	r4, #400
	add	r5, r5, #20
	beq	.L69
.L60:
	add	r3, r4, r6
	ldr	r0, [r4, r6]
	ldr	r1, [r3, #4]
	sub	r0, r0, #2
	mov	r3, #16
	sub	r1, r1, #2
	mov	r2, #12
	str	r7, [sp, #0]
	mov	lr, pc
	bx	r8
	ldr	r3, [r5, #0]
	cmp	r3, #1
	add	r4, r4, #20
	bne	.L59
	sub	r1, r5, #16
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	r0, .L72+16
	mov	r3, #8
	str	r9, [sp, #0]
	mov	lr, pc
	bx	sl
	cmp	r4, #400
	add	r5, r5, #20
	bne	.L60
.L69:
	ldr	r4, .L72+4
	ldr	r6, .L72+20
	ldr	fp, .L72+12
	add	sl, r4, #400
	mov	r7, r6
	mov	r5, r4
	mov	r9, #0
	b	.L62
.L61:
	cmp	r5, sl
	add	r7, r7, #20
	beq	.L70
.L62:
	add	r0, r5, #400
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r3, #16
	sub	r0, r0, #2
	sub	r1, r1, #2
	mov	r2, #12
	str	r9, [sp, #0]
	mov	lr, pc
	bx	r8
	ldr	r3, [r7, #416]
	cmp	r3, #1
	add	r5, r5, #20
	bne	.L61
	mov	ip, #12
	add	r1, r7, #400
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	r0, .L72+24
	mov	r3, #8
	str	ip, [sp, #0]
	mov	lr, pc
	bx	fp
	cmp	r5, sl
	add	r7, r7, #20
	bne	.L62
.L70:
	ldr	r7, .L72+12
	mov	r5, #0
	mov	r9, #12
	b	.L65
.L63:
	cmp	r4, sl
	add	r6, r6, #20
	beq	.L71
.L65:
	add	r0, r4, #800
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r3, #16
	sub	r0, r0, #2
	sub	r1, r1, #2
	mov	r2, #12
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r8
	ldr	r3, [r6, #816]
	cmp	r3, #1
	add	r4, r4, #20
	bne	.L63
	add	r1, r6, #800
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	r0, .L72+28
	mov	r3, #8
	str	r9, [sp, #0]
	mov	lr, pc
	bx	r7
	cmp	r4, sl
	add	r6, r6, #20
	bne	.L65
.L71:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	enemies+16
	.word	oldEnemies
	.word	drawRect4
	.word	drawImage4
	.word	enemy1Bitmap
	.word	enemies
	.word	enemy2Bitmap
	.word	enemy3Bitmap
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r3, .L75
	sub	sp, sp, #12
	ldmia	r3, {r0, r1}	@ phole ldm
	mov	ip, #0
	str	ip, [sp, #0]
	sub	r0, r0, #3
	sub	r1, r1, #3
	mov	r2, #14
	mov	r3, #17
	ldr	ip, .L75+4
	mov	lr, pc
	bx	ip
	ldr	r3, .L75+8
	mov	ip, #12
	ldmia	r3, {r1, r2}	@ phole ldm
	ldr	r0, .L75+12
	str	ip, [sp, #0]
	mov	r3, #8
	ldr	ip, .L75+16
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L76:
	.align	2
.L75:
	.word	oldPlayer
	.word	drawRect4
	.word	player
	.word	playerBitmap
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	updateBullets
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r6, .L93
	ldr	r7, .L93+4
	mov	r4, #0
.L78:
	add	r5, r7, r4
	ldmia	r5!, {r0, r1, r2, r3}
	add	ip, r6, r4
	stmia	ip!, {r0, r1, r2, r3}
	add	r4, r4, #20
	ldr	r2, [r5, #0]
	cmp	r4, #400
	str	r2, [ip, #0]
	bne	.L78
	ldr	r5, .L93+8
	ldr	r6, .L93+12
	ldr	r8, .L93+16
	add	sl, r5, #400
	mov	r7, #0
	mov	r9, #12
	b	.L85
.L79:
	add	r5, r5, #20
	cmp	r5, sl
	beq	.L90
.L85:
	ldr	r3, [r5, #0]
	cmp	r3, #1
	bne	.L79
	ldr	r2, [r5, #-12]
	ldr	r3, [r5, #-4]
	rsb	r2, r3, r2
	str	r2, [r5, #-12]
	ldr	r4, .L93+20
	b	.L84
.L80:
	add	r4, r4, #20
	cmp	r4, r6
	beq	.L83
.L91:
	ldr	r2, [r5, #-12]
.L84:
	ldr	r3, [r4, #0]
	cmp	r3, #1
	bne	.L80
	ldr	r3, [r4, #-16]
	cmp	r2, r3
	movle	ip, #0
	ble	.L81
	add	r3, r3, #7
	cmp	r2, r3
	movgt	ip, #0
	movle	ip, #1
.L81:
	ldr	r1, [r4, #-12]
	ldr	r3, [r5, #-8]
	sub	r0, r1, #2
	cmp	r0, r3
	bgt	.L80
	add	r1, r1, #13
	cmp	r3, r1
	bgt	.L80
	cmp	ip, #1
	bne	.L80
	ldr	r3, [r8, #0]
	add	r3, r3, #1
	cmp	r3, #59
	str	r7, [r4, #0]
	str	r7, [r5, #0]
	str	r3, [r8, #0]
	bgt	.L82
	ldr	r2, [r5, #-12]
.L92:
	add	r4, r4, #20
	cmp	r4, r6
	bne	.L91
.L83:
	cmp	r2, #11
	strle	r9, [r5, #-12]
	strle	r7, [r5, #0]
	add	r5, r5, #20
	cmp	r5, sl
	bne	.L85
.L90:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L82:
	bl	initWin
	ldr	r2, [r5, #-12]
	b	.L92
.L94:
	.align	2
.L93:
	.word	oldBullets
	.word	bullets
	.word	bullets+12
	.word	enemies+1216
	.word	enemiesKilled
	.word	enemies+16
	.size	updateBullets, .-updateBullets
	.align	2
	.global	drawOldBullets
	.type	drawOldBullets, %function
drawOldBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r4, #0
	ldr	r5, .L98
	ldr	r7, .L98+4
	sub	sp, sp, #12
	mov	r6, r4
.L96:
	add	r3, r5, r4
	ldr	r1, [r3, #4]
	ldr	r0, [r5, r4]
	sub	r1, r1, #1
	sub	r0, r0, #1
	mov	r2, #9
	mov	r3, #4
	add	r4, r4, #20
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r7
	cmp	r4, #400
	bne	.L96
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	oldBullets
	.word	drawRect4
	.size	drawOldBullets, .-drawOldBullets
	.align	2
	.global	drawNewBullets
	.type	drawNewBullets, %function
drawNewBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r4, .L105
	sub	sp, sp, #12
	ldr	r7, .L105+4
	add	r5, r4, #400
	mov	r6, #2
	b	.L102
.L101:
	add	r4, r4, #20
	cmp	r4, r5
	beq	.L104
.L102:
	ldr	r3, [r4, #0]
	cmp	r3, #1
	bne	.L101
	sub	r0, r4, #12
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	r2, #5
	mov	r3, #3
	add	r4, r4, #20
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r7
	cmp	r4, r5
	bne	.L102
.L104:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L106:
	.align	2
.L105:
	.word	bullets+12
	.word	drawRect4
	.size	drawNewBullets, .-drawNewBullets
	.align	2
	.global	shootBullet
	.type	shootBullet, %function
shootBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L109
	stmfd	sp!, {r4, r5}
	ldr	r1, .L109+4
	ldr	r3, [r2, #0]
	ldr	r0, .L109+8
	ldr	r4, [r1, #4]
	add	ip, r3, r3, asl #2
	add	r3, r3, #1
	add	r1, r0, ip, asl #2
	cmp	r3, #19
	mov	r5, #1
	str	r3, [r2, #0]
	add	r4, r4, #6
	str	r5, [r1, #12]
	moveq	r3, #0
	mov	r5, #140
	str	r5, [r0, ip, asl #2]
	str	r4, [r1, #4]
	streq	r3, [r2, #0]
	ldmfd	sp!, {r4, r5}
	bx	lr
.L110:
	.align	2
.L109:
	.word	activeBullets
	.word	player
	.word	bullets
	.size	shootBullet, .-shootBullet
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L116
	stmfd	sp!, {r4, r5}
	mov	r5, ip
	ldmia	r5!, {r0, r1, r2, r3}
	ldr	r4, .L116+4
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r0, [r5, #0]
	str	r0, [r4, #0]
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #32
	bne	.L112
	rsb	r3, r3, r1
	cmp	r3, #0
	str	r3, [ip, #4]
	movlt	r3, #0
	strlt	r3, [ip, #4]
.L112:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L113
	ldr	r3, [ip, #4]
	ldr	r2, [ip, #12]
	add	r3, r2, r3
	cmp	r3, #227
	str	r3, [ip, #4]
	ldrgt	r3, .L116
	movgt	r2, #226
	strgt	r2, [r3, #4]
.L113:
	ldr	r3, .L116+8
	ldr	r3, [r3, #0]
	tst	r3, #64
	beq	.L111
	ldr	r3, .L116+12
	ldr	r3, [r3, #0]
	tst	r3, #64
	beq	.L115
.L111:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L115:
	ldmfd	sp!, {r4, r5}
	b	shootBullet
.L117:
	.align	2
.L116:
	.word	player
	.word	oldPlayer
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	dropBomb
	.type	dropBomb, %function
dropBomb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L120
	ldr	r2, .L120+4
	add	r0, r0, r0, asl #2
	stmfd	sp!, {r4, r5, r6}
	ldr	r1, [r3, #0]
	add	r4, r2, r0, asl #2
	ldr	ip, .L120+8
	ldr	r4, [r4, #4]
	ldr	r5, [r2, r0, asl #2]
	add	r0, r1, r1, asl #2
	add	r1, r1, #1
	add	r2, ip, r0, asl #2
	cmp	r1, #9
	add	r4, r4, #6
	mov	r6, #1
	add	r5, r5, #8
	str	r6, [r2, #12]
	str	r4, [r2, #4]
	moveq	r2, #0
	str	r1, [r3, #0]
	str	r5, [ip, r0, asl #2]
	streq	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L121:
	.align	2
.L120:
	.word	activeBombs
	.word	enemies
	.word	bombs
	.size	dropBomb, .-dropBomb
	.align	2
	.global	updateEnemies
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L137
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r2, [r3, #0]
	add	r2, r2, #1
	cmp	r2, #10
	str	r2, [r3, #0]
	ldrne	r4, .L137+4
	beq	.L135
.L123:
	ldr	r3, [r4, #1180]
	cmp	r3, #140
	bgt	.L136
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L136:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	initLose
.L135:
	mov	lr, #0
	str	lr, [r3, #0]
	ldr	r6, .L137+8
	ldr	r4, .L137+4
.L124:
	add	r5, r4, lr
	ldmia	r5!, {r0, r1, r2, r3}
	add	ip, r6, lr
	stmia	ip!, {r0, r1, r2, r3}
	add	lr, lr, #20
	ldr	r1, [r5, #0]
	cmp	lr, #1200
	ldr	r3, .L137+4
	str	r1, [ip, #0]
	bne	.L124
	ldr	r1, [r3, #184]
	ldr	r2, [r3, #4]
	cmp	r1, #227
	movle	r1, #0
	movgt	r1, #1
	cmp	r2, #1
	orrle	r1, r1, #1
	cmp	r1, #0
	addne	ip, r3, #1200
	bne	.L127
.L128:
	ldr	r3, .L137+12
	add	r0, r3, #1200
	b	.L126
.L129:
	ldr	r2, [r3, #-8]
.L126:
	ldr	r1, [r3, #0]
	add	r2, r2, r1
	str	r2, [r3, #-8]
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L129
	ldr	r3, .L137+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L137+20
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #5
	rsb	r3, r3, r3, asl #4
	sub	r3, r0, r3, asl #2
	add	r2, r3, r3, asl #2
	add	r2, r4, r2, asl #2
	ldr	r2, [r2, #16]
	cmp	r2, #1
	bne	.L123
	ldr	r5, .L137+24
	ldr	r2, [r5, #0]
	add	r2, r2, #1
	cmp	r2, #3
	str	r2, [r5, #0]
	bne	.L123
	mov	r0, r3
	bl	dropBomb
	mov	r3, #0
	str	r3, [r5, #0]
	b	.L123
.L127:
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #0]
	ldr	r2, [r3, #8]
	rsb	r1, r1, #0
	add	r2, r0, r2
	str	r1, [r3, #12]
	str	r2, [r3], #20
	cmp	r3, ip
	bne	.L127
	ldr	r2, [r4, #4]
	b	.L128
.L138:
	.align	2
.L137:
	.word	updateE
	.word	enemies
	.word	oldEnemies
	.word	enemies+12
	.word	rand
	.word	-2004318071
	.word	updateB
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	updateBomb
	.type	updateBomb, %function
updateBomb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r6, .L149
	ldr	r7, .L149+4
	mov	r4, #0
.L140:
	add	r5, r7, r4
	ldmia	r5!, {r0, r1, r2, r3}
	add	ip, r6, r4
	stmia	ip!, {r0, r1, r2, r3}
	add	r4, r4, #20
	ldr	r2, [r5, #0]
	cmp	r4, #200
	str	r2, [ip, #0]
	bne	.L140
	ldr	r4, .L149+8
	ldr	r7, .L149+12
	ldr	sl, .L149+16
	add	r5, r4, #200
	mov	r6, #0
	mov	r8, #155
.L145:
	ldr	r3, [r4, #0]
	cmp	r3, #1
	beq	.L141
.L148:
	ldr	r3, [r4, #-12]
.L142:
	cmp	r3, #155
	strgt	r8, [r4, #-12]
	strgt	r6, [r4, #0]
	add	r4, r4, #20
	cmp	r4, r5
	bne	.L145
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L141:
	ldr	r2, [r7, #4]
	ldr	r3, [r4, #-12]
	ldmdb	r4, {r1, ip}	@ phole ldm
	sub	r0, r2, #2
	add	r3, ip, r3
	cmp	r0, r1
	add	r2, r2, #13
	str	r3, [r4, #-12]
	ldr	r0, [r7, #0]
	bgt	.L142
	cmp	r1, r2
	sub	r0, r0, #2
	bgt	.L142
	cmp	r3, r0
	blt	.L142
	ldr	r2, [sl, #0]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r6, [r4, #0]
	str	r2, [sl, #0]
	bne	.L142
	bl	initLose
	b	.L148
.L150:
	.align	2
.L149:
	.word	oldBombs
	.word	bombs
	.word	bombs+12
	.word	player
	.word	lives
	.size	updateBomb, .-updateBomb
	.align	2
	.global	updateBricks
	.type	updateBricks, %function
updateBricks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L166
	stmfd	sp!, {r4, r5, r6, r7, r8}
	ldr	r6, .L166+4
	add	r5, r3, #200
	mov	r7, #0
	b	.L155
.L152:
	add	r3, r3, #20
	cmp	r3, r5
	beq	.L164
.L155:
	ldr	r2, [r3, #0]
	cmp	r2, #1
	bne	.L152
	ldr	r2, .L166+8
.L154:
	ldr	r1, [r2, #0]
	cmp	r1, #0
	ble	.L153
	ldr	r0, [r2, #-4]
	ldr	ip, [r3, #-8]
	sub	r4, r0, #2
	cmp	r4, ip
	add	r0, r0, #24
	ldr	r4, [r2, #-8]
	ldr	r8, [r3, #-12]
	bgt	.L153
	cmp	ip, r0
	sub	r4, r4, #2
	bgt	.L153
	cmp	r4, r8
	suble	r1, r1, #1
	strle	r1, [r2, #0]
	strle	r7, [r3, #0]
.L153:
	add	r2, r2, #16
	cmp	r2, r6
	bne	.L154
	add	r3, r3, #20
	cmp	r3, r5
	bne	.L155
.L164:
	ldr	r3, .L166+12
	ldr	r6, .L166+4
	add	r5, r3, #400
	mov	r7, #0
	b	.L159
.L156:
	add	r3, r3, #20
	cmp	r3, r5
	beq	.L165
.L159:
	ldr	r2, [r3, #0]
	cmp	r2, #1
	bne	.L156
	ldr	r2, .L166+8
.L158:
	ldr	r1, [r2, #0]
	cmp	r1, #0
	ble	.L157
	ldr	r0, [r2, #-4]
	ldr	ip, [r3, #-8]
	sub	r4, r0, #2
	cmp	r4, ip
	add	r0, r0, #24
	ldr	r4, [r2, #-8]
	ldr	r8, [r3, #-12]
	bgt	.L157
	cmp	ip, r0
	add	r4, r4, #9
	bgt	.L157
	cmp	r4, r8
	subge	r1, r1, #1
	strge	r1, [r2, #0]
	strge	r7, [r3, #0]
.L157:
	add	r2, r2, #16
	cmp	r2, r6
	bne	.L158
	add	r3, r3, #20
	cmp	r3, r5
	bne	.L159
.L165:
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L167:
	.align	2
.L166:
	.word	bombs+12
	.word	bricks+56
	.word	bricks+8
	.word	bullets+12
	.size	updateBricks, .-updateBricks
	.align	2
	.global	drawBricks
	.type	drawBricks, %function
drawBricks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r4, .L177
	ldr	r7, .L177+4
	sub	sp, sp, #12
	add	r5, r4, #48
	mov	r6, #24
.L172:
	ldr	r3, [r4, #0]
	cmp	r3, #3
	beq	.L174
	cmp	r3, #2
	beq	.L175
.L170:
	cmp	r3, #1
	beq	.L176
.L171:
	add	r4, r4, #16
	cmp	r4, r5
	bne	.L172
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L174:
	mov	r3, #10
	ldmdb	r4, {r1, r2}	@ phole ldm
	ldr	r0, .L177+8
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r7
	ldr	r3, [r4, #0]
	cmp	r3, #2
	bne	.L170
.L175:
	mov	r3, #10
	ldmdb	r4, {r1, r2}	@ phole ldm
	ldr	r0, .L177+12
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r7
	ldr	r3, [r4, #0]
	cmp	r3, #1
	bne	.L171
.L176:
	ldmdb	r4, {r1, r2}	@ phole ldm
	ldr	r0, .L177+16
	mov	r3, #10
	str	r6, [sp, #0]
	mov	lr, pc
	bx	r7
	b	.L171
.L178:
	.align	2
.L177:
	.word	bricks+8
	.word	drawImage4
	.word	brickHealth3Bitmap
	.word	brickHealth2Bitmap
	.word	BrickHealth1Bitmap
	.size	drawBricks, .-drawBricks
	.align	2
	.global	drawText
	.type	drawText, %function
drawText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	sub	sp, sp, #8
	mov	r0, r4
	mov	r1, r4
	mov	r2, #160
	mov	r3, #240
	ldr	r5, .L183
	str	r4, [sp, #0]
	mov	lr, pc
	bx	r5
	ldr	r7, .L183+4
	mov	ip, #100
	ldr	r0, .L183+8
	mov	r1, #2
	mov	r2, #40
	mov	r3, #10
	ldr	r6, .L183+12
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r7
	mov	r3, #40
	mov	r0, #2
	mov	r1, #143
	mov	r2, #10
	str	r4, [sp, #0]
	mov	lr, pc
	bx	r5
	ldr	r3, [r6, #0]
	cmp	r3, r4
	ble	.L179
	mov	r5, #145
	mov	r8, #12
.L181:
	mov	r2, r5
	mov	r3, #8
	ldr	r0, .L183+16
	mov	r1, #2
	str	r8, [sp, #0]
	mov	lr, pc
	bx	r7
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #16
	bgt	.L181
.L179:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L184:
	.align	2
.L183:
	.word	drawRect4
	.word	drawImage4
	.word	titleBitmap
	.word	lives
	.word	playerBitmap
	.size	drawText, .-drawText
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L189
	bl	updateBullets
	bl	updateBomb
	bl	updateEnemies
	bl	updateBricks
	bl	updatePlayer
	ldr	r3, .L189+4
	mov	lr, pc
	bx	r3
	bl	drawText
	bl	drawOldBullets
	bl	drawOldBombs
	bl	drawBricks
	bl	drawEnemies
	bl	drawPlayer
	bl	drawNewBullets
	bl	drawNewBombs
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L186
	ldr	r2, .L189+8
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L188
.L186:
	tst	r3, #1
	beq	.L185
	ldr	r3, .L189+8
	ldr	r3, [r3, #0]
	tst	r3, #1
	bne	.L185
	ldmfd	sp!, {r4, lr}
	b	initPause
.L185:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L188:
	bl	initialize
	bl	initSplash
	ldr	r3, [r4, #0]
	b	.L186
.L190:
	.align	2
.L189:
	.word	oldButtons
	.word	waitForVblank
	.word	buttons
	.size	game, .-game
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bl	initialize
	bl	initSplash
	ldr	sl, .L200
	ldr	r4, .L200+4
	ldr	r8, .L200+8
	ldr	r6, .L200+12
	ldr	r5, .L200+16
	mov	r7, #67108864
.L199:
	ldr	r1, [r4, #0]
	ldr	r2, [r7, #304]
	ldr	r3, [r8, #0]
	str	r1, [sl, #0]
	str	r2, [r4, #0]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L192
.L198:
	.word	.L193
	.word	.L194
	.word	.L195
	.word	.L196
	.word	.L197
.L197:
	bl	lose
.L192:
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	b	.L199
.L196:
	bl	win
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	b	.L199
.L195:
	bl	pause
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	b	.L199
.L194:
	bl	game
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	b	.L199
.L193:
	bl	splash
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	b	.L199
.L201:
	.align	2
.L200:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	waitForVblank
	.word	flipPage
	.size	main, .-main
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	state,4,4
	.comm	seed,4,4
	.comm	updateE,4,4
	.comm	updateB,4,4
	.comm	activeBullets,4,4
	.comm	activeBombs,4,4
	.comm	enemiesKilled,4,4
	.comm	lives,4,4
	.comm	needToDrawText,4,4
	.comm	enemies,1200,4
	.comm	oldEnemies,1200,4
	.comm	player,20,4
	.comm	oldPlayer,20,4
	.comm	bullets,400,4
	.comm	oldBullets,400,4
	.comm	bombs,200,4
	.comm	oldBombs,200,4
	.comm	bricks,48,4
	.comm	oldBricks,48,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
