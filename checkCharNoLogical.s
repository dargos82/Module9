#Program Name: checkCharNoLogical.s
#Author: David Blossom
#Date: 28 July 2024
#Purpose: Check if a character is a letter or not without using logical operators
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
    LDR r0, =char1Format
    LDR r1, =char1
    BL scanf

    #move input value to r4
    LDR r4, =char1
    LDR r4, [r4]

    #if (r4<0x41); it is not a letter
    CMP r4, #0x41
    BLT notALetter

    #if (r4<=0x5A); it is a letter
    CMP r4, #0x5A
    BLE isALetter

    #if (r4<0x61); it is not a letter
    CMP r4, #0x61
    BLT notALetter

    #if (r4<=0x7A); it is a letter
    CMP r4, #0x7A
    BLE isALetter

    isALetter:

	LDR r0, =output1
	BL printf
	B End

    notALetter:

        LDR r0, =output2
	BL printf
	B End

    End:

    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #prompt user for input
    prompt1:        .asciz  "Enter a character: \n"
    
    #format for character input
    char1Format:   .asciz  "%c"
   
    #character value
    char1:         .asciz

    #output string if character is a letter
    output1:        .asciz  "\nYou entered a letter.\n"

    #output string if character is not a letter
    output2:        .asciz  "You did not enter a letter.\n"

