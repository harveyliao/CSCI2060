extern printf
extern scanf

global main

section .text

main:
  mov rdi, messagePrompt
  mov rax, 0
  push rax 
  call printf 
  pop rax 

  mov rdi, messageFormat
  mov rsi, message
  mov rax, 0
  push rax 
  call scanf 
  pop rax 

  ;; convert message to uppercase

  mov rsi, message 

nextChar:
  mov al, [rsi]

  cmp al, 0
  je printResult 

  cmp al, 97
  jl skipChar 

  cmp al, 122 
  jg skipChar 

  sub al, 32
  mov [rsi], al

skipChar:
  inc rsi 
  jmp nextChar

printResult:
  mov rdi, result
  mov rsi, message 
  mov rax, 0
  push rax 
  call printf 
  pop rax 


exitProgram:
  mov rax, 0
  ret

section .rodata
  messagePrompt db "Enter a message: ", 0
  messageFormat db "%s", 0
  result db "The message in uppercase is %s.", 0ah, 0dh, 0

section .bss 
  message resb 51
