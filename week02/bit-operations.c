#define READING   0x01
#define WRITING   0x02
#define AS_BYTES  0x04
#define AS_BLOCKS 0x08
#define LOCKED    0x10

int main() {
	volatile unsigned char device;

	/* set to a specific combination of bits */
	device = READING | AS_BYTES | LOCKED;
	device = WRITING | AS_BLOCKS | LOCKED;

	/* set the LOCKED bit */
	device |= LOCKED;

	/* unset the LOCKED bit */
	device = device & ~LOCKED;

	/* unset READING then set WRITING */
	device &= ~READING;
	device |= WRITING;
}
