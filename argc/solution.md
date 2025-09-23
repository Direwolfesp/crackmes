# Name: argc
Url: https://crackmes.one/crackme/68698837aadb6eeafb399017

## Solution
This program modifies the `_start` prodecure (before  `main`) to
divide `argc` by 2 by shifting right 1 bit. So one solution is
passing `0b110` arguments so that it becomes 3 (`0b011`) in `main`,
or you could patch `_start` itself but is not recommended.

**Original binary**
- Address: 0x4010e1
- Instruction: `shr al, 0x1`
- Notes: `argc` is passed to `_start` at the top of the stack, so
  we can pop it with the `pop` instruction, modify it with `shr` and put it
  back with `push`. These three instructions are a manual replacement for
  the original 4 byte instruction `endbr64` at the beginning of `_start`.
