# Program Name : fib.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 9
# This program will:
# calculate a Fibonacci number recursively using a user input

	
.text
.global main

main:

        # Save return to os on stack (from textbook)
        SUB sp, sp, #4
        STR lr, [sp, #0]

	# -----------------------------------------------

	# print prompt
	LDR r0, =prompt
	BL printf

	# Read user input
	LDR r0, =input
	LDR r1, =in1
	BL scanf

	# save input
	LDR r1, =in1
	LDR r9, [r1, #0]
	
	# user input is 0
	MOV r7, #0
	CMP r9, r7
	BEQ print
	
	# initiate variables
	MOV r8, #1
	MOV r7, #1
	MOV r6, #1
	MOV r5, #0
	
	# user input is 1
	CMP r9, r7
	BEQ print

# r9 - user input
# r8 - loop counter
# r7 - fib number
# r6 - prev fib number
# r5 - prev prev fib number	

fib:
	CMP r8, r9
	BEQ print
	
	# loop counter not equal
	ADD r7, r6, r5
	
	# INC counter
	ADD r8, #1

	# update variables
	MOV r5, r6
	MOV r6, r7

	B fib

print:
	LDR r0, =output
	MOV r1, r7
	BL printf

end: 
	LDR lr, [sp, #0]
        ADD sp, sp, #4
        MOV pc, lr
	
	
	# -----------------------------------------------
.data 
	
	prompt: .asciz "Please enter a number used to find its corresponding Fibonacci number: "

	input: .asciz "%d"

	output: .asciz "The corresponding Fibonacci number is %d.\n"

	in1: .word 0
