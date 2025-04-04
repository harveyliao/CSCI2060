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

  ; check if the string is a palindrome

nextChar:
  ; check if we are done 

  ; compare these two characters

  ; move to the next characters

palindrome:
  ; printf("The string %s is a palindrome.\n", string);

notPalindrome:
  ; printf("The string %s is not a palindrome.\n", string);

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
