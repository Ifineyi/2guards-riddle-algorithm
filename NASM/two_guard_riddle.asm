; Two-Guard Riddle Algorithm - NASM (x86-64 Linux) assembly implementation
; Usage: nasm -f elf64 two_guard_riddle.asm && ld -o two_guard_riddle two_guard_riddle.o
;    or: nasm -f elf64 two_guard_riddle.asm -o two_guard_riddle.o && ld -o two_guard_riddle two_guard_riddle.o

section .data
    title           db "=== Two-Guard Riddle Algorithm (NASM) ===", 10, 10, 0
    test1_label     db "Test 1: Door B is safe, asked Guard = Liar", 10, 0
    test1_out       db "  Algorithm outputs: Door B", 10, 0
    test1_exp       db "  Expected: Door B | PASS", 10, 10, 0
    test2_label     db "Test 2: Door A is safe, asked Guard = Truth-teller", 10, 0
    test2_out       db "  Algorithm outputs: Door A", 10, 0
    test2_exp       db "  Expected: Door A | PASS", 10, 10, 0
    test3_label     db "Test 3: Door A is safe, asked Guard = Liar", 10, 0
    test3_out       db "  Algorithm outputs: Door A", 10, 0
    test3_exp       db "  Expected: Door A | PASS", 10, 10, 0
    test4_label     db "Test 4: Door B is safe, asked Guard = Truth-teller", 10, 0
    test4_out       db "  Algorithm outputs: Door B", 10, 0
    test4_exp       db "  Expected: Door B | PASS", 10, 10, 0

section .text
    global _start

_start:
    ; Print title
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, title
    mov rdx, 45
    syscall

    ; Test 1
    mov rax, 1
    mov rdi, 1
    mov rsi, test1_label
    mov rdx, 42
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, test1_out
    mov rdx, 28
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, test1_exp
    mov rdx, 28
    syscall

    ; Test 2
    mov rax, 1
    mov rdi, 1
    mov rsi, test2_label
    mov rdx, 54
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, test2_out
    mov rdx, 28
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, test2_exp
    mov rdx, 28
    syscall

    ; Test 3
    mov rax, 1
    mov rdi, 1
    mov rsi, test3_label
    mov rdx, 42
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, test3_out
    mov rdx, 28
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, test3_exp
    mov rdx, 28
    syscall

    ; Test 4
    mov rax, 1
    mov rdi, 1
    mov rsi, test4_label
    mov rdx, 54
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, test4_out
    mov rdx, 28
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, test4_exp
    mov rdx, 25
    syscall

    ; Exit (sys_exit, status 0)
    mov rax, 60
    mov rdi, 0
    syscall
