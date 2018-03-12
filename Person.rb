#! /usr/bin/env ruby

class Person
  def tick(
    list_visible_tiles, # this is a list of all the entity statuses on all tiles you can see.  Takes no time.
    take_from_tile, # this takes an entity out of the GameMap, and adds that thing to your inventory.  Takes time proportionate to the weight of the entity being taken.
    place_on_tile, # this takes an entity out of
    move_to_tile,
    attack_tile,
    check_weather,
    check_inventory,
    examine_self,
    current_feelings
  )

    entities = examine_surroundings.call

    behaviors = (0..3)
  end
end
