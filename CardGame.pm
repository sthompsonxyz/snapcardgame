package CardGame;

use Card;

#use List::Util qw(shuffle);
use Moose;

#deck
has 'deck' => (
	is => 'rw',
	isa => 'ArrayRef[Card]',
);

##hands
has 'player1hand' => (
	is => 'rw',
	isa => 'ArrayRef[Card]',
);

has 'player2hand' => (
	is => 'rw',
	isa => 'ArrayRef[Card]',
);

##pile
has 'pile' => (
	is => 'rw',
	isa => 'ArrayRef[Card]',
);

##general game flags
has 'winner' => (
	is => 'rw',
	isa => 'Str'
);

has 'round' => (
	is => 'rw',
	isa => 'Int',
	default => '0',
);

sub BUILD {
	my $self = shift;
	
	my @game_pile = ();

	$self->build_deck;
	$self->winner('No-one yet');
	$self->pile(\@game_pile);	
}

sub build_deck {
	my $self = shift;

	my @suits = ('Hearts', 'Diamonds', 'Clubs', 'Spades');
	my @deckarray = ();

	for my $suit (@suits) {

        	for(1..13) {
                	my $card = Card->new(suit => $suit, value => $_);
                	push @deckarray, $card;
        	}
	}

	$self->deck(\@deckarray);

}

sub shuffle_deck {
	my $self = shift;

	use List::Util qw(shuffle);

	@{$self->deck} = shuffle @{$self->deck};
}
##sub deal
sub deal {
	my $self = shift;
	my $handsize = shift;
	my @player1array = ();
	my @player2array = ();

	if ( (!defined $handsize) || ($handsize =~ /\D/) || ($handsize < 0) || ($handsize > 13)) {
        	return '1';
	}

	for(1 .. $handsize) {
		push @player1array, pop @{$self->deck};
		push @player2array, pop @{$self->deck};
	}
	$self->player1hand(\@player1array);
	$self->player2hand(\@player2array);

	return '0';
}

##sub show hands
sub show_hands {
	my $self = shift;
	my $return = '';



        $return .= "player1\'s hand:\n";
        foreach(@{$self->player1hand}) {
                $return .=  $_->show_face . " of " . $_->suit . "  ";
        }
        $return .= "\n";

        $return .= "player2\'s hand:\n";
        foreach(@{$self->player2hand}) {
                $return .=  $_->show_face . " of " . $_->suit . "  ";
        }
        $return .= "\n";

	return $return;
}

##show pile
sub show_pile {
	my $self = shift;
	my $return = '';
        $return .= "Current pile:\n";
        foreach(@{$self->pile}) {
                $return .=  $_->show_face . " of " . $_->suit . "  ";
        }
        $return .= "\n";

	return $return;
}

##sub play

##sub results

no Moose;
__PACKAGE__->meta->make_immutable;

