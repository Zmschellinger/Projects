# Program Name : nonlogicalcheck.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 9
# This program will:
# Determine if user input is an alphabetic character other than logically

.text
.global main

main:

        # Save return to os on stack (from textbook)
        SUB sp, sp, #4
        STR lr, [sp, #0]

        # inputs 1 char from user

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

        # User input is stored in r9

        MOV r2, #0x41
        # compare user input to 'A'
        CMP r9, r2
        # if less then, user input is invalid
        BLT invalid

        MOV r2, #0x7B
        # compare user input to '[' (one more than 'Z')
        CMP r9, r2
        # if greater than or equal, user input is invalid
        BGE invalid

        # compare to 'a'
        MOV r2, #0x61
        CMP r9, r2
        BLT checklower

                # code block for valid character
                LDR r0, =valid
                BL printf
                B endif

        checklower:

        MOV r2, #0x5B
        CMP r9, r2
        BGE invalid
                # code block for valid character
                LDR r0, =valid
                BL printf
                B endif

        invalid:
                # code block for invalid
                LDR r0, =invalidprompt
                BL printf


        endif:

        LDR lr, [sp, #0]
        ADD sp, sp, #4
        MOV pc, lr


.data

        prompt: .asciz "Please enter an alphabet character: "
        valid:  .asciz "Your input is valid.\n"
        invalidprompt: .asciz "Your input is invalid.\n"

        input: .asciz "%s"

        usrInput: .word 0
