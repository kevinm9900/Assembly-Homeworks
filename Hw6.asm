section .data
  ;; declare 3 prompt messages and their length using the equ directibe
  prompt1 db "Do you have a driver's license? Y/N "
  promptLen1 equ $ - prompt1

  prompt2 db "Do you have car insurance? Y/N?"
  promptLen2 equ $ - prompt2

  prompt3 db "Your response for the two questions are as follows --> ", 10
  promptLen3 equ $ - prompt3

  section .bss
    ;; declare 2 buffers as byte data
    userInput1 resb 40
    userInput2 resb 40


  section .text
  global _start
  _start:

    ;; system write "Do you have a driver's license? Y/N"
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, promptLen1
    int 80h

    ;; system read into drivers license buffer
    mov eax, 3
    mov ebx, 2
    mov ecx, userInput1
    mov edx, 40
    int 80h

    ;; system write "Do ypu have car insurance? Y/N"
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, promptLen2
    int 80h
    ;; system read into car insurance buffer
    mov eax, 3
    mov ebx, 2
    mov ecx, userInput2
    mov edx, 40
    int 80h

    ;; system write "Your response for the two questions are as follows -->"
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt3
    mov edx, promptLen3
    int 80h
    ;; system write the driver license buffer
    mov eax, 4
    mov ebx, 1
    mov ecx, userInput1
    mov edx, 40
    int 80h

    ;; system write the car insurance buffer
    mov eax, 4
    mov ebx, 1
    mov ecx, userInput2
    mov edx, 40
    int 80h



    mov eax, 1
    mov ebx, 0
    int 80h
