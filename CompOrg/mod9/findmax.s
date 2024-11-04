# Program Name : findmax.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 9
# This program will: 
# Determine if user input is an alphabetic character other than logically

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
	LDR r1, =num1
	BL scanf

	# Save input
	LDR r1, =num1
	LDR r9, [r1, #0]

	# Ask user for input 2
	LDR r0, =prompt2
	BL printf

	# Read user input
	LDR r0, =input2
	LDR r1, =num2
	BL scanf

	# Save input
	LDR r1, =num2
	LDR r8, [r1, #0]

	# Ask user for input 3
	LDR r0, =prompt3
	BL printf

	# Read user input
	LDR r0, =input3
	LDR r1, =num3
	BL scanf

	# Save input
	LDR r1, =num3
	LDR r7, [r1, #0]

	# Determine largest value (compare 1&2, then compare to 3)?
	B findMaxOf3

# int 1 - r8
# int 2 - r7
# int 3 - r6
# output in r1
findMaxOf3:

	# if (int1 > int2) && (int1 > int3)
	# compare int1 and int 2
	CMP r8, r7
	BLE int2check
	# code if int1 is larger then int2
	# check if int1 is larger then int3
	CMP r8, r6
	BLE int3check
	# if int1 is the largest, load and print
	LDR r0, =format
	MOV r1, r8
	BL printf
	B endif

	# elif (int2 > int1) && (int2 > int3)
	int2check:
	# since we know int2 is larger or equal to int1, we can check if it is bigger then int3
	CMP r7, r6
	BLE int3check
	# code if int2 is larger then int3
	LDR r0, =format 
	MOV r1, r7
	BL printf
	B endif
	
	# elif (int3 > int1) && (int3 > int2)
	int3check:
	# since we know int3 larger then int1 and int2, we can go straight to printing
	LDR r0, =format
	MOV r1, r6
	BL printf
	B endif

	endif:

	# Return to the OS
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr


.data

	prompt1: .asciz "Please enter number 1: "
	prompt2: .asciz "Please enter number 2: "
	prompt3: .asciz "Please enter number 3: "
	
	input1: .asciz "%d"
	input2: .asciz "%d"
	input3: .asciz "%d"

	format: .asciz "The largest number is %d"

	num1: .word 0
	num2: .word 0
	num3: .word 0
	
























