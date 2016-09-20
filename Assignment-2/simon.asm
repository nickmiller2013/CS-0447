.data 
	Array1:		.space 	100	#100 element Integer Array

.text
	addi $t8, $zero, 15
postStart:
	addi $t9, $zero, 0
	la $a2, Array1
	la $s0, ($a2)
	addi $s1, $zero, 1
preStart:
	bne $t9, 16, preStart
	addi $t8, $zero, 16


rand:
	addi $v0, $zero, 30
	syscall 
	addi $v0, $zero, 40
	syscall
	addi $v0, $zero, 42 
	add $a0, $zero, $zero 
	addi $a1, $zero, 4
	syscall
	add $t1, $zero, $a0
	#addi $t1, $t1, -1
	addi $a0, $t1, 0
	jal _numberCheck

	j store
	
store:	sllv  $t2, $s1, $t1
	#addi $t8, $t2, 0
#wait3:	bne $t8, 0, wait3
	sb $t2, 0($a2)
	addi $s2, $s2, 1
	addi $a2, $a2, 1
	addi $t4, $t4, 1
	move $a0, $a2
	#jal _playSequence
	addi $a1, $t4, 0
	jal _playSequence
	move $a0, $v0
	jal _userPlay
	beq $v0, 1, rand
	beq $v0, 2, exit
	j exit
	
_playSequence:
	la $t5, ($a0)
	sub $t5, $t5, $a1
loop:	lb $t6, 0($t5)
	beq $t6, 0, exit1
	addi $t8, $t6, 0
wait2:	bne $t8, 0, wait2
	addi $t5, $t5, 1
	j loop
exit1:	move $v0, $a2
	jr $ra
	
	#Ends _playSequence

_userPlay:
	la $t5, ($a0)
	sub $t5, $t5, $a1
loop1:	lb $t6, 0($t5)
	beq $t6, 0, goRand
	addi $t9, $zero, 0
stay:	beq $t9, 0, stay
	addi $t8, $t9, 0
wait1:	bne $t8, 0, wait1
	bne $t6, $t9, goExit
	addi $t5, $t5, 1
	j loop1
	
goRand:	addi $v0, $zero, 1
	jr $ra
	
goExit:	addi $v0, $zero, 2
	jr $ra
	
	#Ends _userPlay

_numberCheck:
	li $v0, 1
	syscall
	jr $ra

exit:	
	addi $t8, $zero, 15
exitLl:	sb $zero, ($s0)
	sub $t4, $t4, 1
	addi $s0, $s0, 1
	bne $t4, $zero, exitLl
	addi $t2, $zero, 0
	addi $v0, $zero, 0
	addi $a0, $zero, 0
	addi $a1, $zero, 0
	addi $a2, $zero, 0
	addi $a3, $zero, 0
	addi $t1, $zero, 0
	addi $t0, $zero, 0
	addi $t2, $zero, 0
	addi $t4, $zero, 0
	addi $t5, $zero, 0
	addi $t6, $zero, 0
	addi $s0, $zero, 0
	addi $s1, $zero, 0
	addi $s2, $zero, 0
	addi $s3, $zero, 0
	addi $t9, $zero, 0
	j postStart
