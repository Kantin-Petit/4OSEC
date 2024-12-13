.section .bss
name: .space 16

.section .text
.global _start
.intel_syntax noprefix

_printText1:
    mov rax, 1
    mov rdi, 1
    lea rsi, [text1]
    mov rdx, 17
    syscall
    ret

_getName:
    mov rax, 0
    mov rdi, 0
    lea rsi, [name]
    mov rdx, 16
    syscall
    ret

_printText2:
    mov rax, 1
    mov rdi, 1
    lea rsi, [text2]
    mov rdx, 7
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    lea rsi, [name]
    mov rdx, 16
    syscall
    ret

_start:
    call _printText1
    call _getName
    call _printText2
    call _printName

    mov rax, 60
    mov rdi, 1/fr,1,3420.html
    syscall

text1: 
    .asciz "What your name?\n"

text2: 
    .asciz "Hello, "
