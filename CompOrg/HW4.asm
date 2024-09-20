# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 4
# This program will 1. Ask a user for thier age -> output the age with tabs between the number before and after.
# Put quotes in a formated string. 

.data

msg:
  .ascii "What is your age?\n"
len = . - msg

.text

.global _start
_start:
  mov x0, #1
  ldr x1, =msg
  mov x2, #3
  mov w8, #64
  svc #0
  b .
