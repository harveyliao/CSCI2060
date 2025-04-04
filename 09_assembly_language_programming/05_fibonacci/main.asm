extern printf
extern scanf

global main

section .text

main:
  ; code goes here

  mov rdi, numberPrompt
  mov rax, 0
  push rax 
  call printf 
  pop rax 

  mov rdi, numberFormat 
  mov rsi, num 
  mov rax, 0
  push rax 
  call scanf 
  pop rax 

  ; calculate the num-th Fibonacci number  
  ; [num] - desired Fibonacci index 
  ; rsi   - current Fibonacci index
  ; r11   - previous Fibonacci number 
  ; r12   - current Fibonacci number
  mov rsi, 1
  mov r11, 0
  mov r12, 1

nextFibonacci:
  ; check if we're at the right index to quit (rsi > [num])
  cmp rsi, [num] 
  mov [fib], r12
  je printResult

  ; calculate the next Fibonacci number
  mov r8, r12  ; store old current for later use
  add r12, r11 ; new current
  mov r11, r8  ; new previous
  inc rsi      ; increment the index

  jmp nextFibonacci

printResult:
  mov rdi, resultMessage
  mov rsi, [num]
  mov rdx, [fib]
  mov rax, 0
  push rax 
  call printf 
  pop rax 

exitProgram:
  ; exit
  mov rax, 0
  ret

section .rodata
  numberPrompt db "Which Fibonacci number do you want? ", 0
  numberFormat db "%lli", 0 ; %lli - 64-bit integer
  resultMessage db "The %llith Fibonacci number is %lli.", 0ah, 0dh, 0

section .data
  num dq 0 
  fib dq 0