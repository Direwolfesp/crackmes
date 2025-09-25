
  # Name: easyjerk
  Url: https://crackmes.one/crackme/67fa22568f555589f3530a94

  ## Solution
  The goal is to get the function `check_serial` return 1. This function
  receives the user input as a parameter and continues to apply the
  function `transform` to each byte of the input and compares the result
  with the corresponding byte of a hard-coded string ``Xn`k{Vfu``.

  If any of the 8 resulting bytes dont match the byte of the string, the
  loop will break and return 0, otherwise it will return 1 in the 8n-th
  iteration.

  To solve this problem I opted for a quick [nushell](https://www.nushell.sh/) script (which can be found
  in `./solve.nu`) that applies the `transform` function for every printable ASCII
  character, checks if it matches with the string and stores it in the result.

  This bruteforce solution came to be pretty fast, as the search window
  is already pretty small thanks to the static analysis done previously.
  ```nu 
  > : timeit { ./solve.nu }
  #=> Result serial is: LiZTeETf
  #=> 34ms 126µs 273ns
  ``` 
