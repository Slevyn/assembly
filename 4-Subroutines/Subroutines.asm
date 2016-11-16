section .text
global _start

_start:
	MOV EAX, msg
	CALL strlen
	MOV EDX, EAX
	MOV ECX, msg
	MOV EBX, 1
	MOV EAX, 4
	INT 0x80

	MOV EBX, 0
	MOV EAX, 1
	INT 0x80

strlen:
	PUSH EBX	; store EBX on the stack so we don't overwrite it
	MOV EBX, EAX	; EAX is our parameter -- move to EBX for comparison

nextchar:
	CMP byte[EAX], 0; is current byte of EAX 0
	JZ finished	; jump to finished if zero
	INC EAX		; increment eax by one
	JMP nextchar	; jump to nextchar (loop)

finished:
	SUB EAX, EBX	; subtract EAX by string length?
	POP ebx		; pop value from stack back to EBX
	RET

section .data
	msg db "Hello, World", 0xa
