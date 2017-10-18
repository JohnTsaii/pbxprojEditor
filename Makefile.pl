use 5.016000;
use ExtUtils::MakeMaker;

WriteMakefile(
	      NAME => 'Xcode::Project',
	      VERSION_FROM => 'lib/Xcode/Project.pm',
#	      ABSTRACT_FROM => 'lib/Xcode/Project.pm',
	      AUTHOR => 'John Tsai',
	      LICENSE => 'freebsd',
	      MIN_PERL_VERSION => '5.016000',
	      EXE_FILES => ['scrpit/proj'],
	      PREREQ_PM => {
			    'strict' => 0,
			    'warnings' => 0,
			   },
	      (eval { ExtUtils::MakeMaker->VERSION(6.46) } ? (META_MERGE => {'meta-spec' => { version => 2 },
resources => { repository => {
													  type => 'git',
													  url  => 'https://github.com/JohnTsaii/pbxprojEditor.git',
													  web  => 'https://github.com/JohnTsaii/pbxprojEditor',
													 },
											  }})
	       : ()
	         ),
	     );
