extern printf
; extern exit

global main

section .text

main:
  ; printf("Hello, world!\n");
  ; cout << "Hello, world!" << endl;
  mov rdi, message
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; exit
  mov rax, 0
  ret

section .data
  message db "Hello, world!", 0ah, 0dh, 0
