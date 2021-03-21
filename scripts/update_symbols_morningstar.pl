# 1

# perl 1_extract_ftse100_tickets.pl > extract_ftse100_tickets
# -*- coding: utf-8 -*-
# perl

# get web page content

use strict;
use warnings;

# use LWP::Simple;
use LWP::UserAgent;

my $ua = new LWP::UserAgent;
$ua->timeout(120);
my $url='https://www.londonstockexchange.com/exchange/prices-and-markets/stocks/indices/constituents-indices.html?index=UKX';
my $request = new HTTP::Request('GET', $url);
my $response = $ua->request($request);
my $content = $response->content();
print $content;

# 2
use warnings 'all';
use strict;
use feature qw(say);
use Data::Dumper;

my $path="extract_ftse100_tickets";
my $regex = qr/<td scope="row" class="name">([A-Z0-9.]+)<\/td>/mp;
my @matches;

open my $fh, "<", $path  or die "Can't open $path: $!";
while (my $line = <$fh>)
{
     if ( $line =~ /$regex/g ) { # check for symbol
         push @matches, $1;
     }
    # check for next page
}
say "@matches";
print Dumper @matches;


close $fh;


# 3 todo: read symbols from db and compare



# 4 insert missing symbols