# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 3)
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

	prompt:  .asciiz "Enter the next number:\n"
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
	la $a0, newline
	syscall

	li $v0, 5
	syscall
	move $t2, $v0


	blt $t0, $zero, make_positive_one
	j one
	make_positive_one:
	nor $t4, $t0, 0
	addi $t0, $t4, 1
	one:

	blt $t1, $zero, make_positive_two
	j two
	make_positive_two:
	nor $t4, $t1, 0
	addi $t1, $t4, 1
	two:

	blt $t2, $zero, make_positive_three
	j three
	make_positive_three:
	nor $t4, $t2, 0
	addi $t2, $t4, 1
	three:

	move $a0, $t0
	blt $a0, $t1, a
	j aa
	a:
	move $a0, $t1
	aa:

	blt $a0, $t2, b
	j bb
	b:
	move $a0, $t2
	bb:

	move $t5, $a0
	li $v0, 4
	la $a0, max
	syscall

	li $v0, 1
	move $a0, $t5
	syscall

	li $v0, 4
	la $a0, newline
	syscall


exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall

