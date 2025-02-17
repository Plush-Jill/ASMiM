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
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movl	$10, -84(%rbp)
	movl	-84(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -80(%rbp)
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
	movq	%rax, -72(%rbp)
	movl	$0, -104(%rbp)
	jmp	.L5
.L6:
	movq	-72(%rbp), %rax
	movl	-104(%rbp), %edx
	movslq	%edx, %rdx
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, -104(%rbp)
.L5:
	movl	-104(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L6
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -64(%rbp)
	movl	$0, -100(%rbp)
	jmp	.L7
.L10:
	movl	$1, -96(%rbp)
	jmp	.L8
.L9:
	movq	-72(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm0
	movl	-96(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-72(%rbp), %rax
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm1
	divsd	%xmm1, %xmm0
	movq	-72(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, -96(%rbp)
.L8:
	movl	-96(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L9
	addl	$1, -100(%rbp)
.L7:
	cmpl	$99999, -100(%rbp)
	jle	.L10
	movl	$0, %eax
	call	rdtscp@PLT
	movq	%rax, -56(%rbp)
	movl	$0, -92(%rbp)
	jmp	.L11
.L14:
	movl	$1, -88(%rbp)
	jmp	.L12
.L13:
	movq	-72(%rbp), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm0
	movl	-88(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-72(%rbp), %rax
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm1
	divsd	%xmm1, %xmm0
	movq	-72(%rbp), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, -88(%rbp)
.L12:
	movl	-88(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L13
	addl	$1, -92(%rbp)
.L11:
	cmpl	$999999, -92(%rbp)
	jle	.L14
	movl	$0, %eax
	call	rdtscp@PLT
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	subq	-56(%rbp), %rax
	movq	%rax, -40(%rbp)
	movl	-84(%rbp), %eax
	imull	$1000000, %eax, %eax
	movslq	%eax, %rsi
	movq	-40(%rbp), %rax
	movl	$0, %edx
	divq	%rsi
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	%rbx, %rsp
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	movq	-8(%rbp), %rbx
	leave
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
	.align 8
.LC1:
	.long	858993459
	.long	1072902963
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
