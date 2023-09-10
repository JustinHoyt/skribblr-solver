#!/usr/bin/env fish

perl -nE "print if '$argv' eq qq(@{[map length, split]})" dictionary.txt \
    | fzf \
    | perl -nE 'chomp; chomp; print' \
    | tty-copy

