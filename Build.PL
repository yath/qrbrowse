use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new
(
    module_name => 'QRBrowse',
    dist_version_from => 'bin/qrbrowse',
    dist_author => 'Sebastian Schmidt <yath@yath.de>',
    dist_abstract => 'Browse a file with certain patterns being replaced by a link to a QR code ',
    requires    => {
        'Regexp::Common' => 0,
    },
    script_files => 'bin/',
    license     => 'mit',
);

$build->create_build_script();
