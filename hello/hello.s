.global _start
.intel_syntax noprefix

_start:
	// WRITE
	mov rax, 1
	mov rdi, 1
	lea rsi, [hello]
	mov rdx, [size]
	syscall

	// EXIT
	mov rax, 60
	mov rdi, 0
	syscall

hello:
	.asciz "Hello, world\n"

size:
	.int 13
