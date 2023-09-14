; Asg 4 - in Class

section .data
  nameStr    db 'My name is Kevin Moran',10
  nameStrLen equ $ - nameStr
  myGoal db 'my goal in learning assembly language is to improve my knowledge in computer science, and learn about a new language.',10
  myGoalLen equ $ - myGoal

section .bss

section .text ;main()
  global _start
  _start:

  mov eax, 4 ; system write call eax = 4
  mov ebx, 1 ; standard out (display)
  mov ecx, nameStr ; address to write
  mov edx, nameStrLen
  int 80h

  mov eax, 4 ; system write call
  mov ebx, 0 ; return value
  mov ecx, myGoal ; address to write
  mov edx, myGoalLen
  int 80h

  mov eax, 1 ; system exit call
  mov ebx, 0 ; return value
  int 80h
