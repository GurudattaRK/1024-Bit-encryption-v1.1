	.file	"C_asm.c"
	.text
	.globl	row
	.bss
	.align 32
	.type	row, @object
	.size	row, 128
row:
	.zero	128
	.globl	column
	.align 32
	.type	column, @object
	.size	column, 128
column:
	.zero	128
	.globl	keys
	.align 32
	.type	keys, @object
	.size	keys, 128
keys:
	.zero	128
	.globl	h
	.align 4
	.type	h, @object
	.size	h, 4
h:
	.zero	4
	.globl	v
	.align 4
	.type	v, @object
	.size	v, 4
v:
	.zero	4
	.section	.rodata
	.align 8
.LC0:
	.string	"\t\t\t\t                 *|*\n\t\t\t\t               **/|\\** "
	.align 8
.LC1:
	.string	"\t\t\t\t    **     ******/|\\******     **\n\t\t\t\t    *************/|\\************* "
	.align 8
.LC2:
	.string	"\t\t\t\t    *************/|\\************* \n\t1024-Bit      \t\t    *************/|\\*************"
	.align 8
.LC3:
	.string	"\tBIT LEVEL ENCRYPTION\t     ************/|\\************\n\t\t\t1.1\t     <<<<<<<<<<<<|+|>>>>>>>>>>>>"
	.align 8
.LC4:
	.string	"\t\t\t \t      ***********\\|/*********** \n\t\t\t\t       **********\\|/********** "
	.align 8
.LC5:
	.string	"\t\t\t\t        *********\\|/********* \n\t\t\t\t         ********\\|/******** "
	.align 8
.LC6:
	.string	"\t\t\t\t           ******\\|/****** \n\t\t\t\t              ***\\|/*** \n\t\t\t\t                 *|* \n"
	.align 8
.LC7:
	.string	"Choose an option:\n1.Encrypt a file\n2.Decrypt a file\n\nEnter your option's number:"
.LC8:
	.string	"%s"
	.align 8
.LC9:
	.string	"\nEnter the file's name which u wanna encrypt:"
.LC10:
	.string	"\nEnter keyfile's name:"
	.align 8
.LC11:
	.string	"\nwhat do u want to call the encrypted file:"
.LC12:
	.string	"rb"
	.align 8
.LC13:
	.string	"\nError in opening/finding the file %s\n Make sure you have provided the right name with right extension or right path to file\n"
	.align 8
.LC14:
	.string	"\n%s is too small.For security reasons keyfile's size should be at least 128 bytes."
.LC15:
	.string	"\nENCRYPTING FILE..\n..."
.LC16:
	.string	"wb"
	.align 8
.LC18:
	.string	"\n\nEncryption of %llu bytes completed in %f seconds "
.LC19:
	.string	"\n\nPress any key to exit"
	.align 8
.LC20:
	.string	"\nEnter the file's name which u wanna decrypt:"
	.align 8
.LC21:
	.string	"\nwhat do u wanna name the decrypted file:"
	.align 8
.LC22:
	.string	"\n%s is too small.For security reasons keyfile's should be at least 128 bytes."
.LC23:
	.string	"\nDECRYPTING FILE..\n..."
	.align 8
.LC24:
	.string	"\n\nDecryption of %llu bytes completed in %f seconds "
.LC25:
	.string	"invalid input"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$464, %rsp
	movl	$.LC0, %edi
	call	puts
	movl	$.LC1, %edi
	call	puts
	movl	$.LC2, %edi
	call	puts
	movl	$.LC3, %edi
	call	puts
	movl	$.LC4, %edi
	call	puts
	movl	$.LC5, %edi
	call	puts
	movl	$.LC6, %edi
	call	puts
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	leaq	-129(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movq	$0, -24(%rbp)
	movzbl	-129(%rbp), %eax
	cmpb	$49, %al
	jne	.L2
	movl	$.LC9, %edi
	call	puts
	leaq	-464(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC10, %edi
	call	puts
	leaq	-240(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC11, %edi
	call	puts
	leaq	-352(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	leaq	-464(%rbp), %rax
	movl	$.LC12, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -88(%rbp)
	leaq	-240(%rbp), %rax
	movl	$.LC12, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -96(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L3
	leaq	-464(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	jmp	.L19
.L3:
	cmpq	$0, -96(%rbp)
	jne	.L5
	leaq	-240(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	jmp	.L19
.L5:
	movq	-96(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseeko
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	ftello
	movq	%rax, -24(%rbp)
	movq	-96(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseeko
	cmpq	$127, -24(%rbp)
	ja	.L6
	leaq	-240(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC14, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	jmp	.L19
.L6:
	call	clock
	movq	%rax, -104(%rbp)
	movl	$.LC15, %edi
	call	puts
	leaq	-352(%rbp), %rax
	movl	$.LC16, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -112(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$128, %esi
	movl	$keys, %edi
	call	fread
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-88(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseeko
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	ftello
	movq	%rax, -8(%rbp)
	movq	-88(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseeko
	movq	-8(%rbp), %rax
	andl	$127, %eax
	movl	%eax, h(%rip)
	movl	h(%rip), %eax
	testl	%eax, %eax
	je	.L7
	movl	h(%rip), %eax
	movl	$128, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, v(%rip)
	movl	v(%rip), %eax
	cltq
	addq	%rax, -8(%rbp)
.L7:
	movq	-8(%rbp), %rax
	shrq	$7, %rax
	movq	%rax, -64(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L8
.L9:
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	movl	$128, %edx
	movl	$1, %esi
	movl	$row, %edi
	call	fread
#APP
# 82 "C_asm.c" 1
	pushfq
	pushq %rax
	pushq %rbx
	pushq %rcx
	pushq %rdx
	pushq %rsi
	pushq %rdi
	pushq %rbp
	pushq %rsp
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	xorq    %r11,%r11
	leaq    keys(%rip),%r13
	leaq    row(%rip),%r14
	leaq    column(%rip),%r15
.Round185:
	movl    (%r13,%r11,4),%ecx
	xorq    %r8,%r8
.RowJump185:
	movl    (%r14,%r8,4),%eax
	rorl    %cl,%eax
	rorq    $7,%rcx
	movl    %eax,(%r14,%r8,4)
	incl    %r8d
	movl    (%r14,%r8,4),%eax
	roll    %cl,%eax
	rorq    $3,%rcx
	movl    %eax,(%r14,%r8,4)
	incl    %r8d
	cmp     $32,%r8
	jne    .RowJump185
	xorq    %r9,%r9
	incl    %r11d
	movl    (%r13,%r11,4),%r12d
	xorl    %r12d,(%r14)
	incl    %r11d
	movl    (%r13,%r11,4),%r12d
	xorl    %r12d,(%r14,%r11,4)
	incl    %r11d
	movl    (%r13,%r11,4),%r12d
	xorl    %r12d,(%r14,%r11,4)
	.RowOuter185:
	xorq    %r8,%r8
.RowInner185:
	bt      %r9d,(%r14,%r8,4)
	jnc    .RowReset185
	bts     %r8d,%r10d
	jmp    .RowExit185
.RowReset185:
	btr     %r8d,%r10d
.RowExit185:
	incl    %r8d
	cmp     $32,%r8d
	jne    .RowInner185
	movl    %r10d,(%r15,%r9,4)
	incq    %r9
	cmp     $32,%r9
	jne    .RowOuter185
	xorq    %r8,%r8
incl    %r11d
	movl    (%r13,%r11,4),%ecx
	.ColJump185:
	movl    (%r15,%r8,4),%eax
	rorl    %cl,%eax
	rorq    $9,%rcx
	movl    %eax,(%r15,%r8,4)
	incl    %r8d
	movl    (%r15,%r8,4),%eax
	roll    %cl,%eax
	rorq    $11,%rcx
	movl    %eax,(%r15,%r8,4)
	incl    %r8d
	cmp     $32,%r8
	jne    .ColJump185
	incl    %r11d
	movl    (%r13,%r11,4),%r12d
	xorl    %r12d,(%r15)
	incl    %r11d
	movl    (%r13,%r11,4),%r12d
	xorl    %r12d,(%r15,%r11,4)
	incl    %r11d
	movl    (%r13,%r11,4),%r12d
	xorl    %r12d,(%r15,%r11,4)
	incl    %r11d
	cmp     $32,%r11
	je     .ExitRound185
	xorq    %r9,%r9
.ColOuter185:
	xorq    %r8,%r8
.ColInner185:
	bt      %r9,(%r15,%r8,4)
	jnc    .ColReset185
	bts     %r8d,%r10d
	jmp    .ColExit185
.ColReset185:
	btr     %r8d,%r10d
.ColExit185:
	incl    %r8d
	cmp     $32,%r8d
	jne    .ColInner185
	movl    %r10d,(%r14,%r9,4)
	incq    %r9
	cmp     $32,%r9
	jne    .ColOuter185
	jmp    .Round185
.ExitRound185:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rsp
	popq %rbp
	popq %rdi
	popq %rsi
	popq %rdx
	popq %rcx
	popq %rbx
	popq %rax
	popfq
	
# 0 "" 2
#NO_APP
	movq	-112(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$128, %esi
	movl	$column, %edi
	call	fwrite
	addq	$1, -16(%rbp)
.L8:
	movq	-16(%rbp), %rax
	cmpq	-64(%rbp), %rax
	jb	.L9
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	call	clock
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	subq	-104(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC17(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -128(%rbp)
	movq	-128(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %xmm0
	movq	%rax, %rsi
	movl	$.LC18, %edi
	movl	$1, %eax
	call	printf
	movl	$.LC19, %edi
	call	puts
	movl	$0, %eax
	jmp	.L19
.L2:
	movzbl	-129(%rbp), %eax
	cmpb	$50, %al
	jne	.L11
	movl	$.LC20, %edi
	call	puts
	leaq	-464(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC10, %edi
	call	puts
	leaq	-240(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC21, %edi
	call	puts
	leaq	-352(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	leaq	-464(%rbp), %rax
	movl	$.LC12, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -32(%rbp)
	leaq	-240(%rbp), %rax
	movl	$.LC12, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -40(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L12
	leaq	-464(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	jmp	.L19
.L12:
	cmpq	$0, -40(%rbp)
	jne	.L14
	leaq	-240(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	jmp	.L19
.L14:
	movq	-40(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseeko
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	ftello
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseeko
	cmpq	$127, -24(%rbp)
	ja	.L15
	leaq	-240(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC22, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	jmp	.L19
.L15:
	call	clock
	movq	%rax, -48(%rbp)
	movl	$.LC23, %edi
	movl	$0, %eax
	call	printf
	leaq	-352(%rbp), %rax
	movl	$.LC16, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -56(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$128, %esi
	movl	$keys, %edi
	call	fread
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-32(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseeko
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	ftello
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseeko
	movq	-8(%rbp), %rax
	andl	$127, %eax
	movl	%eax, h(%rip)
	movl	h(%rip), %eax
	testl	%eax, %eax
	je	.L16
	movl	h(%rip), %eax
	movl	$128, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, v(%rip)
	movl	v(%rip), %eax
	cltq
	addq	%rax, -8(%rbp)
.L16:
	movq	-8(%rbp), %rax
	shrq	$7, %rax
	movq	%rax, -64(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L17
.L18:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$128, %esi
	movl	$column, %edi
	call	fread
#APP
# 334 "C_asm.c" 1
	pushfq
	pushq %rax
	pushq %rbx
	pushq %rcx
	pushq %rdx
	pushq %rsi
	pushq %rdi
	pushq %rbp
	pushq %rsp
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	movq    $32,%r11
	leaq    keys(%rip),%r13
	leaq    row(%rip),%r14
	leaq    column(%rip),%r15
.Round380:
	decl    %r11d
	movl    (%r13,%r11,4),%r12d
	xorl    %r12d,(%r15,%r11,4)
	decl    %r11d
	movl    (%r13,%r11,4),%r12d
	xorl    %r12d,(%r15,%r11,4)
	decl    %r11d
	movl    (%r13,%r11,4),%r12d
	xorl    %r12d,(%r15)
	xorq    %r8,%r8
decl    %r11d
	movl    (%r13,%r11,4),%ecx
	.ColJump380:
	movl    (%r15,%r8,4),%eax
	roll    %cl,%eax
	rorq    $9,%rcx
	movl    %eax,(%r15,%r8,4)
	incl    %r8d
	movl    (%r15,%r8,4),%eax
	rorl    %cl,%eax
	rorq    $11,%rcx
	movl    %eax,(%r15,%r8,4)
	incl    %r8d
	cmp     $32,%r8
	jne    .ColJump380
	xorq    %r9,%r9
.ColOuter380:
	xorq    %r8,%r8
.ColInner380:
	bt      %r9,(%r15,%r8,4)
	jnc    .ColReset380
	bts     %r8d,%r10d
	jmp    .ColExit380
.ColReset380:
	btr     %r8d,%r10d
.ColExit380:
	incl    %r8d
	cmp     $32,%r8
	jne    .ColInner380
	movl    %r10d,(%r14,%r9,4)
	incq    %r9
	cmp     $32,%r9
	jne    .ColOuter380
	decl    %r11d
	movl    (%r13,%r11,4),%r12d
	xorl    %r12d,(%r14,%r11,4)
	decl    %r11d
	movl    (%r13,%r11,4),%r12d
	xorl    %r12d,(%r14,%r11,4)
	decl    %r11d
	movl    (%r13,%r11,4),%r12d
	xorl    %r12d,(%r14)
	xorq    %r8,%r8
decl    %r11d
	movl    (%r13,%r11,4),%ecx
	.RowJump380:
	movl    (%r14,%r8,4),%eax
	roll    %cl,%eax
	rorq    $7,%rcx
	movl    %eax,(%r14,%r8,4)
	incl    %r8d
	movl    (%r14,%r8,4),%eax
	rorl    %cl,%eax
	rorq    $3,%rcx
	movl    %eax,(%r14,%r8,4)
	incl    %r8d
	cmp     $32,%r8
	jne    .RowJump380
	xorq    %r9,%r9
	cmp     $0,%r11
	jle     .ExitRound380
	.RowOuter380:
	xorq    %r8,%r8
.RowInner380:
	bt      %r9d,(%r14,%r8,4)
	jnc    .RowReset380
	bts     %r8d,%r10d
	jmp    .RowExit380
.RowReset380:
	btr     %r8d,%r10d
.RowExit380:
	incl    %r8d
	cmp     $32,%r8
	jne    .RowInner380
	movl    %r10d,(%r15,%r9,4)
	incq    %r9
	cmp     $32,%r9
	jne    .RowOuter380
	jmp    .Round380
.ExitRound380:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rsp
	popq %rbp
	popq %rdi
	popq %rsi
	popq %rdx
	popq %rcx
	popq %rbx
	popq %rax
	popfq
	
# 0 "" 2
#NO_APP
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$128, %esi
	movl	$row, %edi
	call	fwrite
	addq	$1, -16(%rbp)
.L17:
	movq	-16(%rbp), %rax
	cmpq	-64(%rbp), %rax
	jb	.L18
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	call	clock
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	subq	-48(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC17(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
	movq	-80(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %xmm0
	movq	%rax, %rsi
	movl	$.LC24, %edi
	movl	$1, %eax
	call	printf
	movl	$.LC19, %edi
	call	puts
	movl	$0, %eax
	jmp	.L19
.L11:
	movl	$.LC25, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC17:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 12.2.1 20221121 (Red Hat 12.2.1-4)"
	.section	.note.GNU-stack,"",@progbits
