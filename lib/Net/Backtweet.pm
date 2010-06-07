package Net::Backtweet;

# ABSTRACT: client for the backtweet API

use Moose;
use MooseX::Net::API;
extends 'Net::Backtype';

net_api_declare backtweet => (
    base_url    => 'http://api.backtype.com',
    format      => 'json',
    format_mode => 'append',
);

net_api_method tweets_by_url => (
    description =>
      'Retrieve tweets that link to a given URL, whether the links are shortened or unshortened.',
    path     => '/tweets/search/links',
    method   => 'GET',
    params   => [qw/q key/],
    required => [qw/q key/],
    expected => [qw/200/],
);

net_api_method stats_by_url => (
    description =>
      'Retrieve the number of tweets that link to a particular URL.',
    path     => '/tweetcount',
    method   => 'GET',
    params   => [qw/q batch key/],
    required => [qw/q key/],
    expected => [qw/200/],
);

net_api_method good_tweets_by_url => (
    description =>
      'Retrieve filtered tweets that link to a given URL with both shortened and unshortened links. This returns a subset of Tweets by URL.',
    path     => '/goodtweets',
    method   => 'GET',
    params   => [qw/q key/],
    required => [qw/q key/],
    expected => [qw/200/],
);

1;

=head1 SYNOPSIS

  use Net::Backtweet;
  my $client = Net::Backtweet->new();
  my $res = $client->backtweet_search(q => 'http://lumberjaph.net/', key => $mykey);

=head1 DESCRIPTION

Net::Backtype is a client for the backtweet API.

=head2 METHODS

=over 4

=item B<tweets_by_url>

Retrieve the number of tweets that link to a particular URL.

See L<http://www.backtype.com/developers/tweets-by-url>.

=item B<stats_by_url>

Retrieve the number of tweets that link to a particular URL.

See L<http://www.backtype.com/developers/tweet-count>.

=item B<good_tweets_by_url>

Retrieve filtered tweets that link to a given URL with both shortened and unshortened links. This returns a subset of Tweets by URL.

See L<http://www.backtype.com/developers/good-tweets>.

=back

See L<http://backtweets.com/api> for more information about the backtweets API.
