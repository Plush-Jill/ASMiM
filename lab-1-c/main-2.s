	.file	"main.c"
	.text
	.section	.rodata
.LC2:
	.string	"Clock per operation: %lu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %r15
	movl	$10, %r12d
	movl	%r12d, %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -88(%rbp)
	cltq
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L2:
	cmpq	%rdx, %rsp
	je	.L3
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L2
.L3:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L4
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L4:
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -80(%rbp)
	movl	$0, -92(%rbp)
	jmp	.L5
.L6:
	movq	-80(%rbp), %rax
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, -92(%rbp)
.L5:
	cmpl	%r12d, -92(%rbp)
	jl	.L6
	movl	$0, %r13d
	jmp	.L7
.L10:
	movl	$1, %ebx
	jmp	.L8
.L9:
	movq	-80(%rbp), %rax
	movslq	%ebx, %rdx
	movsd	(%rax,%rdx,8), %xmm0
	leal	-1(%rbx), %edx
	movq	-80(%rbp), %rax
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm1
	divsd	%xmm1, %xmm0
	movq	-80(%rbp), %rax
	movslq	%ebx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, %ebx
.L8:
	cmpl	%r12d, %ebx
	jl	.L9
	addl	$1, %r13d
.L7:
	cmpl	$99999, %r13d
	jle	.L10
	movl	$0, %eax
	call	rdtscp@PLT
	movq	%rax, %r14
	movl	$0, %r13d
	jmp	.L11
.L14:
	movl	$1, %ebx
	jmp	.L12
.L13:
	movq	-80(%rbp), %rax
	movslq	%ebx, %rdx
	movsd	(%rax,%rdx,8), %xmm0
	leal	-1(%rbx), %edx
	movq	-80(%rbp), %rax
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm1
	divsd	%xmm1, %xmm0
	movq	-80(%rbp), %rax
	movslq	%ebx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, %ebx
.L12:
	cmpl	%r12d, %ebx
	jl	.L13
	addl	$1, %r13d
.L11:
	cmpl	$999999, %r13d
	jle	.L14
	movl	$0, %eax
	call	rdtscp@PLT
	movq	%rax, %rbx
	movq	%rbx, %rax
	subq	%r14, %rax
	movq	%rax, -72(%rbp)
	imull	$1000000, %r12d, %eax
	movslq	%eax, %rsi
	movq	-72(%rbp), %rax
	movl	$0, %edx
	divq	%rsi
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	%r15, %rsp
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	-1717986918
	.long	1072798105
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
