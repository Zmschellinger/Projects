# Program Name : library.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 9
# This program will: 
# Contain the functions for determining if a users input is an alphabet character:
# 1. logical
# 2. non logically 

.text
.global Logical_Check
.global Non_Logical_Check
.global findMax

# -------------------------------------------------------------------

# User input is saved in r9
# Output will be saved in r1
# logically determine if user input is an alphabetic character
# What does logically mean? Using logical operations such as AND, NOT, OR ETC
# This function will also print wither the input is an alphabetic character

Logical_Check:

  	# Save return to os on stack (from textbook)
  	SUB sp, sp, #4
  	STR lr, [sp, #0]

	# if ((r9>=0x41 && r9=<0x5a) || (r9>=0x61 && r9<= 0x7a))
	# User input is stored in r9
	# From class readings to determine if an input is a character 
	MOV r2, #0
	CMP r9, #0x41
	ADDGE r2, #1
	MOV r3, #0
	CMP r9, #0x5A
	ADDLE r3, #1
	AND r2, r2, r3
	MOV r0, #0
	CMP r9, #0x61
	ADDGE r3, #1
	MOV r3, #0
	CMP r9, #0x7A
	ADDLE r0, #1
	AND r3, r3, r0
	ORR r2, r2, r3 
	
	# if r2 is 1, then the user input is a letter
	CMP r2, #1
	B Valid 
	B Invalid
	
# -------------------------------------------------------------------

# User input is saved in r9
# Output will be saved in r1
Non_Logical_Check:

	# Save return to os on stack (from textbook)
  	SUB sp, sp, #4
  	STR lr, [sp, #0]

	# if ((r9>=0x41 && r9=<0x5a) || (r9>=0x61 && r9<= 0x7a))
	# subtract A from user input, if negative, check to see if lowercase
	SUB r2, r9, #0x41
	CMP r2, #0
	
	# If less than 0, the number is invalid 
	BLT Invalid
	
	# subtract Z from user input, if less then 0, number is capital
	# not less then 0, it might be lowercase
	SUB r2, r9, #0x5A
  	CMP r2, #0
	BLT Valid

	# subtract 'a' from the user input value
	# if less then 0, user input is invalid
	SUB r2, r1, #0x61
	CMP r2, #0
	BLT Invalid
	
	# subtract 'z' from user input value
	# if less then 0, user input is valid
	# if not, user input is invalid
	SUB r2, r1, #0x7A
	CMP r1, #0
	BLT Valid
	B Invalid


# -------------------------------------------------------------------

Valid:

	LDR r0, =f1format1
	BL printf

	# Return to OS
	LDR lr, [sp, #0]
 	ADD sp, sp, #4
 	MOV pc, lr

# -------------------------------------------------------------------

Invalid:
	
	LDR r0, =f1format2
	BL printf

	# Return to OS
	LDR lr, [sp, #0]
 	ADD sp, sp, #4
 	MOV pc, lr

# -------------------------------------------------------------------

# input 3 numbers stored in r4,r5,r6
# r4 = num 1, r5 = num 2, r6 = num 3
# outputs largest number in r1
# Finds largest of 3 numbers 
findMax:

	# Compare it to num 2
	CMP r4, r5
	BLE Else
	# num1 larger then num2
	# Compare it to num 3
	CMP r4, r6
	BLE num1_Greater
	# If num 3 is larger, move to r0 and return 
	MOV r1, r6
	B EndIf
	# if num 1 is greater
	num1_Greater:
	MOV r1, r4
	B EndIf
	# num 2 is larger
	Else:	
	# compare num 2 and num3
	CMP r5, r6
	BLE num2_greater
	MOV r1, r6
	B EndIf	
	num2_greater:
	MOV r1, r5

	EndIf:

	# Return to OS
	LDR lr, [sp, #0]
 	ADD sp, sp, #4
 	MOV pc, lr

# -------------------------------------------------------------------

.data

	# function 1 output formatting	
 	f1format1: .asciz "Your character is an alphabet character\n"	
	f1format2: .asciz "Your character is not an alphabet character\n" 







	
