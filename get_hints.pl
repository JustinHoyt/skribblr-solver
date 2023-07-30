#!/usr/bin/env perl

# Install dependencies with:
# $ cpanm --installdeps .

use feature ":5.30";
use strict;
use warnings;
use autodie;
use Clipboard;
use Time::HiRes qw(sleep);

open(my $fh, '<', 'dictionary.txt');

while(<$fh>) {
    chomp;
    if("@ARGV" eq "@{[map { length } split]}") {
        say;
        Clipboard->copy($_);
        sleep(0.1);
    }
}
