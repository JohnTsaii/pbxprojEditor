package XCConfigurationList;

use strict;
use warnings;
use XCBuildConfiguration;

our @ISA = qw(PBXObject);

my $buildConfigurations = {}; #hash reference

sub buildConfigurations() {
  $buildConfigurations->{$_[1]} = $_[2] if defined $_[2];
  return $buildConfigurations->{$_[1]} if defined $_[1];
}

sub get_configuration_with_name() {
  my $self = shift;
  my $configuration_name = shift;
  die 'please speicfy the configuartion name' until defined $configuration_name;
  my $configs = $self->buildConfigurations(shift);
  foreach (@$configs) {
    if ($_->name eq $configuration_name) {
      return $_
    }
  }
  die "not found the configuration name: \'$configuration_name\' \n";
}

sub _init() {
  my $self = $_[0];
  my $origin_config = $self->{'buildConfigurations'};
  my $objects = $self->objects;
  my @configs;
  foreach (@$origin_config) {
    my $value = $objects->{$_};
    my $build_configuration = XCBuildConfiguration->new($value, $objects);
    push @configs, $build_configuration;
  }
  $self->buildConfigurations($_[1], \@configs); # 设置属性为对象b值
  return $self->SUPER::_init();
}

1;
