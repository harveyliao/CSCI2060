extern printf
extern scanf

global main

section .text

main:
  ; code goes here

  ; printf("Enter a number: ");
  mov rdi, numberPrompt 
  push rax 
  call printf
  pop rax 

  ; scanf("%d", &num);
  mov rdi, numberFormat
  mov rsi, num
  push rax 
  call scanf
  pop rax 

  ; if ((num % 2) == 0) {
  ;     printf("The number %d is even.\n", num);
  ; } else { 
  ;     printf("The number %d is odd.\n", num);
  ; }
  mov rbx, 2
  mov rax, [num] 
  mov rdx, 0
  idiv rbx 
  cmp rdx, 0
  je printEvenMessage

printOddMessage:
  mov rdi, oddMessage 
  mov rsi, [num]
  push rax  
  call printf
  pop rax  

  jmp exitProgram

printEvenMessage:
  mov rdi, evenMessage 
  mov rsi, [num]
  push rax  
  call printf
  pop rax  

exitProgram:
  ; exit
  mov rax, 0
  ret

section .rodata
  ; the .roddata section is for constants
  numberPrompt db "Enter a number: ", 0
  numberFormat db "%d", 0
  evenMessage db "The number %d is even.", 0ah, 0dh, 0 
  oddMessage db "The number %d is odd.", 0ah, 0dh, 0 

  temp db "%d", 0

section .data
  num dq 0
  