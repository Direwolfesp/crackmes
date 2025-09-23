#!/usr/bin/env nu

let TEMPLATE = '
  # Name: <NAME>
  Url: <URL>

  ## Solution
  ...

  **Original binary**
  - Address:
  - Instruction:
  - Notes:
'


def main [] {
  if (glob --no-dir solution.md | is-empty) {
    print "Generating solution.md"
    $TEMPLATE
    | str replace --all "<NAME>" (pwd | path basename)
    | save --force solution.md
    print "Done."
  } else {
    print "There is already a solution.md"
  }
}

