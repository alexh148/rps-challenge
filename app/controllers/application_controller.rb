require 'sinatra/base'

class RPS < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") } 

  get '/' do
    erb(:index)
  end

  run! if app_file == $0
end
