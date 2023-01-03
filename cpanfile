#<<<
use strict; use warnings;
#>>>

on 'configure' => sub {
  requires 'Config'                        => '0';
  requires 'ExtUtils::MakeMaker::CPANfile' => '0';
};

on 'runtime' => sub {
  requires 'Log::Any'         => '0';
  requires 'Moo'              => '0';
  requires 'Type::Tiny'       => '0';
  requires 'namespace::clean' => '0';
};

on 'test' => sub {
  requires 'Log::Log4perl' => '0';
  requires 'Test::More'    => '0';
  requires 'Test::Output'  => '0';
};

on 'develop' => sub {
  suggests 'App::Software::License' => 0;
  suggests 'Pod::Markdown::Github'  => 0;
};
