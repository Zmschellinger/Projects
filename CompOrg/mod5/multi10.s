# Program Name : multi10Mod5.s 
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 5
# This program reads an input then conducts a left logical shift and add in order to multiply a number by 10
.global main

main: 
  #Save return to os on stack (from textbook)
  SUB sp, sp, #4
  STR lr, [sp, #0]

  #Ask user for their age
  LDR r0, =question
  BL printf

  # scanf
  LDR r0, =input
  LDR r1, =num
  BL scanf
  
  #mulitply by 10
  LDR r0, =num
  LDR r0, [r0, #0]
  BL multi

  # print message
  LDR r0, =format
  LDR r1, =num
  LDR r1, [r1, #0]
  BL printf

  # Return to OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data

  #question for the user
  question; .asciz "Please enter a number: "
  #Format to read as an integer
  input: .asciz "%d"
  #Format of output
  #Should have a tab before and after each character
  format: .asciz "Your number multiplied by 10 is %d"
  #Reserves space in mem for age
  num: .word 0

.txt
# multi function
# Left logical shift 3 times, then add the result of 1 left logical shift. 
# num stored in r0
multi:
  MOV r3, r0, LSL #3
  MOV r4, r0, LSL #1
  ADD r0, r3, r4
  
  
