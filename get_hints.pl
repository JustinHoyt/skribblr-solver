#!/usr/bin/env perl

use 5.30.0;
use strict;
use warnings;
use autodie;
use Time::HiRes qw(sleep);

open(my $fh, '<', 'dictionary.txt');

while(<$fh>) {
    chomp;
    if("@ARGV" eq "@{[map { length } split]}") {
        `tty-copy $_`;
        sleep(0.5);
    }
}
