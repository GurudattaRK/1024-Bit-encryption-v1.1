	.file	"C_asm.c"
	.text
	.def	fseeko64;	.scl	3;	.type	32;	.endef
	.seh_proc	fseeko64
fseeko64:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	32(%rbp), %ecx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movl	%ecx, %r8d
	movq	%rax, %rcx
	movq	__imp__fseeki64(%rip), %rax
	call	*%rax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	ftello64;	.scl	3;	.type	32;	.endef
	.seh_proc	ftello64
ftello64:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	movq	__imp__ftelli64(%rip), %rax
	call	*%rax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	row
	.bss
	.align 32
row:
	.space 128
	.globl	column
	.align 32
column:
	.space 128
	.globl	keys
	.align 32
keys:
	.space 128
	.globl	h
	.align 4
h:
	.space 4
	.globl	v
	.align 4
v:
	.space 4
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "\11\11\11\11                 *|*\12\11\11\11\11               **/|\\** \0"
	.align 8
.LC1:
	.ascii "\11\11\11\11    **     ******/|\\******     **\12\11\11\11\11    *************/|\\************* \0"
	.align 8
.LC2:
	.ascii "\11\11\11\11    *************/|\\************* \12\11"
	.ascii "1024-Bit      \11\11    *************/|\\*************\0"
	.align 8
.LC3:
	.ascii "\11BIT LEVEL ENCRYPTION\11     ************/|\\************\12\11\11\11"
	.ascii "1.1\11     <<<<<<<<<<<<|+|>>>>>>>>>>>>\0"
	.align 8
.LC4:
	.ascii "\11\11\11 \11      ***********\\|/*********** \12\11\11\11\11       **********\\|/********** \0"
	.align 8
.LC5:
	.ascii "\11\11\11\11        *********\\|/********* \12\11\11\11\11         ********\\|/******** \0"
	.align 8
.LC6:
	.ascii "\11\11\11\11           ******\\|/****** \12\11\11\11\11              ***\\|/*** \12\11\11\11\11                 *|* \12\0"
	.align 8
.LC7:
	.ascii "Choose an option:\12"
	.ascii "1.Encrypt a file\12"
	.ascii "2.Decrypt a file\12\12Enter your option's number:\0"
.LC8:
	.ascii "%s\0"
	.align 8
.LC9:
	.ascii "\12Enter the file's name which u wanna encrypt:\0"
.LC10:
	.ascii "\12Enter keyfile's name:\0"
	.align 8
.LC11:
	.ascii "\12what do u want to call the encrypted file:\0"
.LC12:
	.ascii "rb\0"
	.align 8
.LC13:
	.ascii "\12Error in opening/finding the file %s\12 Make sure you have provided the right name with right extension or right path to file\12\0"
	.align 8
.LC14:
	.ascii "\12%s is too small.For security reasons keyfile's size should be at least 128 bytes.\0"
.LC15:
	.ascii "\12ENCRYPTING FILE..\12...\0"
.LC16:
	.ascii "wb\0"
	.align 8
.LC18:
	.ascii "\12\12Encryption of %llu bytes completed in %f seconds \0"
.LC19:
	.ascii "\12\12Press any key to exit\0"
	.align 8
.LC20:
	.ascii "\12Enter the file's name which u wanna decrypt:\0"
	.align 8
.LC21:
	.ascii "\12what do u wanna name the decrypted file:\0"
	.align 8
.LC22:
	.ascii "\12%s is too small.For security reasons keyfile's should be at least 128 bytes.\0"
.LC23:
	.ascii "\12DECRYPTING FILE..\12...\0"
	.align 8
.LC24:
	.ascii "\12\12Decryption of %llu bytes completed in %f seconds \0"
.LC25:
	.ascii "invalid input\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$496, %rsp
	.seh_stackalloc	496
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	239(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	movq	$0, 344(%rbp)
	movzbl	239(%rbp), %eax
	cmpb	$49, %al
	jne	.L6
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	-96(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	128(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	leaq	-96(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 280(%rbp)
	leaq	128(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 272(%rbp)
	cmpq	$0, 280(%rbp)
	jne	.L7
	leaq	-96(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	jmp	.L23
.L7:
	cmpq	$0, 272(%rbp)
	jne	.L9
	leaq	128(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	jmp	.L23
.L9:
	movq	272(%rbp), %rax
	movl	$2, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseeko64
	movq	272(%rbp), %rax
	movq	%rax, %rcx
	call	ftello64
	movq	%rax, 344(%rbp)
	movq	272(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseeko64
	cmpq	$127, 344(%rbp)
	ja	.L10
	leaq	128(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC14(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	jmp	.L23
.L10:
	call	clock
	movl	%eax, 268(%rbp)
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	16(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 256(%rbp)
	movq	272(%rbp), %rax
	movq	%rax, %r9
	movl	$1, %r8d
	movl	$128, %edx
	leaq	keys(%rip), %rax
	movq	%rax, %rcx
	call	fread
	movq	272(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	280(%rbp), %rax
	movl	$2, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseeko64
	movq	280(%rbp), %rax
	movq	%rax, %rcx
	call	ftello64
	movq	%rax, 360(%rbp)
	movq	280(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseeko64
	movq	360(%rbp), %rax
	andl	$127, %eax
	movl	%eax, h(%rip)
	movl	h(%rip), %eax
	testl	%eax, %eax
	je	.L11
	movl	h(%rip), %eax
	movl	$128, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, v(%rip)
	movl	v(%rip), %eax
	cltq
	addq	%rax, 360(%rbp)
.L11:
	movq	360(%rbp), %rax
	shrq	$7, %rax
	movq	%rax, 304(%rbp)
	movq	$0, 352(%rbp)
	jmp	.L12
.L13:
	movq	280(%rbp), %rax
	movq	%rax, %r9
	movl	$128, %r8d
	movl	$1, %edx
	leaq	row(%rip), %rax
	movq	%rax, %rcx
	call	fread
/APP
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
.Round244:
	movl    (%r13,%r11,4),%ecx
	xorq    %r8,%r8
.RowJump244:
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
	jne    .RowJump244
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
	.RowOuter244:
	xorq    %r8,%r8
.RowInner244:
	bt      %r9d,(%r14,%r8,4)
	jnc    .RowReset244
	bts     %r8d,%r10d
	jmp    .RowExit244
.RowReset244:
	btr     %r8d,%r10d
.RowExit244:
	incl    %r8d
	cmp     $32,%r8d
	jne    .RowInner244
	movl    %r10d,(%r15,%r9,4)
	incq    %r9
	cmp     $32,%r9
	jne    .RowOuter244
	xorq    %r8,%r8
incl    %r11d
	movl    (%r13,%r11,4),%ecx
	.ColJump244:
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
	jne    .ColJump244
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
	je     .ExitRound244
	xorq    %r9,%r9
.ColOuter244:
	xorq    %r8,%r8
.ColInner244:
	bt      %r9,(%r15,%r8,4)
	jnc    .ColReset244
	bts     %r8d,%r10d
	jmp    .ColExit244
.ColReset244:
	btr     %r8d,%r10d
.ColExit244:
	incl    %r8d
	cmp     $32,%r8d
	jne    .ColInner244
	movl    %r10d,(%r14,%r9,4)
	incq    %r9
	cmp     $32,%r9
	jne    .ColOuter244
	jmp    .Round244
.ExitRound244:
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
/NO_APP
	movq	256(%rbp), %rax
	movq	%rax, %r9
	movl	$1, %r8d
	movl	$128, %edx
	leaq	column(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	addq	$1, 352(%rbp)
.L12:
	movq	352(%rbp), %rax
	cmpq	304(%rbp), %rax
	jb	.L13
	movq	280(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	256(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	call	clock
	movl	%eax, 252(%rbp)
	movl	252(%rbp), %eax
	subl	268(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC17(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, 240(%rbp)
	movsd	240(%rbp), %xmm0
	movq	240(%rbp), %rdx
	movq	360(%rbp), %rax
	movapd	%xmm0, %xmm2
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC18(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC19(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
	jmp	.L23
.L6:
	movzbl	239(%rbp), %eax
	cmpb	$50, %al
	jne	.L15
	leaq	.LC20(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	-96(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	128(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	leaq	.LC21(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	leaq	-96(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 336(%rbp)
	leaq	128(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 328(%rbp)
	cmpq	$0, 336(%rbp)
	jne	.L16
	leaq	-96(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	jmp	.L23
.L16:
	cmpq	$0, 328(%rbp)
	jne	.L18
	leaq	128(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	jmp	.L23
.L18:
	movq	328(%rbp), %rax
	movl	$2, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseeko64
	movq	328(%rbp), %rax
	movq	%rax, %rcx
	call	ftello64
	movq	%rax, 344(%rbp)
	movq	328(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseeko64
	cmpq	$127, 344(%rbp)
	ja	.L19
	leaq	128(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC22(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	jmp	.L23
.L19:
	call	clock
	movl	%eax, 324(%rbp)
	leaq	.LC23(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	16(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 312(%rbp)
	movq	328(%rbp), %rax
	movq	%rax, %r9
	movl	$1, %r8d
	movl	$128, %edx
	leaq	keys(%rip), %rax
	movq	%rax, %rcx
	call	fread
	movq	328(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	336(%rbp), %rax
	movl	$2, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseeko64
	movq	336(%rbp), %rax
	movq	%rax, %rcx
	call	ftello64
	movq	%rax, 360(%rbp)
	movq	336(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	fseeko64
	movq	360(%rbp), %rax
	andl	$127, %eax
	movl	%eax, h(%rip)
	movl	h(%rip), %eax
	testl	%eax, %eax
	je	.L20
	movl	h(%rip), %eax
	movl	$128, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, v(%rip)
	movl	v(%rip), %eax
	cltq
	addq	%rax, 360(%rbp)
.L20:
	movq	360(%rbp), %rax
	shrq	$7, %rax
	movq	%rax, 304(%rbp)
	movq	$0, 352(%rbp)
	jmp	.L21
.L22:
	movq	336(%rbp), %rax
	movq	%rax, %r9
	movl	$1, %r8d
	movl	$128, %edx
	leaq	column(%rip), %rax
	movq	%rax, %rcx
	call	fread
/APP
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
.Round448:
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
	.ColJump448:
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
	jne    .ColJump448
	xorq    %r9,%r9
.ColOuter448:
	xorq    %r8,%r8
.ColInner448:
	bt      %r9,(%r15,%r8,4)
	jnc    .ColReset448
	bts     %r8d,%r10d
	jmp    .ColExit448
.ColReset448:
	btr     %r8d,%r10d
.ColExit448:
	incl    %r8d
	cmp     $32,%r8
	jne    .ColInner448
	movl    %r10d,(%r14,%r9,4)
	incq    %r9
	cmp     $32,%r9
	jne    .ColOuter448
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
	.RowJump448:
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
	jne    .RowJump448
	xorq    %r9,%r9
	cmp     $0,%r11
	jle     .ExitRound448
	.RowOuter448:
	xorq    %r8,%r8
.RowInner448:
	bt      %r9d,(%r14,%r8,4)
	jnc    .RowReset448
	bts     %r8d,%r10d
	jmp    .RowExit448
.RowReset448:
	btr     %r8d,%r10d
.RowExit448:
	incl    %r8d
	cmp     $32,%r8
	jne    .RowInner448
	movl    %r10d,(%r15,%r9,4)
	incq    %r9
	cmp     $32,%r9
	jne    .RowOuter448
	jmp    .Round448
.ExitRound448:
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
/NO_APP
	movq	312(%rbp), %rax
	movq	%rax, %r9
	movl	$1, %r8d
	movl	$128, %edx
	leaq	row(%rip), %rax
	movq	%rax, %rcx
	call	fwrite
	addq	$1, 352(%rbp)
.L21:
	movq	352(%rbp), %rax
	cmpq	304(%rbp), %rax
	jb	.L22
	movq	336(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movq	312(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	call	clock
	movl	%eax, 300(%rbp)
	movl	300(%rbp), %eax
	subl	324(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC17(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, 288(%rbp)
	movsd	288(%rbp), %xmm0
	movq	288(%rbp), %rdx
	movq	360(%rbp), %rax
	movapd	%xmm0, %xmm2
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC24(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC19(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, %eax
	jmp	.L23
.L15:
	leaq	.LC25(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
.L23:
	addq	$496, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC17:
	.long	0
	.long	1083129856
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.1.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	clock;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
