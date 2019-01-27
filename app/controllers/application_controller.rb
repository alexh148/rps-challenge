require 'sinatra/base'
require_relative '../models/player'
require_relative '../models/game'

class RPS < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/user_name' do
    player = Player.new(params[:name])
    computer = Player.make_computer
    $game = Game.new(player, computer)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  post '/result' do
    @game = $game
    @game.player_1.choose(params[:rps_choice])
    @game.player_2.random_choose
    redirect '/winner' if @game.winner == @game.player_1
    redirect '/loser' if @game.winner == @game.player_2
    redirect '/draw' if @game.winner == 'draw'
  end

  get '/winner' do
    @game = $game
    erb(:winner)
  end

  get '/loser' do
    @game = $game
    erb(:loser)
  end

  get '/draw' do
    @game = $game
    erb(:draw)
  end

  run! if app_file == $0
end
