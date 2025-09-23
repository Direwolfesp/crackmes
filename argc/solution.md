# argc
Url: https://crackmes.one/crackme/68698837aadb6eeafb399017

## solution
This program modifies the _start prodecure before main to
divide argc argument by 2 by shifting right 2 bites. 

**Original binary**
- Address: 0x4010e1
- Instruction: `shr al, 0x1`
