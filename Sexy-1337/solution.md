# Name: Sexy-1337
Url: https://crackmes.one/crackme/6715466c9b533b4c22bd18bb

## Solution
Our goal is to have `strcmp(&input, &PASSWD)` output 0 so that
we get "access granted".

We will start with `PASSWD`. First it is filled with the
string "sexy1337" but with each byte plus 3 in
`generate_password(&PASSWD, "sexy1337")`; then it gets
each byte xor'd with 0xaa in `encrypt_decrypt(0xaa)`.

However, if we see what happens to the input, we can se that it
only gets through `encrypt_decrypt(0xaa)` before it gets compared
with `PASSWD`, this is telling us that in order to both have the
same value, we must pick the value that `PASSWD` had just before
the `encrypt_decrypt(0xaa)` which is trivial because is just
pulling the value we got from `generate_password(&PASSWD, "sexy1337")`.

A quick nushell script can be found here:

```nu
def generate_password [seed: string]: [nothing -> binary] {
  $seed
  | into binary
  | chunks 1
  | each { |b| ($b | into int) + 0x3 | into binary | take 1 }
  | bytes collect
}

def main [] {
  generate_password "sexy1337"
}
# => Length: unknown (stream) | printable whitespace ascii_other non_ascii
# => 00000000:   76 68 7b 7c  34 36 36 3a                         vh{|466:
```
