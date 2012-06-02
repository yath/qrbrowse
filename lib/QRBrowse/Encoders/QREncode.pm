package QRBrowse::Encoders::QREncode;
use strict;
use warnings;
use Carp;

my @qrencode = qw(qrencode -t ASCII -m 2);

sub new {
    my $type = shift;
    my $self = {};
    bless $self, $type;
    $self->encode("OHAI"); # test if encoding works by encoding a test string
    return $self;
}

sub encode {
    my $self = shift;
    my $text = shift;

    my $ret = "";

    open(my $qrfh, "-|", @qrencode, "--", $text)
        or croak "Unable to run qrencode: $!\n";
    while (<$qrfh>) {
        y/#/*/;
        $ret .= $_;
    }
    close $qrfh
        or croak "Unable to close qrencode: $!\n";

    return $ret;
}
1;
