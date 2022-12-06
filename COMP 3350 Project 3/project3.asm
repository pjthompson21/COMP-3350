; Program Description: Program that reads a value from one array, then places 
;                      it into another with the location shifted by a specified amount
; Author: Parker Thompson
; Date: 10/11/22

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
    shift dword 2
    input byte 1,2,3,4,5,6,7,8
    output byte lengthof input dup(?)
.code
    main proc
    mov eax, 0      ;clears EAX register
    mov ebx, 0      ;clears EBX register
    mov ecx, shift  ;moves shift into ECX register
    
    ;loop that places the "unwrapped" values into the array
    l1:
        neg ecx
        mov al, input[lengthof input + ecx]
        mov output[ebx], al
        neg ecx
        inc ebx

     loop l1


    mov ecx, lengthof input  ;moves lengthof input into ECX register
    sub ecx, shift           ;subtracts shift from ECX register
    mov edx, 0               ;clears EDX register

    ;loop that places the "wrapped" values into the array
    l2:
        mov al, input[edx]
        mov output[ebx], al
        inc ebx
        inc edx

     loop l2

INVOKE ExitProcess,0
main ENDP
END main
