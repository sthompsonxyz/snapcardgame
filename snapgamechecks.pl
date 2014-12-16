#!/usr/bin/perl

use warnings;
use strict;

use CardGame::Snap;

use Test::More tests => 7;

my $testcard = Card->new('suit' => 'hearts', 'value' => '1');

ok($testcard->suit eq 'hearts', "suit OK");
ok($testcard->value eq '1', "value OK");

ok($testcard->show_face eq 'Ace', "face OK");

require_ok('CardGame');

my $testcardgame = Snap->new();

isa_ok($testcardgame, 'CardGame');

my $thing = pop @{$testcardgame->deck};

print $thing->suit, " ", $thing->value, " ", $thing->show_face, "\n\n";

my $preshuffle = $testcardgame->deck;
$testcardgame->shuffle_deck;

is_deeply( [ sort @{$testcardgame->deck} ], [ sort @{$preshuffle} ], "deck survived shuffling!");

$testcardgame->deal(7);



print $testcardgame->show_hands;

print $testcardgame->play, "\n\n";

$testcardgame->rules;

print $testcardgame->winner, "\n\n";

ok($testcardgame->winner ne 'No-one yet', "win or draw determined OK");

