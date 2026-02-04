# fibonacci.asm program
# CMPSC 64, (c) 2025, Z.Matni
#
#    unsigned int n, f1 = 1, f2 = 1, i = 2, nextfib;
#    cout << "Enter a number:\n";
#    cin >> n;
#    if (n > 1) {
#        cout << "The first " << n << " numbers in the Fibonacci series are:\n";
#        cout << f1 << " " << f2;
#        while (i < n) {
#            nextfib = f1 + f2;
#            f1 = f2;
#            f2 = nextfib;
#            cout << " " << nextfib;
#            i++;
#        }
#    }
#   cout << endl;

.data
	prompt:     .asciiz "Enter a number:\n"
    first:      .asciiz "The first "
    numbers:    .asciiz " numbers in the Fibonacci series are:\n"
	spacech:    .asciiz " "
    newline:    .asciiz "\n"
	
.text
main:
# TODO: Follow the comments below, and the assignment description, 
#       as guides for how to write this assembly program.


# Print the prompt and get user input
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0 #n

    li $t1, 1 #f1
    li $t2, 1 #f2
    li $t4, 2 #index

    ble $t0, $t1, end_loop

    li $v0, 4
    la $a0, first
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, numbers
    syscall

    move $a0, $t1
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, spacech
    syscall

    move $a0, $t2
    li $v0, 1
    syscall


loop:
    bge $t4, $t0, end_loop

    add $t3, $t1, $t2
    move $t1, $t2
    move $t2, $t3

    li $v0, 4
    la $a0, spacech
    syscall

    move $a0, $t3
    li $v0, 1
    syscall

    addi $t4, $t4, 1
    j loop

end_loop:
    li $v0, 4
    la $a0, newline
    syscall


exit:
# print newline

# quit program
