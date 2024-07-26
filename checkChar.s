#Program Name: checkChar.s
#Author: David Blossom
#Date: 28 July 2024
#Purpose: Check if a character is a letter or not
#Input: char1 - character
#Output: output1 - if character is a letter; output2 - if character is not a letter

.text
.global main
main:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #prompt user for first value
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =value1Format
    LDR r1, =value1
    BL scanf

    #move input value to r4
    LDR r4, =value1
    LDR r4, [r4]

    #prompt user for inches input
    LDR r0, =prompt2
    BL printf

    #read user input
    LDR r0, =value2Format
    LDR r1, =value2
    BL scanf

    #move input to r5
    LDR r5, =value2
    LDR r5, [r5]

    #swap values in r4 and r5
    EOR r4, r4, r5
    EOR r5, r4, r5
    EOR r4, r4, r5

    #print swapped values
    MOV r1, r4
    MOV r2, r5
    LDR r0, =output1
    BL printf

    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #prompt user for input
    prompt1:        .asciz  "Enter a character: \n"
    
    #prompt user for inches input
    value1Format:   .asciz  "%c"
   
    #variable to hold feet value, initialized to 0
    value1:         .asciz   0

    #output string if character is a letter
    output1:        .asciz  "You entered a letter.\n"

    #output string if character is not a letter
    output2:        .asciz  "You did not enter a letter.\n"

