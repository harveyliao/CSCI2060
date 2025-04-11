; Asks the user to enter a string, and then the length of the string (you can assume that the user enters this correctly).  The program will then check if that string is a palindrome, and will output a message accordingly.

extern printf
extern scanf
extern exit

global main

section .text

main:
  ; printf("Enter a string: ");
  mov rdi, stringPrompt
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; scanf("%s", string);
  mov rdi, stringFormat
  mov rsi, string
  mov rax, 0
  push rbx
  call scanf
  pop rbx

  ; printf("What is the length of the string? ");
  mov rdi, stringSizePrompt
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; scanf("%lli", stringSize);
  mov rdi, stringSizeFormat
  mov rsi, stringSize
  mov rax, 0
  push rbx
  call scanf
  pop rbx

  ; check if the string is a palindrome
  mov r14, string 
  mov r15, string 
  add r15, [stringSize]
  dec r15

nextChar:
  ; check if we are done 
  cmp r14, r15 
  jge palindrome

  ; compare these two characters
  mov al, [r14]
  mov bl, [r15]
  cmp al, bl 
  jne notPalindrome

  ; move to the next characters
  dec r15 
  inc r14 
  jmp nextChar

palindrome:
  ; printf("The string %s is a palindrome.\n", string);
  mov rdi, responseTrue
  mov rsi, string
  mov rax, 0
  push rbx
  call printf
  pop rbx
  jmp endProgram 

notPalindrome:
  ; printf("The string %s is not a palindrome.\n", string);
  mov rdi, responseFalse
  mov rsi, string
  mov rax, 0
  push rbx
  call printf
  pop rbx

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
