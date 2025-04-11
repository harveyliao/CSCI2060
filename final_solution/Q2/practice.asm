; Asks the user to enter a string, and then reverses that string (in place) and outputs the result
extern printf
extern scanf
extern exit

global main

section .text

main:
  ; printf("Enter a string: ");
  mov rdi, stringPrompt
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; scanf("%s", string);
  mov rdi, stringFormat
  mov rsi, string
  mov rax, 0
  push rbx
  call scanf
  pop rbx

  ; printf("What is the length of the string? ");
  mov rdi, stringSizePrompt
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; scanf("%lli", stringSize);
  mov rdi, stringSizeFormat
  mov rsi, stringSize
  mov rax, 0
  push rbx
  call scanf
  pop rbx

  ; reverse the string
  mov r14, string       ; r14 = front pointer
  mov r15, string       ; r15 = end pointer
  add r15, [stringSize] ; move to end of string
  dec r15               ; adjust to point to last character

nextChar:
  ; check if we are done 
  cmp r14, r15         ; two pointers have met or crossed
  jge printResult      ; if so, we are done

  ; swap these two characters
  mov al, [r14]         ; get char at start
  mov bl, [r15]         ; get char at end
  mov [r14], bl         ; swap them
  mov [r15], al

  ; move to the next characters
  dec r15               ; move end pointer backward
  inc r14               ; move start pointer forward
  jmp nextChar          ; continue loop


printResult:
  ; printf("The reverse of the string is %s.\n", string);
  mov rdi, responseFormat
  mov rsi, string
  mov rax, 0
  push rbx
  call printf
  pop rbx

endProgram:
  ; exit
  mov rax, 0
  ret

section .data
  stringPrompt db "Enter a string: ", 0
  stringFormat db "%s", 0

  stringSizePrompt db "What is the length of the string? ", 0
  stringSizeFormat db "%lli", 0

  responseFormat db "The reverse of the string is %s.", 0ah, 0dh, 0

section .bss 
  string resb 50
  stringSize resq 1
