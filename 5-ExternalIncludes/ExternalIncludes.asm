%include 'functions.asm'

section .text
global _start

_start:
	MOV EAX, msg1
	CALL sprint
	
	MOV EAX, msg2
	CALL sprint

	CALL quit

section .data
	msg1 db "Hello, World", 0xa
	msg2 db "Goodbye", 0xa
