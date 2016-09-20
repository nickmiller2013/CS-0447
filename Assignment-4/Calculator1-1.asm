#Nick Miller
#CS 0447
#Assignment 1
#February 8, 2015



#Operator 1 is stored in $t2, operator 2 is stored in $t4,the operation is stored in $t3
#when #s6 is stored it will make things negative
#$t0, and $t1 are both temporary holders of the operators and the operation
#$t5 is a temporary holder for the result

state0:	addi $t8, $zero, 0
	add $t9, $zero, $zero
	j wait
	
wait:	beq $t9, $zero, wait
	addi $s0, $zero, 0
        add $t0, $t9, $zero
	sll $t0, $t0, 1
	srl $t0, $t0, 1
comebk:	beq $t0, 10, addition
	beq $t0, 11, subtraction
	beq $t0, 12, multiplication
	beq $t0, 13, division
	beq $t0, 14, equals
	beq $t0, 15, clear
	addi $s1, $t1, 0 
	j display
	
negative:addi $s6, $zero, 1
	addi $t0, $zero, 0
	addi $t9, $zero, 0
	j wait
	
display:bne $s0, 9, loop
	addi $s1, $t1, 0 
	add $t1, $t1, $t0 
	add $t8, $t1, $zero
	beq $s6, 1, mkneg2
	add $t9, $zero, $zero
	j oper1
	
mkneg2:
	add $t9, $zero, $zero
	bne $t3, $zero, oper2
	sub $t8, $zero, $t8

	j oper1
	
	
loop:	add $t1, $t1, $s1
	addi $s0, $s0, 1
	beq $t0, 10, addition
	beq $t0, 11, subtraction
	beq $t0, 12, multiplication
	beq $t0, 13, division
	beq $t0, 14, equals
	beq $t0, 15, clear
	j display
	
	
oper1:	bne $t3, $zero, oper2
	addi $t2, $t8, 0
#	beq $s6, 1, mkneg
	j wait
	
oper2:	addi $t4, $t8, 0
	j wait
	
#mkneg:	sub $t7, $zero, $t2
#	addi $t2, $t7, 0
	#addi $s6, $zero, 0
#	j wait


addition:addi $t3, $t0, 0
	#addi $t8, $zero, 0
	addi $t0, $zero, 0
	addi $t1, $zero, 0
	addi $t9, $zero, 0
	addi $t8, $zero, 0
	
	j wait

subtraction:beq $t2, 0, negative
	addi $t3, $t0, 0
	#addi $t8, $zero, 0
	addi $t0, $zero, 0
	addi $t1, $zero, 0
	addi $t9, $zero, 0
	addi $t8, $zero, 0
	j wait

multiplication:addi $t3, $t0, 0
	#addi $t8, $zero, 0
	addi $t0, $zero, 0
	addi $t1, $zero, 0
	addi $t9, $zero, 0
	addi $t8, $zero, 0
	j wait

division: addi $t3, $t0, 0
	#addi $t8, $zero, 0
	addi $t0, $zero, 0
	addi $t1, $zero, 0
	addi $t9, $zero, 0
	addi $t8, $zero, 0
	j wait

equals: beq $t3, 10, adder
	beq $t3, 11, subber
	beq $t3, 12, multer
	beq $t3, 13, diver

adder:	add $t5, $t4, $t2
	add $t8, $t5, $zero
	addi $t0, $zero, 0
	j clear1
	
subber: sub $t5, $t2, $t4
	add $t8, $t5, $zero
	addi $t0, $zero, 0
	j clear1


multer:	bne $t4, $t6, multst
	add $t8, $t5, $zero
	addi $t0, $zero, 0
	addi $t4, $zero, 0
	j clear1
	
multst:	add $t5, $t2, $t5
	addi $t6, $t6, 1
	j multer

diver:	slt $s5, $t2, $zero
	beq $s5, 1, diverneg

stdiver:slt $s3,$t2, $t4
	beq $s3, $zero, divest  
	beq $s4, 1, reneg 
	
enddiv:	add $t8, $t5, $zero
	addi $t0, $zero, 0
	addi $t4, $zero, 0
	j clear1
	
diverneg:sub $t2, $zero, $t2
	addi $s4, $zero, 1
	j stdiver
	
reneg:	sub $t5, $zero, $t5
	j enddiv
	

divest:
	sub $t2, $t2, $t4
	addi $t5, $t5, 1
	j diver
	
clear:	addi $t3, $zero, 0
	addi $t0, $zero, 0 
	addi $t1, $zero, 0
	addi $t2, $zero, 0
	addi $t4, $zero, 0
	addi $t5, $zero, 0
	addi $s0, $zero, 0
	addi $s1, $zero, 0
	addi $s2, $zero, 0 
	addi $s3, $zero, 0
	addi $t9, $zero, 0
	addi $t8, $zero, 0
	addi $t6, $zero, 0
	addi $s4, $zero, 0
	addi $s5, $zero, 0
	j state0

clear1: addi $t3, $t0, 0
	addi $t0, $zero, 0 
	addi $t1, $zero, 0
	addi $t2, $zero, 0
	addi $t4, $zero, 0
	addi $t5, $zero, 0
	addi $t6, $zero, 0
	addi $s0, $zero, 0
	addi $s1, $zero, 0
	addi $s2, $zero, 0 
	addi $s3, $zero, 0
	addi $s4, $zero, 0
	addi $s6, $zero, 0
	addi $t9, $zero, 0
	j wait2
	
wait2:	beq $t9, $zero, wait2
	addi $s0, $zero, 0
	addi $t2, $t8, 0
        add $t0, $t9, $zero
	sll $t0, $t0, 1
	srl $t0, $t0, 1
	beq $t0, 10, addition
	beq $t0, 11, subtraction
	beq $t0, 12, multiplication
	beq $t0, 13, division
	beq $t0, 14, equals
	beq $t0, 15, clear
	addi $s1, $t1, 0 
	j display
