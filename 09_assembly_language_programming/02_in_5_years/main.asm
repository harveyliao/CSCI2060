extern printf
extern scanf

global main

section .text

main:
  ; code goes here
  
  ; printf("Enter your age: ");
  mov rdi, agePrompt 
  mov rax, 0
  push rax 
  call printf
  pop rax ; overwrites printf's return value

  ; scanf("%d", &age);
  mov rdi, ageFormat 
  mov rsi, age 
  mov rax, 0
  push rax 
  call scanf
  pop rax 

  ; age += 5;
  mov rsi, [age]
  add rsi, 5

  ; printf("In 5 years, you will be %d years old.\n", age);
  mov rdi, responseFormat 
  ; no need to move, since age+5 is already in rsi
  mov rax, 0
  push rax 
  call printf
  pop rax

  ; exit
  mov rax, 0
  ret

section .data
  ; data goes here
  agePrompt db "Enter your age: ", 0
  ageFormat db "%d", 0
  age dq 0

  responseFormat db "In 5 years, you will be %d years old.", 0ah, 0dh, 0
