package Net::Backtype;

# ABSTRACT: client for the backtype API

use Moose;
use MooseX::Net::API;

our $VERSION = '0.02';

net_api_declare backtype => (
    base_url    => 'http://api.backtype.com',
    format      => 'json',
    format_mode => 'append',
);

net_api_method comments_search => (
    description => 'Search all the comments on BackType for a given string.',
    path        => '/comments/search',
    method      => 'GET',
    params      => [qw/key q start end/],
    required    => [qw/key q/],
    expected    => [qw/200/],
);

net_api_method comments_connect => (
    description => 'Retrieve all conversations related to a given URL.',
    path        => '/comments/connects',
    method      => 'GET',
    params      => [qw/key url sources sort/],
    required    => [qw/url key/],
    expected    => [qw/200/],
);

net_api_method comments_connect_stats => (
    description =>
      'Retrieve statistics on the conversations related to a given URL.',
    path     => '/comments/connect/stats/',
    method   => 'GET',
    params   => [qw/key url/],
    required => [qw/url key/],
    expected => [qw/200/],
);

net_api_method comments_author => (
    description => 'Retrieve comments written by a particular author.',
    path        => '/url/:url/comments',
    method      => 'GET',
    params      => [qw/key url/],
    required    => [qw/key url/],
    expected    => [qw/200/],
);

net_api_method comments_page => (
    description =>
      'Retrieve excerpts of comments published on a particular page.',
    path     => '/post/comments',
    method   => 'GET',
    params   => [qw/url key/],
    required => [qw/key url/],
    expected => [qw/200/],
);

net_api_method comments_page_stats => (
    description =>
      'Retrieve statistics for the comments published on a particular page.',
    path     => '/post/stats',
    method   => 'GET',
    params   => [qw/url key/],
    required => [qw/key url/],
    expected => [qw/200/],
);

1;

=head1 SYNOPSIS

  use Net::Backtype;
  my $client = Net::Backtype->new();
  my $res = $client->comments_page(url => 'http://...', key => $mykey);

=head1 DESCRIPTION

Net::Backtype is a client for the backtype API

=head2 METHODS

=over 4

=item B<comments_search>

Search all the comments on BackType for a given string.

See L<http://www.backtype.com/developers/comments-search>.

=item B<comments_connect>

Retrieve all conversations related to a given URL.

See L<http://www.backtype.com/developers/comments-connect>.

=item B<comments_connect_stats>

Retrieve statistics on the conversations related to a given URL.

See L<http://www.backtype.com/developers/comments-connect-stats>.

=item B<comments_author>

Retrieve comments written by a particular author.

See L<http://www.backtype.com/developers/url-comments>.

=item B<comments_page>

Retrieve excerpts of comments published on a particular page.

See L<http://www.backtype.com/developers/page-comments>.

=item B<comments_page_stats>

Retrieve statistics for the comments published on a particular page.

See L<http://www.backtype.com/developers/page-comments-stats>

=back
