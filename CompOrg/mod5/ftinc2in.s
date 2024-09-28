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

  #Ask user for their age
  LDR r0, =question
  BL printf

  # scanf
  LDR r0, =input
  LDR r1, =age
  BL scanf

  # print message
  LDR r0, =format
  LDR r1, =age
  LDR r1, [r1, #0]
  BL printf

  # Return to OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data

  #question for the user
  question; .asciz "Please enter your age: "

  #Format to read as an integer
  input: .asciz "%d"

  #Format of output
  #Should have a tab before and after each character
  format: .asciz "Your age is \"\t %d \t\". \n"

  #Reserves space in mem for age
  age: .word 0
