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

  my $prev_position = $position;
  $position = $position + $offset;

  # Handle positive and negative overflows.
  if ($position <= 0 or $position > 99) {

    # Count how many times we rotated to zero. If we were rotating left, handle
    # the special case where we started at zero.
    my $rotations = abs(int($position / 100));
    my $left_extra = ($position <= 0 and $prev_position != 0) ? 1 : 0;
    $password = $password + $rotations + $left_extra;

    # Update our current position.
    $position = $position % 100;
  }
}
print "$password\n";
