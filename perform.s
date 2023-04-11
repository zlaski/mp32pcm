	.file	"perform.c"
	.text
.Ltext0:
	.type	mk_sample, @function
mk_sample:
.LFB2:
	.file 1 "mp32pcm.w"
	.loc 1 3656 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 3656 0
	movsd	.LC0(%rip), %xmm1
	andpd	%xmm0, %xmm1
	movsd	.LC1(%rip), %xmm2
	ucomisd	%xmm1, %xmm2
	jb	.L9
	.loc 1 3659 0
	cvttsd2si	%xmm0, %eax
	jmp	.L4
.L9:
	.loc 1 3665 0
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jbe	.L10
	.loc 1 3666 0
	movl	$2147483647, %eax
	jmp	.L4
.L10:
	.loc 1 3668 0
	movl	$-2147483648, %eax
.L4:
	.loc 1 3669 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	mk_sample, .-mk_sample
	.globl	windowing
	.type	windowing, @function
windowing:
.LFB3:
	.loc 1 886 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	.loc 1 11176 0
	movq	-16(%rbp), %rax
	addq	$384, %rax
	movsd	(%rax), %xmm1
	movsd	.LC3(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$640, %rax
	movsd	(%rax), %xmm2
	movsd	.LC4(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$896, %rax
	movsd	(%rax), %xmm2
	movsd	.LC5(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1152, %rax
	movsd	(%rax), %xmm2
	movsd	.LC6(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1408, %rax
	movsd	(%rax), %xmm2
	movsd	.LC7(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1664, %rax
	movsd	(%rax), %xmm2
	movsd	.LC8(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1920, %rax
	movsd	(%rax), %xmm2
	movsd	.LC9(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2176, %rax
	movsd	(%rax), %xmm2
	movsd	.LC10(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2432, %rax
	movsd	(%rax), %xmm2
	movsd	.LC9(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2688, %rax
	movsd	(%rax), %xmm2
	movsd	.LC8(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2944, %rax
	movsd	(%rax), %xmm2
	movsd	.LC7(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3200, %rax
	movsd	(%rax), %xmm2
	movsd	.LC6(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3456, %rax
	movsd	(%rax), %xmm2
	movsd	.LC5(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3712, %rax
	movsd	(%rax), %xmm2
	movsd	.LC4(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3968, %rax
	movsd	(%rax), %xmm2
	movsd	.LC3(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movq	-24(%rbp), %rdx
	movl	%eax, (%rdx)
	.loc 1 11177 0
	movq	-24(%rbp), %rax
	leaq	8(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$136, %rax
	movsd	(%rax), %xmm1
	movsd	.LC11(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$376, %rax
	movsd	(%rax), %xmm2
	movsd	.LC12(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$648, %rax
	movsd	(%rax), %xmm2
	movsd	.LC13(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$888, %rax
	movsd	(%rax), %xmm2
	movsd	.LC14(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1160, %rax
	movsd	(%rax), %xmm2
	movsd	.LC15(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1400, %rax
	movsd	(%rax), %xmm2
	movsd	.LC16(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1672, %rax
	movsd	(%rax), %xmm2
	movsd	.LC17(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1912, %rax
	movsd	(%rax), %xmm2
	movsd	.LC18(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2184, %rax
	movsd	(%rax), %xmm2
	movsd	.LC19(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2424, %rax
	movsd	(%rax), %xmm2
	movsd	.LC20(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2696, %rax
	movsd	(%rax), %xmm2
	movsd	.LC21(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2936, %rax
	movsd	(%rax), %xmm2
	movsd	.LC22(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3208, %rax
	movsd	(%rax), %xmm2
	movsd	.LC23(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3448, %rax
	movsd	(%rax), %xmm2
	movsd	.LC24(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3720, %rax
	movsd	(%rax), %xmm2
	movsd	.LC25(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3960, %rax
	movsd	(%rax), %xmm2
	movsd	.LC26(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11178 0
	movq	-24(%rbp), %rax
	leaq	16(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$144, %rax
	movsd	(%rax), %xmm1
	movsd	.LC27(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$368, %rax
	movsd	(%rax), %xmm2
	movsd	.LC28(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$656, %rax
	movsd	(%rax), %xmm2
	movsd	.LC29(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$880, %rax
	movsd	(%rax), %xmm2
	movsd	.LC30(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1168, %rax
	movsd	(%rax), %xmm2
	movsd	.LC31(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1392, %rax
	movsd	(%rax), %xmm2
	movsd	.LC32(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1680, %rax
	movsd	(%rax), %xmm2
	movsd	.LC33(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1904, %rax
	movsd	(%rax), %xmm2
	movsd	.LC34(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2192, %rax
	movsd	(%rax), %xmm2
	movsd	.LC35(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2416, %rax
	movsd	(%rax), %xmm2
	movsd	.LC36(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2704, %rax
	movsd	(%rax), %xmm2
	movsd	.LC37(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2928, %rax
	movsd	(%rax), %xmm2
	movsd	.LC38(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3216, %rax
	movsd	(%rax), %xmm2
	movsd	.LC39(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3440, %rax
	movsd	(%rax), %xmm2
	movsd	.LC40(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3728, %rax
	movsd	(%rax), %xmm2
	movsd	.LC41(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3952, %rax
	movsd	(%rax), %xmm2
	movsd	.LC42(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11179 0
	movq	-24(%rbp), %rax
	leaq	24(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$152, %rax
	movsd	(%rax), %xmm1
	movsd	.LC43(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$360, %rax
	movsd	(%rax), %xmm2
	movsd	.LC44(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$664, %rax
	movsd	(%rax), %xmm2
	movsd	.LC45(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$872, %rax
	movsd	(%rax), %xmm2
	movsd	.LC46(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1176, %rax
	movsd	(%rax), %xmm2
	movsd	.LC47(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1384, %rax
	movsd	(%rax), %xmm2
	movsd	.LC48(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1688, %rax
	movsd	(%rax), %xmm2
	movsd	.LC49(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1896, %rax
	movsd	(%rax), %xmm2
	movsd	.LC50(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2200, %rax
	movsd	(%rax), %xmm2
	movsd	.LC51(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2408, %rax
	movsd	(%rax), %xmm2
	movsd	.LC52(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2712, %rax
	movsd	(%rax), %xmm2
	movsd	.LC53(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2920, %rax
	movsd	(%rax), %xmm2
	movsd	.LC54(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3224, %rax
	movsd	(%rax), %xmm2
	movsd	.LC55(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3432, %rax
	movsd	(%rax), %xmm2
	movsd	.LC56(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3736, %rax
	movsd	(%rax), %xmm2
	movsd	.LC57(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3944, %rax
	movsd	(%rax), %xmm2
	movsd	.LC58(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11180 0
	movq	-24(%rbp), %rax
	leaq	32(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$160, %rax
	movsd	(%rax), %xmm1
	movsd	.LC59(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$352, %rax
	movsd	(%rax), %xmm2
	movsd	.LC60(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$672, %rax
	movsd	(%rax), %xmm2
	movsd	.LC61(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$864, %rax
	movsd	(%rax), %xmm2
	movsd	.LC62(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1184, %rax
	movsd	(%rax), %xmm2
	movsd	.LC63(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1376, %rax
	movsd	(%rax), %xmm2
	movsd	.LC64(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1696, %rax
	movsd	(%rax), %xmm2
	movsd	.LC65(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1888, %rax
	movsd	(%rax), %xmm2
	movsd	.LC66(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2208, %rax
	movsd	(%rax), %xmm2
	movsd	.LC67(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2400, %rax
	movsd	(%rax), %xmm2
	movsd	.LC68(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2720, %rax
	movsd	(%rax), %xmm2
	movsd	.LC69(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2912, %rax
	movsd	(%rax), %xmm2
	movsd	.LC70(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3232, %rax
	movsd	(%rax), %xmm2
	movsd	.LC71(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3424, %rax
	movsd	(%rax), %xmm2
	movsd	.LC72(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3744, %rax
	movsd	(%rax), %xmm2
	movsd	.LC73(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3936, %rax
	movsd	(%rax), %xmm2
	movsd	.LC74(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11181 0
	movq	-24(%rbp), %rax
	leaq	40(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$168, %rax
	movsd	(%rax), %xmm1
	movsd	.LC75(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$344, %rax
	movsd	(%rax), %xmm2
	movsd	.LC76(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$680, %rax
	movsd	(%rax), %xmm2
	movsd	.LC77(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$856, %rax
	movsd	(%rax), %xmm2
	movsd	.LC78(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1192, %rax
	movsd	(%rax), %xmm2
	movsd	.LC79(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1368, %rax
	movsd	(%rax), %xmm2
	movsd	.LC80(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1704, %rax
	movsd	(%rax), %xmm2
	movsd	.LC81(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1880, %rax
	movsd	(%rax), %xmm2
	movsd	.LC82(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2216, %rax
	movsd	(%rax), %xmm2
	movsd	.LC83(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2392, %rax
	movsd	(%rax), %xmm2
	movsd	.LC84(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2728, %rax
	movsd	(%rax), %xmm2
	movsd	.LC85(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2904, %rax
	movsd	(%rax), %xmm2
	movsd	.LC86(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3240, %rax
	movsd	(%rax), %xmm2
	movsd	.LC87(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3416, %rax
	movsd	(%rax), %xmm2
	movsd	.LC88(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3752, %rax
	movsd	(%rax), %xmm2
	movsd	.LC89(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3928, %rax
	movsd	(%rax), %xmm2
	movsd	.LC90(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11182 0
	movq	-24(%rbp), %rax
	leaq	48(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$176, %rax
	movsd	(%rax), %xmm1
	movsd	.LC91(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$336, %rax
	movsd	(%rax), %xmm2
	movsd	.LC92(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$688, %rax
	movsd	(%rax), %xmm2
	movsd	.LC93(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$848, %rax
	movsd	(%rax), %xmm2
	movsd	.LC94(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1200, %rax
	movsd	(%rax), %xmm2
	movsd	.LC95(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1360, %rax
	movsd	(%rax), %xmm2
	movsd	.LC96(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1712, %rax
	movsd	(%rax), %xmm2
	movsd	.LC97(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1872, %rax
	movsd	(%rax), %xmm2
	movsd	.LC98(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2224, %rax
	movsd	(%rax), %xmm2
	movsd	.LC99(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2384, %rax
	movsd	(%rax), %xmm2
	movsd	.LC100(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2736, %rax
	movsd	(%rax), %xmm2
	movsd	.LC101(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2896, %rax
	movsd	(%rax), %xmm2
	movsd	.LC102(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3248, %rax
	movsd	(%rax), %xmm2
	movsd	.LC103(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3408, %rax
	movsd	(%rax), %xmm2
	movsd	.LC104(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3760, %rax
	movsd	(%rax), %xmm2
	movsd	.LC105(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3920, %rax
	movsd	(%rax), %xmm2
	movsd	.LC106(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11183 0
	movq	-24(%rbp), %rax
	leaq	56(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$184, %rax
	movsd	(%rax), %xmm1
	movsd	.LC107(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$328, %rax
	movsd	(%rax), %xmm2
	movsd	.LC108(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$696, %rax
	movsd	(%rax), %xmm2
	movsd	.LC109(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$840, %rax
	movsd	(%rax), %xmm2
	movsd	.LC110(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1208, %rax
	movsd	(%rax), %xmm2
	movsd	.LC111(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1352, %rax
	movsd	(%rax), %xmm2
	movsd	.LC112(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1720, %rax
	movsd	(%rax), %xmm2
	movsd	.LC113(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1864, %rax
	movsd	(%rax), %xmm2
	movsd	.LC114(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2232, %rax
	movsd	(%rax), %xmm2
	movsd	.LC115(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2376, %rax
	movsd	(%rax), %xmm2
	movsd	.LC116(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2744, %rax
	movsd	(%rax), %xmm2
	movsd	.LC117(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2888, %rax
	movsd	(%rax), %xmm2
	movsd	.LC118(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3256, %rax
	movsd	(%rax), %xmm2
	movsd	.LC119(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3400, %rax
	movsd	(%rax), %xmm2
	movsd	.LC120(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3768, %rax
	movsd	(%rax), %xmm2
	movsd	.LC121(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3912, %rax
	movsd	(%rax), %xmm2
	movsd	.LC122(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11184 0
	movq	-24(%rbp), %rax
	leaq	64(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$192, %rax
	movsd	(%rax), %xmm1
	movsd	.LC123(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$320, %rax
	movsd	(%rax), %xmm2
	movsd	.LC124(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$704, %rax
	movsd	(%rax), %xmm2
	movsd	.LC125(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$832, %rax
	movsd	(%rax), %xmm2
	movsd	.LC126(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1216, %rax
	movsd	(%rax), %xmm2
	movsd	.LC127(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1344, %rax
	movsd	(%rax), %xmm2
	movsd	.LC128(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1728, %rax
	movsd	(%rax), %xmm2
	movsd	.LC129(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1856, %rax
	movsd	(%rax), %xmm2
	movsd	.LC130(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2240, %rax
	movsd	(%rax), %xmm2
	movsd	.LC131(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2368, %rax
	movsd	(%rax), %xmm2
	movsd	.LC132(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2752, %rax
	movsd	(%rax), %xmm2
	movsd	.LC133(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2880, %rax
	movsd	(%rax), %xmm2
	movsd	.LC134(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3264, %rax
	movsd	(%rax), %xmm2
	movsd	.LC135(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3392, %rax
	movsd	(%rax), %xmm2
	movsd	.LC136(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3776, %rax
	movsd	(%rax), %xmm2
	movsd	.LC137(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3904, %rax
	movsd	(%rax), %xmm2
	movsd	.LC138(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11185 0
	movq	-24(%rbp), %rax
	leaq	72(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$200, %rax
	movsd	(%rax), %xmm1
	movsd	.LC139(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$312, %rax
	movsd	(%rax), %xmm2
	movsd	.LC140(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$712, %rax
	movsd	(%rax), %xmm2
	movsd	.LC141(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$824, %rax
	movsd	(%rax), %xmm2
	movsd	.LC142(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1224, %rax
	movsd	(%rax), %xmm2
	movsd	.LC143(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1336, %rax
	movsd	(%rax), %xmm2
	movsd	.LC144(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$1736, %rax
	movsd	(%rax), %xmm2
	movsd	.LC145(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1848, %rax
	movsd	(%rax), %xmm2
	movsd	.LC146(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2248, %rax
	movsd	(%rax), %xmm2
	movsd	.LC147(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2360, %rax
	movsd	(%rax), %xmm2
	movsd	.LC148(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2760, %rax
	movsd	(%rax), %xmm2
	movsd	.LC149(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2872, %rax
	movsd	(%rax), %xmm2
	movsd	.LC150(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3272, %rax
	movsd	(%rax), %xmm2
	movsd	.LC151(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3384, %rax
	movsd	(%rax), %xmm2
	movsd	.LC152(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3784, %rax
	movsd	(%rax), %xmm2
	movsd	.LC153(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3896, %rax
	movsd	(%rax), %xmm2
	movsd	.LC154(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11186 0
	movq	-24(%rbp), %rax
	leaq	80(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$208, %rax
	movsd	(%rax), %xmm1
	movsd	.LC155(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$304, %rax
	movsd	(%rax), %xmm2
	movsd	.LC156(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$720, %rax
	movsd	(%rax), %xmm2
	movsd	.LC157(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$816, %rax
	movsd	(%rax), %xmm2
	movsd	.LC158(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1232, %rax
	movsd	(%rax), %xmm2
	movsd	.LC159(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1328, %rax
	movsd	(%rax), %xmm2
	movsd	.LC160(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$1744, %rax
	movsd	(%rax), %xmm2
	movsd	.LC161(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1840, %rax
	movsd	(%rax), %xmm2
	movsd	.LC162(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2256, %rax
	movsd	(%rax), %xmm2
	movsd	.LC163(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2352, %rax
	movsd	(%rax), %xmm2
	movsd	.LC164(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2768, %rax
	movsd	(%rax), %xmm2
	movsd	.LC165(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2864, %rax
	movsd	(%rax), %xmm2
	movsd	.LC166(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3280, %rax
	movsd	(%rax), %xmm2
	movsd	.LC167(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3376, %rax
	movsd	(%rax), %xmm2
	movsd	.LC168(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3792, %rax
	movsd	(%rax), %xmm2
	movsd	.LC169(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3888, %rax
	movsd	(%rax), %xmm2
	movsd	.LC170(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11187 0
	movq	-24(%rbp), %rax
	leaq	88(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$216, %rax
	movsd	(%rax), %xmm1
	movsd	.LC171(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$296, %rax
	movsd	(%rax), %xmm2
	movsd	.LC172(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$728, %rax
	movsd	(%rax), %xmm2
	movsd	.LC173(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$808, %rax
	movsd	(%rax), %xmm2
	movsd	.LC174(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1240, %rax
	movsd	(%rax), %xmm2
	movsd	.LC175(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1320, %rax
	movsd	(%rax), %xmm2
	movsd	.LC176(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$1752, %rax
	movsd	(%rax), %xmm2
	movsd	.LC177(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1832, %rax
	movsd	(%rax), %xmm2
	movsd	.LC178(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2264, %rax
	movsd	(%rax), %xmm2
	movsd	.LC179(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2344, %rax
	movsd	(%rax), %xmm2
	movsd	.LC180(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2776, %rax
	movsd	(%rax), %xmm2
	movsd	.LC181(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2856, %rax
	movsd	(%rax), %xmm2
	movsd	.LC182(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3288, %rax
	movsd	(%rax), %xmm2
	movsd	.LC183(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3368, %rax
	movsd	(%rax), %xmm2
	movsd	.LC184(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3800, %rax
	movsd	(%rax), %xmm2
	movsd	.LC185(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3880, %rax
	movsd	(%rax), %xmm2
	movsd	.LC186(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11188 0
	movq	-24(%rbp), %rax
	leaq	96(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$224, %rax
	movsd	(%rax), %xmm1
	movsd	.LC187(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$288, %rax
	movsd	(%rax), %xmm2
	movsd	.LC188(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$736, %rax
	movsd	(%rax), %xmm2
	movsd	.LC189(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$800, %rax
	movsd	(%rax), %xmm2
	movsd	.LC190(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1248, %rax
	movsd	(%rax), %xmm2
	movsd	.LC191(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1312, %rax
	movsd	(%rax), %xmm2
	movsd	.LC192(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$1760, %rax
	movsd	(%rax), %xmm2
	movsd	.LC193(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1824, %rax
	movsd	(%rax), %xmm2
	movsd	.LC194(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2272, %rax
	movsd	(%rax), %xmm2
	movsd	.LC195(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2336, %rax
	movsd	(%rax), %xmm2
	movsd	.LC196(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2784, %rax
	movsd	(%rax), %xmm2
	movsd	.LC197(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2848, %rax
	movsd	(%rax), %xmm2
	movsd	.LC198(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3296, %rax
	movsd	(%rax), %xmm2
	movsd	.LC199(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3360, %rax
	movsd	(%rax), %xmm2
	movsd	.LC200(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3808, %rax
	movsd	(%rax), %xmm2
	movsd	.LC201(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3872, %rax
	movsd	(%rax), %xmm2
	movsd	.LC202(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11189 0
	movq	-24(%rbp), %rax
	leaq	104(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$232, %rax
	movsd	(%rax), %xmm1
	movsd	.LC203(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$280, %rax
	movsd	(%rax), %xmm2
	movsd	.LC204(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$744, %rax
	movsd	(%rax), %xmm2
	movsd	.LC205(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$792, %rax
	movsd	(%rax), %xmm2
	movsd	.LC206(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1256, %rax
	movsd	(%rax), %xmm2
	movsd	.LC207(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1304, %rax
	movsd	(%rax), %xmm2
	movsd	.LC208(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$1768, %rax
	movsd	(%rax), %xmm2
	movsd	.LC209(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1816, %rax
	movsd	(%rax), %xmm2
	movsd	.LC210(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2280, %rax
	movsd	(%rax), %xmm2
	movsd	.LC211(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2328, %rax
	movsd	(%rax), %xmm2
	movsd	.LC212(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2792, %rax
	movsd	(%rax), %xmm2
	movsd	.LC213(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2840, %rax
	movsd	(%rax), %xmm2
	movsd	.LC214(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3304, %rax
	movsd	(%rax), %xmm2
	movsd	.LC215(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3352, %rax
	movsd	(%rax), %xmm2
	movsd	.LC216(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3816, %rax
	movsd	(%rax), %xmm2
	movsd	.LC217(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3864, %rax
	movsd	(%rax), %xmm2
	movsd	.LC218(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11190 0
	movq	-24(%rbp), %rax
	leaq	112(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$240, %rax
	movsd	(%rax), %xmm1
	movsd	.LC219(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$272, %rax
	movsd	(%rax), %xmm2
	movsd	.LC220(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$752, %rax
	movsd	(%rax), %xmm2
	movsd	.LC221(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$784, %rax
	movsd	(%rax), %xmm2
	movsd	.LC222(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1264, %rax
	movsd	(%rax), %xmm2
	movsd	.LC223(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1296, %rax
	movsd	(%rax), %xmm2
	movsd	.LC224(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$1776, %rax
	movsd	(%rax), %xmm2
	movsd	.LC225(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1808, %rax
	movsd	(%rax), %xmm2
	movsd	.LC226(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2288, %rax
	movsd	(%rax), %xmm2
	movsd	.LC227(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2320, %rax
	movsd	(%rax), %xmm2
	movsd	.LC228(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2800, %rax
	movsd	(%rax), %xmm2
	movsd	.LC229(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2832, %rax
	movsd	(%rax), %xmm2
	movsd	.LC230(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3312, %rax
	movsd	(%rax), %xmm2
	movsd	.LC231(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3344, %rax
	movsd	(%rax), %xmm2
	movsd	.LC232(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3824, %rax
	movsd	(%rax), %xmm2
	movsd	.LC233(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3856, %rax
	movsd	(%rax), %xmm2
	movsd	.LC234(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11191 0
	movq	-24(%rbp), %rax
	leaq	120(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$248, %rax
	movsd	(%rax), %xmm1
	movsd	.LC235(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$264, %rax
	movsd	(%rax), %xmm2
	movsd	.LC236(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$760, %rax
	movsd	(%rax), %xmm2
	movsd	.LC237(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$776, %rax
	movsd	(%rax), %xmm2
	movsd	.LC238(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1272, %rax
	movsd	(%rax), %xmm2
	movsd	.LC239(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1288, %rax
	movsd	(%rax), %xmm2
	movsd	.LC240(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$1784, %rax
	movsd	(%rax), %xmm2
	movsd	.LC241(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1800, %rax
	movsd	(%rax), %xmm2
	movsd	.LC242(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2296, %rax
	movsd	(%rax), %xmm2
	movsd	.LC243(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2312, %rax
	movsd	(%rax), %xmm2
	movsd	.LC244(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2808, %rax
	movsd	(%rax), %xmm2
	movsd	.LC245(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2824, %rax
	movsd	(%rax), %xmm2
	movsd	.LC246(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3320, %rax
	movsd	(%rax), %xmm2
	movsd	.LC247(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3336, %rax
	movsd	(%rax), %xmm2
	movsd	.LC248(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3832, %rax
	movsd	(%rax), %xmm2
	movsd	.LC249(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3848, %rax
	movsd	(%rax), %xmm2
	movsd	.LC250(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11192 0
	movq	-24(%rbp), %rax
	leaq	128(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$256, %rax
	movsd	(%rax), %xmm1
	movsd	.LC251(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$768, %rax
	movsd	(%rax), %xmm2
	movsd	.LC252(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1280, %rax
	movsd	(%rax), %xmm2
	movsd	.LC253(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1792, %rax
	movsd	(%rax), %xmm2
	movsd	.LC254(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2304, %rax
	movsd	(%rax), %xmm2
	movsd	.LC255(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2816, %rax
	movsd	(%rax), %xmm2
	movsd	.LC256(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3328, %rax
	movsd	(%rax), %xmm2
	movsd	.LC257(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3840, %rax
	movsd	(%rax), %xmm2
	movsd	.LC258(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11193 0
	movq	-24(%rbp), %rax
	leaq	136(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$248, %rax
	movsd	(%rax), %xmm1
	movsd	.LC259(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$264, %rax
	movsd	(%rax), %xmm2
	movsd	.LC260(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$760, %rax
	movsd	(%rax), %xmm2
	movsd	.LC261(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$776, %rax
	movsd	(%rax), %xmm2
	movsd	.LC262(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1272, %rax
	movsd	(%rax), %xmm2
	movsd	.LC263(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1288, %rax
	movsd	(%rax), %xmm2
	movsd	.LC264(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1784, %rax
	movsd	(%rax), %xmm2
	movsd	.LC265(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1800, %rax
	movsd	(%rax), %xmm2
	movsd	.LC266(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2296, %rax
	movsd	(%rax), %xmm2
	movsd	.LC267(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2312, %rax
	movsd	(%rax), %xmm2
	movsd	.LC268(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2808, %rax
	movsd	(%rax), %xmm2
	movsd	.LC269(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2824, %rax
	movsd	(%rax), %xmm2
	movsd	.LC270(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3320, %rax
	movsd	(%rax), %xmm2
	movsd	.LC271(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3336, %rax
	movsd	(%rax), %xmm2
	movsd	.LC272(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3832, %rax
	movsd	(%rax), %xmm2
	movsd	.LC273(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3848, %rax
	movsd	(%rax), %xmm2
	movsd	.LC274(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11194 0
	movq	-24(%rbp), %rax
	leaq	144(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$240, %rax
	movsd	(%rax), %xmm1
	movsd	.LC275(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$272, %rax
	movsd	(%rax), %xmm2
	movsd	.LC276(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$752, %rax
	movsd	(%rax), %xmm2
	movsd	.LC277(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$784, %rax
	movsd	(%rax), %xmm2
	movsd	.LC278(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1264, %rax
	movsd	(%rax), %xmm2
	movsd	.LC279(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1296, %rax
	movsd	(%rax), %xmm2
	movsd	.LC280(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1776, %rax
	movsd	(%rax), %xmm2
	movsd	.LC281(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1808, %rax
	movsd	(%rax), %xmm2
	movsd	.LC282(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2288, %rax
	movsd	(%rax), %xmm2
	movsd	.LC283(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2320, %rax
	movsd	(%rax), %xmm2
	movsd	.LC284(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2800, %rax
	movsd	(%rax), %xmm2
	movsd	.LC285(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2832, %rax
	movsd	(%rax), %xmm2
	movsd	.LC286(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3312, %rax
	movsd	(%rax), %xmm2
	movsd	.LC287(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3344, %rax
	movsd	(%rax), %xmm2
	movsd	.LC288(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3824, %rax
	movsd	(%rax), %xmm2
	movsd	.LC289(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3856, %rax
	movsd	(%rax), %xmm2
	movsd	.LC290(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11195 0
	movq	-24(%rbp), %rax
	leaq	152(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$232, %rax
	movsd	(%rax), %xmm1
	movsd	.LC291(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$280, %rax
	movsd	(%rax), %xmm2
	movsd	.LC292(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$744, %rax
	movsd	(%rax), %xmm2
	movsd	.LC293(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$792, %rax
	movsd	(%rax), %xmm2
	movsd	.LC294(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1256, %rax
	movsd	(%rax), %xmm2
	movsd	.LC295(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1304, %rax
	movsd	(%rax), %xmm2
	movsd	.LC296(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1768, %rax
	movsd	(%rax), %xmm2
	movsd	.LC297(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1816, %rax
	movsd	(%rax), %xmm2
	movsd	.LC298(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2280, %rax
	movsd	(%rax), %xmm2
	movsd	.LC299(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2328, %rax
	movsd	(%rax), %xmm2
	movsd	.LC300(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2792, %rax
	movsd	(%rax), %xmm2
	movsd	.LC301(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2840, %rax
	movsd	(%rax), %xmm2
	movsd	.LC302(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3304, %rax
	movsd	(%rax), %xmm2
	movsd	.LC303(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3352, %rax
	movsd	(%rax), %xmm2
	movsd	.LC304(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3816, %rax
	movsd	(%rax), %xmm2
	movsd	.LC305(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3864, %rax
	movsd	(%rax), %xmm2
	movsd	.LC306(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11196 0
	movq	-24(%rbp), %rax
	leaq	160(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$224, %rax
	movsd	(%rax), %xmm1
	movsd	.LC307(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$288, %rax
	movsd	(%rax), %xmm2
	movsd	.LC308(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$736, %rax
	movsd	(%rax), %xmm2
	movsd	.LC309(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$800, %rax
	movsd	(%rax), %xmm2
	movsd	.LC310(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1248, %rax
	movsd	(%rax), %xmm2
	movsd	.LC311(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1312, %rax
	movsd	(%rax), %xmm2
	movsd	.LC312(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1760, %rax
	movsd	(%rax), %xmm2
	movsd	.LC313(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1824, %rax
	movsd	(%rax), %xmm2
	movsd	.LC314(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2272, %rax
	movsd	(%rax), %xmm2
	movsd	.LC315(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2336, %rax
	movsd	(%rax), %xmm2
	movsd	.LC316(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2784, %rax
	movsd	(%rax), %xmm2
	movsd	.LC317(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2848, %rax
	movsd	(%rax), %xmm2
	movsd	.LC318(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3296, %rax
	movsd	(%rax), %xmm2
	movsd	.LC319(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3360, %rax
	movsd	(%rax), %xmm2
	movsd	.LC320(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3808, %rax
	movsd	(%rax), %xmm2
	movsd	.LC321(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3872, %rax
	movsd	(%rax), %xmm2
	movsd	.LC322(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11197 0
	movq	-24(%rbp), %rax
	leaq	168(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$216, %rax
	movsd	(%rax), %xmm1
	movsd	.LC323(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$296, %rax
	movsd	(%rax), %xmm2
	movsd	.LC324(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$728, %rax
	movsd	(%rax), %xmm2
	movsd	.LC325(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$808, %rax
	movsd	(%rax), %xmm2
	movsd	.LC326(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1240, %rax
	movsd	(%rax), %xmm2
	movsd	.LC327(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1320, %rax
	movsd	(%rax), %xmm2
	movsd	.LC328(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1752, %rax
	movsd	(%rax), %xmm2
	movsd	.LC329(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1832, %rax
	movsd	(%rax), %xmm2
	movsd	.LC330(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2264, %rax
	movsd	(%rax), %xmm2
	movsd	.LC331(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2344, %rax
	movsd	(%rax), %xmm2
	movsd	.LC332(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2776, %rax
	movsd	(%rax), %xmm2
	movsd	.LC333(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2856, %rax
	movsd	(%rax), %xmm2
	movsd	.LC334(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3288, %rax
	movsd	(%rax), %xmm2
	movsd	.LC335(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3368, %rax
	movsd	(%rax), %xmm2
	movsd	.LC336(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3800, %rax
	movsd	(%rax), %xmm2
	movsd	.LC337(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3880, %rax
	movsd	(%rax), %xmm2
	movsd	.LC338(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11198 0
	movq	-24(%rbp), %rax
	leaq	176(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$208, %rax
	movsd	(%rax), %xmm1
	movsd	.LC339(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$304, %rax
	movsd	(%rax), %xmm2
	movsd	.LC340(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$720, %rax
	movsd	(%rax), %xmm2
	movsd	.LC341(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$816, %rax
	movsd	(%rax), %xmm2
	movsd	.LC342(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1232, %rax
	movsd	(%rax), %xmm2
	movsd	.LC343(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1328, %rax
	movsd	(%rax), %xmm2
	movsd	.LC344(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1744, %rax
	movsd	(%rax), %xmm2
	movsd	.LC345(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1840, %rax
	movsd	(%rax), %xmm2
	movsd	.LC346(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2256, %rax
	movsd	(%rax), %xmm2
	movsd	.LC347(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2352, %rax
	movsd	(%rax), %xmm2
	movsd	.LC348(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2768, %rax
	movsd	(%rax), %xmm2
	movsd	.LC349(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2864, %rax
	movsd	(%rax), %xmm2
	movsd	.LC350(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3280, %rax
	movsd	(%rax), %xmm2
	movsd	.LC351(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3376, %rax
	movsd	(%rax), %xmm2
	movsd	.LC352(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3792, %rax
	movsd	(%rax), %xmm2
	movsd	.LC353(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3888, %rax
	movsd	(%rax), %xmm2
	movsd	.LC168(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11199 0
	movq	-24(%rbp), %rax
	leaq	184(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$200, %rax
	movsd	(%rax), %xmm1
	movsd	.LC354(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$312, %rax
	movsd	(%rax), %xmm2
	movsd	.LC355(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$712, %rax
	movsd	(%rax), %xmm2
	movsd	.LC356(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$824, %rax
	movsd	(%rax), %xmm2
	movsd	.LC357(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1224, %rax
	movsd	(%rax), %xmm2
	movsd	.LC358(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1336, %rax
	movsd	(%rax), %xmm2
	movsd	.LC359(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1736, %rax
	movsd	(%rax), %xmm2
	movsd	.LC360(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1848, %rax
	movsd	(%rax), %xmm2
	movsd	.LC361(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2248, %rax
	movsd	(%rax), %xmm2
	movsd	.LC362(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2360, %rax
	movsd	(%rax), %xmm2
	movsd	.LC363(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2760, %rax
	movsd	(%rax), %xmm2
	movsd	.LC364(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2872, %rax
	movsd	(%rax), %xmm2
	movsd	.LC365(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3272, %rax
	movsd	(%rax), %xmm2
	movsd	.LC366(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3384, %rax
	movsd	(%rax), %xmm2
	movsd	.LC367(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3784, %rax
	movsd	(%rax), %xmm2
	movsd	.LC368(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3896, %rax
	movsd	(%rax), %xmm2
	movsd	.LC369(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11200 0
	movq	-24(%rbp), %rax
	leaq	192(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$192, %rax
	movsd	(%rax), %xmm1
	movsd	.LC370(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$320, %rax
	movsd	(%rax), %xmm2
	movsd	.LC371(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$704, %rax
	movsd	(%rax), %xmm2
	movsd	.LC372(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$832, %rax
	movsd	(%rax), %xmm2
	movsd	.LC373(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1216, %rax
	movsd	(%rax), %xmm2
	movsd	.LC374(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1344, %rax
	movsd	(%rax), %xmm2
	movsd	.LC375(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1728, %rax
	movsd	(%rax), %xmm2
	movsd	.LC376(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1856, %rax
	movsd	(%rax), %xmm2
	movsd	.LC377(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2240, %rax
	movsd	(%rax), %xmm2
	movsd	.LC378(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2368, %rax
	movsd	(%rax), %xmm2
	movsd	.LC379(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2752, %rax
	movsd	(%rax), %xmm2
	movsd	.LC380(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2880, %rax
	movsd	(%rax), %xmm2
	movsd	.LC381(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3264, %rax
	movsd	(%rax), %xmm2
	movsd	.LC382(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3392, %rax
	movsd	(%rax), %xmm2
	movsd	.LC383(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3776, %rax
	movsd	(%rax), %xmm2
	movsd	.LC384(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3904, %rax
	movsd	(%rax), %xmm2
	movsd	.LC385(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11201 0
	movq	-24(%rbp), %rax
	leaq	200(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$184, %rax
	movsd	(%rax), %xmm1
	movsd	.LC386(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$328, %rax
	movsd	(%rax), %xmm2
	movsd	.LC387(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$696, %rax
	movsd	(%rax), %xmm2
	movsd	.LC388(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$840, %rax
	movsd	(%rax), %xmm2
	movsd	.LC389(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1208, %rax
	movsd	(%rax), %xmm2
	movsd	.LC390(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1352, %rax
	movsd	(%rax), %xmm2
	movsd	.LC391(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1720, %rax
	movsd	(%rax), %xmm2
	movsd	.LC392(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1864, %rax
	movsd	(%rax), %xmm2
	movsd	.LC393(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2232, %rax
	movsd	(%rax), %xmm2
	movsd	.LC394(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2376, %rax
	movsd	(%rax), %xmm2
	movsd	.LC395(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2744, %rax
	movsd	(%rax), %xmm2
	movsd	.LC396(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2888, %rax
	movsd	(%rax), %xmm2
	movsd	.LC397(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3256, %rax
	movsd	(%rax), %xmm2
	movsd	.LC398(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3400, %rax
	movsd	(%rax), %xmm2
	movsd	.LC399(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3768, %rax
	movsd	(%rax), %xmm2
	movsd	.LC400(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3912, %rax
	movsd	(%rax), %xmm2
	movsd	.LC401(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11202 0
	movq	-24(%rbp), %rax
	leaq	208(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$176, %rax
	movsd	(%rax), %xmm1
	movsd	.LC402(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$336, %rax
	movsd	(%rax), %xmm2
	movsd	.LC403(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$688, %rax
	movsd	(%rax), %xmm2
	movsd	.LC404(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$848, %rax
	movsd	(%rax), %xmm2
	movsd	.LC405(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1200, %rax
	movsd	(%rax), %xmm2
	movsd	.LC406(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1360, %rax
	movsd	(%rax), %xmm2
	movsd	.LC407(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1712, %rax
	movsd	(%rax), %xmm2
	movsd	.LC408(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1872, %rax
	movsd	(%rax), %xmm2
	movsd	.LC409(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2224, %rax
	movsd	(%rax), %xmm2
	movsd	.LC410(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2384, %rax
	movsd	(%rax), %xmm2
	movsd	.LC411(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2736, %rax
	movsd	(%rax), %xmm2
	movsd	.LC412(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2896, %rax
	movsd	(%rax), %xmm2
	movsd	.LC413(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3248, %rax
	movsd	(%rax), %xmm2
	movsd	.LC414(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3408, %rax
	movsd	(%rax), %xmm2
	movsd	.LC415(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3760, %rax
	movsd	(%rax), %xmm2
	movsd	.LC416(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3920, %rax
	movsd	(%rax), %xmm2
	movsd	.LC417(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11203 0
	movq	-24(%rbp), %rax
	leaq	216(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$168, %rax
	movsd	(%rax), %xmm1
	movsd	.LC418(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$344, %rax
	movsd	(%rax), %xmm2
	movsd	.LC419(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$680, %rax
	movsd	(%rax), %xmm2
	movsd	.LC420(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$856, %rax
	movsd	(%rax), %xmm2
	movsd	.LC421(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1192, %rax
	movsd	(%rax), %xmm2
	movsd	.LC422(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1368, %rax
	movsd	(%rax), %xmm2
	movsd	.LC423(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1704, %rax
	movsd	(%rax), %xmm2
	movsd	.LC424(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1880, %rax
	movsd	(%rax), %xmm2
	movsd	.LC425(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2216, %rax
	movsd	(%rax), %xmm2
	movsd	.LC426(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2392, %rax
	movsd	(%rax), %xmm2
	movsd	.LC427(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2728, %rax
	movsd	(%rax), %xmm2
	movsd	.LC428(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2904, %rax
	movsd	(%rax), %xmm2
	movsd	.LC429(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3240, %rax
	movsd	(%rax), %xmm2
	movsd	.LC430(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3416, %rax
	movsd	(%rax), %xmm2
	movsd	.LC431(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3752, %rax
	movsd	(%rax), %xmm2
	movsd	.LC432(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3928, %rax
	movsd	(%rax), %xmm2
	movsd	.LC433(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11204 0
	movq	-24(%rbp), %rax
	leaq	224(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$160, %rax
	movsd	(%rax), %xmm1
	movsd	.LC434(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$352, %rax
	movsd	(%rax), %xmm2
	movsd	.LC435(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$672, %rax
	movsd	(%rax), %xmm2
	movsd	.LC436(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$864, %rax
	movsd	(%rax), %xmm2
	movsd	.LC437(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1184, %rax
	movsd	(%rax), %xmm2
	movsd	.LC438(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1376, %rax
	movsd	(%rax), %xmm2
	movsd	.LC439(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1696, %rax
	movsd	(%rax), %xmm2
	movsd	.LC440(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1888, %rax
	movsd	(%rax), %xmm2
	movsd	.LC441(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2208, %rax
	movsd	(%rax), %xmm2
	movsd	.LC442(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2400, %rax
	movsd	(%rax), %xmm2
	movsd	.LC443(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2720, %rax
	movsd	(%rax), %xmm2
	movsd	.LC444(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2912, %rax
	movsd	(%rax), %xmm2
	movsd	.LC445(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3232, %rax
	movsd	(%rax), %xmm2
	movsd	.LC446(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3424, %rax
	movsd	(%rax), %xmm2
	movsd	.LC447(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3744, %rax
	movsd	(%rax), %xmm2
	movsd	.LC448(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3936, %rax
	movsd	(%rax), %xmm2
	movsd	.LC449(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11205 0
	movq	-24(%rbp), %rax
	leaq	232(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$152, %rax
	movsd	(%rax), %xmm1
	movsd	.LC450(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$360, %rax
	movsd	(%rax), %xmm2
	movsd	.LC451(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$664, %rax
	movsd	(%rax), %xmm2
	movsd	.LC452(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$872, %rax
	movsd	(%rax), %xmm2
	movsd	.LC453(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1176, %rax
	movsd	(%rax), %xmm2
	movsd	.LC454(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1384, %rax
	movsd	(%rax), %xmm2
	movsd	.LC455(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1688, %rax
	movsd	(%rax), %xmm2
	movsd	.LC456(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1896, %rax
	movsd	(%rax), %xmm2
	movsd	.LC457(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2200, %rax
	movsd	(%rax), %xmm2
	movsd	.LC458(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2408, %rax
	movsd	(%rax), %xmm2
	movsd	.LC459(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2712, %rax
	movsd	(%rax), %xmm2
	movsd	.LC460(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2920, %rax
	movsd	(%rax), %xmm2
	movsd	.LC461(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3224, %rax
	movsd	(%rax), %xmm2
	movsd	.LC462(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3432, %rax
	movsd	(%rax), %xmm2
	movsd	.LC463(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3736, %rax
	movsd	(%rax), %xmm2
	movsd	.LC464(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3944, %rax
	movsd	(%rax), %xmm2
	movsd	.LC465(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11206 0
	movq	-24(%rbp), %rax
	leaq	240(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$144, %rax
	movsd	(%rax), %xmm1
	movsd	.LC466(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$368, %rax
	movsd	(%rax), %xmm2
	movsd	.LC467(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$656, %rax
	movsd	(%rax), %xmm2
	movsd	.LC468(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$880, %rax
	movsd	(%rax), %xmm2
	movsd	.LC469(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1168, %rax
	movsd	(%rax), %xmm2
	movsd	.LC470(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1392, %rax
	movsd	(%rax), %xmm2
	movsd	.LC471(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1680, %rax
	movsd	(%rax), %xmm2
	movsd	.LC472(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1904, %rax
	movsd	(%rax), %xmm2
	movsd	.LC473(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2192, %rax
	movsd	(%rax), %xmm2
	movsd	.LC474(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2416, %rax
	movsd	(%rax), %xmm2
	movsd	.LC475(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2704, %rax
	movsd	(%rax), %xmm2
	movsd	.LC476(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2928, %rax
	movsd	(%rax), %xmm2
	movsd	.LC477(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3216, %rax
	movsd	(%rax), %xmm2
	movsd	.LC478(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3440, %rax
	movsd	(%rax), %xmm2
	movsd	.LC479(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3728, %rax
	movsd	(%rax), %xmm2
	movsd	.LC480(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3952, %rax
	movsd	(%rax), %xmm2
	movsd	.LC481(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 11207 0
	movq	-24(%rbp), %rax
	leaq	248(%rax), %rbx
	movq	-16(%rbp), %rax
	addq	$136, %rax
	movsd	(%rax), %xmm1
	movsd	.LC482(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$376, %rax
	movsd	(%rax), %xmm2
	movsd	.LC483(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$648, %rax
	movsd	(%rax), %xmm2
	movsd	.LC484(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$888, %rax
	movsd	(%rax), %xmm2
	movsd	.LC485(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1160, %rax
	movsd	(%rax), %xmm2
	movsd	.LC486(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1400, %rax
	movsd	(%rax), %xmm2
	movsd	.LC487(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1672, %rax
	movsd	(%rax), %xmm2
	movsd	.LC488(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$1912, %rax
	movsd	(%rax), %xmm2
	movsd	.LC489(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2184, %rax
	movsd	(%rax), %xmm2
	movsd	.LC490(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2424, %rax
	movsd	(%rax), %xmm2
	movsd	.LC491(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$2696, %rax
	movsd	(%rax), %xmm2
	movsd	.LC492(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$2936, %rax
	movsd	(%rax), %xmm2
	movsd	.LC493(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3208, %rax
	movsd	(%rax), %xmm2
	movsd	.LC494(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	-16(%rbp), %rax
	addq	$3448, %rax
	movsd	(%rax), %xmm2
	movsd	.LC495(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3720, %rax
	movsd	(%rax), %xmm2
	movsd	.LC496(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	addq	$3960, %rax
	movsd	(%rax), %xmm2
	movsd	.LC497(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	call	mk_sample
	movl	%eax, (%rbx)
	.loc 1 886 0
	addq	$16, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	windowing, .-windowing
	.globl	dct32
	.type	dct32, @function
dct32:
.LFB4:
	.loc 1 889 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1752, %rsp
	movq	%rdi, -1864(%rbp)
	movq	%rsi, -1872(%rbp)
.LBB2:
	.loc 1 10875 0
	movq	-1864(%rbp), %rax
	addq	$248, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$240, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	.loc 1 10876 0
	movq	-1864(%rbp), %rax
	addq	$240, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$232, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	.loc 1 10877 0
	movq	-1864(%rbp), %rax
	addq	$232, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$224, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	.loc 1 10878 0
	movq	-1864(%rbp), %rax
	addq	$224, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$216, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	.loc 1 10879 0
	movq	-1864(%rbp), %rax
	addq	$216, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$208, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	.loc 1 10880 0
	movq	-1864(%rbp), %rax
	addq	$208, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$200, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	.loc 1 10881 0
	movq	-1864(%rbp), %rax
	addq	$200, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$192, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	.loc 1 10882 0
	movq	-1864(%rbp), %rax
	addq	$192, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$184, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 1 10883 0
	movq	-1864(%rbp), %rax
	addq	$184, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$176, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	.loc 1 10884 0
	movq	-1864(%rbp), %rax
	addq	$176, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$168, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
	.loc 1 10885 0
	movq	-1864(%rbp), %rax
	addq	$168, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$160, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 1 10886 0
	movq	-1864(%rbp), %rax
	addq	$160, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$152, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	.loc 1 10887 0
	movq	-1864(%rbp), %rax
	addq	$152, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$144, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)
	.loc 1 10888 0
	movq	-1864(%rbp), %rax
	addq	$144, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$136, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -112(%rbp)
	.loc 1 10889 0
	movq	-1864(%rbp), %rax
	addq	$136, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	subq	$-128, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -120(%rbp)
	.loc 1 10890 0
	movq	-1864(%rbp), %rax
	subq	$-128, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$120, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -128(%rbp)
	.loc 1 10891 0
	movq	-1864(%rbp), %rax
	addq	$120, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$112, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -136(%rbp)
	.loc 1 10892 0
	movq	-1864(%rbp), %rax
	addq	$112, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$104, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)
	.loc 1 10893 0
	movq	-1864(%rbp), %rax
	addq	$104, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$96, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -152(%rbp)
	.loc 1 10894 0
	movq	-1864(%rbp), %rax
	addq	$96, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$88, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -160(%rbp)
	.loc 1 10895 0
	movq	-1864(%rbp), %rax
	addq	$88, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$80, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -168(%rbp)
	.loc 1 10896 0
	movq	-1864(%rbp), %rax
	addq	$80, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$72, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -176(%rbp)
	.loc 1 10897 0
	movq	-1864(%rbp), %rax
	addq	$72, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$64, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -184(%rbp)
	.loc 1 10898 0
	movq	-1864(%rbp), %rax
	addq	$64, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$56, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -192(%rbp)
	.loc 1 10899 0
	movq	-1864(%rbp), %rax
	addq	$56, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$48, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -200(%rbp)
	.loc 1 10900 0
	movq	-1864(%rbp), %rax
	addq	$48, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$40, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -208(%rbp)
	.loc 1 10901 0
	movq	-1864(%rbp), %rax
	addq	$40, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$32, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -216(%rbp)
	.loc 1 10902 0
	movq	-1864(%rbp), %rax
	addq	$32, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$24, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -224(%rbp)
	.loc 1 10903 0
	movq	-1864(%rbp), %rax
	addq	$24, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$16, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -232(%rbp)
	.loc 1 10904 0
	movq	-1864(%rbp), %rax
	addq	$16, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -240(%rbp)
	.loc 1 10905 0
	movq	-1864(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	.loc 1 10906 0
	movq	-1864(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-1864(%rbp), %rax
	addq	$248, %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	.loc 1 10907 0
	movq	-1864(%rbp), %rax
	movsd	(%rax), %xmm1
	movq	-1864(%rbp), %rax
	addq	$248, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -264(%rbp)
	.loc 1 10908 0
	movsd	-192(%rbp), %xmm0
	subsd	-64(%rbp), %xmm0
	movsd	%xmm0, -272(%rbp)
	.loc 1 10909 0
	movsd	-200(%rbp), %xmm0
	subsd	-56(%rbp), %xmm0
	movsd	%xmm0, -280(%rbp)
	.loc 1 10910 0
	movsd	-184(%rbp), %xmm0
	subsd	-72(%rbp), %xmm0
	movsd	%xmm0, -288(%rbp)
	.loc 1 10911 0
	movsd	-208(%rbp), %xmm0
	subsd	-48(%rbp), %xmm0
	movsd	%xmm0, -296(%rbp)
	.loc 1 10912 0
	movsd	-176(%rbp), %xmm0
	subsd	-80(%rbp), %xmm0
	movsd	%xmm0, -304(%rbp)
	.loc 1 10913 0
	movsd	-216(%rbp), %xmm0
	subsd	-40(%rbp), %xmm0
	movsd	%xmm0, -312(%rbp)
	.loc 1 10914 0
	movsd	-168(%rbp), %xmm0
	subsd	-88(%rbp), %xmm0
	movsd	%xmm0, -320(%rbp)
	.loc 1 10915 0
	movsd	-224(%rbp), %xmm0
	subsd	-32(%rbp), %xmm0
	movsd	%xmm0, -328(%rbp)
	.loc 1 10916 0
	movsd	-160(%rbp), %xmm0
	subsd	-96(%rbp), %xmm0
	movsd	%xmm0, -336(%rbp)
	.loc 1 10917 0
	movsd	-232(%rbp), %xmm0
	subsd	-24(%rbp), %xmm0
	movsd	%xmm0, -344(%rbp)
	.loc 1 10918 0
	movsd	-152(%rbp), %xmm0
	subsd	-104(%rbp), %xmm0
	movsd	%xmm0, -352(%rbp)
	.loc 1 10919 0
	movsd	-240(%rbp), %xmm0
	subsd	-16(%rbp), %xmm0
	movsd	%xmm0, -360(%rbp)
	.loc 1 10920 0
	movsd	-144(%rbp), %xmm0
	subsd	-112(%rbp), %xmm0
	movsd	%xmm0, -368(%rbp)
	.loc 1 10921 0
	movsd	-248(%rbp), %xmm0
	subsd	-8(%rbp), %xmm0
	movsd	%xmm0, -376(%rbp)
	.loc 1 10922 0
	movsd	-136(%rbp), %xmm0
	subsd	-120(%rbp), %xmm0
	movsd	%xmm0, -384(%rbp)
	.loc 1 10923 0
	movsd	-248(%rbp), %xmm0
	addsd	-8(%rbp), %xmm0
	movsd	%xmm0, -392(%rbp)
	.loc 1 10924 0
	movsd	-232(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0
	movsd	%xmm0, -400(%rbp)
	.loc 1 10925 0
	movsd	-216(%rbp), %xmm0
	addsd	-40(%rbp), %xmm0
	movsd	%xmm0, -408(%rbp)
	.loc 1 10926 0
	movsd	-200(%rbp), %xmm0
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -416(%rbp)
	.loc 1 10927 0
	movsd	-184(%rbp), %xmm0
	addsd	-72(%rbp), %xmm0
	movsd	%xmm0, -424(%rbp)
	.loc 1 10928 0
	movsd	-168(%rbp), %xmm0
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, -432(%rbp)
	.loc 1 10929 0
	movsd	-152(%rbp), %xmm0
	addsd	-104(%rbp), %xmm0
	movsd	%xmm0, -440(%rbp)
	.loc 1 10930 0
	movsd	-136(%rbp), %xmm0
	addsd	-120(%rbp), %xmm0
	movsd	%xmm0, -448(%rbp)
	.loc 1 10931 0
	movsd	-240(%rbp), %xmm0
	addsd	-16(%rbp), %xmm0
	movsd	%xmm0, -456(%rbp)
	.loc 1 10932 0
	movsd	-208(%rbp), %xmm0
	addsd	-48(%rbp), %xmm0
	movsd	%xmm0, -464(%rbp)
	.loc 1 10933 0
	movsd	-176(%rbp), %xmm0
	addsd	-80(%rbp), %xmm0
	movsd	%xmm0, -472(%rbp)
	.loc 1 10934 0
	movsd	-144(%rbp), %xmm0
	addsd	-112(%rbp), %xmm0
	movsd	%xmm0, -480(%rbp)
	.loc 1 10935 0
	movsd	-224(%rbp), %xmm0
	addsd	-32(%rbp), %xmm0
	movsd	%xmm0, -488(%rbp)
	.loc 1 10936 0
	movsd	-160(%rbp), %xmm0
	addsd	-96(%rbp), %xmm0
	movsd	%xmm0, -496(%rbp)
	.loc 1 10937 0
	movsd	-264(%rbp), %xmm0
	subsd	-128(%rbp), %xmm0
	movsd	%xmm0, -504(%rbp)
	.loc 1 10938 0
	movsd	-264(%rbp), %xmm0
	addsd	-128(%rbp), %xmm0
	movsd	%xmm0, -512(%rbp)
	.loc 1 10939 0
	movsd	-192(%rbp), %xmm0
	addsd	-64(%rbp), %xmm0
	movsd	%xmm0, -520(%rbp)
	.loc 1 10940 0
	movsd	-512(%rbp), %xmm0
	addsd	-520(%rbp), %xmm0
	movsd	%xmm0, -528(%rbp)
	.loc 1 10941 0
	movsd	-512(%rbp), %xmm0
	subsd	-520(%rbp), %xmm0
	movsd	%xmm0, -536(%rbp)
	.loc 1 10942 0
	movsd	-488(%rbp), %xmm0
	subsd	-496(%rbp), %xmm0
	movsd	%xmm0, -544(%rbp)
	.loc 1 10943 0
	movsd	-488(%rbp), %xmm0
	addsd	-496(%rbp), %xmm0
	movsd	%xmm0, -552(%rbp)
	.loc 1 10944 0
	movsd	-544(%rbp), %xmm1
	movsd	.LC498(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -560(%rbp)
	.loc 1 10945 0
	movsd	-528(%rbp), %xmm0
	addsd	-552(%rbp), %xmm0
	movsd	%xmm0, -568(%rbp)
	.loc 1 10946 0
	movsd	-456(%rbp), %xmm0
	addsd	-480(%rbp), %xmm0
	movsd	%xmm0, -576(%rbp)
	.loc 1 10947 0
	movsd	-464(%rbp), %xmm0
	subsd	-472(%rbp), %xmm0
	movsd	%xmm0, -584(%rbp)
	.loc 1 10948 0
	movsd	-464(%rbp), %xmm0
	addsd	-472(%rbp), %xmm0
	movsd	%xmm0, -592(%rbp)
	.loc 1 10949 0
	movsd	-576(%rbp), %xmm0
	addsd	-592(%rbp), %xmm0
	movsd	%xmm0, -600(%rbp)
	.loc 1 10950 0
	movq	-1872(%rbp), %rax
	subq	$-128, %rax
	movsd	-568(%rbp), %xmm0
	subsd	-600(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 10951 0
	movsd	-576(%rbp), %xmm0
	subsd	-592(%rbp), %xmm0
	movsd	%xmm0, -608(%rbp)
	.loc 1 10952 0
	movsd	-504(%rbp), %xmm0
	subsd	-560(%rbp), %xmm0
	movsd	%xmm0, -616(%rbp)
	.loc 1 10953 0
	movsd	-504(%rbp), %xmm0
	addsd	-560(%rbp), %xmm0
	movsd	%xmm0, -624(%rbp)
	.loc 1 10954 0
	movsd	-528(%rbp), %xmm0
	subsd	-552(%rbp), %xmm0
	movsd	%xmm0, -632(%rbp)
	.loc 1 10955 0
	movsd	-456(%rbp), %xmm0
	subsd	-480(%rbp), %xmm0
	movsd	%xmm0, -640(%rbp)
	.loc 1 10956 0
	movsd	-608(%rbp), %xmm1
	movsd	.LC498(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -648(%rbp)
	.loc 1 10957 0
	movsd	-640(%rbp), %xmm0
	addsd	-584(%rbp), %xmm0
	movsd	%xmm0, -656(%rbp)
	.loc 1 10958 0
	movsd	-640(%rbp), %xmm1
	movsd	.LC499(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -664(%rbp)
	.loc 1 10959 0
	movsd	-656(%rbp), %xmm1
	movsd	.LC500(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -672(%rbp)
	.loc 1 10960 0
	movsd	-584(%rbp), %xmm1
	movsd	.LC501(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -680(%rbp)
	.loc 1 10961 0
	movsd	-664(%rbp), %xmm0
	addsd	-672(%rbp), %xmm0
	movsd	%xmm0, -688(%rbp)
	.loc 1 10962 0
	movsd	-680(%rbp), %xmm0
	subsd	-672(%rbp), %xmm0
	movsd	%xmm0, -696(%rbp)
	.loc 1 10964 0
	movsd	-568(%rbp), %xmm0
	addsd	-600(%rbp), %xmm0
	movsd	%xmm0, -704(%rbp)
	.loc 1 10965 0
	movsd	-616(%rbp), %xmm0
	subsd	-688(%rbp), %xmm0
	movsd	%xmm0, -712(%rbp)
	.loc 1 10966 0
	movsd	-536(%rbp), %xmm0
	subsd	-648(%rbp), %xmm0
	movsd	%xmm0, -720(%rbp)
	.loc 1 10967 0
	movsd	-536(%rbp), %xmm0
	addsd	-648(%rbp), %xmm0
	movsd	%xmm0, -728(%rbp)
	.loc 1 10968 0
	movsd	-624(%rbp), %xmm0
	addsd	-696(%rbp), %xmm0
	movsd	%xmm0, -736(%rbp)
	.loc 1 10969 0
	movsd	-624(%rbp), %xmm0
	subsd	-696(%rbp), %xmm0
	movsd	%xmm0, -744(%rbp)
	.loc 1 10970 0
	movsd	-616(%rbp), %xmm0
	addsd	-688(%rbp), %xmm0
	movsd	%xmm0, -752(%rbp)
	.loc 1 10971 0
	movsd	-392(%rbp), %xmm0
	subsd	-448(%rbp), %xmm0
	movsd	%xmm0, -760(%rbp)
	.loc 1 10972 0
	movsd	-392(%rbp), %xmm0
	addsd	-448(%rbp), %xmm0
	movsd	%xmm0, -768(%rbp)
	.loc 1 10973 0
	movsd	-400(%rbp), %xmm0
	subsd	-440(%rbp), %xmm0
	movsd	%xmm0, -776(%rbp)
	.loc 1 10974 0
	movsd	-400(%rbp), %xmm0
	addsd	-440(%rbp), %xmm0
	movsd	%xmm0, -784(%rbp)
	.loc 1 10975 0
	movsd	-408(%rbp), %xmm0
	subsd	-432(%rbp), %xmm0
	movsd	%xmm0, -792(%rbp)
	.loc 1 10976 0
	movsd	-408(%rbp), %xmm0
	addsd	-432(%rbp), %xmm0
	movsd	%xmm0, -800(%rbp)
	.loc 1 10977 0
	movsd	-416(%rbp), %xmm0
	subsd	-424(%rbp), %xmm0
	movsd	%xmm0, -808(%rbp)
	.loc 1 10978 0
	movsd	-416(%rbp), %xmm0
	addsd	-424(%rbp), %xmm0
	movsd	%xmm0, -816(%rbp)
	.loc 1 10979 0
	movsd	-768(%rbp), %xmm0
	subsd	-816(%rbp), %xmm0
	movsd	%xmm0, -824(%rbp)
	.loc 1 10980 0
	movsd	-768(%rbp), %xmm0
	addsd	-816(%rbp), %xmm0
	movsd	%xmm0, -832(%rbp)
	.loc 1 10981 0
	movsd	-784(%rbp), %xmm0
	subsd	-800(%rbp), %xmm0
	movsd	%xmm0, -840(%rbp)
	.loc 1 10982 0
	movsd	-784(%rbp), %xmm0
	addsd	-800(%rbp), %xmm0
	movsd	%xmm0, -848(%rbp)
	.loc 1 10984 0
	movsd	-832(%rbp), %xmm0
	subsd	-848(%rbp), %xmm0
	movsd	%xmm0, -856(%rbp)
	.loc 1 10985 0
	movsd	-832(%rbp), %xmm0
	addsd	-848(%rbp), %xmm0
	movsd	%xmm0, -864(%rbp)
	.loc 1 10986 0
	movsd	-704(%rbp), %xmm0
	addsd	-864(%rbp), %xmm0
	movq	-1872(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 10987 0
	movsd	-856(%rbp), %xmm1
	movsd	.LC498(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -872(%rbp)
	.loc 1 10988 0
	movq	-1872(%rbp), %rax
	addq	$192, %rax
	movsd	-632(%rbp), %xmm0
	subsd	-872(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 10989 0
	movq	-1872(%rbp), %rax
	addq	$64, %rax
	movsd	-632(%rbp), %xmm0
	addsd	-872(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 10990 0
	movsd	-824(%rbp), %xmm0
	addsd	-840(%rbp), %xmm0
	movsd	%xmm0, -880(%rbp)
	.loc 1 10991 0
	movsd	-824(%rbp), %xmm1
	movsd	.LC499(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -888(%rbp)
	.loc 1 10992 0
	movsd	-880(%rbp), %xmm1
	movsd	.LC500(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -896(%rbp)
	.loc 1 10993 0
	movsd	-840(%rbp), %xmm1
	movsd	.LC501(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -904(%rbp)
	.loc 1 10994 0
	movsd	-888(%rbp), %xmm0
	addsd	-896(%rbp), %xmm0
	movsd	%xmm0, -912(%rbp)
	.loc 1 10995 0
	movq	-1872(%rbp), %rax
	addq	$160, %rax
	movsd	-720(%rbp), %xmm0
	subsd	-912(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 10996 0
	movq	-1872(%rbp), %rax
	addq	$96, %rax
	movsd	-720(%rbp), %xmm0
	addsd	-912(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 10997 0
	movsd	-904(%rbp), %xmm0
	subsd	-896(%rbp), %xmm0
	movsd	%xmm0, -920(%rbp)
	.loc 1 10998 0
	movq	-1872(%rbp), %rax
	addq	$32, %rax
	movsd	-728(%rbp), %xmm0
	addsd	-920(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 10999 0
	movq	-1872(%rbp), %rax
	addq	$224, %rax
	movsd	-728(%rbp), %xmm0
	subsd	-920(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11000 0
	movsd	-776(%rbp), %xmm0
	subsd	-792(%rbp), %xmm0
	movsd	%xmm0, -928(%rbp)
	.loc 1 11001 0
	movsd	-776(%rbp), %xmm0
	addsd	-792(%rbp), %xmm0
	movsd	%xmm0, -936(%rbp)
	.loc 1 11002 0
	movsd	-936(%rbp), %xmm1
	movsd	.LC498(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -944(%rbp)
	.loc 1 11003 0
	movsd	-928(%rbp), %xmm1
	movsd	.LC498(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -952(%rbp)
	.loc 1 11004 0
	movsd	-760(%rbp), %xmm0
	subsd	-944(%rbp), %xmm0
	movsd	%xmm0, -960(%rbp)
	.loc 1 11005 0
	movsd	-760(%rbp), %xmm0
	addsd	-944(%rbp), %xmm0
	movsd	%xmm0, -968(%rbp)
	.loc 1 11006 0
	movsd	-808(%rbp), %xmm0
	subsd	-952(%rbp), %xmm0
	movsd	%xmm0, -976(%rbp)
	.loc 1 11007 0
	movsd	-808(%rbp), %xmm0
	addsd	-952(%rbp), %xmm0
	movsd	%xmm0, -984(%rbp)
	.loc 1 11009 0
	movsd	-984(%rbp), %xmm0
	addsd	-968(%rbp), %xmm0
	movsd	%xmm0, -992(%rbp)
	.loc 1 11010 0
	movsd	-992(%rbp), %xmm1
	movsd	.LC502(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1000(%rbp)
	.loc 1 11011 0
	movsd	-984(%rbp), %xmm1
	movsd	.LC503(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1008(%rbp)
	.loc 1 11012 0
	movsd	-968(%rbp), %xmm1
	movsd	.LC504(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1016(%rbp)
	.loc 1 11013 0
	movsd	-1008(%rbp), %xmm0
	addsd	-1000(%rbp), %xmm0
	movsd	%xmm0, -1024(%rbp)
	.loc 1 11014 0
	movq	-1872(%rbp), %rax
	addq	$16, %rax
	movsd	-736(%rbp), %xmm0
	addsd	-1024(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11015 0
	movq	-1872(%rbp), %rax
	addq	$240, %rax
	movsd	-736(%rbp), %xmm0
	subsd	-1024(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11016 0
	movsd	-1016(%rbp), %xmm0
	subsd	-1000(%rbp), %xmm0
	movsd	%xmm0, -1032(%rbp)
	.loc 1 11017 0
	movq	-1872(%rbp), %rax
	addq	$144, %rax
	movsd	-744(%rbp), %xmm0
	subsd	-1032(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11018 0
	movq	-1872(%rbp), %rax
	addq	$112, %rax
	movsd	-744(%rbp), %xmm0
	addsd	-1032(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11020 0
	movsd	-976(%rbp), %xmm0
	addsd	-960(%rbp), %xmm0
	movsd	%xmm0, -1040(%rbp)
	.loc 1 11021 0
	movsd	-1040(%rbp), %xmm1
	movsd	.LC505(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1048(%rbp)
	.loc 1 11022 0
	movsd	-976(%rbp), %xmm1
	movsd	.LC506(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1056(%rbp)
	.loc 1 11023 0
	movsd	-960(%rbp), %xmm1
	movsd	.LC507(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1064(%rbp)
	.loc 1 11024 0
	movsd	-1056(%rbp), %xmm0
	addsd	-1048(%rbp), %xmm0
	movsd	%xmm0, -1072(%rbp)
	.loc 1 11025 0
	movq	-1872(%rbp), %rax
	addq	$176, %rax
	movsd	-712(%rbp), %xmm0
	subsd	-1072(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11026 0
	movq	-1872(%rbp), %rax
	addq	$80, %rax
	movsd	-712(%rbp), %xmm0
	addsd	-1072(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11027 0
	movsd	-1064(%rbp), %xmm0
	subsd	-1048(%rbp), %xmm0
	movsd	%xmm0, -1080(%rbp)
	.loc 1 11028 0
	movq	-1872(%rbp), %rax
	addq	$48, %rax
	movsd	-752(%rbp), %xmm0
	addsd	-1080(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11029 0
	movq	-1872(%rbp), %rax
	addq	$208, %rax
	movsd	-752(%rbp), %xmm0
	subsd	-1080(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11031 0
	movsd	-272(%rbp), %xmm1
	movsd	.LC498(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1088(%rbp)
	.loc 1 11032 0
	movsd	-256(%rbp), %xmm0
	subsd	-1088(%rbp), %xmm0
	movsd	%xmm0, -1096(%rbp)
	.loc 1 11033 0
	movsd	-256(%rbp), %xmm0
	addsd	-1088(%rbp), %xmm0
	movsd	%xmm0, -1104(%rbp)
	.loc 1 11034 0
	movsd	-328(%rbp), %xmm0
	addsd	-336(%rbp), %xmm0
	movsd	%xmm0, -1112(%rbp)
	.loc 1 11035 0
	movsd	-328(%rbp), %xmm1
	movsd	.LC499(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1120(%rbp)
	.loc 1 11036 0
	movsd	-1112(%rbp), %xmm1
	movsd	.LC500(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1128(%rbp)
	.loc 1 11037 0
	movsd	-336(%rbp), %xmm1
	movsd	.LC501(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1136(%rbp)
	.loc 1 11038 0
	movsd	-1120(%rbp), %xmm0
	addsd	-1128(%rbp), %xmm0
	movsd	%xmm0, -1144(%rbp)
	.loc 1 11039 0
	movsd	-1136(%rbp), %xmm0
	subsd	-1128(%rbp), %xmm0
	movsd	%xmm0, -1152(%rbp)
	.loc 1 11040 0
	movsd	-1104(%rbp), %xmm0
	subsd	-1152(%rbp), %xmm0
	movsd	%xmm0, -1160(%rbp)
	.loc 1 11041 0
	movsd	-1104(%rbp), %xmm0
	addsd	-1152(%rbp), %xmm0
	movsd	%xmm0, -1168(%rbp)
	.loc 1 11042 0
	movsd	-1096(%rbp), %xmm0
	subsd	-1144(%rbp), %xmm0
	movsd	%xmm0, -1176(%rbp)
	.loc 1 11043 0
	movsd	-1096(%rbp), %xmm0
	addsd	-1144(%rbp), %xmm0
	movsd	%xmm0, -1184(%rbp)
	.loc 1 11044 0
	movsd	-296(%rbp), %xmm0
	subsd	-304(%rbp), %xmm0
	movsd	%xmm0, -1192(%rbp)
	.loc 1 11045 0
	movsd	-296(%rbp), %xmm0
	addsd	-304(%rbp), %xmm0
	movsd	%xmm0, -1200(%rbp)
	.loc 1 11046 0
	movsd	-1200(%rbp), %xmm1
	movsd	.LC498(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1208(%rbp)
	.loc 1 11047 0
	movsd	-1192(%rbp), %xmm1
	movsd	.LC498(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1216(%rbp)
	.loc 1 11048 0
	movsd	-360(%rbp), %xmm0
	subsd	-1208(%rbp), %xmm0
	movsd	%xmm0, -1224(%rbp)
	.loc 1 11049 0
	movsd	-360(%rbp), %xmm0
	addsd	-1208(%rbp), %xmm0
	movsd	%xmm0, -1232(%rbp)
	.loc 1 11050 0
	movsd	-368(%rbp), %xmm0
	subsd	-1216(%rbp), %xmm0
	movsd	%xmm0, -1240(%rbp)
	.loc 1 11051 0
	movsd	-368(%rbp), %xmm0
	addsd	-1216(%rbp), %xmm0
	movsd	%xmm0, -1248(%rbp)
	.loc 1 11052 0
	movsd	-1248(%rbp), %xmm0
	addsd	-1232(%rbp), %xmm0
	movsd	%xmm0, -1256(%rbp)
	.loc 1 11053 0
	movsd	-1248(%rbp), %xmm1
	movsd	.LC503(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1264(%rbp)
	.loc 1 11054 0
	movsd	-1256(%rbp), %xmm1
	movsd	.LC502(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1272(%rbp)
	.loc 1 11055 0
	movsd	-1232(%rbp), %xmm1
	movsd	.LC504(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1280(%rbp)
	.loc 1 11056 0
	movsd	-1264(%rbp), %xmm0
	addsd	-1272(%rbp), %xmm0
	movsd	%xmm0, -1288(%rbp)
	.loc 1 11057 0
	movsd	-1280(%rbp), %xmm0
	subsd	-1272(%rbp), %xmm0
	movsd	%xmm0, -1296(%rbp)
	.loc 1 11058 0
	movsd	-1240(%rbp), %xmm0
	addsd	-1224(%rbp), %xmm0
	movsd	%xmm0, -1304(%rbp)
	.loc 1 11059 0
	movsd	-1240(%rbp), %xmm1
	movsd	.LC506(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1312(%rbp)
	.loc 1 11060 0
	movsd	-1304(%rbp), %xmm1
	movsd	.LC505(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1320(%rbp)
	.loc 1 11061 0
	movsd	-1224(%rbp), %xmm1
	movsd	.LC507(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1328(%rbp)
	.loc 1 11062 0
	movsd	-1312(%rbp), %xmm0
	addsd	-1320(%rbp), %xmm0
	movsd	%xmm0, -1336(%rbp)
	.loc 1 11063 0
	movsd	-1328(%rbp), %xmm0
	subsd	-1320(%rbp), %xmm0
	movsd	%xmm0, -1344(%rbp)
	.loc 1 11064 0
	movsd	-1168(%rbp), %xmm0
	subsd	-1288(%rbp), %xmm0
	movsd	%xmm0, -1352(%rbp)
	.loc 1 11065 0
	movsd	-1168(%rbp), %xmm0
	addsd	-1288(%rbp), %xmm0
	movsd	%xmm0, -1360(%rbp)
	.loc 1 11066 0
	movsd	-1184(%rbp), %xmm0
	subsd	-1344(%rbp), %xmm0
	movsd	%xmm0, -1368(%rbp)
	.loc 1 11067 0
	movsd	-1184(%rbp), %xmm0
	addsd	-1344(%rbp), %xmm0
	movsd	%xmm0, -1376(%rbp)
	.loc 1 11068 0
	movsd	-1176(%rbp), %xmm0
	subsd	-1336(%rbp), %xmm0
	movsd	%xmm0, -1384(%rbp)
	.loc 1 11069 0
	movsd	-1176(%rbp), %xmm0
	addsd	-1336(%rbp), %xmm0
	movsd	%xmm0, -1392(%rbp)
	.loc 1 11070 0
	movsd	-1160(%rbp), %xmm0
	subsd	-1296(%rbp), %xmm0
	movsd	%xmm0, -1400(%rbp)
	.loc 1 11071 0
	movsd	-1160(%rbp), %xmm0
	addsd	-1296(%rbp), %xmm0
	movsd	%xmm0, -1408(%rbp)
	.loc 1 11072 0
	movsd	-376(%rbp), %xmm0
	subsd	-344(%rbp), %xmm0
	movsd	%xmm0, -1416(%rbp)
	.loc 1 11073 0
	movsd	-312(%rbp), %xmm0
	subsd	-344(%rbp), %xmm0
	movsd	%xmm0, -1424(%rbp)
	.loc 1 11074 0
	movsd	-312(%rbp), %xmm0
	subsd	-280(%rbp), %xmm0
	movsd	%xmm0, -1432(%rbp)
	.loc 1 11075 0
	movsd	-288(%rbp), %xmm0
	subsd	-280(%rbp), %xmm0
	movsd	%xmm0, -1440(%rbp)
	.loc 1 11076 0
	movsd	-288(%rbp), %xmm0
	subsd	-320(%rbp), %xmm0
	movsd	%xmm0, -1448(%rbp)
	.loc 1 11077 0
	movsd	-352(%rbp), %xmm0
	subsd	-320(%rbp), %xmm0
	movsd	%xmm0, -1456(%rbp)
	.loc 1 11078 0
	movsd	-352(%rbp), %xmm0
	subsd	-384(%rbp), %xmm0
	movsd	%xmm0, -1464(%rbp)
	.loc 1 11079 0
	movsd	-1448(%rbp), %xmm0
	subsd	-1432(%rbp), %xmm0
	movsd	%xmm0, -1472(%rbp)
	.loc 1 11080 0
	movsd	-1448(%rbp), %xmm0
	addsd	-1432(%rbp), %xmm0
	movsd	%xmm0, -1480(%rbp)
	.loc 1 11081 0
	movsd	-1480(%rbp), %xmm1
	movsd	.LC498(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1488(%rbp)
	.loc 1 11082 0
	movsd	-1464(%rbp), %xmm0
	subsd	-1488(%rbp), %xmm0
	movsd	%xmm0, -1496(%rbp)
	.loc 1 11083 0
	movsd	-1464(%rbp), %xmm0
	addsd	-1488(%rbp), %xmm0
	movsd	%xmm0, -1504(%rbp)
	.loc 1 11084 0
	movsd	-1472(%rbp), %xmm1
	movsd	.LC498(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1512(%rbp)
	.loc 1 11085 0
	movsd	-1512(%rbp), %xmm0
	subsd	-1416(%rbp), %xmm0
	movsd	%xmm0, -1520(%rbp)
	.loc 1 11086 0
	movsd	-1512(%rbp), %xmm0
	addsd	-1416(%rbp), %xmm0
	movsd	%xmm0, -1528(%rbp)
	.loc 1 11087 0
	movsd	-1528(%rbp), %xmm0
	addsd	-1504(%rbp), %xmm0
	movsd	%xmm0, -1536(%rbp)
	.loc 1 11088 0
	movsd	-1528(%rbp), %xmm1
	movsd	.LC503(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1544(%rbp)
	.loc 1 11089 0
	movsd	-1536(%rbp), %xmm1
	movsd	.LC502(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1552(%rbp)
	.loc 1 11090 0
	movsd	-1504(%rbp), %xmm1
	movsd	.LC504(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1560(%rbp)
	.loc 1 11091 0
	movsd	-1544(%rbp), %xmm0
	addsd	-1552(%rbp), %xmm0
	movsd	%xmm0, -1568(%rbp)
	.loc 1 11092 0
	movsd	-1560(%rbp), %xmm0
	subsd	-1552(%rbp), %xmm0
	movsd	%xmm0, -1576(%rbp)
	.loc 1 11093 0
	movsd	-1520(%rbp), %xmm0
	addsd	-1496(%rbp), %xmm0
	movsd	%xmm0, -1584(%rbp)
	.loc 1 11094 0
	movsd	-1520(%rbp), %xmm1
	movsd	.LC508(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1592(%rbp)
	.loc 1 11095 0
	movsd	-1584(%rbp), %xmm1
	movsd	.LC509(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1600(%rbp)
	.loc 1 11096 0
	movsd	-1496(%rbp), %xmm1
	movsd	.LC507(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1608(%rbp)
	.loc 1 11097 0
	movsd	-1592(%rbp), %xmm0
	addsd	-1600(%rbp), %xmm0
	movsd	%xmm0, -1616(%rbp)
	.loc 1 11098 0
	movsd	-1608(%rbp), %xmm0
	subsd	-1600(%rbp), %xmm0
	movsd	%xmm0, -1624(%rbp)
	.loc 1 11099 0
	movsd	-1424(%rbp), %xmm0
	addsd	-1456(%rbp), %xmm0
	movsd	%xmm0, -1632(%rbp)
	.loc 1 11101 0
	movsd	-1456(%rbp), %xmm1
	movsd	.LC510(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1640(%rbp)
	.loc 1 11102 0
	movsd	-1632(%rbp), %xmm1
	movsd	.LC511(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1648(%rbp)
	.loc 1 11103 0
	movsd	-1424(%rbp), %xmm1
	movsd	.LC512(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1656(%rbp)
	.loc 1 11104 0
	movsd	-1656(%rbp), %xmm0
	addsd	-1648(%rbp), %xmm0
	movsd	%xmm0, -1664(%rbp)
	.loc 1 11105 0
	movsd	-1640(%rbp), %xmm0
	subsd	-1648(%rbp), %xmm0
	movsd	%xmm0, -1672(%rbp)
	.loc 1 11106 0
	movsd	-1440(%rbp), %xmm1
	movsd	.LC498(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1680(%rbp)
	.loc 1 11107 0
	movsd	-1680(%rbp), %xmm0
	addsd	-384(%rbp), %xmm0
	movsd	%xmm0, -1688(%rbp)
	.loc 1 11108 0
	movsd	-1680(%rbp), %xmm0
	subsd	-384(%rbp), %xmm0
	movsd	%xmm0, -1696(%rbp)
	.loc 1 11109 0
	movsd	-1672(%rbp), %xmm0
	subsd	-1696(%rbp), %xmm0
	movsd	%xmm0, -1704(%rbp)
	.loc 1 11110 0
	movsd	-1672(%rbp), %xmm0
	addsd	-1696(%rbp), %xmm0
	movsd	%xmm0, -1712(%rbp)
	.loc 1 11111 0
	movsd	-1568(%rbp), %xmm0
	addsd	-1712(%rbp), %xmm0
	movsd	%xmm0, -1720(%rbp)
	.loc 1 11112 0
	movsd	-1568(%rbp), %xmm0
	subsd	-1712(%rbp), %xmm0
	movsd	%xmm0, -1728(%rbp)
	.loc 1 11113 0
	movsd	-1720(%rbp), %xmm1
	movsd	.LC513(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1736(%rbp)
	.loc 1 11114 0
	movq	-1872(%rbp), %rax
	addq	$136, %rax
	movsd	-1352(%rbp), %xmm0
	subsd	-1736(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11115 0
	movq	-1872(%rbp), %rax
	addq	$120, %rax
	movsd	-1352(%rbp), %xmm0
	addsd	-1736(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11116 0
	movsd	-1728(%rbp), %xmm1
	movsd	.LC514(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1744(%rbp)
	.loc 1 11117 0
	movq	-1872(%rbp), %rax
	addq	$248, %rax
	movsd	-1360(%rbp), %xmm0
	subsd	-1744(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11118 0
	movq	-1872(%rbp), %rax
	addq	$8, %rax
	movsd	-1360(%rbp), %xmm0
	addsd	-1744(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11119 0
	movsd	-1664(%rbp), %xmm0
	subsd	-1688(%rbp), %xmm0
	movsd	%xmm0, -1752(%rbp)
	.loc 1 11120 0
	movsd	-1664(%rbp), %xmm0
	addsd	-1688(%rbp), %xmm0
	movsd	%xmm0, -1760(%rbp)
	.loc 1 11121 0
	movsd	-1760(%rbp), %xmm0
	subsd	-1616(%rbp), %xmm0
	movsd	%xmm0, -1768(%rbp)
	.loc 1 11122 0
	movsd	-1616(%rbp), %xmm0
	addsd	-1760(%rbp), %xmm0
	movsd	%xmm0, -1776(%rbp)
	.loc 1 11123 0
	movsd	-1776(%rbp), %xmm1
	movsd	.LC515(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1784(%rbp)
	.loc 1 11124 0
	movq	-1872(%rbp), %rax
	addq	$232, %rax
	movsd	-1376(%rbp), %xmm0
	addsd	-1784(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11125 0
	movq	-1872(%rbp), %rax
	addq	$24, %rax
	movsd	-1376(%rbp), %xmm0
	subsd	-1784(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11127 0
	movsd	-1624(%rbp), %xmm0
	addsd	-1752(%rbp), %xmm0
	movsd	%xmm0, -1792(%rbp)
	.loc 1 11128 0
	movsd	-1624(%rbp), %xmm0
	subsd	-1752(%rbp), %xmm0
	movsd	%xmm0, -1800(%rbp)
	.loc 1 11130 0
	movsd	-1800(%rbp), %xmm1
	movsd	.LC516(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1808(%rbp)
	.loc 1 11131 0
	movq	-1872(%rbp), %rax
	addq	$216, %rax
	movsd	-1392(%rbp), %xmm0
	subsd	-1808(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11132 0
	movq	-1872(%rbp), %rax
	addq	$40, %rax
	movsd	-1392(%rbp), %xmm0
	addsd	-1808(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11134 0
	movsd	-1704(%rbp), %xmm0
	subsd	-1576(%rbp), %xmm0
	movsd	%xmm0, -1816(%rbp)
	.loc 1 11135 0
	movsd	-1576(%rbp), %xmm0
	addsd	-1704(%rbp), %xmm0
	movsd	%xmm0, -1824(%rbp)
	.loc 1 11136 0
	movsd	-1824(%rbp), %xmm1
	movsd	.LC517(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1832(%rbp)
	.loc 1 11137 0
	movq	-1872(%rbp), %rax
	addq	$200, %rax
	movsd	-1408(%rbp), %xmm0
	addsd	-1832(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11138 0
	movq	-1872(%rbp), %rax
	addq	$56, %rax
	movsd	-1408(%rbp), %xmm0
	subsd	-1832(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11139 0
	movsd	-1816(%rbp), %xmm1
	movsd	.LC518(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1840(%rbp)
	.loc 1 11140 0
	movq	-1872(%rbp), %rax
	addq	$184, %rax
	movsd	-1400(%rbp), %xmm0
	subsd	-1840(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11141 0
	movq	-1872(%rbp), %rax
	addq	$72, %rax
	movsd	-1400(%rbp), %xmm0
	addsd	-1840(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11143 0
	movsd	-1768(%rbp), %xmm1
	movsd	.LC519(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1848(%rbp)
	.loc 1 11144 0
	movq	-1872(%rbp), %rax
	addq	$152, %rax
	movsd	-1368(%rbp), %xmm0
	subsd	-1848(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11145 0
	movq	-1872(%rbp), %rax
	addq	$104, %rax
	movsd	-1368(%rbp), %xmm0
	addsd	-1848(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11147 0
	movsd	-1792(%rbp), %xmm1
	movsd	.LC520(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -1856(%rbp)
	.loc 1 11148 0
	movq	-1872(%rbp), %rax
	addq	$168, %rax
	movsd	-1384(%rbp), %xmm0
	subsd	-1856(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11149 0
	movq	-1872(%rbp), %rax
	addq	$88, %rax
	movsd	-1384(%rbp), %xmm0
	addsd	-1856(%rbp), %xmm0
	movsd	%xmm0, (%rax)
.LBE2:
	.loc 1 929 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	dct32, .-dct32
	.globl	dct18
	.type	dct18, @function
dct18:
.LFB5:
	.loc 1 11258 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$632, %rsp
	movq	%rdi, -744(%rbp)
	movq	%rsi, -752(%rbp)
	.loc 1 11259 0
	movabsq	$4595424355236410250, %rax
	movq	%rax, -8(%rbp)
	.loc 1 11260 0
	movabsq	$4607045579204271127, %rax
	movq	%rax, -16(%rbp)
	.loc 1 11261 0
	movabsq	$4603964935624201757, %rax
	movq	%rax, -24(%rbp)
	.loc 1 11262 0
	movabsq	$4605075134482436153, %rax
	movq	%rax, -32(%rbp)
	.loc 1 11263 0
	movabsq	$4606639218218904860, %rax
	movq	%rax, -40(%rbp)
	.loc 1 11264 0
	movabsq	$4599832907078044661, %rax
	movq	%rax, -48(%rbp)
	.loc 1 11265 0
	movabsq	$4610479282544200874, %rax
	movq	%rax, -56(%rbp)
	.loc 1 11266 0
	movabsq	$4608194579719069998, %rax
	movq	%rax, -64(%rbp)
	.loc 1 11267 0
	movabsq	$4604544271217802189, %rax
	movq	%rax, -72(%rbp)
	.loc 1 11268 0
	movabsq	$4609047870845172685, %rax
	movq	%rax, -80(%rbp)
	.loc 1 11281 0
	movq	-744(%rbp), %rax
	addq	$136, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	subq	$-128, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 1 11282 0
	movq	-744(%rbp), %rax
	subq	$-128, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$120, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	.loc 1 11283 0
	movq	-744(%rbp), %rax
	addq	$120, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$112, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)
	.loc 1 11284 0
	movq	-744(%rbp), %rax
	addq	$112, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$104, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -112(%rbp)
	.loc 1 11285 0
	movq	-744(%rbp), %rax
	addq	$104, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$96, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -120(%rbp)
	.loc 1 11286 0
	movq	-744(%rbp), %rax
	addq	$96, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$88, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -128(%rbp)
	.loc 1 11287 0
	movq	-744(%rbp), %rax
	addq	$88, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$80, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -136(%rbp)
	.loc 1 11288 0
	movq	-744(%rbp), %rax
	addq	$80, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$72, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)
	.loc 1 11289 0
	movq	-744(%rbp), %rax
	addq	$72, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$64, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -152(%rbp)
	.loc 1 11290 0
	movq	-744(%rbp), %rax
	addq	$64, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$56, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -160(%rbp)
	.loc 1 11291 0
	movq	-744(%rbp), %rax
	addq	$56, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$48, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -168(%rbp)
	.loc 1 11292 0
	movq	-744(%rbp), %rax
	addq	$48, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$40, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -176(%rbp)
	.loc 1 11293 0
	movq	-744(%rbp), %rax
	addq	$40, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$32, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -184(%rbp)
	.loc 1 11294 0
	movq	-744(%rbp), %rax
	addq	$32, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$24, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -192(%rbp)
	.loc 1 11295 0
	movq	-744(%rbp), %rax
	addq	$24, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$16, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -200(%rbp)
	.loc 1 11296 0
	movq	-744(%rbp), %rax
	addq	$16, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -208(%rbp)
	.loc 1 11297 0
	movq	-744(%rbp), %rax
	addq	$8, %rax
	movsd	(%rax), %xmm1
	movq	-744(%rbp), %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -216(%rbp)
	.loc 1 11298 0
	movq	-744(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -224(%rbp)
.LBB3:
	.loc 1 11302 0
	movsd	-224(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	movsd	%xmm0, -232(%rbp)
	.loc 1 11303 0
	movsd	-80(%rbp), %xmm0
	mulsd	-152(%rbp), %xmm0
	movsd	%xmm0, -240(%rbp)
	.loc 1 11304 0
	movsd	-232(%rbp), %xmm0
	subsd	-240(%rbp), %xmm0
	movsd	%xmm0, -248(%rbp)
	.loc 1 11305 0
	movsd	-232(%rbp), %xmm0
	addsd	-240(%rbp), %xmm0
	movsd	%xmm0, -256(%rbp)
.LBB4:
	.loc 1 11308 0
	movsd	-88(%rbp), %xmm0
	addsd	-216(%rbp), %xmm0
	mulsd	-72(%rbp), %xmm0
	movsd	%xmm0, -264(%rbp)
	.loc 1 11309 0
	movsd	-88(%rbp), %xmm0
	subsd	-216(%rbp), %xmm0
	mulsd	-72(%rbp), %xmm0
	movsd	%xmm0, -272(%rbp)
	.loc 1 11310 0
	movsd	-160(%rbp), %xmm0
	subsd	-264(%rbp), %xmm0
	movsd	%xmm0, -280(%rbp)
	.loc 1 11311 0
	movsd	-272(%rbp), %xmm0
	addsd	-144(%rbp), %xmm0
	movsd	%xmm0, -288(%rbp)
	.loc 1 11312 0
	movsd	-160(%rbp), %xmm0
	addsd	-264(%rbp), %xmm0
	movsd	%xmm0, -296(%rbp)
	.loc 1 11313 0
	movsd	-272(%rbp), %xmm0
	subsd	-144(%rbp), %xmm0
	movsd	%xmm0, -304(%rbp)
.LBE4:
.LBB5:
	.loc 1 11317 0
	movsd	-56(%rbp), %xmm0
	mulsd	-176(%rbp), %xmm0
	movsd	%xmm0, -312(%rbp)
	.loc 1 11318 0
	movsd	-104(%rbp), %xmm0
	subsd	-200(%rbp), %xmm0
	mulsd	-72(%rbp), %xmm0
	movsd	%xmm0, -320(%rbp)
	.loc 1 11319 0
	movsd	-104(%rbp), %xmm0
	addsd	-200(%rbp), %xmm0
	mulsd	-64(%rbp), %xmm0
	movsd	%xmm0, -328(%rbp)
	.loc 1 11320 0
	movsd	-320(%rbp), %xmm0
	addsd	-128(%rbp), %xmm0
	movsd	%xmm0, -336(%rbp)
	.loc 1 11321 0
	movsd	-328(%rbp), %xmm0
	subsd	-312(%rbp), %xmm0
	movsd	%xmm0, -344(%rbp)
	.loc 1 11322 0
	movsd	-320(%rbp), %xmm0
	subsd	-128(%rbp), %xmm0
	movsd	%xmm0, -352(%rbp)
	.loc 1 11323 0
	movsd	-328(%rbp), %xmm0
	addsd	-312(%rbp), %xmm0
	movsd	%xmm0, -360(%rbp)
.LBE5:
.LBB6:
	.loc 1 11327 0
	movsd	-168(%rbp), %xmm0
	subsd	-136(%rbp), %xmm0
	mulsd	-72(%rbp), %xmm0
	movsd	%xmm0, -368(%rbp)
	.loc 1 11328 0
	movsd	-168(%rbp), %xmm0
	addsd	-136(%rbp), %xmm0
	mulsd	-72(%rbp), %xmm0
	movsd	%xmm0, -376(%rbp)
	.loc 1 11329 0
	movsd	-184(%rbp), %xmm0
	addsd	-120(%rbp), %xmm0
	mulsd	-72(%rbp), %xmm0
	movsd	%xmm0, -384(%rbp)
	.loc 1 11330 0
	movsd	-120(%rbp), %xmm0
	subsd	-184(%rbp), %xmm0
	mulsd	-72(%rbp), %xmm0
	movsd	%xmm0, -392(%rbp)
	.loc 1 11331 0
	movsd	-384(%rbp), %xmm0
	subsd	-192(%rbp), %xmm0
	movsd	%xmm0, -400(%rbp)
	.loc 1 11332 0
	movsd	-96(%rbp), %xmm0
	subsd	-368(%rbp), %xmm0
	movsd	%xmm0, -408(%rbp)
	.loc 1 11333 0
	movsd	-400(%rbp), %xmm0
	addsd	-408(%rbp), %xmm0
	movsd	%xmm0, -416(%rbp)
	.loc 1 11334 0
	movsd	-376(%rbp), %xmm0
	subsd	-208(%rbp), %xmm0
	movsd	%xmm0, -424(%rbp)
	.loc 1 11335 0
	movsd	-392(%rbp), %xmm0
	addsd	-112(%rbp), %xmm0
	movsd	%xmm0, -432(%rbp)
	.loc 1 11336 0
	movsd	-424(%rbp), %xmm0
	addsd	-432(%rbp), %xmm0
	movsd	%xmm0, -440(%rbp)
	.loc 1 11337 0
	movsd	-192(%rbp), %xmm0
	addsd	-384(%rbp), %xmm0
	movsd	%xmm0, -448(%rbp)
	.loc 1 11338 0
	movsd	-96(%rbp), %xmm0
	addsd	-368(%rbp), %xmm0
	movsd	%xmm0, -456(%rbp)
	.loc 1 11339 0
	movsd	-448(%rbp), %xmm0
	subsd	-456(%rbp), %xmm0
	movsd	%xmm0, -464(%rbp)
	.loc 1 11340 0
	movsd	-376(%rbp), %xmm0
	addsd	-208(%rbp), %xmm0
	movsd	%xmm0, -472(%rbp)
	.loc 1 11341 0
	movsd	-392(%rbp), %xmm0
	subsd	-112(%rbp), %xmm0
	movsd	%xmm0, -480(%rbp)
	.loc 1 11342 0
	movsd	-472(%rbp), %xmm0
	addsd	-480(%rbp), %xmm0
	movsd	%xmm0, -488(%rbp)
.LBE6:
.LBB7:
	.loc 1 11346 0
	movsd	-440(%rbp), %xmm0
	addsd	-288(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	movsd	%xmm0, -496(%rbp)
	.loc 1 11347 0
	movsd	-248(%rbp), %xmm0
	subsd	-336(%rbp), %xmm0
	subsd	-336(%rbp), %xmm0
	movsd	%xmm0, -504(%rbp)
	.loc 1 11348 0
	movsd	-280(%rbp), %xmm0
	addsd	-416(%rbp), %xmm0
	movsd	%xmm0, -512(%rbp)
	.loc 1 11349 0
	movsd	-504(%rbp), %xmm0
	subsd	-512(%rbp), %xmm0
	movsd	%xmm0, -520(%rbp)
	.loc 1 11350 0
	movq	-752(%rbp), %rax
	addq	$104, %rax
	movsd	-504(%rbp), %xmm0
	addsd	-512(%rbp), %xmm0
	addsd	-512(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11351 0
	movq	-752(%rbp), %rax
	addq	$80, %rax
	movsd	-520(%rbp), %xmm0
	addsd	-496(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11352 0
	movq	-752(%rbp), %rax
	addq	$8, %rax
	movsd	-520(%rbp), %xmm0
	subsd	-496(%rbp), %xmm0
	movsd	%xmm0, (%rax)
.LBE7:
.LBB8:
	.loc 1 11356 0
	movsd	-488(%rbp), %xmm0
	addsd	-304(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	movsd	%xmm0, -528(%rbp)
	.loc 1 11357 0
	movsd	-256(%rbp), %xmm0
	addsd	-352(%rbp), %xmm0
	addsd	-352(%rbp), %xmm0
	movsd	%xmm0, -536(%rbp)
	.loc 1 11358 0
	movsd	-296(%rbp), %xmm0
	subsd	-464(%rbp), %xmm0
	movsd	%xmm0, -544(%rbp)
	.loc 1 11359 0
	movsd	-536(%rbp), %xmm0
	subsd	-544(%rbp), %xmm0
	movsd	%xmm0, -552(%rbp)
	.loc 1 11360 0
	movq	-752(%rbp), %rax
	addq	$32, %rax
	movsd	-536(%rbp), %xmm0
	addsd	-544(%rbp), %xmm0
	addsd	-544(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11361 0
	movq	-752(%rbp), %rax
	subq	$-128, %rax
	movsd	-552(%rbp), %xmm0
	addsd	-528(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11362 0
	movq	-752(%rbp), %rax
	addq	$56, %rax
	movsd	-552(%rbp), %xmm0
	subsd	-528(%rbp), %xmm0
	movsd	%xmm0, (%rax)
.LBE8:
.LBB9:
	.loc 1 11366 0
	movsd	-256(%rbp), %xmm0
	subsd	-352(%rbp), %xmm0
	movsd	%xmm0, -560(%rbp)
	.loc 1 11367 0
	movsd	-560(%rbp), %xmm0
	addsd	-360(%rbp), %xmm0
	movsd	%xmm0, -568(%rbp)
	.loc 1 11368 0
	movsd	-560(%rbp), %xmm0
	subsd	-360(%rbp), %xmm0
	movsd	%xmm0, -576(%rbp)
.LBB10:
	.loc 1 11371 0
	movsd	-464(%rbp), %xmm0
	addsd	-296(%rbp), %xmm0
	addsd	-296(%rbp), %xmm0
	movsd	%xmm0, -584(%rbp)
	.loc 1 11372 0
	movsd	-472(%rbp), %xmm0
	subsd	-480(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	movsd	%xmm0, -592(%rbp)
	.loc 1 11373 0
	movsd	-584(%rbp), %xmm0
	addsd	-592(%rbp), %xmm0
	movsd	%xmm0, -600(%rbp)
	.loc 1 11374 0
	movsd	-584(%rbp), %xmm0
	subsd	-592(%rbp), %xmm0
	movsd	%xmm0, -608(%rbp)
	.loc 1 11375 0
	movsd	-304(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	subsd	-488(%rbp), %xmm0
	movsd	%xmm0, -616(%rbp)
	.loc 1 11376 0
	movsd	-448(%rbp), %xmm0
	addsd	-456(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	movsd	%xmm0, -624(%rbp)
	.loc 1 11377 0
	movsd	-616(%rbp), %xmm0
	subsd	-624(%rbp), %xmm0
	movsd	%xmm0, -632(%rbp)
	.loc 1 11378 0
	movsd	-624(%rbp), %xmm0
	addsd	-616(%rbp), %xmm0
	movsd	%xmm0, -640(%rbp)
.LBE10:
	.loc 1 11380 0
	movq	-752(%rbp), %rax
	addq	$88, %rax
	movsd	-48(%rbp), %xmm0
	mulsd	-632(%rbp), %xmm0
	movsd	-568(%rbp), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	mulsd	-600(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11381 0
	movsd	-32(%rbp), %xmm0
	mulsd	-600(%rbp), %xmm0
	addsd	-568(%rbp), %xmm0
	movsd	-24(%rbp), %xmm1
	mulsd	-632(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movq	-752(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 11382 0
	movq	-752(%rbp), %rax
	addq	$64, %rax
	movsd	-32(%rbp), %xmm0
	mulsd	-608(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	addsd	-576(%rbp), %xmm1
	movsd	-24(%rbp), %xmm0
	mulsd	-640(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11383 0
	movq	-752(%rbp), %rax
	addq	$120, %rax
	movsd	-48(%rbp), %xmm0
	mulsd	-640(%rbp), %xmm0
	addsd	-576(%rbp), %xmm0
	movsd	-40(%rbp), %xmm1
	mulsd	-608(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11384 0
	movq	-752(%rbp), %rax
	addq	$24, %rax
	movsd	-8(%rbp), %xmm0
	mulsd	-608(%rbp), %xmm0
	addsd	-576(%rbp), %xmm0
	movsd	-16(%rbp), %xmm1
	mulsd	-640(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11385 0
	movq	-752(%rbp), %rax
	addq	$96, %rax
	movsd	-8(%rbp), %xmm0
	mulsd	-600(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	addsd	-568(%rbp), %xmm1
	movsd	-16(%rbp), %xmm0
	mulsd	-632(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
.LBE9:
.LBB11:
	.loc 1 11389 0
	movsd	-248(%rbp), %xmm0
	addsd	-336(%rbp), %xmm0
	movsd	%xmm0, -648(%rbp)
	.loc 1 11390 0
	movsd	-648(%rbp), %xmm0
	addsd	-344(%rbp), %xmm0
	movsd	%xmm0, -656(%rbp)
	.loc 1 11391 0
	movsd	-648(%rbp), %xmm0
	subsd	-344(%rbp), %xmm0
	movsd	%xmm0, -664(%rbp)
.LBB12:
	.loc 1 11394 0
	movsd	-280(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	subsd	-416(%rbp), %xmm0
	movsd	%xmm0, -672(%rbp)
	.loc 1 11395 0
	movsd	-432(%rbp), %xmm0
	subsd	-424(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	movsd	%xmm0, -680(%rbp)
	.loc 1 11396 0
	movsd	-672(%rbp), %xmm0
	subsd	-680(%rbp), %xmm0
	movsd	%xmm0, -688(%rbp)
	.loc 1 11397 0
	movsd	-672(%rbp), %xmm0
	addsd	-680(%rbp), %xmm0
	movsd	%xmm0, -696(%rbp)
	.loc 1 11398 0
	movsd	-440(%rbp), %xmm0
	subsd	-288(%rbp), %xmm0
	subsd	-288(%rbp), %xmm0
	movsd	%xmm0, -704(%rbp)
	.loc 1 11399 0
	movsd	-400(%rbp), %xmm0
	subsd	-408(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	movsd	%xmm0, -712(%rbp)
	.loc 1 11400 0
	movsd	-704(%rbp), %xmm0
	subsd	-712(%rbp), %xmm0
	movsd	%xmm0, -720(%rbp)
	.loc 1 11401 0
	movsd	-712(%rbp), %xmm0
	addsd	-704(%rbp), %xmm0
	movsd	%xmm0, -728(%rbp)
.LBE12:
	.loc 1 11403 0
	movq	-752(%rbp), %rax
	addq	$16, %rax
	movsd	-48(%rbp), %xmm0
	mulsd	-720(%rbp), %xmm0
	addsd	-656(%rbp), %xmm0
	movsd	-40(%rbp), %xmm1
	mulsd	-688(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11404 0
	movq	-752(%rbp), %rax
	addq	$112, %rax
	movsd	-8(%rbp), %xmm0
	mulsd	-688(%rbp), %xmm0
	addsd	-656(%rbp), %xmm0
	movsd	-16(%rbp), %xmm1
	mulsd	-720(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11405 0
	movq	-752(%rbp), %rax
	addq	$40, %rax
	movsd	-8(%rbp), %xmm0
	mulsd	-696(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	addsd	-664(%rbp), %xmm1
	movsd	-16(%rbp), %xmm0
	mulsd	-728(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11406 0
	movq	-752(%rbp), %rax
	addq	$136, %rax
	movsd	-32(%rbp), %xmm0
	mulsd	-696(%rbp), %xmm0
	addsd	-664(%rbp), %xmm0
	movsd	-24(%rbp), %xmm1
	mulsd	-728(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11407 0
	movq	-752(%rbp), %rax
	addq	$48, %rax
	movsd	-48(%rbp), %xmm0
	mulsd	-728(%rbp), %xmm0
	movsd	-664(%rbp), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	-40(%rbp), %xmm1
	mulsd	-696(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11408 0
	movq	-752(%rbp), %rax
	addq	$72, %rax
	movsd	-32(%rbp), %xmm0
	mulsd	-688(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	addsd	-656(%rbp), %xmm1
	movsd	-24(%rbp), %xmm0
	mulsd	-720(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
.LBE11:
.LBE3:
	.loc 1 11411 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	dct18, .-dct18
	.globl	dct6
	.type	dct6, @function
dct6:
.LFB6:
	.loc 1 11458 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$72, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -192(%rbp)
	.loc 1 11481 0
	movq	-184(%rbp), %rax
	movsd	(%rax), %xmm1
	movq	-184(%rbp), %rax
	addq	$24, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	.loc 1 11482 0
	movq	-184(%rbp), %rax
	addq	$24, %rax
	movsd	(%rax), %xmm1
	movq	-184(%rbp), %rax
	addq	$48, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	.loc 1 11483 0
	movq	-184(%rbp), %rax
	addq	$48, %rax
	movsd	(%rax), %xmm1
	movq	-184(%rbp), %rax
	addq	$72, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	.loc 1 11484 0
	movq	-184(%rbp), %rax
	addq	$72, %rax
	movsd	(%rax), %xmm1
	movq	-184(%rbp), %rax
	addq	$96, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	.loc 1 11485 0
	movq	-184(%rbp), %rax
	addq	$96, %rax
	movsd	(%rax), %xmm1
	movq	-184(%rbp), %rax
	addq	$120, %rax
	movsd	(%rax), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	.loc 1 11486 0
	movsd	-8(%rbp), %xmm0
	addsd	-40(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	.loc 1 11487 0
	movsd	-40(%rbp), %xmm0
	subsd	-8(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	.loc 1 11488 0
	movsd	-24(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc 1 11489 0
	movsd	-64(%rbp), %xmm0
	subsd	-56(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	.loc 1 11490 0
	movsd	-24(%rbp), %xmm0
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, -80(%rbp)
	.loc 1 11491 0
	movq	-184(%rbp), %rax
	movsd	(%rax), %xmm0
	subsd	-32(%rbp), %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 1 11492 0
	movsd	-32(%rbp), %xmm1
	movsd	.LC530(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	.loc 1 11493 0
	movq	-184(%rbp), %rax
	movsd	(%rax), %xmm0
	addsd	-96(%rbp), %xmm0
	movsd	%xmm0, -104(%rbp)
	.loc 1 11494 0
	movsd	-16(%rbp), %xmm1
	movsd	.LC531(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -112(%rbp)
	.loc 1 11495 0
	movsd	-112(%rbp), %xmm0
	addsd	-104(%rbp), %xmm0
	movsd	%xmm0, -120(%rbp)
	.loc 1 11496 0
	movsd	-104(%rbp), %xmm0
	subsd	-112(%rbp), %xmm0
	movsd	%xmm0, -128(%rbp)
	.loc 1 11497 0
	movsd	-72(%rbp), %xmm1
	movsd	.LC532(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -136(%rbp)
	.loc 1 11498 0
	movsd	-80(%rbp), %xmm1
	movsd	.LC533(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)
	.loc 1 11499 0
	movsd	-48(%rbp), %xmm1
	movsd	.LC534(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -152(%rbp)
	.loc 1 11500 0
	movsd	-136(%rbp), %xmm0
	addsd	-152(%rbp), %xmm0
	movsd	%xmm0, -160(%rbp)
	.loc 1 11501 0
	movsd	-152(%rbp), %xmm0
	subsd	-136(%rbp), %xmm0
	movsd	%xmm0, -168(%rbp)
	.loc 1 11502 0
	movsd	-160(%rbp), %xmm0
	addsd	-128(%rbp), %xmm0
	movq	-192(%rbp), %rax
	movsd	%xmm0, (%rax)
	.loc 1 11503 0
	movq	-192(%rbp), %rax
	addq	$8, %rax
	movsd	-144(%rbp), %xmm0
	addsd	-88(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11504 0
	movq	-192(%rbp), %rax
	addq	$16, %rax
	movsd	-168(%rbp), %xmm0
	addsd	-120(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11505 0
	movq	-192(%rbp), %rax
	addq	$24, %rax
	movsd	-120(%rbp), %xmm0
	subsd	-168(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11506 0
	movq	-192(%rbp), %rax
	addq	$32, %rax
	movsd	-88(%rbp), %xmm0
	subsd	-144(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11507 0
	movq	-192(%rbp), %rax
	addq	$40, %rax
	movsd	-128(%rbp), %xmm0
	subsd	-160(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	.loc 1 11508 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	dct6, .-dct6
	.section	.rodata
	.align 16
.LC0:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC1:
	.long	0
	.long	1105199104
	.align 8
.LC3:
	.long	3892279331
	.long	1060405647
	.align 8
.LC4:
	.long	3295841487
	.long	1063441315
	.align 8
.LC5:
	.long	4163359904
	.long	1064585469
	.align 8
.LC6:
	.long	2295212543
	.long	1066828161
	.align 8
.LC7:
	.long	1184215994
	.long	1068267377
	.align 8
.LC8:
	.long	477751980
	.long	1068640389
	.align 8
.LC9:
	.long	2023733523
	.long	1071244078
	.align 8
.LC10:
	.long	503285200
	.long	1072294012
	.align 8
.LC11:
	.long	1351530952
	.long	-1092103341
	.align 8
.LC12:
	.long	375842397
	.long	1060432710
	.align 8
.LC13:
	.long	2407507230
	.long	1063537122
	.align 8
.LC14:
	.long	3667863250
	.long	1064690587
	.align 8
.LC15:
	.long	1188705577
	.long	1066878026
	.align 8
.LC16:
	.long	3502561811
	.long	1068307925
	.align 8
.LC17:
	.long	254546936
	.long	1068586161
	.align 8
.LC18:
	.long	3006840553
	.long	1071246352
	.align 8
.LC19:
	.long	1926441493
	.long	1072382792
	.align 8
.LC20:
	.long	3581979183
	.long	1071086730
	.align 8
.LC21:
	.long	2438380276
	.long	1068810117
	.align 8
.LC22:
	.long	4109434735
	.long	1068056054
	.align 8
.LC23:
	.long	3500935165
	.long	1066926057
	.align 8
.LC24:
	.long	3979726020
	.long	1064364433
	.align 8
.LC25:
	.long	453125876
	.long	1063476130
	.align 8
.LC26:
	.long	2705656456
	.long	1060211591
	.align 8
.LC27:
	.long	3840962524
	.long	-1092011866
	.align 8
.LC28:
	.long	4283297658
	.long	1060545414
	.align 8
.LC29:
	.long	3612895070
	.long	1063640844
	.align 8
.LC30:
	.long	3775266541
	.long	1064795354
	.align 8
.LC31:
	.long	1200672041
	.long	1066928617
	.align 8
.LC32:
	.long	2652414852
	.long	1068348756
	.align 8
.LC33:
	.long	4242914415
	.long	1068517314
	.align 8
.LC34:
	.long	682545283
	.long	1071252066
	.align 8
.LC35:
	.long	1201194257
	.long	1072484035
	.align 8
.LC36:
	.long	1339363427
	.long	1070946352
	.align 8
.LC37:
	.long	1429991379
	.long	1068991872
	.align 8
.LC38:
	.long	1894200736
	.long	1067867231
	.align 8
.LC39:
	.long	1212719434
	.long	1067031922
	.align 8
.LC40:
	.long	828611239
	.long	1064046159
	.align 8
.LC41:
	.long	2126546323
	.long	1063511713
	.align 8
.LC42:
	.long	3187661401
	.long	1060047909
	.align 8
.LC43:
	.long	520518178
	.long	-1091904500
	.align 8
.LC44:
	.long	1673540995
	.long	1060612024
	.align 8
.LC45:
	.long	2036410064
	.long	1063754577
	.align 8
.LC46:
	.long	437523095
	.long	1064900670
	.align 8
.LC47:
	.long	983652684
	.long	1066980238
	.align 8
.LC48:
	.long	3428565455
	.long	1068389661
	.align 8
.LC49:
	.long	659635365
	.long	1068361868
	.align 8
.LC50:
	.long	1662478296
	.long	1071260890
	.align 8
.LC51:
	.long	1072294890
	.long	1072600597
	.align 8
.LC52:
	.long	3906369589
	.long	1070820296
	.align 8
.LC53:
	.long	1869769528
	.long	1069189124
	.align 8
.LC54:
	.long	4027758520
	.long	1067696759
	.align 8
.LC55:
	.long	291128108
	.long	1067146980
	.align 8
.LC56:
	.long	3501854100
	.long	1063706756
	.align 8
.LC57:
	.long	3456457723
	.long	1063555174
	.align 8
.LC58:
	.long	1573504618
	.long	1059726636
	.align 8
.LC59:
	.long	118283347
	.long	-1091777355
	.align 8
.LC60:
	.long	1593075547
	.long	1060677558
	.align 8
.LC61:
	.long	1410051937
	.long	1063881069
	.align 8
.LC62:
	.long	1079164531
	.long	1065007334
	.align 8
.LC63:
	.long	3687905542
	.long	1067032326
	.align 8
.LC64:
	.long	3714493123
	.long	1068430469
	.align 8
.LC65:
	.long	3508151683
	.long	1068141726
	.align 8
.LC66:
	.long	1152906534
	.long	1071272504
	.align 8
.LC67:
	.long	3992150567
	.long	1072714750
	.align 8
.LC68:
	.long	2673334883
	.long	1070706412
	.align 8
.LC69:
	.long	491715676
	.long	1069406873
	.align 8
.LC70:
	.long	803606967
	.long	1067542519
	.align 8
.LC71:
	.long	960565159
	.long	1067274701
	.align 8
.LC72:
	.long	755457849
	.long	1063409485
	.align 8
.LC73:
	.long	126852318
	.long	1063608283
	.align 8
.LC74:
	.long	445569472
	.long	1059510754
	.align 8
.LC75:
	.long	2666843619
	.long	-1091625117
	.align 8
.LC76:
	.long	1742551270
	.long	1060780906
	.align 8
.LC77:
	.long	2843233234
	.long	1064024027
	.align 8
.LC78:
	.long	2661656832
	.long	1065116083
	.align 8
.LC79:
	.long	1124806931
	.long	1067085103
	.align 8
.LC80:
	.long	3639578645
	.long	1068471630
	.align 8
.LC81:
	.long	3202818590
	.long	1067863289
	.align 8
.LC82:
	.long	2074864076
	.long	1071286699
	.align 8
.LC83:
	.long	743675991
	.long	1072794761
	.align 8
.LC84:
	.long	1841308641
	.long	1070602921
	.align 8
.LC85:
	.long	1760747770
	.long	1069599424
	.align 8
.LC86:
	.long	148326156
	.long	1067353513
	.align 8
.LC87:
	.long	4174376494
	.long	1067419728
	.align 8
.LC88:
	.long	2600730920
	.long	1063040420
	.align 8
.LC89:
	.long	3649836747
	.long	1063665499
	.align 8
.LC90:
	.long	2633805625
	.long	1059312091
	.align 8
.LC91:
	.long	2320716528
	.long	-1091503976
	.align 8
.LC92:
	.long	3380269717
	.long	1060882367
	.align 8
.LC93:
	.long	1627852573
	.long	1064188596
	.align 8
.LC94:
	.long	3981692082
	.long	1065225291
	.align 8
.LC95:
	.long	854594336
	.long	1067138820
	.align 8
.LC96:
	.long	73656394
	.long	1068505664
	.align 8
.LC97:
	.long	1791591726
	.long	1067508019
	.align 8
.LC98:
	.long	4289368833
	.long	1071303322
	.align 8
.LC99:
	.long	1877096705
	.long	1072890586
	.align 8
.LC100:
	.long	3982567695
	.long	1070420711
	.align 8
.LC101:
	.long	1157472771
	.long	1069739716
	.align 8
.LC102:
	.long	1136636520
	.long	1067097190
	.align 8
.LC103:
	.long	3283190700
	.long	1067518880
	.align 8
.LC104:
	.long	1115057127
	.long	1062580100
	.align 8
.LC105:
	.long	2892318032
	.long	1063736764
	.align 8
.LC106:
	.long	2760623560
	.long	1059202153
	.align 8
.LC107:
	.long	2573857840
	.long	-1090341353
	.align 8
.LC108:
	.long	3969306600
	.long	1060982915
	.align 8
.LC109:
	.long	3684218777
	.long	1064343399
	.align 8
.LC110:
	.long	4028281803
	.long	1065338070
	.align 8
.LC111:
	.long	1925918378
	.long	1067191388
	.align 8
.LC112:
	.long	691059105
	.long	1068526062
	.align 8
.LC113:
	.long	182791514
	.long	1066648918
	.align 8
.LC114:
	.long	351092330
	.long	1071322302
	.align 8
.LC115:
	.long	2234993968
	.long	1073007490
	.align 8
.LC116:
	.long	2119149192
	.long	1070247212
	.align 8
.LC117:
	.long	2410801735
	.long	1069904367
	.align 8
.LC118:
	.long	2753905450
	.long	1066861481
	.align 8
.LC119:
	.long	2495331669
	.long	1067618458
	.align 8
.LC120:
	.long	2282600307
	.long	1062122112
	.align 8
.LC121:
	.long	2389019267
	.long	1063826516
	.align 8
.LC122:
	.long	3018033397
	.long	1058994507
	.align 8
.LC123:
	.long	2176520959
	.long	-1090197567
	.align 8
.LC124:
	.long	2348051491
	.long	1061118894
	.align 8
.LC125:
	.long	3582895610
	.long	1064454840
	.align 8
.LC126:
	.long	1243044895
	.long	1065403034
	.align 8
.LC127:
	.long	2475626711
	.long	1067245035
	.align 8
.LC128:
	.long	1935114835
	.long	1068546268
	.align 8
.LC129:
	.long	2595663838
	.long	1062657382
	.align 8
.LC130:
	.long	205261422
	.long	1071343529
	.align 8
.LC131:
	.long	2070165540
	.long	1073153365
	.align 8
.LC132:
	.long	3980543394
	.long	1070087306
	.align 8
.LC133:
	.long	2809720937
	.long	1070103110
	.align 8
.LC134:
	.long	2649362846
	.long	1066644466
	.align 8
.LC135:
	.long	1889953158
	.long	1067740381
	.align 8
.LC136:
	.long	52419452
	.long	1061387178
	.align 8
.LC137:
	.long	2343894305
	.long	1063930729
	.align 8
.LC138:
	.long	2745084362
	.long	1058808932
	.align 8
.LC139:
	.long	3910336411
	.long	-1090011336
	.align 8
.LC140:
	.long	678659355
	.long	1061206612
	.align 8
.LC141:
	.long	1738637222
	.long	1064599553
	.align 8
.LC142:
	.long	310243334
	.long	1065461820
	.align 8
.LC143:
	.long	1056112288
	.long	1067298540
	.align 8
.LC144:
	.long	539690517
	.long	1068566356
	.align 8
.LC145:
	.long	4079048353
	.long	1066869960
	.align 8
.LC146:
	.long	1637673103
	.long	1071366965
	.align 8
.LC147:
	.long	2536597761
	.long	1073340656
	.align 8
.LC148:
	.long	1998144399
	.long	1069939233
	.align 8
.LC149:
	.long	1875551374
	.long	1070351181
	.align 8
.LC150:
	.long	4111327724
	.long	1066444053
	.align 8
.LC151:
	.long	2806020377
	.long	1067892700
	.align 8
.LC152:
	.long	3154260372
	.long	1060314645
	.align 8
.LC153:
	.long	4177399269
	.long	1064079862
	.align 8
.LC154:
	.long	3613242496
	.long	1058495916
	.align 8
.LC155:
	.long	2818527024
	.long	-1089761475
	.align 8
.LC156:
	.long	1458066436
	.long	1061274580
	.align 8
.LC157:
	.long	4188207760
	.long	1064772919
	.align 8
.LC158:
	.long	3106448189
	.long	1065521317
	.align 8
.LC159:
	.long	3103001894
	.long	1067348057
	.align 8
.LC160:
	.long	643885633
	.long	1068586121
	.align 8
.LC161:
	.long	3184992935
	.long	1068273168
	.align 8
.LC162:
	.long	1842750542
	.long	1071392667
	.align 8
.LC163:
	.long	2795059091
	.long	1073590072
	.align 8
.LC164:
	.long	795490820
	.long	1069801629
	.align 8
.LC165:
	.long	3136005118
	.long	1070634783
	.align 8
.LC166:
	.long	2378949291
	.long	1066115210
	.align 8
.LC167:
	.long	2106022724
	.long	1068094144
	.align 8
.LC168:
	.long	700468906
	.long	1055963230
	.align 8
.LC169:
	.long	608396835
	.long	1064281700
	.align 8
.LC170:
	.long	3225295278
	.long	1058334307
	.align 8
.LC171:
	.long	3669006575
	.long	-1088900749
	.align 8
.LC172:
	.long	1696508073
	.long	1061343319
	.align 8
.LC173:
	.long	2157964719
	.long	1065009227
	.align 8
.LC174:
	.long	2946294426
	.long	1065581959
	.align 8
.LC175:
	.long	2867419078
	.long	1067397168
	.align 8
.LC176:
	.long	3198414892
	.long	1068605629
	.align 8
.LC177:
	.long	1719899258
	.long	1069188781
	.align 8
.LC178:
	.long	1333045513
	.long	1071420548
	.align 8
.LC179:
	.long	4225593414
	.long	1073840320
	.align 8
.LC180:
	.long	754765939
	.long	1069673273
	.align 8
.LC181:
	.long	2037830186
	.long	1070855939
	.align 8
.LC182:
	.long	3774365255
	.long	1065769862
	.align 8
.LC183:
	.long	3785829076
	.long	1068371993
	.align 8
.LC184:
	.long	443435704
	.long	1059972445
	.align 8
.LC185:
	.long	1925285992
	.long	1064427649
	.align 8
.LC186:
	.long	3767300668
	.long	1058180699
	.align 8
.LC187:
	.long	2379110763
	.long	-1088503498
	.align 8
.LC188:
	.long	745494002
	.long	1061430029
	.align 8
.LC189:
	.long	995971991
	.long	1065354410
	.align 8
.LC190:
	.long	2928310982
	.long	1065644170
	.align 8
.LC191:
	.long	3717675064
	.long	1067437009
	.align 8
.LC192:
	.long	4290900483
	.long	1068624675
	.align 8
.LC193:
	.long	243153223
	.long	1069986009
	.align 8
.LC194:
	.long	4089659109
	.long	1071450745
	.align 8
.LC195:
	.long	1301856809
	.long	1074101662
	.align 8
.LC196:
	.long	2959197059
	.long	1069553119
	.align 8
.LC197:
	.long	4229356516
	.long	1071182208
	.align 8
.LC198:
	.long	739903229
	.long	1065447887
	.align 8
.LC199:
	.long	1108553748
	.long	1068642513
	.align 8
.LC200:
	.long	4064891925
	.long	1060966127
	.align 8
.LC201:
	.long	2205314653
	.long	1064641760
	.align 8
.LC202:
	.long	349461177
	.long	1058033724
	.align 8
.LC203:
	.long	2701051371
	.long	-1087683901
	.align 8
.LC204:
	.long	338700567
	.long	1061518214
	.align 8
.LC205:
	.long	3199794466
	.long	1065623629
	.align 8
.LC206:
	.long	1456853115
	.long	1065708377
	.align 8
.LC207:
	.long	3177992114
	.long	1067457332
	.align 8
.LC208:
	.long	3489170190
	.long	1068643311
	.align 8
.LC209:
	.long	3492596452
	.long	1070816349
	.align 8
.LC210:
	.long	3278176663
	.long	1071483287
	.align 8
.LC211:
	.long	853583065
	.long	1074536873
	.align 8
.LC212:
	.long	1837858562
	.long	1069332887
	.align 8
.LC213:
	.long	3907178565
	.long	1071682059
	.align 8
.LC214:
	.long	3985019938
	.long	1064941376
	.align 8
.LC215:
	.long	3021523873
	.long	1068984827
	.align 8
.LC216:
	.long	326806939
	.long	1061485087
	.align 8
.LC217:
	.long	3634104141
	.long	1065000759
	.align 8
.LC218:
	.long	3381107039
	.long	1057771126
	.align 8
.LC219:
	.long	344347976
	.long	-1087084656
	.align 8
.LC220:
	.long	1078822552
	.long	1061608494
	.align 8
.LC221:
	.long	857639903
	.long	1066153786
	.align 8
.LC222:
	.long	1390096007
	.long	1065773987
	.align 8
.LC223:
	.long	3343739215
	.long	1067451730
	.align 8
.LC224:
	.long	2925988900
	.long	1068661447
	.align 8
.LC225:
	.long	3227585177
	.long	1071763891
	.align 8
.LC226:
	.long	2751822905
	.long	1071518257
	.align 8
.LC227:
	.long	451439453
	.long	1075098607
	.align 8
.LC228:
	.long	4283909844
	.long	1069119846
	.align 8
.LC229:
	.long	2863953323
	.long	1072214751
	.align 8
.LC230:
	.long	2644305260
	.long	1064377624
	.align 8
.LC231:
	.long	226495835
	.long	1069607648
	.align 8
.LC232:
	.long	2386899239
	.long	1061855443
	.align 8
.LC233:
	.long	2611809118
	.long	1065526956
	.align 8
.LC234:
	.long	197204592
	.long	1057759927
	.align 8
.LC235:
	.long	548389503
	.long	-1085703780
	.align 8
.LC236:
	.long	528295287
	.long	1061701501
	.align 8
.LC237:
	.long	3855592568
	.long	1067054050
	.align 8
.LC238:
	.long	4035757047
	.long	1065840441
	.align 8
.LC239:
	.long	665515647
	.long	1067283611
	.align 8
.LC240:
	.long	2626680362
	.long	1068678727
	.align 8
.LC241:
	.long	3068077176
	.long	1073037034
	.align 8
.LC242:
	.long	406737691
	.long	1071555827
	.align 8
.LC243:
	.long	1120638512
	.long	1076121011
	.align 8
.LC244:
	.long	1214155062
	.long	1068918376
	.align 8
.LC245:
	.long	3439761306
	.long	1073248660
	.align 8
.LC246:
	.long	2508838611
	.long	1063388558
	.align 8
.LC247:
	.long	1183281096
	.long	1070613150
	.align 8
.LC248:
	.long	739155886
	.long	1062193613
	.align 8
.LC249:
	.long	1574137338
	.long	1066511453
	.align 8
.LC250:
	.long	1878355015
	.long	1057490797
	.align 8
.LC251:
	.long	4006736920
	.long	1061814271
	.align 8
.LC252:
	.long	4162111107
	.long	1065909247
	.align 8
.LC253:
	.long	4287367472
	.long	1068695423
	.align 8
.LC254:
	.long	70369
	.long	1071596128
	.align 8
.LC255:
	.long	3659175
	.long	1068727168
	.align 8
.LC256:
	.long	244661128
	.long	1060536321
	.align 8
.LC257:
	.long	3826592935
	.long	1062354943
	.align 8
.LC258:
	.long	4035225266
	.long	1057226752
	.align 8
.LC259:
	.long	3993432334
	.long	1062113778
	.align 8
.LC260:
	.long	3003287564
	.long	1061931153
	.align 8
.LC261:
	.long	138313847
	.long	1066678406
	.align 8
.LC262:
	.long	3738956087
	.long	1065979873
	.align 8
.LC263:
	.long	3231472899
	.long	1067904369
	.align 8
.LC264:
	.long	2876104591
	.long	1068711150
	.align 8
.LC265:
	.long	2971999324
	.long	1073512296
	.align 8
.LC266:
	.long	2854157442
	.long	1071639319
	.align 8
.LC267:
	.long	4032869354
	.long	1076067900
	.align 8
.LC268:
	.long	1298255645
	.long	1068544806
	.align 8
.LC269:
	.long	2766278135
	.long	1073207411
	.align 8
.LC270:
	.long	3111140720
	.long	1062676259
	.align 8
.LC271:
	.long	3935504171
	.long	1070452816
	.align 8
.LC272:
	.long	2439677501
	.long	1062495818
	.align 8
.LC273:
	.long	3797637732
	.long	1066328946
	.align 8
.LC274:
	.long	2853365095
	.long	1057228333
	.align 8
.LC275:
	.long	1228909756
	.long	1061280422
	.align 8
.LC276:
	.long	3647591623
	.long	1062036538
	.align 8
.LC277:
	.long	1706756970
	.long	1065412038
	.align 8
.LC278:
	.long	382194545
	.long	1066051805
	.align 8
.LC279:
	.long	2164117388
	.long	1067825216
	.align 8
.LC280:
	.long	1483541627
	.long	1068725757
	.align 8
.LC281:
	.long	2340594867
	.long	1072704078
	.align 8
.LC282:
	.long	3335419047
	.long	1071665147
	.align 8
.LC283:
	.long	820174920
	.long	1074992401
	.align 8
.LC284:
	.long	2054566115
	.long	1068242077
	.align 8
.LC285:
	.long	1265298739
	.long	1072133133
	.align 8
.LC286:
	.long	428536699
	.long	1063862047
	.align 8
.LC287:
	.long	3079312254
	.long	1069315184
	.align 8
.LC288:
	.long	144981889
	.long	1062615912
	.align 8
.LC289:
	.long	4290598548
	.long	1065157445
	.align 8
.LC290:
	.long	3923560254
	.long	1056969678
	.align 8
.LC291:
	.long	652627258
	.long	1060625014
	.align 8
.LC292:
	.long	1934105061
	.long	1062180745
	.align 8
.LC293:
	.long	1583102553
	.long	1064414541
	.align 8
.LC294:
	.long	3279876478
	.long	1066125564
	.align 8
.LC295:
	.long	478474712
	.long	1067821974
	.align 8
.LC296:
	.long	995675506
	.long	1068739068
	.align 8
.LC297:
	.long	1678002338
	.long	1072182460
	.align 8
.LC298:
	.long	3685180270
	.long	1071689999
	.align 8
.LC299:
	.long	3352197172
	.long	1074324483
	.align 8
.LC300:
	.long	4238502851
	.long	1067907496
	.align 8
.LC301:
	.long	2076115016
	.long	1071558063
	.align 8
.LC302:
	.long	1822614395
	.long	1064508661
	.align 8
.LC303:
	.long	2395475598
	.long	1068633271
	.align 8
.LC304:
	.long	734578283
	.long	1062724141
	.align 8
.LC305:
	.long	3790985585
	.long	1064442456
	.align 8
.LC306:
	.long	3095659961
	.long	1056976078
	.align 8
.LC307:
	.long	1607943903
	.long	1060405462
	.align 8
.LC308:
	.long	2988662057
	.long	1062261440
	.align 8
.LC309:
	.long	99124190
	.long	1063404226
	.align 8
.LC310:
	.long	2080487493
	.long	1066201699
	.align 8
.LC311:
	.long	3928203885
	.long	1067838664
	.align 8
.LC312:
	.long	1819019336
	.long	1068751007
	.align 8
.LC313:
	.long	3299509013
	.long	1071921020
	.align 8
.LC314:
	.long	400005952
	.long	1071716700
	.align 8
.LC315:
	.long	1606276772
	.long	1073889268
	.align 8
.LC316:
	.long	2248132956
	.long	1067584974
	.align 8
.LC317:
	.long	1051793508
	.long	1071023431
	.align 8
.LC318:
	.long	2077655261
	.long	1064914033
	.align 8
.LC319:
	.long	3755444317
	.long	1068085360
	.align 8
.LC320:
	.long	1100559236
	.long	1062829410
	.align 8
.LC321:
	.long	1727647049
	.long	1063866124
	.align 8
.LC322:
	.long	1562623118
	.long	1056471121
	.align 8
.LC323:
	.long	3130150742
	.long	1060275487
	.align 8
.LC324:
	.long	2191127601
	.long	1062332779
	.align 8
.LC325:
	.long	832141302
	.long	1062065788
	.align 8
.LC326:
	.long	2237666966
	.long	1066278679
	.align 8
.LC327:
	.long	1745067858
	.long	1067864166
	.align 8
.LC328:
	.long	288878194
	.long	1068761336
	.align 8
.LC329:
	.long	929146339
	.long	1071768142
	.align 8
.LC330:
	.long	1285768287
	.long	1071745403
	.align 8
.LC331:
	.long	180763530
	.long	1073514059
	.align 8
.LC332:
	.long	2374831072
	.long	1067095015
	.align 8
.LC333:
	.long	3665354231
	.long	1070700535
	.align 8
.LC334:
	.long	4131548989
	.long	1065303997
	.align 8
.LC335:
	.long	2179564414
	.long	1067676628
	.align 8
.LC336:
	.long	1656905902
	.long	1062915490
	.align 8
.LC337:
	.long	1755040521
	.long	1063438074
	.align 8
.LC338:
	.long	124987463
	.long	1056488900
	.align 8
.LC339:
	.long	3175878138
	.long	1060190583
	.align 8
.LC340:
	.long	3214943223
	.long	1062417322
	.align 8
.LC341:
	.long	2818527024
	.long	1057722173
	.align 8
.LC342:
	.long	265279101
	.long	1066358118
	.align 8
.LC343:
	.long	3459913605
	.long	1067893954
	.align 8
.LC344:
	.long	1662152430
	.long	1068769639
	.align 8
.LC345:
	.long	1654616456
	.long	1071669690
	.align 8
.LC346:
	.long	2883643493
	.long	1071776357
	.align 8
.LC347:
	.long	4191815328
	.long	1073165330
	.align 8
.LC348:
	.long	3679355377
	.long	1066488567
	.align 8
.LC349:
	.long	793890679
	.long	1070370982
	.align 8
.LC350:
	.long	1037956367
	.long	1065514897
	.align 8
.LC351:
	.long	2010686743
	.long	1067358640
	.align 8
.LC352:
	.long	3943976440
	.long	1062999444
	.align 8
.LC353:
	.long	2651135485
	.long	1063077911
	.align 8
.LC354:
	.long	1619437801
	.long	1060131690
	.align 8
.LC355:
	.long	4102998654
	.long	1062498804
	.align 8
.LC356:
	.long	2261291500
	.long	1061861126
	.align 8
.LC357:
	.long	1255143399
	.long	1066420127
	.align 8
.LC358:
	.long	3984914426
	.long	1067926135
	.align 8
.LC359:
	.long	1306349864
	.long	1068775850
	.align 8
.LC360:
	.long	2992531728
	.long	1071560189
	.align 8
.LC361:
	.long	4207153461
	.long	1071809761
	.align 8
.LC362:
	.long	1278297582
	.long	1072915924
	.align 8
.LC363:
	.long	178562347
	.long	1065390040
	.align 8
.LC364:
	.long	4010495435
	.long	1070058432
	.align 8
.LC365:
	.long	1245482120
	.long	1065696736
	.align 8
.LC366:
	.long	3534653866
	.long	1066970266
	.align 8
.LC367:
	.long	3359794096
	.long	1063081744
	.align 8
.LC368:
	.long	1306938504
	.long	1062690855
	.align 8
.LC369:
	.long	1835928495
	.long	1055981148
	.align 8
.LC370:
	.long	1672063055
	.long	1060174908
	.align 8
.LC371:
	.long	167386181
	.long	1062586492
	.align 8
.LC372:
	.long	2797897846
	.long	1062700196
	.align 8
.LC373:
	.long	3440385327
	.long	1066462139
	.align 8
.LC374:
	.long	1614110539
	.long	1067960469
	.align 8
.LC375:
	.long	725607325
	.long	1068779303
	.align 8
.LC376:
	.long	2834319848
	.long	1071464843
	.align 8
.LC377:
	.long	2591647264
	.long	1071845938
	.align 8
.LC378:
	.long	1504658233
	.long	1072728659
	.align 8
.LC379:
	.long	2981903128
	.long	1061351709
	.align 8
.LC380:
	.long	3716732263
	.long	1069821812
	.align 8
.LC381:
	.long	2801250969
	.long	1065871874
	.align 8
.LC382:
	.long	838266742
	.long	1066679095
	.align 8
.LC383:
	.long	2112910738
	.long	1063145110
	.align 8
.LC384:
	.long	2278765079
	.long	1062400502
	.align 8
.LC385:
	.long	745802885
	.long	1056002442
	.align 8
.LC386:
	.long	2496428477
	.long	1060134725
	.align 8
.LC387:
	.long	4108241273
	.long	1062690398
	.align 8
.LC388:
	.long	106145876
	.long	1063270874
	.align 8
.LC389:
	.long	3752188587
	.long	1066504096
	.align 8
.LC390:
	.long	3793096111
	.long	1067996271
	.align 8
.LC391:
	.long	2918058032
	.long	1068779799
	.align 8
.LC392:
	.long	2496663557
	.long	1071395721
	.align 8
.LC393:
	.long	1340628876
	.long	1071885226
	.align 8
.LC394:
	.long	3082090617
	.long	1072472326
	.align 8
.LC395:
	.long	3660867459
	.long	1065530282
	.align 8
.LC396:
	.long	460151707
	.long	1069636126
	.align 8
.LC397:
	.long	2749751162
	.long	1066043421
	.align 8
.LC398:
	.long	1951406681
	.long	1066453724
	.align 8
.LC399:
	.long	1035989304
	.long	1063215998
	.align 8
.LC400:
	.long	1981746834
	.long	1062141307
	.align 8
.LC401:
	.long	4195442830
	.long	1056027414
	.align 8
.LC402:
	.long	3752109217
	.long	1060173962
	.align 8
.LC403:
	.long	3538133208
	.long	1062793742
	.align 8
.LC404:
	.long	477016250
	.long	1063536916
	.align 8
.LC405:
	.long	3302245375
	.long	1066547408
	.align 8
.LC406:
	.long	778883164
	.long	1068033165
	.align 8
.LC407:
	.long	817968655
	.long	1068776781
	.align 8
.LC408:
	.long	1954012145
	.long	1071345207
	.align 8
.LC409:
	.long	1211548025
	.long	1071928006
	.align 8
.LC410:
	.long	789385738
	.long	1072238534
	.align 8
.LC411:
	.long	3207086880
	.long	1066535797
	.align 8
.LC412:
	.long	4224409952
	.long	1069424687
	.align 8
.LC413:
	.long	2823967038
	.long	1066213490
	.align 8
.LC414:
	.long	696536154
	.long	1066146723
	.align 8
.LC415:
	.long	2104999485
	.long	1063266412
	.align 8
.LC416:
	.long	3433854076
	.long	1061813394
	.align 8
.LC417:
	.long	1085743206
	.long	1055007864
	.align 8
.LC418:
	.long	923504728
	.long	1060145308
	.align 8
.LC419:
	.long	1475762280
	.long	1062906709
	.align 8
.LC420:
	.long	3141262933
	.long	1063777041
	.align 8
.LC421:
	.long	895607999
	.long	1066591836
	.align 8
.LC422:
	.long	4259209610
	.long	1068070438
	.align 8
.LC423:
	.long	633047905
	.long	1068769573
	.align 8
.LC424:
	.long	3887961569
	.long	1071308350
	.align 8
.LC425:
	.long	3625500105
	.long	1071974769
	.align 8
.LC426:
	.long	3581911939
	.long	1072046918
	.align 8
.LC427:
	.long	321343348
	.long	1067105192
	.align 8
.LC428:
	.long	3196952713
	.long	1069177026
	.align 8
.LC429:
	.long	2375238242
	.long	1066380746
	.align 8
.LC430:
	.long	2697030510
	.long	1065856267
	.align 8
.LC431:
	.long	4176925521
	.long	1063296279
	.align 8
.LC432:
	.long	1068553242
	.long	1061544447
	.align 8
.LC433:
	.long	576934982
	.long	1055041400
	.align 8
.LC434:
	.long	101481854
	.long	1060182396
	.align 8
.LC435:
	.long	2704445489
	.long	1063030874
	.align 8
.LC436:
	.long	3866115715
	.long	1064006403
	.align 8
.LC437:
	.long	1630025349
	.long	1066637111
	.align 8
.LC438:
	.long	3787514889
	.long	1068109010
	.align 8
.LC439:
	.long	3962020214
	.long	1068757662
	.align 8
.LC440:
	.long	1619398805
	.long	1071281925
	.align 8
.LC441:
	.long	3277713753
	.long	1072026103
	.align 8
.LC442:
	.long	2999267144
	.long	1071886906
	.align 8
.LC443:
	.long	1185244643
	.long	1067564379
	.align 8
.LC444:
	.long	2111240940
	.long	1068968433
	.align 8
.LC445:
	.long	27716370
	.long	1066475162
	.align 8
.LC446:
	.long	2469658173
	.long	1065615120
	.align 8
.LC447:
	.long	1255817815
	.long	1063325739
	.align 8
.LC448:
	.long	2476520232
	.long	1061319442
	.align 8
.LC449:
	.long	283179260
	.long	1055080009
	.align 8
.LC450:
	.long	2296156193
	.long	1060216921
	.align 8
.LC451:
	.long	1331102690
	.long	1063157937
	.align 8
.LC452:
	.long	4216982330
	.long	1064229017
	.align 8
.LC453:
	.long	432738634
	.long	1066683562
	.align 8
.LC454:
	.long	588726950
	.long	1068147854
	.align 8
.LC455:
	.long	2835123646
	.long	1068739917
	.align 8
.LC456:
	.long	4291450413
	.long	1071263660
	.align 8
.LC457:
	.long	1919058488
	.long	1072082735
	.align 8
.LC458:
	.long	1144527532
	.long	1071751202
	.align 8
.LC459:
	.long	2362403229
	.long	1067855483
	.align 8
.LC460:
	.long	307752245
	.long	1068790534
	.align 8
.LC461:
	.long	3972641838
	.long	1066559897
	.align 8
.LC462:
	.long	1347627368
	.long	1065413387
	.align 8
.LC463:
	.long	3236801849
	.long	1063354887
	.align 8
.LC464:
	.long	2379763966
	.long	1061152049
	.align 8
.LC465:
	.long	3494676284
	.long	1055124383
	.align 8
.LC466:
	.long	1053249131
	.long	1060301420
	.align 8
.LC467:
	.long	868902886
	.long	1063277838
	.align 8
.LC468:
	.long	2858252393
	.long	1064376277
	.align 8
.LC469:
	.long	2757206832
	.long	1066730894
	.align 8
.LC470:
	.long	538710287
	.long	1068187435
	.align 8
.LC471:
	.long	3917092253
	.long	1068715447
	.align 8
.LC472:
	.long	445342272
	.long	1071252002
	.align 8
.LC473:
	.long	3114716610
	.long	1072145487
	.align 8
.LC474:
	.long	2165386640
	.long	1071624515
	.align 8
.LC475:
	.long	2266815407
	.long	1068153033
	.align 8
.LC476:
	.long	2685849464
	.long	1068636559
	.align 8
.LC477:
	.long	1791747315
	.long	1066646114
	.align 8
.LC478:
	.long	1558919196
	.long	1065131695
	.align 8
.LC479:
	.long	2401986232
	.long	1063383813
	.align 8
.LC480:
	.long	3629013268
	.long	1060869598
	.align 8
.LC481:
	.long	1497424068
	.long	1055175382
	.align 8
.LC482:
	.long	3025293602
	.long	1060330403
	.align 8
.LC483:
	.long	776615365
	.long	1063357318
	.align 8
.LC484:
	.long	3282307155
	.long	1064478961
	.align 8
.LC485:
	.long	3120093892
	.long	1066778756
	.align 8
.LC486:
	.long	3899768062
	.long	1068226989
	.align 8
.LC487:
	.long	735671102
	.long	1068682773
	.align 8
.LC488:
	.long	1941840080
	.long	1071245777
	.align 8
.LC489:
	.long	1151162519
	.long	1072215463
	.align 8
.LC490:
	.long	179356120
	.long	1071421893
	.align 8
.LC491:
	.long	2781915872
	.long	1068460637
	.align 8
.LC492:
	.long	1237819192
	.long	1068501915
	.align 8
.LC493:
	.long	2051444524
	.long	1066735223
	.align 8
.LC494:
	.long	725905049
	.long	1064838817
	.align 8
.LC495:
	.long	2232424220
	.long	1063412598
	.align 8
.LC496:
	.long	1403516272
	.long	1060574370
	.align 8
.LC497:
	.long	971897034
	.long	1055234075
	.align 8
.LC498:
	.long	1719614413
	.long	1072079006
	.align 8
.LC499:
	.long	2437214460
	.long	1073014702
	.align 8
.LC500:
	.long	3476196677
	.long	-1074950037
	.align 8
.LC501:
	.long	2077964434
	.long	-1075752582
	.align 8
.LC502:
	.long	3489094832
	.long	1072652951
	.align 8
.LC503:
	.long	3235705645
	.long	-1075239831
	.align 8
.LC504:
	.long	4018725658
	.long	1072877666
	.align 8
.LC505:
	.long	967731400
	.long	1071761211
	.align 8
.LC506:
	.long	3737153975
	.long	1070704725
	.align 8
.LC507:
	.long	2975761718
	.long	1073099088
	.align 8
.LC508:
	.long	3737153971
	.long	-1076778923
	.align 8
.LC509:
	.long	688824739
	.long	1072339814
	.align 8
.LC510:
	.long	2077964429
	.long	1071731066
	.align 8
.LC511:
	.long	2796464494
	.long	-1076331038
	.align 8
.LC512:
	.long	2437214462
	.long	1073014702
	.align 8
.LC513:
	.long	2623658353
	.long	1071649745
	.align 8
.LC514:
	.long	2162505950
	.long	1075079059
	.align 8
.LC515:
	.long	2957009218
	.long	1073450788
	.align 8
.LC516:
	.long	709807833
	.long	1072756873
	.align 8
.LC517:
	.long	192758288
	.long	1072248976
	.align 8
.LC518:
	.long	2562450374
	.long	1071952579
	.align 8
.LC519:
	.long	65790302
	.long	1071691855
	.align 8
.LC520:
	.long	3506854516
	.long	1071785063
	.align 8
.LC530:
	.long	0
	.long	1071644672
	.align 8
.LC531:
	.long	3898100906
	.long	-1075071366
	.align 8
.LC532:
	.long	1719614411
	.long	1071030430
	.align 8
.LC533:
	.long	1719614412
	.long	-1075404642
	.align 8
.LC534:
	.long	336142638
	.long	1071880334
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x17c1
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF159
	.byte	0x1
	.long	.LASF160
	.long	.LASF161
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x4
	.long	.LASF162
	.byte	0x1
	.value	0x600
	.long	0x34
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF12
	.uleb128 0x5
	.long	.LASF163
	.byte	0x1
	.value	0xe47
	.long	0x81
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0xca
	.uleb128 0x6
	.string	"x"
	.byte	0x1
	.value	0xe47
	.long	0x94
	.uleb128 0x1
	.byte	0x61
	.byte	0
	.uleb128 0x7
	.long	.LASF13
	.byte	0x1
	.value	0x375
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x103
	.uleb128 0x6
	.string	"v"
	.byte	0x1
	.value	0x375
	.long	0x103
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.string	"x"
	.byte	0x1
	.value	0x375
	.long	0x10e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x109
	.uleb128 0x9
	.long	0x94
	.uleb128 0x8
	.byte	0x8
	.long	0x81
	.uleb128 0xa
	.long	.LASF14
	.byte	0x1
	.value	0x378
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0xfd1
	.uleb128 0x6
	.string	"y"
	.byte	0x1
	.value	0x378
	.long	0x103
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1880
	.uleb128 0x6
	.string	"v"
	.byte	0x1
	.value	0x378
	.long	0xfd1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1888
	.uleb128 0xb
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0xc
	.string	"f0"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"f1"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.string	"f2"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.string	"f3"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.string	"f4"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.string	"f5"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xc
	.string	"f6"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xc
	.string	"f7"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xc
	.string	"f8"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0xc
	.string	"f9"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0xc
	.string	"f10"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0xc
	.string	"f11"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0xc
	.string	"f12"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0xc
	.string	"f13"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0xc
	.string	"f14"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0xc
	.string	"f15"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0xc
	.string	"f16"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0xc
	.string	"f17"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0xc
	.string	"f18"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0xc
	.string	"f19"
	.byte	0x1
	.value	0x2a6d
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0xc
	.string	"f20"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0xc
	.string	"f21"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0xc
	.string	"f22"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0xc
	.string	"f23"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0xc
	.string	"f24"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0xc
	.string	"f25"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0xc
	.string	"f26"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0xc
	.string	"f27"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0xc
	.string	"f28"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0xc
	.string	"f29"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0xc
	.string	"f30"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0xc
	.string	"f31"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0xc
	.string	"f32"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.uleb128 0xc
	.string	"f33"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0xc
	.string	"f34"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.uleb128 0xc
	.string	"f35"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0xc
	.string	"f36"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.uleb128 0xc
	.string	"f37"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0xc
	.string	"f38"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -344
	.uleb128 0xc
	.string	"f39"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0xc
	.string	"f40"
	.byte	0x1
	.value	0x2a6e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -360
	.uleb128 0xc
	.string	"f41"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0xc
	.string	"f42"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -376
	.uleb128 0xc
	.string	"f43"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -384
	.uleb128 0xc
	.string	"f44"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -392
	.uleb128 0xc
	.string	"f45"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0xc
	.string	"f46"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0xc
	.string	"f47"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0xc
	.string	"f48"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -408
	.uleb128 0xc
	.string	"f49"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0xc
	.string	"f50"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -424
	.uleb128 0xc
	.string	"f51"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -432
	.uleb128 0xc
	.string	"f52"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -440
	.uleb128 0xc
	.string	"f53"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -448
	.uleb128 0xc
	.string	"f54"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -456
	.uleb128 0xc
	.string	"f55"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -464
	.uleb128 0xc
	.string	"f56"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -472
	.uleb128 0xc
	.string	"f57"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -480
	.uleb128 0xc
	.string	"f58"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -488
	.uleb128 0xc
	.string	"f59"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -496
	.uleb128 0xc
	.string	"f60"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -504
	.uleb128 0xc
	.string	"f61"
	.byte	0x1
	.value	0x2a6f
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -512
	.uleb128 0xc
	.string	"f62"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -520
	.uleb128 0xc
	.string	"f63"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -528
	.uleb128 0xc
	.string	"f64"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -536
	.uleb128 0xc
	.string	"f65"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -544
	.uleb128 0xc
	.string	"f66"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -552
	.uleb128 0xc
	.string	"f67"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -560
	.uleb128 0xc
	.string	"f68"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -568
	.uleb128 0xc
	.string	"f69"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -576
	.uleb128 0xc
	.string	"f70"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -584
	.uleb128 0xc
	.string	"f71"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -632
	.uleb128 0xc
	.string	"f72"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -640
	.uleb128 0xc
	.string	"f73"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -648
	.uleb128 0xc
	.string	"f74"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -656
	.uleb128 0xc
	.string	"f75"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -592
	.uleb128 0xc
	.string	"f76"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -600
	.uleb128 0xc
	.string	"f77"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -608
	.uleb128 0xc
	.string	"f78"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -624
	.uleb128 0xc
	.string	"f79"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -616
	.uleb128 0xc
	.string	"f80"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -664
	.uleb128 0xc
	.string	"f81"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -672
	.uleb128 0xc
	.string	"f82"
	.byte	0x1
	.value	0x2a70
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -680
	.uleb128 0xc
	.string	"f83"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -688
	.uleb128 0xc
	.string	"f84"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -696
	.uleb128 0xc
	.string	"f85"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -704
	.uleb128 0xc
	.string	"f86"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -712
	.uleb128 0xc
	.string	"f87"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -720
	.uleb128 0xc
	.string	"f88"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -728
	.uleb128 0xc
	.string	"f89"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -752
	.uleb128 0xc
	.string	"f90"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -736
	.uleb128 0xc
	.string	"f91"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -744
	.uleb128 0xc
	.string	"f92"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -760
	.uleb128 0xc
	.string	"f93"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -768
	.uleb128 0xc
	.string	"f95"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -776
	.uleb128 0xc
	.string	"f96"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -784
	.uleb128 0xc
	.string	"f97"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -792
	.uleb128 0xc
	.string	"f98"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -800
	.uleb128 0xc
	.string	"f99"
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -808
	.uleb128 0xd
	.long	.LASF15
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -816
	.uleb128 0xd
	.long	.LASF16
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -824
	.uleb128 0xd
	.long	.LASF17
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -832
	.uleb128 0xd
	.long	.LASF18
	.byte	0x1
	.value	0x2a71
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -840
	.uleb128 0xd
	.long	.LASF19
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -848
	.uleb128 0xd
	.long	.LASF20
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -856
	.uleb128 0xd
	.long	.LASF21
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -864
	.uleb128 0xd
	.long	.LASF22
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -872
	.uleb128 0xd
	.long	.LASF23
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -880
	.uleb128 0xd
	.long	.LASF24
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -888
	.uleb128 0xd
	.long	.LASF25
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -896
	.uleb128 0xd
	.long	.LASF26
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -904
	.uleb128 0xd
	.long	.LASF27
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -912
	.uleb128 0xd
	.long	.LASF28
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -920
	.uleb128 0xd
	.long	.LASF29
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -928
	.uleb128 0xd
	.long	.LASF30
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -936
	.uleb128 0xd
	.long	.LASF31
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -944
	.uleb128 0xd
	.long	.LASF32
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -952
	.uleb128 0xd
	.long	.LASF33
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -960
	.uleb128 0xd
	.long	.LASF34
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -968
	.uleb128 0xd
	.long	.LASF35
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -976
	.uleb128 0xd
	.long	.LASF36
	.byte	0x1
	.value	0x2a72
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -984
	.uleb128 0xd
	.long	.LASF37
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -992
	.uleb128 0xd
	.long	.LASF38
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1000
	.uleb128 0xd
	.long	.LASF39
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1008
	.uleb128 0xd
	.long	.LASF40
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1024
	.uleb128 0xd
	.long	.LASF41
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1016
	.uleb128 0xd
	.long	.LASF42
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1032
	.uleb128 0xd
	.long	.LASF43
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1040
	.uleb128 0xd
	.long	.LASF44
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1048
	.uleb128 0xd
	.long	.LASF45
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0xd
	.long	.LASF46
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1072
	.uleb128 0xd
	.long	.LASF47
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1064
	.uleb128 0xd
	.long	.LASF48
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1080
	.uleb128 0xd
	.long	.LASF49
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1088
	.uleb128 0xd
	.long	.LASF50
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1096
	.uleb128 0xd
	.long	.LASF51
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1104
	.uleb128 0xd
	.long	.LASF52
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1112
	.uleb128 0xd
	.long	.LASF53
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1120
	.uleb128 0xd
	.long	.LASF54
	.byte	0x1
	.value	0x2a73
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1128
	.uleb128 0xd
	.long	.LASF55
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1136
	.uleb128 0xd
	.long	.LASF56
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1144
	.uleb128 0xd
	.long	.LASF57
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1152
	.uleb128 0xd
	.long	.LASF58
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1160
	.uleb128 0xd
	.long	.LASF59
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1168
	.uleb128 0xd
	.long	.LASF60
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1176
	.uleb128 0xd
	.long	.LASF61
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1184
	.uleb128 0xd
	.long	.LASF62
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1192
	.uleb128 0xd
	.long	.LASF63
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1200
	.uleb128 0xd
	.long	.LASF64
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1208
	.uleb128 0xd
	.long	.LASF65
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1216
	.uleb128 0xd
	.long	.LASF66
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1224
	.uleb128 0xd
	.long	.LASF67
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1232
	.uleb128 0xd
	.long	.LASF68
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1240
	.uleb128 0xd
	.long	.LASF69
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1248
	.uleb128 0xd
	.long	.LASF70
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1256
	.uleb128 0xd
	.long	.LASF71
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1264
	.uleb128 0xd
	.long	.LASF72
	.byte	0x1
	.value	0x2a74
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1272
	.uleb128 0xd
	.long	.LASF73
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1280
	.uleb128 0xd
	.long	.LASF74
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1288
	.uleb128 0xd
	.long	.LASF75
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1296
	.uleb128 0xd
	.long	.LASF76
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1304
	.uleb128 0xd
	.long	.LASF77
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1312
	.uleb128 0xd
	.long	.LASF78
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1320
	.uleb128 0xd
	.long	.LASF79
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1328
	.uleb128 0xd
	.long	.LASF80
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1336
	.uleb128 0xd
	.long	.LASF81
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1344
	.uleb128 0xd
	.long	.LASF82
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1352
	.uleb128 0xd
	.long	.LASF83
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1360
	.uleb128 0xd
	.long	.LASF84
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1368
	.uleb128 0xd
	.long	.LASF85
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1376
	.uleb128 0xd
	.long	.LASF86
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1384
	.uleb128 0xd
	.long	.LASF87
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1392
	.uleb128 0xd
	.long	.LASF88
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1400
	.uleb128 0xd
	.long	.LASF89
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1408
	.uleb128 0xd
	.long	.LASF90
	.byte	0x1
	.value	0x2a75
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1416
	.uleb128 0xd
	.long	.LASF91
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1424
	.uleb128 0xd
	.long	.LASF92
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1432
	.uleb128 0xd
	.long	.LASF93
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1440
	.uleb128 0xd
	.long	.LASF94
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1448
	.uleb128 0xd
	.long	.LASF95
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1456
	.uleb128 0xd
	.long	.LASF96
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1464
	.uleb128 0xd
	.long	.LASF97
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1472
	.uleb128 0xd
	.long	.LASF98
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1480
	.uleb128 0xd
	.long	.LASF99
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1488
	.uleb128 0xd
	.long	.LASF100
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1496
	.uleb128 0xd
	.long	.LASF101
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1504
	.uleb128 0xd
	.long	.LASF102
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1512
	.uleb128 0xd
	.long	.LASF103
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1520
	.uleb128 0xd
	.long	.LASF104
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1528
	.uleb128 0xd
	.long	.LASF105
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1536
	.uleb128 0xd
	.long	.LASF106
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1544
	.uleb128 0xd
	.long	.LASF107
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1552
	.uleb128 0xd
	.long	.LASF108
	.byte	0x1
	.value	0x2a76
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1560
	.uleb128 0xd
	.long	.LASF109
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1568
	.uleb128 0xd
	.long	.LASF110
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1576
	.uleb128 0xd
	.long	.LASF111
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1584
	.uleb128 0xd
	.long	.LASF112
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1592
	.uleb128 0xd
	.long	.LASF113
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1600
	.uleb128 0xd
	.long	.LASF114
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1608
	.uleb128 0xd
	.long	.LASF115
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1616
	.uleb128 0xd
	.long	.LASF116
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1624
	.uleb128 0xd
	.long	.LASF117
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1632
	.uleb128 0xd
	.long	.LASF118
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1640
	.uleb128 0xd
	.long	.LASF119
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1648
	.uleb128 0xd
	.long	.LASF120
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1672
	.uleb128 0xd
	.long	.LASF121
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1664
	.uleb128 0xd
	.long	.LASF122
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1656
	.uleb128 0xd
	.long	.LASF123
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1680
	.uleb128 0xd
	.long	.LASF124
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1688
	.uleb128 0xd
	.long	.LASF125
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1696
	.uleb128 0xd
	.long	.LASF126
	.byte	0x1
	.value	0x2a77
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1704
	.uleb128 0xd
	.long	.LASF127
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1712
	.uleb128 0xd
	.long	.LASF128
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1720
	.uleb128 0xd
	.long	.LASF129
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1728
	.uleb128 0xd
	.long	.LASF130
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1768
	.uleb128 0xd
	.long	.LASF131
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1776
	.uleb128 0xd
	.long	.LASF132
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1736
	.uleb128 0xd
	.long	.LASF133
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1744
	.uleb128 0xd
	.long	.LASF134
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1784
	.uleb128 0xd
	.long	.LASF135
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1792
	.uleb128 0xd
	.long	.LASF136
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1808
	.uleb128 0xd
	.long	.LASF137
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1816
	.uleb128 0xd
	.long	.LASF138
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1832
	.uleb128 0xd
	.long	.LASF139
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1840
	.uleb128 0xd
	.long	.LASF140
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1760
	.uleb128 0xd
	.long	.LASF141
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1800
	.uleb128 0xd
	.long	.LASF142
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1824
	.uleb128 0xd
	.long	.LASF143
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1848
	.uleb128 0xd
	.long	.LASF144
	.byte	0x1
	.value	0x2a78
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1752
	.uleb128 0xd
	.long	.LASF145
	.byte	0x1
	.value	0x2a79
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1864
	.uleb128 0xd
	.long	.LASF146
	.byte	0x1
	.value	0x2a79
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1872
	.uleb128 0xd
	.long	.LASF147
	.byte	0x1
	.value	0x2a79
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1856
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x94
	.uleb128 0xa
	.long	.LASF148
	.byte	0x1
	.value	0x2bf9
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x164d
	.uleb128 0x6
	.string	"I"
	.byte	0x1
	.value	0x2bf9
	.long	0x103
	.uleb128 0x3
	.byte	0x91
	.sleb128 -760
	.uleb128 0x6
	.string	"O"
	.byte	0x1
	.value	0x2bf9
	.long	0xfd1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -768
	.uleb128 0xc
	.string	"I17"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0xc
	.string	"I16"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0xc
	.string	"I15"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0xc
	.string	"I14"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0xc
	.string	"I13"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0xc
	.string	"I12"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0xc
	.string	"I11"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0xc
	.string	"I10"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0xc
	.string	"I9"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0xc
	.string	"I8"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0xc
	.string	"I7"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0xc
	.string	"I6"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0xc
	.string	"I5"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0xc
	.string	"I4"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0xc
	.string	"I3"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0xc
	.string	"I2"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0xc
	.string	"I1"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0xc
	.string	"I0"
	.byte	0x1
	.value	0x2bfa
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0xd
	.long	.LASF149
	.byte	0x1
	.value	0x2bfb
	.long	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.long	.LASF150
	.byte	0x1
	.value	0x2bfc
	.long	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xd
	.long	.LASF151
	.byte	0x1
	.value	0x2bfd
	.long	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xd
	.long	.LASF152
	.byte	0x1
	.value	0x2bfe
	.long	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xd
	.long	.LASF153
	.byte	0x1
	.value	0x2bff
	.long	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xd
	.long	.LASF154
	.byte	0x1
	.value	0x2c00
	.long	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xd
	.long	.LASF155
	.byte	0x1
	.value	0x2c01
	.long	0x109
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xd
	.long	.LASF156
	.byte	0x1
	.value	0x2c02
	.long	0x109
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xd
	.long	.LASF157
	.byte	0x1
	.value	0x2c03
	.long	0x109
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0xd
	.long	.LASF158
	.byte	0x1
	.value	0x2c04
	.long	0x109
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0xb
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0xc
	.string	"f0"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0xc
	.string	"f1"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0xc
	.string	"f2"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.uleb128 0xc
	.string	"f3"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0xc
	.string	"f4"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.uleb128 0xc
	.string	"f5"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0xc
	.string	"f6"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0xc
	.string	"f7"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -360
	.uleb128 0xc
	.string	"f8"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0xc
	.string	"f9"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -376
	.uleb128 0xc
	.string	"f10"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0xc
	.string	"f11"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -424
	.uleb128 0xc
	.string	"f12"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -432
	.uleb128 0xc
	.string	"f13"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -440
	.uleb128 0xc
	.string	"f14"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -448
	.uleb128 0xc
	.string	"f15"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -456
	.uleb128 0xc
	.string	"f16"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -464
	.uleb128 0xc
	.string	"f17"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -472
	.uleb128 0xc
	.string	"f18"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -480
	.uleb128 0xc
	.string	"f19"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -488
	.uleb128 0xc
	.string	"f20"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -496
	.uleb128 0xc
	.string	"f21"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -504
	.uleb128 0xc
	.string	"f22"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0xc
	.string	"f23"
	.byte	0x1
	.value	0x2c25
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0xe
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x137c
	.uleb128 0xc
	.string	"g0"
	.byte	0x1
	.value	0x2c2b
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0xc
	.string	"g1"
	.byte	0x1
	.value	0x2c2b
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.byte	0
	.uleb128 0xe
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.long	0x13bf
	.uleb128 0xc
	.string	"g1"
	.byte	0x1
	.value	0x2c34
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.uleb128 0xc
	.string	"g2"
	.byte	0x1
	.value	0x2c34
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0xc
	.string	"g3"
	.byte	0x1
	.value	0x2c34
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -344
	.byte	0
	.uleb128 0xe
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x1411
	.uleb128 0xc
	.string	"g4"
	.byte	0x1
	.value	0x2c3e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -384
	.uleb128 0xc
	.string	"g5"
	.byte	0x1
	.value	0x2c3e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -392
	.uleb128 0xc
	.string	"g6"
	.byte	0x1
	.value	0x2c3e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0xc
	.string	"g7"
	.byte	0x1
	.value	0x2c3e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -408
	.byte	0
	.uleb128 0xe
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.long	0x1463
	.uleb128 0xc
	.string	"g0"
	.byte	0x1
	.value	0x2c51
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -512
	.uleb128 0xc
	.string	"g1"
	.byte	0x1
	.value	0x2c51
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -520
	.uleb128 0xc
	.string	"g2"
	.byte	0x1
	.value	0x2c51
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -528
	.uleb128 0xc
	.string	"g3"
	.byte	0x1
	.value	0x2c51
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -536
	.byte	0
	.uleb128 0xe
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x14b5
	.uleb128 0xc
	.string	"g0"
	.byte	0x1
	.value	0x2c5b
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -544
	.uleb128 0xc
	.string	"g1"
	.byte	0x1
	.value	0x2c5b
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -552
	.uleb128 0xc
	.string	"g2"
	.byte	0x1
	.value	0x2c5b
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -560
	.uleb128 0xc
	.string	"g3"
	.byte	0x1
	.value	0x2c5b
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -568
	.byte	0
	.uleb128 0xe
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0x1582
	.uleb128 0xc
	.string	"g0"
	.byte	0x1
	.value	0x2c65
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -584
	.uleb128 0xc
	.string	"g1"
	.byte	0x1
	.value	0x2c65
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -592
	.uleb128 0xc
	.string	"g2"
	.byte	0x1
	.value	0x2c65
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -616
	.uleb128 0xc
	.string	"g3"
	.byte	0x1
	.value	0x2c65
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -624
	.uleb128 0xc
	.string	"g4"
	.byte	0x1
	.value	0x2c65
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -648
	.uleb128 0xc
	.string	"g5"
	.byte	0x1
	.value	0x2c65
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -656
	.uleb128 0xc
	.string	"g6"
	.byte	0x1
	.value	0x2c65
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -576
	.uleb128 0xb
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0xc
	.string	"h0"
	.byte	0x1
	.value	0x2c6a
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -600
	.uleb128 0xc
	.string	"h1"
	.byte	0x1
	.value	0x2c6a
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -608
	.uleb128 0xc
	.string	"h2"
	.byte	0x1
	.value	0x2c6a
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -632
	.uleb128 0xc
	.string	"h3"
	.byte	0x1
	.value	0x2c6a
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -640
	.byte	0
	.byte	0
	.uleb128 0xb
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0xc
	.string	"g0"
	.byte	0x1
	.value	0x2c7c
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -672
	.uleb128 0xc
	.string	"g1"
	.byte	0x1
	.value	0x2c7c
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -680
	.uleb128 0xc
	.string	"g2"
	.byte	0x1
	.value	0x2c7c
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -704
	.uleb128 0xc
	.string	"g3"
	.byte	0x1
	.value	0x2c7c
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -712
	.uleb128 0xc
	.string	"g4"
	.byte	0x1
	.value	0x2c7c
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -736
	.uleb128 0xc
	.string	"g5"
	.byte	0x1
	.value	0x2c7c
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -744
	.uleb128 0xc
	.string	"g6"
	.byte	0x1
	.value	0x2c7c
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -664
	.uleb128 0xb
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0xc
	.string	"h0"
	.byte	0x1
	.value	0x2c81
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -688
	.uleb128 0xc
	.string	"h1"
	.byte	0x1
	.value	0x2c81
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -696
	.uleb128 0xc
	.string	"h2"
	.byte	0x1
	.value	0x2c81
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -720
	.uleb128 0xc
	.string	"h3"
	.byte	0x1
	.value	0x2c81
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -728
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	.LASF164
	.byte	0x1
	.value	0x2cc1
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.string	"z"
	.byte	0x1
	.value	0x2cc1
	.long	0x103
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x6
	.string	"t"
	.byte	0x1
	.value	0x2cc1
	.long	0xfd1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0xc
	.string	"f0"
	.byte	0x1
	.value	0x2cc3
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"f1"
	.byte	0x1
	.value	0x2cc4
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.string	"f2"
	.byte	0x1
	.value	0x2cc5
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.string	"f3"
	.byte	0x1
	.value	0x2cc6
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.string	"f4"
	.byte	0x1
	.value	0x2cc7
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.string	"f5"
	.byte	0x1
	.value	0x2cc8
	.long	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xc
	.string	"f6"
	.byte	0x1
	.value	0x2cc9
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xc
	.string	"f7"
	.byte	0x1
	.value	0x2cca
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xc
	.string	"f8"
	.byte	0x1
	.value	0x2ccb
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0xc
	.string	"f9"
	.byte	0x1
	.value	0x2ccc
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0xc
	.string	"f10"
	.byte	0x1
	.value	0x2ccd
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0xc
	.string	"f11"
	.byte	0x1
	.value	0x2cce
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0xc
	.string	"f12"
	.byte	0x1
	.value	0x2ccf
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0xc
	.string	"f13"
	.byte	0x1
	.value	0x2cd0
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0xc
	.string	"f14"
	.byte	0x1
	.value	0x2cd1
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0xc
	.string	"f15"
	.byte	0x1
	.value	0x2cd2
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0xc
	.string	"f16"
	.byte	0x1
	.value	0x2cd3
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0xc
	.string	"f17"
	.byte	0x1
	.value	0x2cd4
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0xc
	.string	"f18"
	.byte	0x1
	.value	0x2cd5
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0xc
	.string	"f19"
	.byte	0x1
	.value	0x2cd6
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0xc
	.string	"f20"
	.byte	0x1
	.value	0x2cd7
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF15:
	.string	"f100"
.LASF16:
	.string	"f101"
.LASF17:
	.string	"f102"
.LASF18:
	.string	"f103"
.LASF19:
	.string	"f104"
.LASF20:
	.string	"f105"
.LASF162:
	.string	"mp3_sample"
.LASF22:
	.string	"f107"
.LASF23:
	.string	"f108"
.LASF24:
	.string	"f109"
.LASF3:
	.string	"unsigned int"
.LASF25:
	.string	"f110"
.LASF26:
	.string	"f111"
.LASF27:
	.string	"f112"
.LASF28:
	.string	"f113"
.LASF29:
	.string	"f114"
.LASF30:
	.string	"f115"
.LASF31:
	.string	"f116"
.LASF32:
	.string	"f117"
.LASF33:
	.string	"f118"
.LASF34:
	.string	"f119"
.LASF13:
	.string	"windowing"
.LASF150:
	.string	"KP984807753"
.LASF35:
	.string	"f120"
.LASF36:
	.string	"f121"
.LASF37:
	.string	"f122"
.LASF38:
	.string	"f123"
.LASF39:
	.string	"f124"
.LASF40:
	.string	"f125"
.LASF41:
	.string	"f126"
.LASF42:
	.string	"f127"
.LASF43:
	.string	"f128"
.LASF44:
	.string	"f129"
.LASF164:
	.string	"dct6"
.LASF156:
	.string	"KP1_224744871"
.LASF11:
	.string	"float"
.LASF152:
	.string	"KP766044443"
.LASF45:
	.string	"f130"
.LASF46:
	.string	"f131"
.LASF47:
	.string	"f132"
.LASF10:
	.string	"long long unsigned int"
.LASF49:
	.string	"f134"
.LASF50:
	.string	"f135"
.LASF151:
	.string	"KP642787609"
.LASF155:
	.string	"KP1_732050807"
.LASF149:
	.string	"KP173648177"
.LASF100:
	.string	"f200"
.LASF101:
	.string	"f201"
.LASF102:
	.string	"f202"
.LASF103:
	.string	"f203"
.LASF104:
	.string	"f204"
.LASF105:
	.string	"f205"
.LASF106:
	.string	"f206"
.LASF161:
	.string	"/home/ruckert/mp32pcm"
.LASF51:
	.string	"f151"
.LASF52:
	.string	"f152"
.LASF53:
	.string	"f153"
.LASF54:
	.string	"f154"
.LASF55:
	.string	"f155"
.LASF56:
	.string	"f156"
.LASF57:
	.string	"f157"
.LASF58:
	.string	"f158"
.LASF59:
	.string	"f159"
.LASF157:
	.string	"KP707106781"
.LASF159:
	.string	"GNU C 4.8.2 -mtune=generic -march=x86-64 -ggdb"
.LASF8:
	.string	"char"
.LASF60:
	.string	"f160"
.LASF61:
	.string	"f161"
.LASF62:
	.string	"f162"
.LASF63:
	.string	"f163"
.LASF64:
	.string	"f164"
.LASF65:
	.string	"f165"
.LASF66:
	.string	"f166"
.LASF67:
	.string	"f167"
.LASF68:
	.string	"f168"
.LASF69:
	.string	"f169"
.LASF107:
	.string	"f207"
.LASF108:
	.string	"f208"
.LASF109:
	.string	"f209"
.LASF110:
	.string	"f210"
.LASF111:
	.string	"f211"
.LASF163:
	.string	"mk_sample"
.LASF112:
	.string	"f212"
.LASF113:
	.string	"f213"
.LASF154:
	.string	"KP342020143"
.LASF114:
	.string	"f214"
.LASF9:
	.string	"long long int"
.LASF115:
	.string	"f215"
.LASF116:
	.string	"f216"
.LASF70:
	.string	"f170"
.LASF71:
	.string	"f171"
.LASF72:
	.string	"f172"
.LASF73:
	.string	"f173"
.LASF74:
	.string	"f174"
.LASF75:
	.string	"f175"
.LASF76:
	.string	"f176"
.LASF77:
	.string	"f177"
.LASF78:
	.string	"f178"
.LASF79:
	.string	"f179"
.LASF117:
	.string	"f217"
.LASF118:
	.string	"f218"
.LASF119:
	.string	"f219"
.LASF160:
	.string	"perform.c"
.LASF21:
	.string	"f106"
.LASF80:
	.string	"f180"
.LASF81:
	.string	"f181"
.LASF82:
	.string	"f182"
.LASF83:
	.string	"f183"
.LASF84:
	.string	"f184"
.LASF85:
	.string	"f185"
.LASF86:
	.string	"f186"
.LASF87:
	.string	"f187"
.LASF88:
	.string	"f188"
.LASF89:
	.string	"f189"
.LASF127:
	.string	"f227"
.LASF128:
	.string	"f228"
.LASF129:
	.string	"f229"
.LASF121:
	.string	"f221"
.LASF14:
	.string	"dct32"
.LASF123:
	.string	"f223"
.LASF124:
	.string	"f224"
.LASF125:
	.string	"f225"
.LASF126:
	.string	"f226"
.LASF90:
	.string	"f190"
.LASF91:
	.string	"f191"
.LASF92:
	.string	"f192"
.LASF93:
	.string	"f193"
.LASF94:
	.string	"f194"
.LASF95:
	.string	"f195"
.LASF96:
	.string	"f196"
.LASF97:
	.string	"f197"
.LASF98:
	.string	"f198"
.LASF99:
	.string	"f199"
.LASF137:
	.string	"f237"
.LASF138:
	.string	"f238"
.LASF139:
	.string	"f239"
.LASF120:
	.string	"f220"
.LASF122:
	.string	"f222"
.LASF5:
	.string	"short int"
.LASF6:
	.string	"long int"
.LASF140:
	.string	"f240"
.LASF141:
	.string	"f241"
.LASF142:
	.string	"f242"
.LASF143:
	.string	"f243"
.LASF144:
	.string	"f244"
.LASF145:
	.string	"f245"
.LASF146:
	.string	"f246"
.LASF147:
	.string	"f247"
.LASF148:
	.string	"dct18"
.LASF131:
	.string	"f231"
.LASF132:
	.string	"f232"
.LASF133:
	.string	"f233"
.LASF134:
	.string	"f234"
.LASF135:
	.string	"f235"
.LASF136:
	.string	"f236"
.LASF7:
	.string	"sizetype"
.LASF0:
	.string	"long unsigned int"
.LASF158:
	.string	"KP1_414213562"
.LASF1:
	.string	"unsigned char"
.LASF130:
	.string	"f230"
.LASF4:
	.string	"signed char"
.LASF2:
	.string	"short unsigned int"
.LASF12:
	.string	"double"
.LASF48:
	.string	"f133"
.LASF153:
	.string	"KP939692620"
	.ident	"GCC: (GNU) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
