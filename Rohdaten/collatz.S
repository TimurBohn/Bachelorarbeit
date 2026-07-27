/*
* LED Blinker
* Assuming that GPIO_BASE is mapped to a GPIO core, which in turn is
* connected to LEDs, this will light the LEDs one at a time.
* Useful as smoke test to see that serv is running correctly
*/
#ifndef GPIO_BASE
#define GPIO_BASE 0x40000000
#endif
	
	/*
	a0 = GPIO Base address
	t0 = Value
	*/

.globl _start
_start:
	/* Load GPIO base address to a0 */
	lui a0, %hi(GPIO_BASE)
	addi a0, a0, %lo(GPIO_BASE)

	/* Clear t0 */
	addi	t0, zero, 1
loop:
	/* Write to LEDs */
	sb t0, 0(a0)

	/* invert LED */
	xori t0, t0, 1

	/* Delay loop */
delay:
    li	a4, 0x1
    li	a3, 0x1             /* a4 = a3 = i = 1 */
    li	a2, 0x3e9           /* a2 = 1001 */
outer_loop:
    mv	a5, a4              /* n = a5 = i */
    j	check_loop_zu_Ende
ungerade:
    slli	a1, a5, 0x1
    add	a5, a1, a5
    addi	a5, a5, 0x1     /* n = 3*n+1 */
check_gerade_ungerade:
    andi	a1, a5, 0x1     /* n%2 == 1 ? Sprung zu ungerade : n = n/2 */ 
    bnez	a1, ungerade
    srai	a5, a5, 0x1
check_loop_zu_Ende:
    bne	a5, a3, check_gerade_ungerade /* n!=1 ? weiter in Collatz : i++ */
    addi	a4, a4, 0x1
    bne	a4, a2, outer_loop            /* i != n ? Collatz mit i : LED wechseln */ 
    j loop
