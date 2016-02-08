INSTRUCTIONS:

Fork this repo, and clone to your local machine
	git clone git@github.com:makersacademy/rps-challenge.git
In the Gemfile, ensure ruby version is 2.2.3 in order to run RSpec tests (from project root directory)
Run the command: gem install bundle
When the installation completes, run: bundle
Ensure you open irb, or pry from the project directory.

ABOUT:		

This is a project/challenge set by the coding bootcamp Makers Academy and then completed by the AUTHOR as a learning assignment.

Consequently, all scripts not included in the 'app', 'lib' or 'spec' directory are the work of the staff at Makers Academy.
This README therefore only relates to these three directories.

The challenge is to build a simple online Rock Paper Scissors game that you can play against the computer from a locally hosted webpage.

MY APPROACH:



THINGS I NEED TO DO


1.



USER STORIES:

As a marketeer
So that I can see my name in lights
I would like to register my name before playing an online game

As a marketeer
So that I can enjoy myself away from the daily grind
I would like to be able to play rock/paper/scissors


USAGE GUIDE:
```ruby
irb
2.2.3 :001 > require './lib/player.rb'
 => true
2.2.3 :002 > player = Player.new('viola')
 => #<Player:0x007ffe65075948 @name="viola", @turn_klass=Turn>
2.2.3 :003 > opponent = Opponent.new('Johny')
 => #<Opponent:0x007ffe65015750 @name="Johny", @weapon=nil>
2.2.3 :004 > opponent.assign_weapon("scissors")
 => #<Opponent:0x007ffe65015750 @name="Johny", @weapon=:scissors>
2.2.3 :005 > opponent
 => #<Opponent:0x007ffe65015750 @name="Johny", @weapon=:scissors>
2.2.3 :006 > player.new_turn("rock", opponent)
 => #<Turn:0x007ffe640ee768 @p1_weapon=:rock, @p2_weapon=:scissors>
2.2.3 :007 > player.result
 => :win
```

CLASSES:

App
Game
computer
Player



	Methods:



	Private Methods:





LICENSE:	This project is licensed under the terms of the MIT license.
		see LICENSE.md

AUTHORS: 	Viola Crellin
CONTACT: 	viola.crellin@gmail.com

PROJECT CONTENTS:

      Gemfile
			Gemfile.lock
			Rakefile
			README.md - a description of the challenge set by MakersAcademy
      app directory

			lib directory

			spec directory

				feature_spec directory
