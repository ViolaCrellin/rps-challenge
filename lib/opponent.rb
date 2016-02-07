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

  attr_reader :name, :weapon


    def initialize(name, weapon=nil)
      @name = name
      @weapon = weapon
    end

    def assign_weapon(weapon)
      @weapon = weapon
    end

end
