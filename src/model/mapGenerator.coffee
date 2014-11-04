window.Model ||= {}

class window.Model.MapGenerator
  @validTypes = ['wilderness', 'town']  
  @TILE_SIZE = { width: 32, height: 32 }
  # This is in TILES, young spring chicken, not pixels.
  # Approximation for 144px is 5 tiles.
  HOUSE_SIZE = { width: 5, height: 5 }
  
  @generate: (width, height, type, x, y) -> # in tiles
    @_validateType(type)
    toReturn = new window.Model.Map(width, height) # empty field
    
    if (type == 'town')
      @_addHouse(toReturn)
      
    toReturn.x = x
    toReturn.y = y
    return toReturn
    
  @_validateType: (type) ->
    throw "Not sure how to generate #{type}" if type not in window.Model.MapGenerator.validTypes
    
  @_addHouse: (map) ->
    # NB: house-1 is 144x144px. Pick smartly the location.
    # Don't put it in a perimeter of two tiles; that'll be (or block) exits. 
    # This operation is in tiles, not pixels.
    x = Math.floor(Math.random() * (map.width - HOUSE_SIZE.width - 4)) + 2
    y = Math.floor(Math.random() * (map.height - HOUSE_SIZE.height - 4)) + 2
    map.addObject(new window.Model.Object('house 1', x, y)) 

