#! /usr/bin/env ruby

class Game
  @@game_age=0
  def Game.start
    @@game_age=0
    puts "Game begins!"
    until Game.over?
      Game.tick
    end
    puts "Game ends!"
  end

  def Game.age
    @@game_age
  end

  def Game.tick
    @@game_age += 1
    puts "Game tick!"
  end

  def Game.over?
    Game.age >= 100
  end
end
