#!/usr/bin/env nu
#
# My solution for crackme: https://crackmes.one/crackme/67fa22568f555589f3530a94
# By bruteforcing all printable ascii chars to match the key

def transform [byte: binary, index: int]: [ nothing -> binary ] {
  if (($byte | bytes length) != 1) {
    print --stderr "Incorrect byte length. Expected length = 1"
    return
  }

  let new_index = $index + 7 | into binary | take 4
  
  $byte
  | bits xor $new_index
  | into int
  | $in + 0x0d
  | into binary
  | take 1
  | bits and 0x[7f]
}


def main [] {
  let KEY: string = "Xn`k{Vfu";  
  mut RESULT: list<string> = []
  
  mut i = 0;
  while ($i < 8) {
    for c in 32..127 {
      let char: binary = $c | into binary | take 1
      let to_match: binary = $KEY | into binary | bytes at $i..$i 
      
      if ((transform $char $i) == $to_match) {
        $RESULT ++= [ ($char | into int | char -i $in) ]
        $i += 1;
        break;
      }
    }
  }

  print $"Result serial is: ($RESULT | str join)"
}
