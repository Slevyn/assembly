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
	msg1 db "Hello, brave new world!", 0Ah
	msg2 db "This is how we recycle in NASM.", 0Ah
