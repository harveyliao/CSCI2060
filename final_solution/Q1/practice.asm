; Asks the user to enter an integer, and then searches through an array of integers, sequentially, and outputs a message whether or not that integer was found
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
  mov r12, list        ; r12 = address of list
  mov r13, [listSize]  ; r13 = size of list (counter)
  mov r14, [toFind]    ; r14 = number to find

nextNumber:
  ; get the next array element
  mov r15, [r12]       ; r15 = current element

  ; compare this array element to our number
  cmp r15, r14         ; compare current element to number to find
  je numberFound       ; if equal, jump to numberFound

  ; go to the next array element
  add r12, 8           ; move to the next element (quad word, so 8 bytes)
  dec r13              ; decrement the counter
  cmp r13, 0           ; check if we reached the end
  jne nextNumber       ; if not at end, jump to nextNumber

numberNotFound:
  ; printf("The number %lli was not found in the list.\n", toFind);
  mov rdi, responseFailed
  mov rsi, [toFind]
  mov rax, 0
  push rbx
  call printf
  pop rbx
  jmp endProgram

numberFound:
  ; printf("The number %lli was found in the list.\n", toFind);
  mov rdi, responseSuccess
  mov rsi, [toFind]
  mov rax, 0
  push rbx
  call printf
  pop rbx

endProgram:
  ; exit
  mov rax, 0
  ret

section .data
  toFindPrompt db "Enter a number: ", 0
  toFindFormat db "%lli", 0
  toFind dq 0

  list dq -4, 7, 6, 11, -1, 0, 3, 9, 16, -3 ; list of quad words
  listSize dq 10

  responseSuccess db "The number %lli was found in the list.", 0ah, 0dh, 0
  responseFailed db "The number %lli was not found in the list.", 0ah, 0dh, 0
