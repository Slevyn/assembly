%include 'functions.asm'

section .data
	msg1 db "Hello, World", 0xa, 0x00
	msg2 db "Goodbye", 0xa, 0x00

section .text
global _start

_start:
	MOV EAX, msg1
	CALL sprint

	MOV EAX, msg2
	CALL sprint

	CALL quit
