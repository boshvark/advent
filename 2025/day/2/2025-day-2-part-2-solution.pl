#!/usr/bin/perl

# Advent of Code 2025 - Day 1.

use strict;

my $total = 0;

for (<>) {
  chomp;
  for my $range (split /,/) {
    next unless $range =~ /^(\d+)-(\d+)$/;
    my ($low, $high) = ($1, $2);
    next unless $high > $low;

    # Check every ID for repeated digits. A sequence must repeat at least once,
    # and up to N times where N is the number of digits at the top of the range.
    for my $id ($low .. $high) {
      $total = $total + $id if $id =~ /^(.*)\1+$/;
    }
  }
}

print "$total\n";
