; print('hello world') in python

section .data
  helloStr    db 'Hello World',10
  helloStrLen equ $ - helloStr
  courseName db 'COSC2331-01',10
  courseNameLen equ $ - courseName

section .bss

section .text ;main()
  global _start
  _start:

  mov eax, 4 ; system write call eax = 4
  mov ebx, 1 ; standard out (display)
  mov ecx, helloStr ; address to write
  mov edx, helloStrLen
  int 80h

  mov eax, 4 ; system write call
  mov ebx, 0 ; return value
  mov ecx, courseName ; address to write
  mov edx, courseNameLen
  int 80h

  mov eax, 1 ; system exit call
  mov ebx, 0 ; return value
  int 80h
