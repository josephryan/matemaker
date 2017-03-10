
use ExtUtils::MakeMaker;

WriteMakefile(NAME      => 'matemaker',
              AUTHOR    => 'Joseph Ryan <joseph.ryan@whitney.ufl.edu',
              VERSION_FROM  => 'matemaker',
              PREREQ_PM => { 'JFR::Fasta' => '1.04' },
              EXE_FILES => ['matemaker']);

