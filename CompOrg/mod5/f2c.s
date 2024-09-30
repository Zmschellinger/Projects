# Program Name : far2CelMod5.s  
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 5
# This program converts Fahrenheit tempurture to Celsius. 
.text
.global main
main: 
  #Save return to os on stack (from textbook)
  SUB sp, sp, #4
  STR lr, [sp, #0]

  #Prompt user for C temp
  LDR r0, =question
  BL printf

  # Read temp 
  LDR r0, =input
  LDR r1, =num
  BL scanf

  #Convert F to C
  #subtract 32
  LDR r0, =num
  LDR r0, [r0, #0]
  MOV r1, #32
  SUB r0, r0, r1  
  #multiply by 5
  MOV r1, #5
  MUL r0, r1, r0
  #divide by 9
  MV r1, 9
  BL __aeabi_idiv

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
  question: .asciz "Please enter your tempeture in fahrenheit: "
  #Format to read as a floating point integer
  input: .asciz "%d"
  #Format of output
  format: .asciz "Your tempeture in Fahrenheit is %d \n"
  #Reserves space in mem for temp
  num: .word 0
