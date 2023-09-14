section .data
  prompt db "This is the data you entered ", 10
  promptLen equ $ - prompt

section .bss
   userInput resb 40
   userInputLen resd 1

section .text
global _start
_start:
  ;; system read from keyboard
   mov eax, 3    ;; system read call
   mov ebx, 2    ;; read from keyboard
   mov ecx, userInput   ;; buffer to read the data in
   mov edx, 40      ;; length of the buffer
   int 80h          ;; kernel call

   dec eax         ;; contains length of the user input including the enter key
   mov dword [userInputLen], eax

;; system write - echo back the user input
   mov eax, 4
   mov ebx, 1
   mov ecx, userInput
   mov edx, [userInputLen]
   int 80h
;; system write the prompt
   mov eax, 4
   mov ebx, 1
   mov ecx, prompt
   mov edx, promptLen
   int 80h


   mov eax, 1
   mov ebx, 0
   int 80h
