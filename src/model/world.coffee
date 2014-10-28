window.Model ||= {}

class window.Model.World
  constructor: (@width, @height) ->
    @maps = []
    for x in [0 ... @width]
      current = []      
      for y in [0 ... @height]
        map = window.Model.MapGenerator.generate(25, 19)
        map.x = x
        map.y = y
        current.push(map)
        
      @maps.push(current)

    @currentMap = @maps[1][0]
    
