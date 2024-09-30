# Program Name : cel2FarMod5.asm  
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 5
# This program converts Celsius temperture to Fahrenheit.
# Takes the input celsius and uses the formual C = (F- 32) * (5/9) or C = ((F * 9)/5)+32
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
  MOV r9, r1

  #Convert C to F
  #Mulitply by 9
  LDR r0, =num
  LDR r0, [r0, #0]
  MOV r1, #9
  MUL r0, r0, r1
  #Divide by 5
  MOV r1, #5
  BL __aeabi_idiv
  #add 32
  MOV r1, #32
  FADD r0, r0, r1 

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
  question: .asciz "Please enter your tempeture in Celcius: "
  #Format to read as a floating point integer
  input: .asciz "%f"
  #Format of output
  format: .asciz "Your tempeture in Fahrenheit is %f \n"
  #Reserves space in mem for temp
  num: .word 0
