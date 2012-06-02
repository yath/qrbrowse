package QRBrowse::Encoders::QREncode;
use strict;
use warnings;

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
        or die "Unable to run qrencode: $!\n";
    while (<$qrfh>) {
        y/#/*/;
        $ret .= $_;
    }
    close $qrfh
        or die "Unable to close qrencode: $!\n";

    return $ret;
}
1;
