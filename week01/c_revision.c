/* COMP1521: revision code for COMP1511 */

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct input {
	unsigned int len;
	char *str;
};

static char str[BUFSIZ];

struct input *alloc_struct(const char *str) {
	assert(str != NULL);
	struct input *new = malloc(sizeof(struct input));
	if (new == NULL) {
		return NULL;
	}

	new->len = strlen(str) + 1;
	new->str = malloc(new->len);
	if (new->str == NULL) {
		free(new);
		return NULL;
	}

	// new->str is big enough to store str
	strcpy(new->str, str);
	return new;
}

void free_struct(struct input *old) {
	free(old->str);
	free(old);
}

int main(int argc, char *argv[]) {
	printf("My arguments are:");
	for (int i = 0; i < argc; i++ ) {
		printf(" %s", argv[i]);
	}
	printf("\n");

	printf("Please type some input: ");
	fgets(str, BUFSIZ, stdin);
	struct input *inp = alloc_struct(str);

	FILE *out = fopen("out.txt", "w");
	fprintf(out, "%u:%s", inp->len, inp->str);
	fclose(out);

	puts("Thanks!");
	free_struct(inp);
	return EXIT_SUCCESS;
}
