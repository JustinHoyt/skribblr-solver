#! python3

'''
pass in a variable number of word lengths to get the matching words from the
dictionary.txt file. `_` acts as a wildcard.

usage
```
$ ./get_hints.py 3 4
the pole
all bird

$ ./get_hints.py 4 _
the pole
all bird
nom nom
eat doritos
```
'''

import sys

def equals(actual_length: int, expected_length: int | str):
    return actual_length == expected_length or expected_length == '_'

def parse(arg: str):
    return int(arg) if arg.isdigit() else arg

expected_lengths: list[str | int] = [parse(length) for length in sys.argv[1:]]

phrases: list[str] = []
with open('dictionary.txt') as file:
    # trim the endline on each line and add to phrases
    phrases = [line.strip() for line in file]

valid_phrases: list[str] = []

for phrase in phrases:
    actual_lengths = [len(word) for word in phrase.split(' ')]

    matches = True

    if len(expected_lengths) == len(actual_lengths) and all(map(equals, actual_lengths, expected_lengths)):
        valid_phrases.append(phrase)

[print(phrase) for phrase in valid_phrases]
