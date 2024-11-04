# Program Name : logicalcheck.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 9
# This program will: 
# Logically determine if user input is an alphabetic character 

.text
.global main

main:

	# Save return to os on stack (from textbook)
 	SUB sp, sp, #4
 	STR lr, [sp, #0]

	# -----------------------------------------------
	# Function 1 - user input checker, logical
	# inputs 1 char from user  
	# output in r0

	# Ask user for input
	LDR r0, =prompt
	BL printf
	
	# Read user input
	LDR r0, =input
	LDR r1, =usrInput
	BL scanf
	
	# Save input
	LDR r1, =usrInput
	LDR r9, [r1, #0]
	
	# if ((r9>=0x41 && r9=<0x5a) || (r9>=0x61 && r9<= 0x7a))
	# User input is stored in r9
	
	# From class readings to determine if an input is a character 
	MOV r2, #0
	MOV r1, r9
	# Compare user input to 'A'
	CMP r1, #0x41
	
	# add 1 to r2 if user input is greater than or equal to 'A'
	ADDGE r2, #1
	
	MOV r3, #0
	# compare user input to 'z'
	CMP r1, #0x7A
	
	# add 1 to r3 if user input is less than or equal to 'z'
	ADDLE r3, #1
	# and r2 and r3, if not in range, r2 will be 0
	AND r2, r2, r3	

	MOV r0, #0
	# compare user input to 'a'
	CMP r1, #0x61
	# add 1 to r3 if greater than or equal
	ADDGE r3, #1
	
	MOV r3, #0
	# compare user input to 'z'
	CMP r1 #0x7A
	# add 1 to r0 if less than or equal 
	ADDLE r0, #1
	# and r3 and r0, if not in range r3 will be 0
	AND r3, r3, r0
	# if 
	ORR r2, r2, r3 
	
	MOV r4, #0
	CMP r2, r4
	BEQ invalid
		# code block for valid character
		LDR r0, =valid
		BL printf
		B endif

	invalid:
		# code block for invalid
		LDR r0, =invalid
		BL printf

	endif:

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data

	prompt: .asciz "Please enter an alphabet character: "
	valid:	.asciz "Your character is valid.\n"
	invalid: .aciz "Your character is invalid.\n"

	input: .asciz "%d"

	usrInput: .word 0
	
