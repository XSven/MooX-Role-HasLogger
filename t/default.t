#<<<
use strict; use warnings;
#>>>

use Test::More import => [ qw( BAIL_OUT is ok ) ], tests => 5;
use Log::Any::Test;
use Log::Any qw( $log_buffer );

my $class = 'Foo';
my $role  = 'MooX::Role::HasLogger';

eval qq{
  package $class;

  use Moo;
  use MooX::TypeTiny;
  use namespace::clean;

  with qw( $role );

  1;
};

'' eq $@ or BAIL_OUT( "Cannot create Moo class '$class' dynamically: $@" );

is __PACKAGE__, 'main', "current package is 'main'";
ok $class->does( $role ), "class '$class' consumes role '$role'";

my $logger = $class->new->logger;
is $class, $logger->category, "default logger has 'category' attribute with value '$class'";

$logger->infof( 'log %s', 'something' );
$log_buffer->contains_ok( qr/\Alog something\z/, 'default logger provides additional logging methods' );
$log_buffer->empty_ok( 'no more log lines in log buffer' );
