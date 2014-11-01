window.Model ||= {}

class window.Model.MapGenerator
  @validTypes = ['wilderness', 'town']
  
  @generate: (width, height, type) -> # in tiles
    @_validateType(type)
    toReturn = new window.Model.Map(width, height) # empty field
    
    if (type == 'town')
      @_addHouse(toReturn)
      
    return toReturn
    
  @_validateType: (type) ->
    throw "Not sure how to generate #{type}" if type not in window.Model.MapGenerator.validTypes
    
  @_addHouse: (map) ->
    # NB: house-1 is 144x144px. Pick smartly the location. 
    # This may be in a wall.
    x = Math.floor(Math.random() * (map.width / 2))
    y = Math.floor(Math.random() * (map.height / 2))
    map.addObject(new window.Model.Object('house 1', x, y))
    console.log("T at #{x}, #{y}")
