# Program Name : main.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 8
# This program will: 
# Prompt for and read the values of miles and hours, and print out the kph value.
# Prompt for and read the values for Celsius, print out Fahrenheit conversion.
# prompt for and read the values for inches, print out feet conversion. 

.text
.global main

main:

	# Save return to os on stack (from textbook)
 	SUB sp, sp, #4
 	STR lr, [sp, #0]

	# -----------------------------------------------
	# Function 1 - testing KPH function
	# inputs int miles, r0, and int hours, r1. 
	# output in r0

	# Ask user for miles
	LDR r0, =f1prompt1
	BL printf
	# Read user input
	LDR r0, =f1input1
	LDR r1, =miles
	BL scanf
	MOV r9, r1

	# Ask user for hours
	LDR r0, =f1prompt2
	BL printf

	# Read user input
	LDR r0, =f1input2
	LDR r1, =hours
	BL scanf

	# Convert to KPH
	MOV r0, r9
	BL kph
	MOV r1, r0

	# Print output 
	LDR r0, =f1format
	BL printf

	# -----------------------------------------------
	# Function 2 - converting Celsius to Fahrenheit 
	# input int Celsius, r0
	# Output in r0

	# Ask user for Celsius
	LDR r0, =f2prompt1
	BL printf

	# Read user input
	LDR r0, =f2input1
	LDR r1, =Celsius
	BL scanf

	# Convert Celsius to Fahrenheit
	BL cToF
	MOV r1, r0

	# Print output
	LDR r0, =f2format
	BL printf
	# -----------------------------------------------

	# Function 3 - converting inches to feet
	# input int inches, r0
	# Output in r0

	# Ask user for inches 
	LDR r0, =f3prompt1
	BL printf
	# Read user input
	LDR r0, =f3input1
	LDR r1, =inches 
	BL scanf

	# Convert inches to feet
	BL inchesToFeet
	MOV r1, r0

	# Print output
	LDR r0, =f3format
	BL printf

	# -----------------------------------------------

	# Return to OS
 	LDR lr, [sp, #0]
  	ADD sp, sp, #4
  	MOV pc, lr

.data
	# -----------------------------------------------
	# function 1 prompts
	f1prompt1: .asciz "Please enter a number for miles: "
	f1prompt2: .asciz "Please enter a number for hours: "
	# function 1 input format
	f1input1: .asciz "%d"
	f1input2: .asciz "%d"
	# function 1 output formatting
	f1format: .asciz "The output in KPH is %d \n"
	# function 1 space reservation for variables
	miles: .word 0
	hours: .word 0

	# -----------------------------------------------

	# Function 2 prompts
	f2prompt1: .asciz "Please enter a number for Celsius: "

	# Function 2 input format
	f2input1: .asciz "%d"

	# function 2 output format
	f2format: .asciz "Your number converted to Fahrenheit is %d"

	# function 2 space reservation for variables 
	Celsius: .word 0
	# -----------------------------------------------

	# Function 3 prompts
	f3prompt1: .asciz "Please enter a number for inches: "
	# Function 3 input format
	f3input1: .asciz "%d"

	# Function 3 output format
	f3format: .asciz "Your number converted to feet is %d"

	# Function 3 space reservation for variables 
	inches: .word 0
