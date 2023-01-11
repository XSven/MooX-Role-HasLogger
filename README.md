# NAME

MooX::Role::HasLogger - Moo role that provides a logger attribute

# SYNOPSIS

```perl
package Foo;

use Moo;
use MooX::TypeTiny;
use namespace::clean;

with qw( MooX::Role::HasLogger );

sub bar {
  my ( $self ) = @_;
  $self->logger->info( 'log something' );
}

1;
```

# DESCRIPTION

This [Moo::Role](https://metacpan.org/pod/Moo%3A%3ARole) based role provides a `logger` attribute to the consuming
class.  The attribute is read-only and its value is grabbed lazily. The type
library [MooX::Role::HasLogger::Types](https://metacpan.org/pod/MooX%3A%3ARole%3A%3AHasLogger%3A%3ATypes) exports the `Logger` type that defines
the interface of the attribute. The `build_logger()` builder method returns a
[Log::Any](https://metacpan.org/pod/Log%3A%3AAny) logger object with the consuming class as its category.

This example

```perl
package Bar;

use Moo;
use MooX::TypeTiny;
use Types::Standard              qw( HasMethods );
use MooX::Role::HasLogger::Types qw( Logger );
use namespace::clean;

with qw( MooX::Role::HasLogger );

has '+logger' => ( isa => ( Logger ) & ( HasMethods [ qw( tracef debugf infof warnf errorf fatalf ) ] ) );

sub build_logger {
  return Log::Any->get_logger( category => ref shift, default_adapter => 'Stderr' );
}

1;
```

shows

- how to override the `isa` option of the `logger` attribute using the `+`
notation.
- how to extend the `Logger` type using a [Type::Tiny](https://metacpan.org/pod/Type%3A%3ATiny) intersection. Now a
logger has to be an object of a class that implements the `Logger` type
methods and additionally the `f` suffixed log methods.
- how to override the `build_logger()` builder method. This time the builder
returns a [Log::Any](https://metacpan.org/pod/Log%3A%3AAny) logger object with the consuming class as its category
and with a default adapter that refers to the [Log::Any::Adapter::Stderr](https://metacpan.org/pod/Log%3A%3AAny%3A%3AAdapter%3A%3AStderr)
adapter class.

# SEE ALSO

- [MooX::Role::Logger](https://metacpan.org/pod/MooX%3A%3ARole%3A%3ALogger)
- [MooX::Log::Any](https://metacpan.org/pod/MooX%3A%3ALog%3A%3AAny)

# AUTHOR

Sven Willenbuecher <sven.willenbuecher@gmx.de>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2023 by Sven Willenbuecher.

This is free software; you can redistribute it and/or modify it under the
same terms as the Perl 5 programming language system itself.

