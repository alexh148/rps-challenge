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
    $player = Player.new(params[:name])
    redirect '/play'
  end

  get '/play' do
    @player = $player
    erb(:play)
  end

  post '/result' do
    @player = $player
    @player.choose(params[:rps_choice])
    $computer = Player.make_computer
    @computer = $computer
    @game = Game.new
    redirect '/winner' if @game.winner(@player, @computer) == @player
    redirect '/loser' if @game.winner(@player, @computer) == @computer
    redirect '/draw' if @game.winner(@player, @computer) == 'draw'
  end

  get '/winner' do
    @player = $player
    @computer = $computer
    erb(:winner)
  end

  get '/loser' do
    @player = $player
    @computer = $computer
    erb(:loser)
  end

  get '/draw' do
    @player = $player
    @computer = $computer
    erb(:draw)
  end

  run! if app_file == $0
end
