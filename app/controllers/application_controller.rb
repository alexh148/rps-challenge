require 'sinatra/base'

class RPS < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/user_name' do
    session[:name] = params[:name]
    redirect '/play'
  end

  get '/play' do
    @name = session[:name]
    erb(:play)
  end

  run! if app_file == $0
end
