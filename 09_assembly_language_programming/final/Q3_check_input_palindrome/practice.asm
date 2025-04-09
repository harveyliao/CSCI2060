; Q3: check if the input string is a palindrome
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

  ; check if the string is a palindrome
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
  jge palindrome

  ; compare these two characters
  mov r10b, [r8]
  mov r11b, [r9]
  cmp r10b, r11b
  jne notPalindrome

  ; move to the next characters
  inc r8
  dec r9
  jmp nextChar

palindrome:
  ; printf("The string %s is a palindrome.\n", string);
  mov rdi, responseTrue
  mov rsi, string
  mov rax, 0
  push rax
  call printf
  pop rax

  jmp endProgram

notPalindrome:
  ; printf("The string %s is not a palindrome.\n", string);
  mov rdi, responseFalse
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

  responseTrue db "The string %s is a palindrome.", 0ah, 0dh, 0
  responseFalse db "The string %s is not a palindrome.", 0ah, 0dh, 0

section .bss 
  string resb 50
  stringSize resq 1
