# Aesni-testing

This is just the [reference implementation](https://www.intel.com/content/dam/doc/white-paper/advanced-encryption-standard-new-instructions-set-paper.pdf) by intel modified for nasm 32 bit
compile using make and look at the keys in gdb:
```
gdb test
break end
run
x/40bx &generated_keys
 ```