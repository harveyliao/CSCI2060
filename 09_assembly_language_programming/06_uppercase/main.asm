extern printf
extern scanf

global main

section .text

main:
  ; print the message prompt
  mov rdi, messagePrompt
  mov rax, 0
  push rax 
  call printf 
  pop rax 

  ; read the message from the user
  ; scanf will put a null terminator at the end of the string
  mov rdi, messageFormat
  mov rsi, message
  mov rax, 0
  push rax 
  call scanf 
  pop rax 

  ; convert message to uppercase

  mov rsi, message 

nextChar:
  
  mov al, [rsi]    ; al is the low bits of RAX, it will contain the current character

  cmp al, 0        ; compare the current character to the null terminator
  je printResult   ; if we've reached the end of the string, print the result

  ; check if the character is a lowercase letter
        ; look up the ASCII table.
        ; 97 is the ASCII code for 'a'
        ; 122 is the ASCII code for 'z'
  cmp al, 97
  jl skipChar 

  cmp al, 122 
  jg skipChar 

  ; convert the character to uppercase
  ; 32 is the difference between the ASCII codes of lowercase and uppercase letters
  sub al, 32          ; subtract 32 from the character to convert it to uppercase
  mov [rsi], al       ; store the uppercase character back in the message

skipChar:
  inc rsi             ; move to the next character
                      ; increment by 1 because that's the size of a character
  jmp nextChar        ; repeat the loop

printResult:
  mov rdi, result
  mov rsi, message 
  mov rax, 0
  push rax 
  call printf 
  pop rax 


exitProgram:
  mov rax, 0
  ret

section .rodata
  messagePrompt db "Enter a message: ", 0
  messageFormat db "%s", 0
  result db "The message in uppercase is %s.", 0ah, 0dh, 0

section .bss 
  message resb 51
