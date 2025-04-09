extern printf
extern scanf

global main

section .text

main:
  ; code goes here
  
  ; printf("Enter your cat's name: ");
  mov rdi, namePrompt 
  push rdi 
  call printf
  pop rdi

  ; scanf("%s", name);
  mov rdi, nameFormat 
  mov rsi, name 
  push rsi ; what register we use is arbitrary, as long as its 64 bits
  call scanf
  pop rsi 

  ; printf("Enter your cat's age: ");
  mov rdi, agePrompt 
  push rdi 
  call printf
  pop rdi

  ; scanf("%d", &age);
  mov rdi, ageFormat 
  mov rsi, age
  push rsi
  call scanf
  pop rsi 

  ; int catAge = age * 7;   ; we can choose to use variable catAge or just use register
  mov rax, [age]
  mov rcx, 7
  mul rcx
  ; rdx - contains the high-order bits, which should be 0
  ; rax - contains the low-order bits, which should be our product

  ; printf("Your cat, %s, is %d year(s) old (%d in cat years).\n", name, age, catAge);
  mov rdi, message 
  mov rsi, name 
  mov rdx, [age]
  ; mov rcx, catAge
  mov rcx, rax  ; load the product into rcx
  push rdi 
  call printf
  pop rdi

  ; exit
  mov rax, 0
  ret

section .data
  ; data goes here
  namePrompt db "Enter your cat's name: ", 0
  nameFormat db "%s", 0

  agePrompt db "Enter your cat's age: ", 0
  ageFormat db "%d", 0

  message db "Your cat, %s, is %d year(s) old (%d in cat years).", 0ah, 0dh, 0

section .bss
  ; these variables have not been initialized
  ; the values are set at run time 
  name resb 51 ; 50 bytes for characters + 1 byte for null terminator
  age resq 1   ; 1 quadword
  ; catAge resq 1