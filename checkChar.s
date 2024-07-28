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
    LDR r0, =char1Format
    LDR r1, =char1
    BL scanf

    #move input value to r4
    LDR r4, =char1
    LDR r4, [r4]

    #if((r4>=0x41 && r4=<0x5a) || (r4>=0x61 && r4<=7a))
    MOV r2, #0
    CMP r4, #0x41
    ADDGE r2, #1		//if r4 >= 0x41, r2 = 1

    MOV r3, #0
    CMP r4, #0x5A
    ADDLE r3, #1		//if r4 <= 0x5A, r3 = 1

    AND r2, r2, r3		//if r2 and r3 are both 1, r2 = 1
  
    MOV r0, #0
    CMP r4, #0x61
    ADDGE r0, #1		//if r4 >= 0x61, r0 = 1

    MOV r3, #0
    CMP r4, #0x7A
    ADDLE r3, #1		//if r4 <= 0x7A, r3 = 1

    AND r3, r3, r0		//if r0 and r3 are both 1, r3 = 1
    
    ORR r2, r2, r3		//if either r2 or r3 are 1, r2 = 1

    MOV r1, #1			//r1 = 1
    CMP r2, r1			
    BNE Else			//if r2 != 1, branch to else (not a letter)
    
    	LDR r0, =output1
    	BL printf

    B EndIf

    Else:

        LDR r0, =output2
	BL printf

    EndIf:

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
    char1:         .space  32

    #output string if character is a letter
    output1:        .asciz  "\nYou entered a letter.\n"

    #output string if character is not a letter
    output2:        .asciz  "\nYou did not enter a letter.\n"

