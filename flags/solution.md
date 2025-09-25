
  # Name: flags
  Url: https://crackmes.one/crackme/686918c6aadb6eeafb398fbd

  ## Solution
  correct input is "\x02\x04\x08\x10\x20".
  We want to find a buffer so that when we `i` reaches 0,
  `val` variable which was 0x40 initially is still intact.

  In each loop iteration the next byte of the buffer will be
  left shifted `i` bits, in other words, the solution can be
  generated like this by shifting in the oposite way `val` so
  that the shifts cancel each other:

  ```nu
    5..1 | each { |i| 0x[40] | bits shr $i } | bytes collect 
    # => Length: unknown (stream) | printable whitespace ascii_other non_ascii
    # => 00000000:   02 04 08 10  20
  ```  
