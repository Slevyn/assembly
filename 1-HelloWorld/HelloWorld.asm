section .text
global _start

_start:
	MOV EDX, 13	; size of the message
	MOV ECX, msg	; message to write
	MOV EBX, 1   	; where to write (1=stdout)
	MOV EAX, 4   	; system call number (4=sys_write)
	INT 0x80	; interrupt

	MOV EAX, 1	; system call number (1=sys_exit)
	INT 0x80	; interrupt

section .data
	msg db "Hello, World", 0xa
