# challenge.s: a simple program that says hello, but is vulnerable to hackers!
# Without modifying this program, try to see if you can get it to print the
# string s_win.
#
# Hint 1: you can input hex bytes into SPIM like so:
# echo -e "\x41\x42\x43\x44" | spim -file hello.s
# This will input the bytes 0x41, 0x42, 0x43, 0x44.
#
# Hint 2: Is SPIM little-endian or big-endian?

	.data
s_dont_exec_1:
	.asciiz "==> This is the address (in decimal) of some code: "
s_dont_exec_2:
	.asciiz "\n==> Hope this helps. Please don't abuse it.\n\n"
s_who:
	.asciiz "Hi. What's your name? "
s_hello:
	.asciiz "Hello, "
s_win:
	.ascii	"\n\n===== You win! =====\n\n"
	.ascii  "Have some bonus marks!\n"
	.ascii	"Unless you modified the program.\n"
	.ascii	"No bonus marks in that case, you cheater.\n\000"

	.text
	.globl main
main:
	# stack frame: 32 bytes buf + 16 bytes args + 8 bytes saved $fp and $ra
	addiu	$sp, $sp, -56
	sw	$ra, 52($sp)
	sw	$fp, 48($sp)
	move	$fp, $sp

	la	$a0, s_dont_exec_1
	li	$v0, 4			# print_string
	syscall

	la	$a0, evil_code
	li	$v0, 1			# print_int
	syscall

	la	$a0, s_dont_exec_2
	li	$v0, 4			# print_string
	syscall

	la	$a0, s_who
	li	$v0, 4			# print_string
	syscall

	la	$a0, 16($fp)
	jal	get_name

	la	$a0, s_hello
	li	$v0, 4			# print_string
	syscall

	addiu	$a0, $fp, 16
	li	$v0, 4			# print_string
	syscall

	li	$v0, 0
	move	$sp, $fp
	lw	$ra, 52($sp)
	lw	$fp, 48($sp)
	addiu	$sp, $sp, 56
	jr	$ra

	.globl get_name
get_name:
	# stack frame: 16 bytes args + 8 bytes saved $fp and $ra
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	move	$fp, $sp

	# $a0 already contains buffer
	li	$a1, 64			# whoops...
	li	$v0, 8			# read_string
	syscall

	move	$sp, $fp
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addi	$sp, $sp, 24
	jr	$ra

evil_code:
	# For your safety: please do not run this code.
	# This code may cause a nuclear meltdown.
	# We have ensured this code will never be called.
	la	$a0, s_win
	li	$v0, 4			# print_string
	syscall

	li	$v0, 10			# exit
	syscall
