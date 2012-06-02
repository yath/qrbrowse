package QRBrowse::Encoder;
use strict;
use warnings;
use base qw(Exporter);
our @EXPORT_OK = qw(get_encoder);
use Carp;

sub get_encoder {
    my $encoder;
    for my $encname (qw(TextQRCode QREncode)) {
        undef $encoder;
        eval {
            my $fullname = "QRBrowse::Encoders::$encname";
            eval "require $fullname" or die $@;
            no strict "refs";
            $encoder = $fullname->new();
        };
        last unless $@;
    }
    croak "No suitable QR encoder found!\n" unless $encoder;
    return $encoder;
}

1;
