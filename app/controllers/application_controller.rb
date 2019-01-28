require 'sinatra/base'
require_relative '../models/player'
require_relative '../models/game'

class RPS < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  post '/user_name' do
    player = Player.new(params[:name])
    computer = Player.make_computer
    @game = Game.create(player, computer)
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  post '/result' do
    @game.player_1.choose(params[:rps_choice])
    @game.player_2.random_choose
    redirect '/winner'
  end

  get '/winner' do
    erb(:winner)
  end

  run! if app_file == $0
end
