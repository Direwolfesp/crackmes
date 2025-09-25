#!/usr/bin/env nu

def generate_password [seed: string]: [nothing -> binary] {
  $seed
  | into binary
  | chunks 1
  | each { |r|
    ($r | into int) + 0x3 | into binary | take 1
  }
  | bytes collect
}

def main [] {
  generate_password "sexy1337"
}
