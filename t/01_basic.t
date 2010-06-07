use strict;
use warnings;
use Test::More;

use HTTP::Response;
use Net::Backtype;
use Net::Backtweet;

ok my $backtype = Net::Backtype->new, 'object backtype created';
_add_handler($backtype);

ok my $res = $backtype->comments_search(
    key => 's3kr3tk3y',
    q   => 'http://lumberjaph.net'
  ),
  'got result for backtype query';

ok my $backtweet = Net::Backtweet->new, 'object backtweet created';
_add_handler($backtweet);

ok $res = $backtweet->stats_by_url(
    key => 's3kr3tk3y',
    q   => 'http://lumberjaph.net',
  ),
  'got result for backtweet query';

sub _add_handler {
    my $object = shift;
    $object->api_useragent->add_handler(
        'request_send' => sub {
            my $request  = shift;
            my $response = HTTP::Response->new(200);
            $response->header('Content-Type' => 'application/json');
            $response->content(
                '{"startindex" : 1, "itemsperpage" : 25, "since_ts" : 1275874078, "totalresults" : "500"}'
            );
            $response;
        }
    );
}

done_testing;
