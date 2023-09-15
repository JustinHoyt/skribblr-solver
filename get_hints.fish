#!/usr/bin/env fish

perl -nE "print if '$argv' eq qq(@{[map length, split]})" dictionary.txt \
    | fzf \
    | tty-copy -n

