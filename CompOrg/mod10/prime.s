# Program Name : prime.s
# Creator : Zachary Schellinger
# EN.605.204.81.FA24
# Homework for module 10
# This program will:
# Prompt user for a number and determine if it is prime
# If user enter -1, end program
# user cannot input 0,1,2 or any other negative number

.text
.global main

main:

        # Save return to os on stack (from textbook)
        SUB     sp, sp, #4
        STR     lr, [sp, #0]

        # -----------------------------------------------

# Enter the menu loop
menuloop:

        # Give user a menu
        LDR     r0, =menuprompt
        BL      printf

        # Scan user input
        LDR     r0, =input1
        LDR     r1, =usrinput
        BL      scanf

        # save user input in r9
        LDR     r1, =usrinput
        LDR     r9, [r1, #0]

        # is the user input -1?
        MOV     r0, #-1
        CMP     r9, r0
        BEQ     end

        # check if user input is 0,1 or negative
        MOV     r0, #1
        CMP     r9, r0
        BLE     invalid

        # check if user input is 2
        MOV     r2, #2
        CMP     r9, r2
        # if user input is 2, go to isprime
        BEQ     isprime


# Divide users input starting with 2, then increment the divisor until it = n/2
loop:

        # check if number is prime
        # do this by checking if remainder from division is 0
        # User input is stored in r9
        # counter stored in r2
        # remainder stored in r1

        # call remainder function
        B remainder

inner_loop:
        # if remainder does not = 0, increment counter
        # Check if counter is 0
        CMP r7, #0
        BEQ notprime

        # if not 0, then increment the divisor and repeat
        ADD r2, r2, #1

        # Compare counter to user input, if equal, number is prime, if not continue
        CMP r2, r9
        BEQ isprime

        # repeat
        B loop

# divide the user input and store remainder in r1
# r7 - user input place holder
# r8 - divisor
# r6 - divide counter
# divisor is equal to the counter
remainder:
        # copies user input to r7
        MOV r8, r2
        MOV r7, r9

rem_loop:
        SUB r7, r7, r8
        CMP r7, r8
        BPL rem_loop
        B inner_loop

notprime:
        MOV r1, r9
        LDR r0, =not_primeformat
        BL printf
        B menuloop

isprime:
        MOV r1, r9
        LDR     r0, =isprimeformat
        BL      printf
        B       menuloop

invalid:
        MOV r1, r9
        LDR     r0, =invalidprompt
        BL      printf
        B       menuloop

end:

        LDR     lr, [sp, #0]
        ADD     sp, sp, #4
        MOV     pc, lr

# End main


.data

        # -----------------------------------------------
        menuprompt:     .asciz "To exit, enter -1\nPlease enter a number to check: "

        input1:         .asciz "%d"

        isprimeformat:  .asciz "The number %d is prime\n"
        not_primeformat:        .asciz "The number %d is not prime\n"
        invalidprompt:  .asciz "Your input is invalid, please enter another.\n"

        usrinput:       .word 0
