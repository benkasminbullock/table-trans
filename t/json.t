use warnings;
use strict;
use Table::Translations 'trans_to_json_file';
use Test::More;
use JSON::Parse 'json_file_to_perl';
use FindBin '$Bin';
my $in = "$Bin/test-translations.txt";
my $out = "$Bin/test-translations.json";
use utf8;

del_out ();
trans_to_json_file ($in, $out);
ok (-f $out);
my $json = json_file_to_perl ($out);
is ($json->{monkey}->{ja}, '猿', "Monkey");
is ($json->{fruit}->{es}, 'Fruto');
del_out ();
done_testing ();
exit;

sub del_out
{
    if (-f $out) {
	unlink $out or die $!;
    }
}

