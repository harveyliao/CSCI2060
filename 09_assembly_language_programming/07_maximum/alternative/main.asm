extern printf

global main

section .text

main:

  ; iterate through the array, finding the maximum
  ;  r12 - current maximum value
  ;  r13 - pointer to current value
  ;  r14 - value of numberCount (counter)
  ;  r15 - current value from the array

  ; initialize (max is the first element)
  mov r13, numbers
  mov r12, [r13]
  mov r14, [numberCount]
nextNumber:
  ; check if we're at the end of the array
  cmp r14, 0
  je printResult

  ; load the next number into a register
  mov r15, [r13]

  ; check if the current number is > than the maximum
  cmp r15, r12
  jle notLarger

  ; update the maximum value
  mov r12, r15

notLarger:
  add r13, 8
  dec r14
  jmp nextNumber

printResult:
  ; save the max into the maxVal variable
  mov [maxVal], r12

  ; print the result
  mov rdi, result 
  mov rsi, r12 ; mov rsi, [maxVal]
  mov rax, 0
  push rax 
  call printf
  pop rax

exitProgram:
  mov rax, 0
  ret

section .rodata
  numbers dq 331, -31, 77, 50, -19, -1, 2, 0, -9, 13, -41, 53, 90, -102, 13, 11, -8, -19, 1, 123
  numberCount dq 20

  result db "The maximum element of the array is %lli.", 0ah, 0dh, 0

section .bss 
  maxVal resq 1

