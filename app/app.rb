require 'sinatra/base'
require 'rack'
require_relative '../lib/player'
require_relative '../lib/turn'

class RPS < Sinatra::Base
  use Rack::Session::Pool, :expire_after => 2592000
  set :sesion_secret, "super secret"

  helpers do
    def session_player
      Player.look_up(session[:player_id])
    end

    def remember(player)
      player_id = player.object_id
      Player.add(player_id, player)
      session[:player_id] = player_id
    end

    def opponent
      Player.look_up(session[:opponent_id])
    end

    def assign(opponent)
      opponent_id = opponent.object_id
      Player.add(opponent_id, opponent)
      session[:opponent_id] = opponent_id
    end

  end

  get '/' do
    erb :index
  end

  post '/name' do
    if params[:opponent_name] == "Computer"
      remember(Player.new(params[:player_name]))
      redirect '/play'
    else
      remember(Player.new(params[:player_name]))
      assign(Player.new(params[:opponent_name]))
      redirect '/multiplayer_check'
    end
  end

  get '/play' do
    if session_player.name.length >1
      @player = session_player.name
    else
      @player = opponent.name
    end
    erb :play
  end

  get '/multiplayer_check' do
    if session_player.name.length > 1
      redirect '/multiplayer'
    else
      redirect '/play'
    end
  end

  get '/multiplayer' do
    @player = session_player.name
    @opponent = opponent.name
    erb :multiplayer
  end

  post '/play' do
    weapon_choice = params[:weapon_choice]
    session_player.new_turn(weapon_choice)
    redirect '/the_choices'
  end

  get '/the_choices' do
    @player = session_player.name
    @p1_weapon = session_player.p1_weapon
    @p2_weapon = session_player.opponent_weapon
    @result = session_player.result
    erb :the_choices
  end

  run! if app_file == $0
end
