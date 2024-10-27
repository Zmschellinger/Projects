# Program Name : main.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24# Homework for module 9
# This program will: 
# 1. Check if a user input a alphabetic character or not in 2 ways:
# Way 1a: as a logical operation# Way 1b: as a function that does not use logical operations 
# 2. Implement a grading program # 3. A function that finds the largest of 3 values. 
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
 	LDR r0, =f1prompt1	
	BL printf		
 	
	# Read user input	
	LDR r0, =f1input1	
 	LDR r1, =usrInput		
	
 # Save input	
 	LDR r1, =usrInput	
	LDR r9, [r1, #0]		
 
	# logically determine if user input is an alphabetic character
	
 	# non-logically determine if user input is an alphabetic character		
 
	# If true, print prompt 1 	
	LDR r0, =f1format1	
	
 # If false, print prompt 2	
 	LDR r0, =f1format2		
 
	# -----------------------------------------------	
	# Function 2 - Implement a grading program	
 	# input 1 - student name, input 2 - student average	
	# Output - students name and grade	
 	# Determine if average is <0 or >100, if so print error	
	# Else, calculate a grade as 90-100 as A, 80-90 as B, 70-80 as C, else F
	# Ask user for input1 	
 	LDR r0, =f2prompt1	BL printf		
 	
	# Read user input 	
	LDR r0, =f2input1		LDR r1, =sName	BL scanf		
	
 	# Save input	
 	LDR r1, =sName	LDR r8, [r1, #0]		
 	
	# Ask user for input 2	
	LDR r0, =f2prompt2	BL printf
	
 	# Read user input	
 	LDR r0, =f2input2	LDR r1, =sAvg	BL scanf		
 	
	# Save input	
	LDR r1, =sAvg	LDR r7, [r1, #0]
	
 	# Determine if grade is valid
	
 	# Determine grade
	
 	# Save grade 		
 	
	# Print student name and grade 	
	
 	# -----------------------------------------------	
 	# Function 3 - find largest of 3 values 	
	# Prompts user for 3 values 	
 	# Use ABI standards for arguments and return values 	
	# Prints largest value		
 	# Ask user for input1 
	
 	# Read user input 
	
 	# Save input		
 	
	# Ask user for input 2		
	
 	# Read user input		
 	
	# Save input
	
 	# Ask user for input 3		
 	
	# Read user input
	
 	# Save input
	
 	# Determine largest value (compare 1&2, then compare to 3)?
	
 	# Print largest value
	
 	# -----------------------------------------------		
 	# Return to OS 	
	LDR lr, [sp, #0]  	
 	ADD sp, sp, #4  	
	MOV pc, lr
 
.data 		 
 	# -----------------------------------------------		
	# function 1 prompts	
 	f1prompt1: .asciz "Please enter an alphabet character: "		
	# function 1 input format	
 	f1input1: .asciz "%d"		
	# function 1 output formatting	
 	f1format1: .asciz "Your character is an alphabet character\n"	
	f1format2: .asciz "Your character is not an alphabet character\n" 		
 	# function 1 space reservation for variables	
	usrInput: .word 0		
	# -----------------------------------------------
	# Function 2 prompts	
 	f2prompt1: .asciz "Please enter a students name: "	
	f2prompt2: .asciz "Please enter a students grade average: "		
 	# Function 2 input format	
	f2input1: .asciz "%s"	f2input2: .asciz "%d"		
 	# function 2 output format	
	f2format: .asciz "%d has the grade average of %d"
	# function 2 space reservation for variables 	
 	sName: .word 0	sAvg: .word 0	
	# -----------------------------------------------
	# Function 3 prompts	
 	f3prompt1: .asciz "Please enter number 1: "	
	f3prompt2: .asciz "Please enter number 2: "	
 	f3prompt3: .asciz "Please enter number 3: "		
	# Function 3 input format	
 	f3input1: .asciz "%d"	
	f3input2: .asciz "%d"	
 	f3input3: .asciz "%d"
	# Function 3 output format	
 	f3format: .asciz "The largest number is %d"
	# Function 3 space reservation for variables 	
 	num1: .word 0	
	num2: .word 0	
 	num3: .word 0





