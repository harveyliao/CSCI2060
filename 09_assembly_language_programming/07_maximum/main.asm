extern printf

global main

section .text

main:

  ; iterate through the array, finding the maximum
  ;  r8 - the current maximum value
  ;  r9 - the current index within the array
  ;  r10 - the value of numberCount
  ;  r11 - the current value from the array

  ; initialize (max is the first element)
  mov r8, [numbers]
  mov r9, 1
  mov r10, [numberCount]

nextNumber:
  ; check if we're at the end of the array
  cmp r9, r10 ; cmp r9, [numberCount]
  jge printResult

  ; load the next number into a register
  mov r11, [numbers + r9 * 8]  ; *8 because we used qword for numbers
                               ; similar to pointer arithmetic

  ; check if the current number is > than the maximum
  cmp r11, r8    ; currentValue > maxValue
  jle notLarger  ; if currentValue <= maxValue, skip the update

  ; update the maximum value
  mov r8, r11 

notLarger:
  inc r9
  jmp nextNumber

printResult:
  ; save the max into the maxVal variable
  mov [maxVal], r8

  ; print the result
  mov rdi, result 
  mov rsi, r8 ; mov rsi, [maxVal]
  mov rax, 0
  push rax 
  call printf
  pop rax

exitProgram:
  mov rax, 0
  ret

section .rodata
  numbers dq 311, -31, 77, 50, -19, -1, 2, 0, -9, 13, -41, 53, 90, -102, 13, 11, -8, -19, 1, 123
  numberCount dq 20

  result db "The maximum element of the array is %lli.", 0ah, 0dh, 0

section .bss 
  maxVal resq 1

