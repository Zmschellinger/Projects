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
Logical_Check:

  # Save return to os on stack (from textbook)
  SUB sp, sp, #4
  STR lr, [sp, #0]

	# Move user input to r1
	MOV r1, r9
	# Compare input to Z, if higher check to see if lowercase
	CMP r1, #90
	BHI Logical_lowercase

	# Compare input to A, if lower send to invalid
	CMP r1, #65
	BCC Invalid
	B Valid
	# Return to OS
	LDR lr, [sp, #0]
 	ADD sp, sp, #4
 	MOV pc, lr

Logical_lowercase:
	CMP r1, #122
	BHI Invalid
	CMP r1, #97
	BCC Invalid
	B Valid

# -------------------------------------------------------------------

# User input is saved in r9
# Output will be saved in r1
Non_Logical_Check:

	# Save return to os on stack (from textbook)
  	SUB sp, sp, #4
  	STR lr, [sp, #0]
	# Move user input to r1
	MOV r1, r9
	# subtract Z from user input, if negative, check to see if lowercase
	SUB r2, r1, #90
	CMP r2, #0
	# If greater than 0, the number might be a lowercase letter
	BGT Non_Logical_Lowercase
	# If not greater then 0, the number might be captial
	# Subtract A from user input, if negative, input is invalid
	SUB r2, r1, #65
	CMP r2, #0
	BLT Invalid
	# if not invalid, then it must be valid
	B Valid

	# Return to OS
	LDR lr, [sp, #0]
 	ADD sp, sp, #4
 	MOV pc, lr


Non_Logical_Lowercase:
	# subtract 97 or 'a' from the user input value
	SUB r2, r1, #97
	CMP r2, #0
	BLT Invalid
	SUB r2, r1, #122
	CMP r2, #0
	BGT Invalid
	B Valid


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







	
