#!/usr/bin/perl
package PBXNativeTarget;

use strict;
use warnings;
use XCConfigurationList;

our @ISA = qw(PBXObject);

my $buildConfigurationList = {}; # hash ref

sub buildConfigurationList() {
  $buildConfigurationList->{$_[1]} = $_[2] if defined $_[2];
  return $buildConfigurationList->{$_[1]} if defined $_[1];
}

sub name() {
  $_[0]->{'name'} = $_[1] if defined $_[1];
  return $_[0]->{'name'};
}
   
sub get_configuration_with_name() {
  my $self = shift;
  my $name = shift;
  return $self->buildConfigurationList($self->name)->get_configuration_with_name($name, $self->name);
}

sub _init() {
  my $self = $_[0];
  my $origin_config = $self->{'buildConfigurationList'};
  my $objects = $self->objects;
  my $value = $objects->{$origin_config};
  my $configuration_list = XCConfigurationList->new($value, $objects, $self->{'name'});
  $self->buildConfigurationList($self->{'name'}, $configuration_list); # 设置属性为对象值
  return $self->SUPER::_init();
}
1;
