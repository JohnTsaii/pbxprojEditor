#!/usr/bin/perl

use strict;
use warnings;
use Xcode::Project;

my $project = Project->new();

sub test_PBXProject() {
  $project->set_buildSettings_with_keyValue('Target', 'Debug', "CODE_SIGN_IDENTITY=code1", "DEVELOPMENT_TEAM=12");
  $project->set_buildSettings_with_keyValue('Target', 'Release', "CODE_SIGN_IDENTITY=code1", "DEVELOPMENT_TEAM=12");
  $project->save();
}
test_PBXProject();

