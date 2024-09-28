# Program Name : 2negMod5.asm  
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 5
# This program will take an integer number and write out the negative value of the number. 
.text
.global main

main: 
  #Save return to os on stack (from textbook)
  SUB sp, sp, #4
  STR lr, [sp, #0]

  #Ask user for the number they want to be negative
  LDR r0, =prompt
  BL printf

  # scanf
  LDR r0, =input
  LDR r1, =num
  BL scanf

  #convert to negative
  #ones complement using MVN
  MVN r1, r1
  #add 
  ADD r1, #1
  
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
  prompt: .asciz "Please enter the number you want to negate: "

  #Format to read as an integer
  input: .asciz "%d"

  #Format of output
  #Should have a tab before and after each character
  format: .asciz "The output is %d \n"

  #Reserves space in mem for age
  num: .word 0
