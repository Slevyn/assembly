section .text
global _start

_start:
	MOV EBX, msg	; store message in EBX
	MOV EAX, EBX	; store message in EAX

nextchar:
	CMP byte[EAX], 0; is current byte of EAX 0
	JZ finished	; jump to finished if zero
	INC EAX		; increment eax by one
	JMP nextchar	; jump to nextchar (loop)

finished:
	SUB EAX, EBX	; subtract EAX by string length?

	MOV EDX, EAX	; size of the message
	MOV ECX, msg	; message to write
	MOV EBX, 1   	; where to write (1=stdout)
	MOV EAX, 4 	; system call number (4=sys_write)
	INT 0x80	; interrupt

	MOV EAX, 1	; system call number (1=sys_exit)
	INT 0x80	; interrupt

section .data
	msg db "Hello, World", 0xa
