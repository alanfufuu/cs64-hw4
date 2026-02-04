# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 3)
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

	prompt:  .asciiz "Enter number:\n"
    newline: .asciiz "\n"
	max:     .asciiz "Maximum: "

#Text Area (i.e. instructions/code directive)
.text

main:

	# TODO: Write your code here
    # You can have other labels expressed here, if you need to

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t2, $v0

	srl $t3, $t0, 31
	beq $t3, $zero, one
	nor $t0, $t0, zero
	addiu $t0, $t0, 1
	
one:
	srl $t3, $t1, 31
	beq $t3, $zero, two
	nor $t1, $t1, $zero
	addiu $t1, $t1, 1
two:
	srl $t3, $t2, 31
	beq $t3, $zero, three
	nor $t2, $t2, $zero
	addiu $t2, $t2, 1
three:


	move $t4, $t0
	slt $t5, $zero, four
	move $t4, $t1
four:
	slt $t5, $t4, $t2
	beq $t5, $zero, five
	move $t4, $t2

five:
	

	$li v0, 4
	la $a0, max
	syscall

	li $v0, 1
	move $a0, $t4
	syscall

	li $v0, 4
	la $a0, newline
	syscall


exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall

