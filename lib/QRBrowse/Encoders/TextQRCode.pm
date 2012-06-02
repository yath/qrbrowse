package QRBrowse::Encoders::TextQRCode;
use strict;
use warnings;
use Text::QRCode;

my $charwidth = 2;
my $borderwidth = 2;

sub new {
    my $type = shift;
    my $self = {
        encoder => Text::QRCode->new()
    };
    return bless $self, $type;
}

sub encode {
    my $self = shift;
    my $text = shift;
  
    my @ret = map { join("", map { $_ x $charwidth } @$_) } @{$self->{encoder}->plot($text)};

    # draw a border
    @ret = map { (" " x $borderwidth) . $_ . (" " x $borderwidth) } @ret;
    my $width = length $ret[0];
    unshift(@ret, " " x length $ret[0]);
    push(@ret, $ret[0]);
    return join("\n", @ret);
}
1;
