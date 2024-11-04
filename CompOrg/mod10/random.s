# Program Name : random.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 10
# This program will: 
# allow the user to guess a random number generated by the computer
# user will first input a upper limit, then start guessing
# the program will inform the user if their guess is high or low
# The program will also keep track of and print the number of guesses

	
.text
.global main

main:

	# Save return to os on stack (from textbook)
 	SUB 	sp, sp, #4
 	STR	lr, [sp, #0]

	# -----------------------------------------------
	MOV r6, #0
	# Enter the menu loop	
menuloop:

	# Give user a menu
	LDR 	r0, =menuprompt
	BL 	printf

	# Scan user input
	LDR	r0, =upperlimit
	LDR 	r1, =limit
	BL	scanf
		
	# save user input in r9
	LDR	r1, =limit
	LDR 	r9, [r1, #0]

	# is the user input -1?
	MOV 	r0, #-1
	CMP 	r9, r0
	BEQ 	end
	
	# Generate random number using the upper limit
	# r0 - min random number
	# r1 - max random number

random:
	# seed ran num generator
	MOV r0, #1
	BL srand

	# generate random number
	BL rand
	
	# random number is in r0
	# scale random number to range
	# max value - r9
	# min value - r8
	MOV r8, #1
	
	SUB r9, r9, r8
	ADD r9, #1

	# r0 - number to be divided/ already in r0
	# r1 - divisor
	MOV r1, r9
	Bl __aeabi_idiv
	# result in r0
	# save in r8
	LDR r8, [r0, #0]
	
# once the random number is generated, we can start asking the user for an input and comparing
user_loop:

	# ask user to guess number
	LDR r0, =guessprompt
	BL printf

	# scan user guess
	LDR r0, =guess
	LDR r1, =usrguess
	BL scanf
	
	# save user input
	LDR r1, =usrguess
	LDR r7, [r1, #0]

	# increment counter
	ADD r6, #1

	# check 1 <= usrinput <= max
	MOV r1, #0
	MOV r0, #0
	CMP r7, r0
	MOVGE r0, #1

	MOV r2, #0
	MOV r0, r9
	CMP r7, r0
	MOVLE r2, #1

	AND r1, r1, r2
	MOV r2, #1
	CMP r1, r2
	BEQ validguess
	
	# guess is invalid
	LDR r0, =invalidguess
	BL printf
	B user_loop


validguess:	
	#compare user guess and random number
	CMP r7, r8
	BEQ correct_guess
	# will this work?
	BLT to_low
	BGT to_high
	#else
	B user_loop

correct_guess:
	# move counter to r1
	MOV r1, r6
	LDR r0, =correct
	BL printf
	B menuloop

to_low:	
	LDR r0, =low
	BL printf
	B user_loop

to_high:
	LDR r0, =high
	BL printf
	B user_loop

end:

	LDR 	lr, [sp, #0]
	ADD 	sp, sp, #4
	MOV 	pc, lr

# End main


	# -----------------------------------------------
 
.data 
	#prompts
	menuprompt: .asciz "Please enter an upper limit (-1 to exit): "
	guessprompt: .asciz "Please enter your guess: "
	invalidguess: .asciz "Your guess is invalid, please try again.\n"
	high: .asciz "Your guess is to high.\n"
	low: .asciz "Your guess is to low.\n"

	#input format
	upperlimit: 	.asciz "%d"
	guess: .asciz "%d"
	
	#output format 
	correct: .asciz "It took %d tries to guess the random number.\n"

	#space reservation
	limit: 	.word 0
	usrguess: .word 0







