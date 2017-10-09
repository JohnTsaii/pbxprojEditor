#!/usr/bin/perl
package XCBuildConfiguration;

use strict;
use warnings;
use PBXObject;

our @ISA=qw(PBXObject);

sub buildSettings() {
  $_[0]->{'buildSettings'} = $_[1] if defined $_[1];
  return $_[0]->{'buildSettings'};
}

sub name() {
  $_[0]->{'name'} = $_[1] if defined $_[1];
  return $_[0]->{'name'};
}

# set build configuration key value entry
# if key is unexist return false
sub set_entries() {
  my $self = shift;
  foreach (@_) {
    my @words = split /=/, $_;
    my $key = shift @words;
    my $value = shift @words;
    my $find_it = 0;
    # first seach buildConfiguration key
    foreach (keys %$self) {
      if ($_ eq $key) {
	$self->{$key} = $value;
	$find_it = 1;
	last;
      }
    }

    # second seach buildSetting key
    if (not $find_it) {
      $self->buildSettings->{$key} = $value if exists $self->buildSettings->{$key};
      }
  }
}

1;
