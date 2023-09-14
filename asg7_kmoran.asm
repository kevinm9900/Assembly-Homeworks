section .data
  LicenseMsg    db "Do you have a driver's license? Y/N", 10
  LicenseMsgLen equ $ - LicenseMsg

  InsuranceMsg      db "Do you have car insurance? Y/N", 10
  InsuranceMsgLen   equ $ - InsuranceMsg

  yesDisp            db "Great! You are eligible to drive",
  yesDispLen         equ $ - yesDisp

  noDisp             db   "Sorry! You can not drive unless you have the driver's license AND the car insurance", 10
  noDispLen          equ  $ - noDisp

  section .bss
    LicenseUserInput    resb 40
    LicenseUserInputLen resd 1

    InsuranceUserInput      resb 40
    InsuranceUserInputLen   resd 1

  section .text
    global _start
    _start:
    ; System Write: Driver's License
      mov eax, 4
      mov ebx, 1
      mov ecx, LicenseMsg
      mov edx, LicenseMsgLen
      int 80h

    ; System read from keyboard: Driver's License Input
      mov eax, 3                       ; system read call
      mov ebx, 2                       ; ebx = 2 means read from keyboard
      mov ecx, LicenseUserInput ; buffer to read the data
      mov edx, 40                      ; length of the buffer
      int 80h                          ; kernel call

      dec eax
      mov dword [LicenseUserInputLen], eax

    ; System Write: Car Insurance
      mov eax, 4
      mov ebx, 1
      mov ecx, InsuranceMsg
      mov edx, InsuranceMsgLen
      int 80h

    ; System read from keyboard: Car Insurance Input
      mov eax, 3                       ; system read call
      mov ebx, 2                       ; ebx = 2 means read from keyboard
      mov ecx, InsuranceUserInput ; buffer to read the data
      mov edx, 40                      ; length of the buffer
      int 80h                          ; kernel call

      dec eax
      mov dword [InsuranceUserInputLen], eax

      cmp byte [LicenseUserInput], 'y'
      je secondCond
      jne printNo

      secondCond:
        cmp byte [InsuranceUserInput], 'y'
        je printYes
        jne printNo

      ; thirdCond:
      ;   cmp byte [InsuranceUserInput], [LicenseUserInput]
      ;   je printYes
      ;   jne printNo

      printNo:
         mov eax, 4
         mov ebx, 1
         mov ecx, noDisp
         mov edx, noDispLen
         int 80h
         jmp exitCode

       printYes:
          mov eax, 4
          mov ebx, 1
          mov ecx, yesDisp
          mov edx, yesDispLen
          int 80h
          jmp exitCode


    ; Exit
    exitCode:
      mov eax, 1
      mov ebx, 0
      int 80h
