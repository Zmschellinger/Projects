# Program Name : cel2FarMod5.asm  
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 5
# This program converts Celsius temperture to Fahrenheit.
# Takes the input celsius and uses the formual C = (F- 32) * (5/9) or C = (F - 32) * 1.8
.text

#function to convert celsius to fahrenheit
cels2fahr:
  SUB sp, sp, #4
  STR lr, [sp, #0]

  #multiply by 9
  MOV r3, #9
  MUL r0, r1, r3
  #divide by 5
  MOV r1, #5
  UDIV r0, r1, r3
  #add 32



.global main

main: 
  #Save return to os on stack (from textbook)
  SUB sp, sp, #4
  STR lr, [sp, #0]

  #Ask user for the temp they want converted
  LDR r0, =question
  BL printf

  # Read celcius 
  LDR r0, =input
  LDR r1, =temp
  BL scanf

  #convert to farh, return in r1
  
  BL cels2fahr

  
  # print message
  LDR r0, =format
  LDR r1, =temp
  LDR r1, [r1, #0]
  BL printf

  # Return to OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data

  #question for the user
  question; .asciz "Please enter your tempeture in Celcius: "

  #Format to read as a floating point integer
  input: .asciz "%d"

  #Format of output
  #Should have a tab before and after each character
  format: .asciz "Your tempeture in Fahrenheit is %d \n"

  #Reserves space in mem for temp
  temp: .word 0
