#<<<
use strict; use warnings;
#>>>

use Test::More import => [ qw( BAIL_OUT is isa_ok ok ) ], tests => 4;

my $class = 'Foo';
my $role  = 'MooX::Role::HasLogger';

eval qq{
  package $class;

  use Log::Log4perl qw();
  use Moo           qw( with );

  with qw( $role );

  sub build_logger {
    return Log::Log4perl->get_logger(ref shift);
  }

  1;
};

'' eq $@ or BAIL_OUT( "Cannot create Moo class '$class' dynamically!" );

is __PACKAGE__, 'main', "current package is 'main'";
ok $class->does( $role ), "class '$class' consumes role '$role'";

isa_ok my $logger = $class->new->logger, 'Log::Log4perl::Logger';
is $class, $logger->category, "custom logger has 'category' attribute with value '$class'";
