# This is the output of `gcc -S c_revision.c' on my computer.
# You are not required to understand the code here,
# but you should know that this is machine-specific code.
	.file	"c_revision.c"
	.text
	.local	str
	.comm	str,8192,32
	.section	.rodata
.LC0:
	.string	"c_revision.c"
.LC1:
	.string	"str != NULL"
	.text
	.globl	alloc_struct
	.type	alloc_struct, @function
alloc_struct:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L2
	movl	$__PRETTY_FUNCTION__.3018, %ecx
	movl	$16, %edx
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	__assert_fail
.L2:
	movl	$16, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L3
	movl	$0, %eax
	jmp	.L4
.L3:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %eax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L5
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	jmp	.L4
.L5:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	-8(%rbp), %rax
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	alloc_struct, .-alloc_struct
	.globl	free_struct
	.type	free_struct, @function
free_struct:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	free_struct, .-free_struct
	.section	.rodata
.LC2:
	.string	"My arguments are:"
.LC3:
	.string	" %s"
.LC4:
	.string	"Please type some input: "
.LC5:
	.string	"w"
.LC6:
	.string	"out.txt"
.LC7:
	.string	"%u:%s"
.LC8:
	.string	"Thanks!"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -4(%rbp)
	jmp	.L8
.L9:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -4(%rbp)
.L8:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L9
	movl	$10, %edi
	call	putchar
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movq	stdin(%rip), %rax
	movq	%rax, %rdx
	movl	$8192, %esi
	movl	$str, %edi
	call	fgets
	movl	$str, %edi
	call	alloc_struct
	movq	%rax, -16(%rbp)
	movl	$.LC5, %esi
	movl	$.LC6, %edi
	call	fopen
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	$.LC7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$.LC8, %edi
	call	puts
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free_struct
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.3018, @object
	.size	__PRETTY_FUNCTION__.3018, 13
__PRETTY_FUNCTION__.3018:
	.string	"alloc_struct"
	.ident	"GCC: (GNU) 9.1.1 20190503 (Red Hat 9.1.1-1)"
	.section	.note.GNU-stack,"",@progbits
