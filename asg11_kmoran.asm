section .data
  helloStr  db  'My name is Kevin Moran',10
  helloStrLen equ $ - helloStr

  hiStr  db  'My goal in learning assembly language is to improve my knowledge in computer science, and learn about a new language.',10
  hiStrLen equ $ - hiStr

section .bss
  readBuffer resb 80
  readBufferLen resd 1

section .text
  global _start
  _start:

    push helloStr
    push helloStrLen
    call writeStr

    push hiStr
    push hiStrLen
    call writeStr

  mov eax, 3
    mov ebx, 2
    mov ecx, readBuffer
  mov edx, 80
    int 80h

    dec eax
    mov dword [readBufferLen], eax

    push readBuffer
    push dword [readBufferLen]
    call writeStr

    mov eax, 1
    mov ebx, 0
    int 80h


writeStr:

  push ebp
  mov ebp, esp


  pushad

  mov eax, 4
  mov ebx, 1
  mov ecx , [ebp+12]
  mov edx, [ebp+8]
  int 80h

  popad

  mov esp, ebp
  pop ebp

  ret 8
