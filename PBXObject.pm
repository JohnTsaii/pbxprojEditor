#!usr/bin/perl
package PBXObject;

use strict;
use warnings;

my  $objects;

sub new() {
  my $class = shift;
  my $data = shift;
  $objects = shift;
  my $self = $data;
  bless($self, $class);
  $self->_init(@_);
  return $self;
}

sub _init() {}

sub isa() {
    $_[0]->{'isa'} = $_[1] if defined $_[1];
   return $_[0]->{'isa'};
}

sub objects() {
  if (defined $_[1]) {
    return $objects->{$_[1]};
  } else {
    return $objects;
   }
}

1;
