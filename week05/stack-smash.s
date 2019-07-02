# stack-smash.s: a MIPS assembly translation of stack-smash.c
# This file is generated using GCC, but edited to be more readable.
# N.B. this code won't work, not in SPIM, nor on a real machine.
# Remember: use gcc -S to look at GCC's real assembly output.

	.rdata
	.align	2
s_printf_debug:
	.asciiz	"DEBUG: I have a buffer at %p\n"
	.align	2
s_give_int:
	.asciiz	"Give me an int! "
	.align	2
s_give_long:
	.asciiz	"Give me a long! "
	.align	2
s_give_string:
	.asciiz	"Give me a string! "
	.align	2
s_printf_end:
	.asciiz	"Thank you! I got %d, %ld, %s!\n"

	.text
	.align	2
	.globl	main
main:
	.frame	$fp, 104, $ra		# vars= 72, regs= 2/0, args= 16, gp= 8

	# proluge of main
	addiu	$sp, $sp, -104
	sw	$ra, 100($sp)
	sw	$fp, 96($sp)
	move	$fp, $sp

	# we are going to overwrite $a0 and $a1, so save them into their
	# reserved storage on the stack, in case we want to use them later.
	sw	$a0, 104($sp)
	sw	$a1, 108($sp)
	la	$a1, 32($sp)	# buf
	la	$a0, s_printf_debug
	jal	printf
	nop

	la	$a0, s_give_int
	jal	printf
	nop

	la	$a0, 32($sp)	# buf
	jal	get_string
	nop

	jal	atoi		# buf is already in $a0
	nop
	sw	$v0, 24($sp)	# i

	la	$a0, s_give_long
	jal	printf
	nop

	la	$a0, 32($sp)	# buf
	jal	get_string
	nop

	jal	atol		# buf is already in $a0
	nop
	sw	$v0, 28($sp)	# l

	la	$a0, s_give_string
	jal	printf
	nop

	la	$a0, 32($sp)	# buf
	jal	get_string
	nop

	la	$a0, s_printf_end
	lw	$a1, 24($sp)	# i
	lw	$a2, 28($sp)	# l
	la	$a3, 32($sp)	# buf
	jal	printf
	nop

	# epilogue of main
	move	$v0, $0
	move	$sp, $fp
	lw	$ra, 100($sp)
	lw	$fp, 96($sp)
	addiu	$sp, $sp, 104
	jr	$ra
	nop


	.text
	.align	2
	.globl	get_string
get_string:
	.frame	$fp, 32, $ra		# vars= 0, regs= 2/0, args= 16, gp= 8

	addiu	$sp, $sp, -32
	sw	$ra, 28($sp)
	sw	$fp, 24($sp)
	move	$fp, $sp

	sw	$a0, 32($fp)

	# s is already in $a0
	li	$a1, 128
	lw	$a2, stdin
	jal	fgets
	nop

	move	$sp, $fp
	lw	$ra, 28($sp)
	lw	$fp, 24($sp)
	addiu	$sp, $sp, 32
	jr	$ra
	nop
