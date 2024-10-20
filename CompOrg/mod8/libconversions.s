# Program Name : libConversions.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 8
# This program will have 4 functions
# 1) miles2kilometer(int miles), which converts miles to kilometers
# 2) kph(int hours, int miles), which uses miles2kilometer to help convert
# 3) CToF, Celsius to Fahrenheit
# 4) InchesToFt

.text
.global miles2kilometer
.global kph
.global cToF
.global inchesToFeet


# Miles2Kilometer --
# inputs int miles r0
# We multiply by 161 then divide by 100 since 1 mile is equivalent to approximately 1.61 kilometers. 
# To achieve greater accuracy, we could multiply by 1609344 and divide by 1000000 in order to get an extremely 
# precise answer. 
# Output in r0

miles2kilometer: 
	# Save return to os on stack (from textbook)
  	SUB sp, sp, #4
  	STR lr, [sp, #0]

	# multiply the input by 161
	MOV r1, #161
	MUL r0, r0, r1
	# divide the input by 100
	MOV r1, #100
	BL __aeabi_idiv

	# Return to OS
	LDR lr, [sp, #0]
 	ADD sp, sp, #4
 	MOV pc, lr

# kph --
# inputs int miles, r0, and int hours, r1. 
# output in r0

kph:
	# Save return to os on stack (from textbook)
  	SUB sp, sp, #4
  	STR lr, [sp, #0]

	# Prepare to use miles2kilometer function by moving r1 value (hours) to temp register
	MOV r2, r1
	# Convert miles to kilometer (result stored in r0)
	BL miles2kilometer

	# Move hours back to r1
	MOV r1, r2

	# Divide kilometers by hours
	BL __aeabi_idiv

	# Return to OS
	LDR lr, [sp, #0]
 	ADD sp, sp, #4
 	MOV pc, lr
# CToF --
# inputs Celsius in r0
# outputs Fahrenheit in r0

cToF:

	# Save return to os on stack (from textbook)
 	SUB sp, sp, #4
	STR lr, [sp, #0]
	#Convert C to F
	#Mulitply by 9
    	MOV r1, #9
  	MUL r0, r0, r1
  	
	#Divide by 5
  	MOV r1, #5
  	BL __aeabi_idiv
  	
	#add 32
  	MOV r1, #32
  	ADD r0, r0, r1
	# Return to OS
  	LDR lr, [sp, #0]
  	ADD sp, sp, #4
  	MOV pc, lr

# inchesToFeet --
# inputs inches in r0
# outputs feet in r0

inchesToFeet:

	# Save return to os on stack (from textbook)
	SUB sp, sp, #4
  	STR lr, [sp, #0]

	# Divide by 12 to convert inches to feet
	MOV r1, #12
	BL __aeabi_idiv

	# Return to OS
  	LDR lr, [sp, #0]
  	ADD sp, sp, #4
  	MOV pc, lr

.data
