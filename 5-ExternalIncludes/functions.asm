;--------------------------------
; int slen(String message)
; String length calculation function
slen:
	PUSH EBX
	MOV EBX, EAX

nextchar:
	CMP byte[EAX], 0
	JZ finished
	INC EAX
	JMP nextchar

finished:
	SUB EAX, EBX
	POP EBX
	RET

;-------------------------------
; void sprint(String message)
; String printing function
sprint:
	PUSH EDX 	; store on stack
	PUSH ECX	; store on stack
	PUSH EBX	; store on stack
	PUSH EAX	; store on stack

	MOV EDX, EAX	; move the string length to EDX (evidently this function requires EAX to be used for both arguments)
	POP EAX		; POP the string from the stack

	MOV ECX, EAX	; move the string to ECX
	MOV EBX, 1	; output -- console
	MOV EAX, 4	; kernel op code - sys_write
	INT 0x80	; interrupt

	POP EBX		; restore from stack
	POP ECX		; restore from stack
	POP EDX		; restore from stack
	RET

;------------------------
; void exit()
; Exit program and restore resources
quit:
	MOV EBX, 0
	MOV EAX, 1
	INT 0x80
	RET
