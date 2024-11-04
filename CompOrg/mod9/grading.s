# Program Name : grading.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 9
# This program will: 
# 1. Check if a user input a alphabetic character or not in 2 ways:
# Way 1a: as a logical operation
# Way 1b: as a function that does not use logical operations 
# 2. Implement a grading program 
# 3. A function that finds the largest of 3 values. 

.text
.global main

main:

	# Save return to os on stack (from textbook)
 	SUB sp, sp, #4
 	STR lr, [sp, #0]

	# Ask user for input1 
	LDR r0, =prompt1
	BL printf
	
	# Read user input 
	LDR r0, =input1	
	LDR r1, =sName
	BL scanf
	
	# Save input
	LDR r1, =sName
	LDR r9, [r1, #0]
	
	# Ask user for input 2
	LDR r0, =prompt2
	BL printf

	# Read user input
	LDR r0, =f2input2
	LDR r1, =sAvg
	BL scanf
	
	# Save input
	LDR r1, =sAvg
	LDR r8, [r1, #0]

	# check if user input is between 0 and 100
	# user grade stored in r8
	#check 0 <= r4 <= 100
	MOV r1, #0
	MOV r0, #0
	# compare user input to 0
	# shout out to the textbook code for helping
	CMP r8, r0
	MOVGE r1, #1
	MOV r2, #0
	MOV r0, #100
	# compare user input to 100
	CMP r8, r0
	MOVLE r2, #1
	AND r1, r1, r2
	MOV r2, #1
	CMP r1, r2
	# if valid, start checking the grades
	BEQ grade_A

	# Code block for Invalid Grade
	LDR r0, =invalid
	BL printf
	B EndIf

	grade_A:
	MOV r0, #90
	CMP r8, r0
	BLT grade_B
	
	# Code block for grade of A
	LDR r0, =GradeA
	BL printf
	B EndIf
	
	grade_B:
	MOV r0, #80
	CMP r8, r0
	BLT grade_C

	# Code block for grade of B
	LDR r0, =GradeB
	BL printf
	B EndIf
	
	grade_C:
	MOV r0, #70
	CMP r8, r0
	BLT grade_D
	
	# Code block for grade of C
	LDR r0, =GradeC
	BL printf
	B EndIf
	
	grade_D:
	MOV r0, #60
	CMP r8, r0
	BLT Else
	
	# Code block for grade of D
	LDR r0, =GradeD
	BL printf
	B EndIf
	
	Else:
	# Code block for grade of F
	LDR r0, =GradeF
	BL printf
	B EndIf
	
	EndIf:

	# Return to the OS
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	
.data

	prompt1: .asciz "Please enter a students name: "
	prompt2: .asciz "Please enter a students grade average: "
	invalid: .asciz "Your grade is invalid.\n"
	input1: .asciz "%s"
	input2: .asciz "%d"
	

	gradeA: .asciz "%s has the grade average of A"
	gradeB: .asciz "%s has the grade average of B"
	gradeC: .asciz "%s has the grade average of C"
	gradeD: .asciz "%s has the grade average of D"
	gradeF: .asciz "%s has the grade average of F"


	# function 2 space reservation for variables 
	sName: .word 0
	sAvg: .word 0
	














	