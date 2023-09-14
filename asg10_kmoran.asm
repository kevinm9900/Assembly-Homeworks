section .data
  WORD_SIZE equ 4
  array     dd      2, -4, 3, -1, -7, 8,  12,  -20,  -10,  -11,  23,  4,  5
  arrayLen equ ($ - array)/ WORD_SIZE
  positiveCount db 0
  negativeCount db 0

  positiveCountString db 'The amount of positive numbers is: '
  positiveCountStringLen equ $ - positiveCountString

  negativeCountString db 'The amount of negative numbers is: '
  negativeCountStringLen equ $ - negativeCountString

  newLineChar db 10

section .bss

section .text
    global _start
    _start:

    mov esi, array
    mov edi, 0

  compareNum:
    mov eax,  dword [esi + (WORD_SIZE * edi)]

    cmp eax, 0
    jg incrementPosCounter
    cmp eax, 0
    jl incrementNegCounter
    jmp nextElement

  incrementPosCounter:
    inc byte[positiveCount]

  nextElement:
    inc edi  ;; increment the index
    cmp edi, arrayLen
    jl compareNum

    add byte [positiveCount], '0'
    add byte [negativeCount], '0'

    mov eax, 4  ;; eax = 4 for system write
    mov ebx, 1  ;; ebx = 1 to write in the standard out
    mov ecx, positiveCountString ;; ecx contains the address of the data to write
    mov edx, positiveCountStringLen ;; edc contains the length of data to write
    int 80h ;; kernel call

    mov eax, 4  ;; eax = 4 for system write
    mov ebx, 1  ;; ebx = 1 to write in the standard out
    mov ecx, positiveCount ;; ecx contains the address of the data to write
    mov edx, 1 ;; edc contains the length of data to write
    int 80h ;; kernel call

    mov eax, 4  ;; eax = 4 for system write
    mov ebx, 1  ;; ebx = 1 to write in the standard out
    mov ecx, newLineChar ;; ecx contains the address of the data to write
    mov edx, 1 ;; edc contains the length of data to write
    int 80h ;; kernel call

    mov eax, 4  ;; eax = 4 for system write
    mov ebx, 1  ;; ebx = 1 to write in the standard out
    mov ecx, negativeCountString ;; ecx contains the address of the data to write
    mov edx, negativeCountStringLen ;; edc contains the length of data to write
    int 80h ;; kernel call

    mov eax, 4  ;; eax = 4 for system write
    mov ebx, 1  ;; ebx = 1 to write in the standard out
    mov ecx, negativeCount ;; ecx contains the address of the data to write
    mov edx, 1 ;; edc contains the length of data to write
    int 80h ;; kernel call

    mov eax, 4  ;; eax = 4 for system write
    mov ebx, 1  ;; ebx = 1 to write in the standard out
    mov ecx, newLineChar ;; ecx contains the address of the data to write
    mov edx, 1 ;; edc contains the length of data to write
    int 80h ;; kernel call

    mov eax, 1
    mov ebx, 0
    int 80h

    incrementNegCounter:
      inc byte[negativeCount]
      jmp nextElement
