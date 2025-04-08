extern printf
; extern exit

global main

section .text

main:
  ; printf("Hello, world!\n");
  ; cout << "Hello, world!" << endl;
  mov rdi, message  ; rdi is the first argument of printf
  mov rax, 0        ; store the return value of function
  push rbx          ; push rbx onto the stack
                    ; this is to adjust the stack pointer to be a multiple of 8
  call printf       ; call printf
  pop rbx           ; pop rbx from the stack, clean up

  ; exit
  mov rax, 0        ; rax is the return value of the program
  ret               ; return from the function

section .data
  message db "Hello, world!", 0ah, 0dh, 0
