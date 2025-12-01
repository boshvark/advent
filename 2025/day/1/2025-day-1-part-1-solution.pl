#!/usr/bin/perl

# Advent of Code 2025 - Day 1.

use strict;

my $password = 0;
my $position = 50;

for (<>) {
  next unless /([LR])(\d+)/;
  my ($direction, $offset) = ($1, $2);

  # Turn the dial to the left or right.
  $offset = -$offset if $direction eq 'L';
  $position = $position + $offset;

  # Handle positive and negative overflows.
  if ($position < 0 or $position > 99) {
    $position = $position % 100;
  }

  # Increment password if currently on position zero.
  ++$password if $position == 0;
}
print "$password\n";
