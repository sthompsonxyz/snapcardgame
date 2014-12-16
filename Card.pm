package Card;

use Moose;

has 'suit' => (
		is => 'rw',
		isa => 'Str',
	);

has 'value' => (
		is => 'rw',
		isa => 'Int',
	);

has 'faces' => (
		is => 'ro',
		isa => 'HashRef',
	);

sub BUILD {
	my $self = shift;

	my $buildfaces = {
		'1' => 'Ace',
		'2' => '2',
		'3' => '3',
		'4' => '4',
		'5' => '5',
		'6' => '6',
		'7' => '7',
		'8' => '8',
		'9' => '9',
		'10' => '10',
		'11' => 'Jack',
		'12' => 'Queen',
		'13' => 'King',	
	};

	$self->{'faces'} = $buildfaces;
}

sub show_face {
	my $self = shift;
	#my $val_to_show = shift;

	$self->{'faces'}->{$self->value};	
}

no Moose;
__PACKAGE__->meta->make_immutable;


