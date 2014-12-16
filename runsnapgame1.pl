#!/usr/bin/perl

use warnings;
use strict;

use CardGame::Snap;
use Test::More;

#do some input checking, if not OK use default hand size value of 10
my $hand_size;
(( !defined $ARGV[0] ) || ( $ARGV[0] =~ /\D/ ) || ( $ARGV[0] < 0 ) || ($ARGV[0] > 13) ) ? $hand_size = 10 : ( $hand_size = $ARGV[0] );

my $testcardgame = Snap->new();

$testcardgame->shuffle_deck;

$testcardgame->deal($hand_size);

print $testcardgame->play, "\n\n";

$testcardgame->rules;

print $testcardgame->winner, "\n\n";

