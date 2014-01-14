#!/bin/env perl
use Mojo::Base -strict;
use File::Basename 'dirname';
use File::Spec::Functions qw(catdir splitdir);

# Source directory has precedence
my @base = (splitdir(dirname(__FILE__)), '..');
my $lib = join('/', @base, 'lib');
-e catdir(@base, 't') ? unshift(@INC, $lib) : push(@INC, $lib);

# Start commands for application
require Mojolicious::Commands;
Mojolicious::Commands->start_app('Zvezda::Web');