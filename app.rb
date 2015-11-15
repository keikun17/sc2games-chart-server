# Bundler.require

require 'sinatra/base'
require 'sinatra/asset_pipeline'

class App < Sinatra::Base
  register Sinatra::AssetPipeline

  set :haml, format: :html5
  set :bind, '0.0.0.0'
  set :port, '4569'

  get '/' do
    haml :index, layout: :layout
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
