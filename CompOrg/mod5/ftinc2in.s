# Program Name : cel2FarMod5.asm  
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 5
# This program converts ft and inch, to inch.
# Takes the 2 inputs, one for ft and one for inches, then outputs the sum in inches. 
.text
.global main

main: 
  #Save return to os on stack (from textbook)
  SUB sp, sp, #4
  STR lr, [sp, #0]

  #Ask user for ft and scan/store
  LDR r0, =prompt1
  BL printf
  
  LDR r0, =input
  LDR r1, =feet
  BL scanf
  MOV r9, r1

  #Ask user for inch and scan/store
  LDR r0, =prompt2
  BL printf
  
  LDR r0, =input
  LDR r1, =inch
  BL scanf
  MOV r10, r1

  # convert feet to inch
  LDR r0, =feet
  LDR r0, [r0, #0]
  ADD r4, r4, #12
  MUL r0, r0, r4
  # add converted feet to stored inches 
  LDR r1, =inch
  LDR r1, [r1, #0]
  ADD r0, r0, r1
  # print message
  MOV r1, r0
  LDR r0, =format
  BL printf

  # Return to OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data

  #question for the user
  prompt1: .asciz "Please enter the number of feet: "
  prompt2: .asciz "Please enter the number of inches: "
  
  #Format to read as an integer
  input1: .asciz "%d"
  input2: .asciz "%d"
  
  #Format of output
  #Should have a tab before and after each character
  format: .asciz "The total amount of inches is %d. \n"

  #Reserves space in mem for feet and inch 
  feet : .word 0
  inch : .word 0
