require 'json'
require 'sinatra/base'
require 'sinatra/json'

class App < Sinatra::Base
  set :bind, '0.0.0.0'
  set :port, '4569'

  get '/' do
    '/playerone'
  end

  get '/playerone' do
    # json( { wins: 32}, encoder: :to_json, content_type: :json)
    json({:foo => 'bar'}, :encoder => :to_json, :content_type => :js)

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
