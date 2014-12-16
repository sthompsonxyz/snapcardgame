package Snap;

use Moose;

extends 'CardGame';

sub play {
	my $self = shift;

	while ( @{$self->player1hand} && @{$self->player2hand} ) {
       
        printf "Round %s\n", $self->round;
        $self->round($self->round + 1);

	#player 1 goes first 
 	push @{$self->pile}, pop @{$self->player1hand};
	if(scalar @{$self->pile} >= 2) {
		
			if( @{$self->pile}[-1]->value eq @{$self->pile}[-2]->value ) {
			push ( @{$self->player1hand}, @{$self->pile} );
			@{$self->pile} = ();
		}
	}

 	push @{$self->pile}, pop @{$self->player2hand};
	if(scalar @{$self->pile} >= 2) {
		
			if( @{$self->pile}[-1]->value eq @{$self->pile}[-2]->value ) {
			push ( @{$self->player2hand}, @{$self->pile} );
			@{$self->pile} = ();
		}
	}
	
	print $self->show_hands;
	print $self->show_pile;	
	}


	return 'played a game';
	
}

sub rules {
	my $self = shift;

	if ( (!@{$self->player1hand}) && (!@{$self->player2hand}) ) {
		$self->winner('Draw');
	} else {
		$self->winner('Player 1 won!') if @{$self->player1hand};
		$self->winner('Player 2 won!') if @{$self->player2hand};
	
	}	
}


no Moose;
__PACKAGE__->meta->make_immutable;

