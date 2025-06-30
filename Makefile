all:
	nasm -f elf32 test.nasm -o test.o;
	ld -m elf_i386 test.o -o test