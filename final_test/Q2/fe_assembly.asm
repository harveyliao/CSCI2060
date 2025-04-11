extern printf
extern scanf

global main 

section .text

main:

  ; printf("The following numbers are greater than %d and odd:\n", compareValue);
  mov rdi, messageFormat
  mov rsi, [compareValue]
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; loop over the numbers in the array
  mov r12, values        ; r12 = address of array
  mov r13, [valueCount]  ; r13 = size of array (counter)
  mov r14, [compareValue]; r14 = number to compare

nextNumber:
  ; retrieve the next number from the array
  mov r15, [r12]         ; r15 = current element

  ; check if we're at the end of the array
  cmp r13, 0
  je endOfProgram

  ; check for > 7
  cmp r15, 7
  jl skipPrint

  ; check for odd
  mov rbx, 2
  mov rax, r15 
  mov rdx, 0
  idiv rbx 
  cmp rdx, 0    ; compare remainder to 0
  je skipPrint  ; conditional jump to skipPrint if remainder is 0 (i.e. even number)

  ; printf("  %d\n", values[i])
  mov rdi, resultFormat
  mov rsi, r15
  mov rax, 0
  push rbx
  call printf
  pop rbx


skipPrint:
  ; advance the pointer to the next number in the array
  add r12, 8           ; move to the next element (quad word, so 8 bytes)
  dec r13              ; decrement the counter
  jmp nextNumber       ; jump to nextNumber


endOfProgram:
  ; exit the program
  mov rax, 0
  ret 

section .data 
  values dq 4, 8, -3, 5, 4, -9, 0, 11, 12, 16, 20, 1, 19, 15, 14
  valueCount dq 15
  compareValue dq 7

  messageFormat db "The following numbers are greater than %lli and odd:", 0ah, 0dh, 0
  resultFormat db "  %lli", 0ah, 0dh, 0

  ; define any additional variables needed, here
