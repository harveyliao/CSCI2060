extern printf
extern scanf

global main

section .text

main:
    ; Initialize sorting variables
    ; r8  - outer loop counter (i)
    ; r9  - inner loop counter (j)
    ; r10 - length of array
    ; r11 - temporary for swapping
    mov r8, 0          ; i = 0
    mov r10, [listSize]
    dec r10            ; listSize - 1 for outer loop

outer_loop:
    cmp r8, r10
    jge print_array    ; if i >= listSize-1, we're done sorting
    
    mov r9, 0          ; j = 0
    mov rcx, r10
    sub rcx, r8        ; inner loop limit = listSize-1-i

inner_loop:
    cmp r9, rcx
    jge inner_loop_end

    ; Compare adjacent elements
    mov rax, [list + r9*8]      ; list[j]
    mov rbx, [list + r9*8 + 8]  ; list[j+1]
    cmp rax, rbx
    jle no_swap                 ; if list[j] <= list[j+1], no swap needed
    ; jge no_swap ; descending order

    ; Swap elements
    mov [list + r9*8], rbx      ; list[j] = list[j+1]
    mov [list + r9*8 + 8], rax  ; list[j+1] = list[j]

no_swap:
    inc r9
    jmp inner_loop

inner_loop_end:
    inc r8
    jmp outer_loop

print_array:
    ; Print the sorted array
    mov r8, 0          ; index counter
    mov r9, [listSize] ; array length

print_loop:
    cmp r8, r9
    jge end_program

    ; Print current number
    mov rdi, numberFormat
    mov rsi, [list + r8*8]
    mov rax, 0
    push r8
    push r9
    call printf
    pop r9
    pop r8

    inc r8
    jmp print_loop

end_program:
    ; Print newline at the end
    mov rdi, newline
    mov rax, 0
    call printf

    ; exit
    mov rax, 0
    ret

section .data
    list dq -4, 7, 6, 11, -1, 0, 3, 9, 16, -3
    listSize dq 10

    numberFormat db "%lli ", 0
    newline db 0ah, 0dh, 0