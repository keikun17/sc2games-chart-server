require 'json'
require 'sinatra/base'
require 'sinatra/asset_pipeline'

class App < Sinatra::Base


  # Include these files when precompiling assets
  set :assets_precompile, %w(app.js app.css *.png *.jpg *.svg *.eot *.ttf *.woff *.woff2 *.sass)

  # Sprockets : Logical paths to your assets
  set :assets_prefix, %w(assets vendor/assets)
  # Sprockets : CSS minification
  set :assets_css_compressor, :sass

  # Sprockets : JavaScript minification
  set :assets_js_compressor, :uglifier

  # Sprockets : Register the AssetPipeline extention, make sure this goes after all customization
  register Sinatra::AssetPipeline

  set :haml, format: :html5
  set :bind, '0.0.0.0'
  set :port, '4569'

  get '/' do
    haml :index, layout: :layout
  end

  get '/playerone' do
    json( { wins: 32}, encoder: :to_json, content_type: :json)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
