# http://gmarik.info/blog/2010/05/10/blogging-with-jekyll-and-heroku-for-free

require 'rack'
require 'rack/contrib/try_static'

use Rack::TryStatic, 
    :root => "_site",  # static files root dir
    :urls => %w[/],     # match all requests 
    :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially
# otherwise 404 NotFound
run lambda { [404, {'Content-Type' => 'text/html'}, ['whoops! Not Found']]}


# static = Rack::Static.new \
#   :urls => ["/css", "/images"],
#   :root => "_site"

# use Rack::Static
  

# homepage = lambda do |env|
#     [
#      200, 
#      {
#        'Content-Type'  => 'text/html', 
#        'Cache-Control' => 'public, max-age=0' 
#      },
#      File.open('_site/index.html', File::RDONLY)
#     ]
# end

# map "/" do
#   run homepage
# end

 
