package t::lib::TestSerializer;

use Dancer;

setting serializer => 'JSON';

get '/' => sub {
    { foo => 1 }
};

get '/blessed' => sub {
    require HTTP::Headers;
    my $r = HTTP::Request->new(GET => 'http://localhost');
    {request => $r};
};

post '/' => sub {
    request->params;
};

get '/error' => sub {
    send_error({foo => 42}, 401);
};

get '/error_bis' => sub {
    send_error(42, 402);
};
1;
