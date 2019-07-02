# Q4: addressing modes examples

	.data
aa:
	.word	42
bb:
	.word	666
cc:
	.word	1
	.word	3
	.word	5
	.word	7

	.text
	.globl main
main:
	# a. label addressing
	la	$t0, aa

	# b.
	lw	$t0, bb

	# c.
	lb	$t0, bb

	# d. label addressing with offset
	lw	$t0, aa+4

	# e. indirect addressing
	la	$t1, cc
	lw	$t0, ($t1)

	# f. indirect addressing with offset
	la	$t1, cc
	lw	$t0, 8($t1)

	# g. indirect addressing with label offset
	li	$t1, 8
	lw	$t0, cc($t1)

	# h. unaligned read (causes exception)
	la	$t1, cc
	lw	$t0, 2($t1)

	# exit the program
	li	$v0, 10
	syscall
