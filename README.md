# NAME

MooX::Role::HasLogger - Moo role that provides a logger attribute

# SYNOPSIS

```perl
package Foo;

use Moo;

with qw( MooX::Role::HasLogger );

sub main;

1;
```

# DESCRIPTION

This role declares a `logger` attribute for the class to be composed into.

# SEE ALSO

- [MooX::Role::Logger](https://metacpan.org/pod/MooX%3A%3ARole%3A%3ALogger)
- [MooX::Log::Any](https://metacpan.org/pod/MooX%3A%3ALog%3A%3AAny)

# AUTHOR

Sven Willenbuecher <sven.willenbuecher@gmx.de>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2023 by Sven Willenbuecher.

This is free software; you can redistribute it and/or modify it under the
same terms as the Perl 5 programming language system itself.

