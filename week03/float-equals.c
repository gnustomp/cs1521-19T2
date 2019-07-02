/* float-equals.c: When equals is not equals */

#include <stdio.h>

int main() {
	if (0.1 + 0.2 == 0.3) {
		puts("Equal!");
	} else {
		puts("Wait, what?");
	}
}
