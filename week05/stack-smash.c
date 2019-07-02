/* stack-smash.c: a simple program to get and print user input using functions
 * What could go wrong?
 *
 * Narrator: a lot
 */

#include <stdio.h>
#include <stdlib.h>

void get_string(char *s);

int main(int argc, char *argv[]) {
	int i;
	long l;
	char buf[64];

	printf("DEBUG: I have a buffer at %p\n", buf);

	printf("Give me an int! ");
	get_string(buf);
	i = atoi(buf);
	printf("Give me a long! ");
	get_string(buf);
	l = atol(buf);
	printf("Give me a string! ");
	get_string(buf);

	printf("Thank you! I got %d, %ld, %s!\n", i, l, buf);
	return 0;
}

void get_string(char *s) {
	fgets(s, 128, stdin);
}
