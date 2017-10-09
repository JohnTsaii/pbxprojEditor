#!/usr/bin/perl
package PBXProject;

use strict;
use warnings;
use PBXNativeTarget;

our @ISA = qw(PBXObject);

my $targets;
sub targets() {
  $targets = $_[1] if defined $_[1];
  return $targets;
}

sub _init() {
  my @targets;
  my $self = $_[0];
  my $origin_targets = $self->{'targets'};
  my $objects = $self->objects();
  foreach (@$origin_targets) {
    my $key = $_;
    my $value = $self->objects($_);
    my $target = PBXNativeTarget->new($value, $objects);
    push @targets, $target;
  }
  my $array = \@targets;
  $self->targets($array);
  return $self->SUPER::_init();
}
1;
