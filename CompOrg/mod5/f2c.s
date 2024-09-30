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
  LDR r1, =num
  MOV r2, #32
  FSUB r1, r1, r2  
  #multiply by 5
  MOV r2, #5
  MUL r1, r2, r1
  #divide by 9
  MV r2, 9
  SDIV r1, r2, r1

  # print message
  LDR r0, =format
  LDR r1, [r1, #0]
  BL printf

  # Return to OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr
  
.data
  #question for the user
  question: .asciz "Please enter your tempeture in fahrenheit: "
  #Format to read as a floating point integer
  input: .asciz "%f"
  #Format of output
  format: .asciz "Your tempeture in Fahrenheit is %f \n"
  #Reserves space in mem for temp
  num: .word 0
