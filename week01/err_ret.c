/* There are many ways of conveying error information from a function to its
 * caller. In this example, an error code is written to an integer passed into
 * the function through a pointer */

/* We are unable to tell if this function succeeded or failed from the return
 * value alone. */
int fn(int arg, int *err) {
	// do something

	if (/* something went wrong */) { 
		*err = 0xBAD;
	} else {
		*err = 0;
	}

	return arg + 1;
}

void caller(void) {
	int err;
	int result = fn(1, &err);
	if (err != 0) {
		// an error occurred
	} else {
		printf("%d\n", result);
	}
}
