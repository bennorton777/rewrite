#! /usr/bin/env ruby

class GameMap
  @@location_map = {}
  @@passable_types = [:blank]
  def GameMap.initialize(location_map)
    @@location_map = location_map;
    @@location_map.keys.each do |key|
      unless @@location_map[key].nil?
        @@location_map[key] = [@@location_map[key].to_sym, :blank]
      end
    end
  end

  def GameMap.get_entities(location)
    @@location_map[GameMap.key_for(location)] || [:blank]
  end

  def GameMap.remove_entity(entity)
    key = GameMap.key_for(entity.location)
    @@location_map[key].delete(entity.id)
    if @@location_map[key] == [:blank]
      @@location_map.delete(key)
    end
  end

  def GameMap.move_entity(entity, new_place)
    return false unless entity.can_move
    return false unless GameMap.put_entity(entity, new_place)
    GameMap.remove_entity(entity)
    true
  end

  def GameMap.put_entity(entity, place)
    return false unless GameMap.can_put(entity, place)
    key = GameMap.key_for(place)
    if @@location_map[key].nil?
      @@location_map[key] = [:blank]
    end
    @@location_map[GameMap.key_for(place)] << entity.id
    entity.set_location(place)
    true
  end

  def GameMap.key_for(location)
    [location[:x], location[:y]].join("/")
  end

  def GameMap.can_put(entity, new_place)
    entities_on_tile = @@location_map[GameMap.key_for(new_place)]
    entities_on_tile.all{|e| (e != entity.type) && @@passable_types.include?(entity.type)}
  end
end

