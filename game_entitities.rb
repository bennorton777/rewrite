#! /usr/bin/env ruby

require 'securerandom'
require_relative 'game_maps'

class Entity

  @@id = nil
  @@location = nil

  def initialize(location)
    @@id = SecureRandom.hex(13)
    raise "Failed to place entity on tile" unless GameMap.put_entity(self, location)
  end

  def set_location(location)
    @@location = location
  end

  def id
    @@id
  end

  def type
    raise "Root entity has no type - type method must be overridden."
  end

  def location
    @@location
  end
end
