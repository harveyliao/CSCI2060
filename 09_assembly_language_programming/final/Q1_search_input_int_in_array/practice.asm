extern printf
extern scanf

global main

section .text

main:
  ; printf("Enter a number: ");

  ; scanf("%lli", &toFind);

  ; search the list

nextNumber:
  ; get the next array element

  ; compare this array element to our number

  ; go to the next array element

numberNotFound:
  ; printf("The number %lli was not found in the list.\n", toFind);

numberFound:
  ; printf("The number %lli was found in the list.\n", toFind);

endProgram:
  ; exit
  mov rax, 0
  ret

section .data
  toFindPrompt db "Enter a number: ", 0
  toFindFormat db "%lli", 0
  toFind dq 0

  list dq -4, 7, 6, 11, -1, 0, 3, 9, 16, -3
  listSize dq 10

  ; more variables to be added as needed go here