require 'sinatra/base'
require 'rack'
require 'pry'
require_relative '../lib/player'
require_relative '../lib/turn'
require_relative '../lib/opponent'

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
      Opponent.look_up(session[:opponent_id])
    end

    def assign(opponent)
      opponent_id = opponent.object_id
      Opponent.add(opponent_id, opponent)
      session[:opponent_id] = opponent_id
    end

    # def no_session_player?
    #   session_player.name.length <1
    # end

  end

  get '/' do
    erb :index
  end

  post '/name' do
    if params[:opponent_name] == "Computer"
      remember(Player.new(params[:player_name]))
      redirect '/play'
    elsif params[:player_name].length < 1 && params[:opponent_name].length > 1
      remember(Player.new(params[:opponent_name]))
      redirect '/play'
    else
      remember(Player.new(params[:player_name]))
      assign(Opponent.new(params[:opponent_name]))
      redirect '/multiplayer'
    end
  end

  get '/play' do
    @player = session_player.name
    erb :play
  end

  post '/play' do
    session_player.new_turn(params[:weapon_choice])
    redirect '/the_choices'
  end

  get '/the_choices' do
    @p1_weapon = session_player.p1_weapon
    @p2_weapon = session_player.opponent_weapon
    @result = session_player.result
    @player = session_player.name
    erb :the_choices
  end

  get '/multiplayer' do
    @player = session_player.name
    @opponent_name = opponent.name
    erb :multiplayer
  end

  post '/multiplayer' do
    opponent.assign_weapon(params[:weapon_choice_2])
    session_player.new_turn(params[:weapon_choice_1], opponent)
    redirect '/the_result'
  end

  get '/the_result' do
    @player = session_player.name
    @p1_weapon = session_player.p1_weapon
    @opponent = opponent.name
    @p2_weapon = session_player.opponent_weapon
    @result = session_player.result
    erb :the_result
  end


  run! if app_file == $0
end
