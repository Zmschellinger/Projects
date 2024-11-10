# Program Name : multi.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 11
# This program will:
# Prompt user for 2 inputs,
# input 1 is the multiplier
# input 2 is the number of addition iterations 
# This is done recursively



.text
.global main

main:

        # Save return to os on stack (from textbook)
        SUB     sp, sp, #4
        STR     lr, [sp, #0]

        # -----------------------------------------------

	# Ask user for multiplier
	LDR r0, =prompt1
	BL printf

	# read user input
	LDR r0, =input
	LDR r1, =in1
	BL scanf
	
	# Save input
	LDR r1, =in1
	LDR r9, [r1, #0]

	# Ask user for iteration count
	LDR r0, =prompt2
	BL printf

	# read user input
	LDR r0, =input
	LDR r1, =in2
	BL scanf
	
	# Save input
	LDR r1, =in2
	LDR r8, [r1, #0]

	#initiate counter
	MOV r7, #1 
	
	# does the iteration count = 1?
	# if so print r9
	CMP r8, r7
	BEQ eq1
	
	# else begin multiplication
	B multiply


# r6 - result
# r7 - counter
# r8 - user iteration input
# r9 - number being multiplied

multiply:

	# check counter 
	CMP r7, r8
	BEQ print

	# counter not equal to iteration count
	ADD r6, r6, r9
	
	# increment counter
	ADD r7, #1

	# repeat
	B multiply


print: 
	LDR r0, =output
	MOV r1, r6
	BL printf
	
	B end


eq1:
	# user iteration equals 1
	LDR r0, =output
	MOV r1, r9
	BL printf
	
end:

	# Return to the OS
        ldr lr, [sp, #0]
        add sp, sp, #4
        mov pc, lr

# End main

.data
 	# -----------------------------------------------

	prompt1: .asciz "Please enter the number you want multiplied: "
	prompt2: .asciz "Please enter the number you want to multiply by: "

	input: 	.asciz "%d"
	
	output:	.asciz "The output is %d.\n"

	in1:	.word 0
	in2:	.word 0

