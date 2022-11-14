	.file	"Dot_Prod_Pntr.cpp"
	.text
	.globl	_Z13Dot_Prod_PntrPfS_i
	.type	_Z13Dot_Prod_PntrPfS_i, @function
_Z13Dot_Prod_PntrPfS_i:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -20(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
.L3:
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	cmpq	%rax, -16(%rbp)
	jnb	.L2
	movq	-16(%rbp), %rax
	movss	(%rax), %xmm1
	movq	-8(%rbp), %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movss	-20(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -20(%rbp)
	addq	$4, -16(%rbp)
	addq	$4, -8(%rbp)
	jmp	.L3
.L2:
	movss	-20(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z13Dot_Prod_PntrPfS_i, .-_Z13Dot_Prod_PntrPfS_i
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
