require_relative 'turn'
require_relative 'computer'

class Opponent

  class << self

    def opponents
      @opponents ||= {}
    end

    def add(player_id, name)
      opponents[player_id] = name
    end

    def look_up(player_id)
      opponents[player_id]
    end
  end

  attr_reader :name
  attr_accessor :weapon


    def initialize(name)
      @name = name
      @weapon = "potatoe"
    end

    def assign_weapon(weapon_chosen)
      @weapon = weapon_chosen.to_sym
      # self
    end

end
