#!/usr/bin/env perl

# Install dependencies with:
# $ cpanm --installdeps .

use strict;
use warnings;
use autodie;
use Clipboard;
use Time::HiRes qw(sleep);

open(my $fh, '<', 'dictionary.txt');

while(my $line = <$fh>) {
    my @lengths = map { length } split(' ', $line);
    if("@ARGV" eq "@lengths") {
        print $line;
        Clipboard->copy($line);
        sleep(0.3);
    }
}
