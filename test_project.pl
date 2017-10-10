#!/usr/bin/perl

use strict;
use warnings;
use Project;
use Cwd;

my $project = Project->new('/Users/John/Desktop/RoadHomeRepo/roadHomeIOS/trunk/RoadHome.xcodeproj/project.pbxproj');

sub test_PBXProject() {
  $project->set_buildSettings_with_keyValue('RoadHome', 'Debug', "CODE_SIGN_IDENTITY=code1", "DEVELOPMENT_TEAM=12");
  $project->set_buildSettings_with_keyValue('RoadHome', 'Release', "CODE_SIGN_IDENTITY=code1", "DEVELOPMENT_TEAM=12");
  $project->save();
}
test_PBXProject();

