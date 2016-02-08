require_relative 'turn'
require_relative 'computer'

class Player

  class << self

    def players
      @players ||= {}
    end

    def add(player_id, name)
      players[player_id] = name
    end

    def look_up(player_id)
      players[player_id]
    end
  end

  attr_reader :name, :p1_weapon, :turn_klass, :turn


    def initialize(name, turn_klass=Turn)
      @name = name
      @turn_klass = turn_klass
    end


    def new_turn(p1_weapon, p2=ComputerTurn.new)
      @p1_weapon = p1_weapon.to_sym
      @turn = turn_klass.new(@p1_weapon, p2.weapon)
    end

    def opponent_weapon
      turn.p2_weapon
    end

    def result
      turn.result
    end
end
