extern printf
extern scanf
extern exit

global main

section .text

main:
  ; printf("Enter a string: ");

  ; scanf("%s", string);

  ; printf("What is the length of the string? ");

  ; scanf("%lli", stringSize);

  ; reverse the string

nextChar:
  ; check if we are done 

  ; swap these two characters

  ; move to the next characters


printResult:
  ; printf("The reverse of the string is %s.\n", string);

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
