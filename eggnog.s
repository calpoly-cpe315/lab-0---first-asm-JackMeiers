    .global	main
main:
    // pre-increment the stack point to create space for two 8-byte registers
    // link register (x30), and frame pointer (x29), and store them.
	stp	x29, x30, [sp, -16]!

    // Load the argument and perform the call. Like 'printf("...")' in C.
	ldr	x0, =lineone
	bl	printf
	mov 	x0, 0

	ldr	x0, =linetwo
	bl	printf
	mov	x0, 0

	ldr	x0, =linethree
	bl	printf

    // initialize the return value in the return register
	mov	x0, 0

    // restore the registers and post-decrement 
    // the stack pointer for consistency
	ldp	x29, x30, [sp], 16

    // return from the call
	ret

lineone:
	.asciz "We drink merrily\n"

linetwo:
	.asciz "Egg nog, nectar of the gods\n"

linethree:
	.asciz "It's our favorite\n"
