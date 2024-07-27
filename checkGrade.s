#Program Name: checkGrade.s
#Author: David Blossom
#Date: 28 July 2024
#Purpose: Check if a grade integer is valide and print letter grade
#Input: input1 - integer; name1 - string
#Output: outputError - if invalid entry; outputA - if grade is A; outputB - if grade is B; outputC - if grade is C;
#output F -if grade is F 

.text
.global main
main:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #prompt user for student's name
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =name1Format
    LDR r1, =name1
    BL scanf

    #move name to r8
    LDR r8, =name1
    //LDR r8, [r8]

    #prompt user for grade
    LDR r0, =prompt2
    BL printf

    #read user input
    LDR r0, =grade1Format
    LDR r1, =grade1
    BL scanf

    #move grade to r9
    LDR r9, =grade1
    LDR r9, [r9]

    #if-else if block
    	
	#if (0 <= r9 || r9 <= 100)
	MOV r0, #0
	MOV r1, #0
	CMP r9, r0
	ADDGE r1, #1		//if r9 >= 0, r1 = 1

	MOV r0, #100
	MOV r2, #0
	CMP r9, r0
	ADDLE r2, #1		//if r9 <= 100, r2 = 1

	AND r1, r1, r2		//if r1 and r2 are 1, valid grade and r1 = 1
	MOV r2, #1		//test value
	CMP r1, r2		//test if r1 = 1 (grade is valid)

	BEQ gradeA		//if valid, check if it is an A

	#else
	LDR r0, =outputError
	BL printf
	B EndIf 

	gradeA:
	    MOV r0, #90
	    CMP r9, r0
	    BLT gradeB

	    LDR r0, =outputA
	    LDR r1, =name1
	    BL printf
	    B EndIf

	gradeB:
	    MOV r0, #80
	    CMP r9, r0
	    BLT gradeC

	    LDR r0, =outputB
	    LDR r1, =name1
	    BL printf
	    B EndIf

	gradeC:
	    MOV r0, #70
	    CMP r9, r0
	    BLT gradeF

	    LDR r0, =outputC
	    LDR r1, =name1
	    BL printf
	    B EndIf

	gradeF:
	    LDR r0, =outputF
	    LDR r1, =name1
	    BL printf
	    B EndIf

    EndIf:
	   
    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #prompt for name input
    prompt1:	.asciz  "Enter the student's last name: \n"
    
    #format for name input
    name1Format:	.asciz  "%s"
   
    #name variable
    name1:	.space  40

    #prompt for grade input
    prompt2:	.asciz	"Enter grade as an integer: \n"

    #format for grade input
    grade1Format:	.asciz	"%d"

    #grade variable
    grade1:	.word	0

    #output string if invalid grade
    outputError:	.asciz  "\nPlease enter a grade between 0 and 100.\n"

    #output string if grade is A
    outputA:	.asciz  "\n%s has an A.\n"

    #output string if grade is B
    outputB:	.asciz	"\n%s has a B.\n"

    #output string if grade is C
    outputC:	.asciz	"\n%s has a C.\n"

    #output string if grade is F
    outputF:	.asciz	"\n%s has an F.\n"

