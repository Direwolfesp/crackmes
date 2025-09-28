
  # Name: getting_started
  Url: https://crackmes.one/crackme/660a24f1cddae72ae250bf56

  ## Solution
  Password: secret

  The program first allocates an array of 6 ints in the heap using malloc,
  and initializes all of them with {0x6e, 0x60, 0x5e, 0x6d, 0x60, 0x6f}.
  Then it adds 5 to each element of the array by looping 5 times and adding 1.

  Then it allocates a 7 byte length string in the heap with malloc and copies
  the previous int array into it, because the original array elements only
  used 1 byte we dont loose any information.

  Finally it checks if the first argument to the program (argv[1]) equals to that
  string.

  Here we can see a nushell one lines that obtains the solution. 
  ```nu
  > : [0x6e 0x60 0x5e 0x6d 0x60 0x6f] | each {|n| $n + 5 | into binary | take 1 } | bytes collect
  # => Length: unknown (stream) | printable whitespace ascii_other non_ascii
  # => 00000000:   73 65 63 72  65 74                                   secret
  ```
