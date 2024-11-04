# Program Name : logicalcheck.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 9
# This program will:
# Logically determine if user input is an alphabetic character

.text
.global main

main:

        # Save return to os on stack (from textbook)
        SUB sp, sp, #4
        STR lr, [sp, #0]

        # -----------------------------------------------
        # Function 1 - user input checker, logical
        # inputs 1 char from user
        # output in r0

        # Ask user for input
        LDR r0, =prompt
        BL printf

        # Read user input
        LDR r0, =input
        LDR r1, =usrInput
        BL scanf

        # Save input
        LDR r1, =usrInput
        LDR r9, [r1, #0]

        # if ((r4>=0x41 && r4=<0x5a) || (r4>=0x61 && r4<= 0x7a))

        # r1 = upper place holder
        # r2 = lower place holder
        # r4= user input
        # to be valid:
        # if ((r4>=0x41 && r4=<0x51) || (r4>=0x61 && r4<=0x7a))

        # (r4>=0x41)
        MOV r4, r9
        MOV r1, #0
        MOV r0, #65

        CMP r4, r0
        ADDGE r1, #1

        # (r4=<0x51)
        MOV r0, #90
        MOV r2, #0

        CMP r4, r0
        ADDLE r2, #1

        # if upper case, r1 will = 1
        AND r1, r1, r2

        # (r4>=0x61)
        MOV r2, #0
        MOV r0, #97

        CMP r4, r0
        ADDGE r2, #1

        # (r4<=0x7a)
        MOV r0, #122
        MOV r3, #0

        CMP r4, r0
        ADDLE r3, #1

        # if lower case, r2 will = 1
        AND r2, r2, r3


        # if character is valid, r1 will = 1
        ORR r1, r1, r2

        MOV r2, #1
        CMP r1, r2
        BEQ valid

        # if character is invalid
        LDR r0, =invalidprompt
        BL printf
        B endif

valid:
        # code block for valid character
        LDR r0, =validprompt
        BL printf

endif:

        LDR lr, [sp, #0]
        ADD sp, sp, #4
        MOV pc, lr

.data

        prompt: .asciz "Please enter an alphabet character: "
        validprompt:    .asciz "Your character is valid.\n"
        invalidprompt: .asciz "Your character is invalid.\n"

        input: .asciz "%s"
        testformat: .asciz "%d\n"

        usrInput: .word 0
