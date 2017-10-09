#!/usr/bin/perl

use strict;
use warnings;
use Project;

use PBXObject;
use PBXProject;
use PBXNativeTarget;

my $project = Project->new('RoadHome.xcodeproj/project.pbxproj');

sub test_PBXObject() {
  my $test_data = {'isa' => 'test_isa'};
#  my $object = PBXObject->new($test_data);
}

test_PBXObject();

sub test_PBXProject() {
  $project->project();
  $project->set_buildSettings_with_keyValue('RoadHome', 'Debug', "CODE_SIGN_IDENTITY=code1", "DEVELOPMENT_TEAM=12");
  $project->set_buildSettings_with_keyValue('RoadHome', 'Release', "CODE_SIGN_IDENTITY=code1", "DEVELOPMENT_TEAM=12");
#  print $project->rootObject, "\n";
#  print $project->rootObject('111111'), "\n";
#  print $project->rootObject, "\n";
  $project->save();
}
test_PBXProject();

