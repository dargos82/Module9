#Program Name: findMax.s
#Author: David Blossom
#Date: 28 July 2024
#Purpose: Find the maximum of 3 values
#Input: number1 - integer; number2 - integer; number3 - integer
#Output: outputError - if invalid entries; outputMax - outputs max value

.text
.global main
main:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #prompt user 
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =number1Format
    LDR r1, =number1
    BL scanf

    #move number to r6
    LDR r6, =number1
    LDR r6, [r6]

    #prompt user 
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =number2Format
    LDR r1, =number2
    BL scanf

    #move number to r7
    LDR r7, =number2
    LDR r7, [r7]

    #prompt user 
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =number3Format
    LDR r1, =number3
    BL scanf

    #move number to r8
    LDR r8, =number3
    LDR r8, [r8]

    BL findMaxOf3		//r0 has max number

    #check for error and print max value
    MOV r1, r0
    MOV r2, #-1
    CMP r1, r2
    BNE printMax

	LDR r0, =outputError
	BL printf
	B endIf

    printMax:
	MOV r1, r0
	LDR r0, =outputMax
	BL printf

    endIf:
	   
    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #prompt for input
    prompt1:	.asciz  "\nEnter a positive number: "
    
    #format for first input
    number1Format:	.asciz  "%d"
   
    #number variable
    number1:	.word	0

    #format for second input
    number2Format:	.asciz  "%d"
   
    #number variable
    number2:	.word	0

    #format for third input
    number3Format:	.asciz  "%d"
   
    #number variable
    number3:	.word	0

    #output string if invalid entries
    outputError:	.asciz  "\nThe max cannot be determined.\n"

    #output string with max value
    outputMax:	.asciz  "\nThe max value is %d.\n"

