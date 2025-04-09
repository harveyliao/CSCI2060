; Q2: Asks the user to enter a string, and then reverses that 
; string (in place) and outputs the result
extern printf
extern scanf
extern exit

global main

section .text

main:
  ; printf("Enter a string: ");
  mov rdi, stringPrompt
  mov rax, 0
  push rax
  call printf
  pop rax

  ; scanf("%s", string);
  mov rdi, stringFormat
  mov rsi, string
  mov rax, 0
  push rax
  call scanf
  pop rax

  ; printf("What is the length of the string? ");
  mov rdi, stringSizePrompt
  mov rax, 0
  push rax
  call printf
  pop rax

  ; scanf("%lli", stringSize);
  mov rdi, stringSizeFormat
  mov rsi, stringSize
  mov rax, 0
  push rax
  call scanf
  pop rax

  ; reverse the string
  ; r8: front address
  ; r9: back address
  ; r10b: current front character
  ; r11b: current back character
  mov r8, string
  mov r9, string ;r9 = string + [stringSize] - 1
  add r9, [stringSize]
  dec r9

nextChar:
  ; check if we are done 
  cmp r8, r9 ; if front pointer >= back pointer, done
  jge printResult

  ; swap these two characters
  mov r10b, [r8]
  mov r11b, [r9]
  mov [r9], r10b
  mov [r8], r11b

  ; move to the next characters
  inc r8
  dec r9
  jmp nextChar

printResult:
  ; printf("The reverse of the string is %s.\n", string);
  mov rdi, responseFormat
  mov rsi, string
  mov rax, 0
  push rax
  call printf
  pop rax


endProgram:
  ; exit
  mov rax, 0
  ret

section .data
  stringPrompt db "Enter a string: ", 0
  stringFormat db "%s", 0

  stringSizePrompt db "What is the length of the string? ", 0
  stringSizeFormat db "%lli", 0

  responseFormat db "The reverse of the string is %s.", 0ah, 0dh, 0

section .bss 
  string resb 50
  stringSize resq 1
