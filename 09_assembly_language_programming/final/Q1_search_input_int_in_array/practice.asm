extern printf
extern scanf

global main

section .text

main:
  ; printf("Enter a number: ");
  mov rdi, toFindPrompt  
  mov rax, 0        
  push rbx          
  call printf       
  pop rbx           

  ; scanf("%lli", &toFind);
  mov rdi, toFindFormat
  mov rsi, toFind
  mov rax, 0
  push rbx
  call scanf
  pop rbx

  ; search the list

  ; initialize
  ; rsi - toFind
  ; r8  - the current element of array
  ; r9  - the current index
  ; r10 - length of the array
  mov rsi, [toFind]
  ;mov r8, [list]
  mov r9, 0 ;0-index the array
  mov r10, [listSize]

nextNumber:
  ; get the next array element
  cmp r9, r10
  jge numberNotFound
  mov r8, [list + r9 * 8]

  ; compare this array element to our number
  cmp r8, rsi
  je numberFound

  ; go to the next array element
  inc r9
  jmp nextNumber

numberNotFound:
  ; printf("The number %lli was not found in the list.\n", toFind);
  mov rdi, numberNotFoundFormat
  mov rsi, [toFind]
  mov rax, 0
  push rax
  call printf
  pop rax

  jmp endProgram

numberFound:
  ; printf("The number %lli was found in the list.\n", toFind);
  mov rdi, numberFoundFormat
  mov rsi, [toFind]
  mov rax, 0
  push rax
  call printf
  pop rax
  

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
  numberNotFoundFormat db "The number %lli was not found in the list.", 0ah, 0dh, 0
  numberFoundFormat db "The number %lli was found in the list.", 0ah, 0dh, 0