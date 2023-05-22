#<<<
use strict; use warnings;
#>>>

package MooX::Role::HasLogger::Types;

our $VERSION = '0.002';

use Type::Library    qw( -base );
use Type::Tiny::Duck qw();

my $Logger = __PACKAGE__->add_type(
  Type::Tiny::Duck->new(
    name    => 'Logger',
    methods => [ qw( is_trace trace is_debug debug is_info info is_warn warn is_error error is_fatal fatal ) ]
  ),
);

__PACKAGE__->add_type(
  Type::Tiny::Duck->new(
    name    => 'LoggerAny',
    methods => [ @{ $Logger->methods }, qw( category tracef debugf infof warnf errorf fatalf ) ]
  ),
);

__PACKAGE__->make_immutable;

1;
