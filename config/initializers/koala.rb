# config/initializers/koala.rb
require 'koala'

Koala.configure do |config|
  config.api_version = 'v2.1'
  # config.graph_server = 'my-graph-mock.mysite.com'
  # other common options are `rest_server` and `dialog_host`
  # see lib/koala/http_service.rb
end