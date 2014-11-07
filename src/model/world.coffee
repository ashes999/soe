window.Model ||= {}

class window.Model.World
  constructor: (@width, @height) ->
    @maps = []
    for x in [0 ... @width]
      current = []      
      for y in [0 ... @height]
        map = window.Model.MapGenerator.generate(25, 19, 'wilderness', x, y)
        current.push(map)
        
      @maps.push(current)

    townX = Math.floor(Math.random() * @width)
    townY = Math.floor(Math.random() * @height)
    
    console.debug("Town generated at #{townX}, #{townY}")
    @maps[townX][townY] = window.Model.MapGenerator.generate(25, 19, 'town', townX, townY)

    @_connectMaps()

    # Set the starting map.
    @currentMap = @maps[townX][townY]
    
  # Connect every map to every other adjacent map
  _connectMaps: () ->
    for x in [0 ... @width]
      for y in [0 ... @height]
        m = @maps[x][y]
        # Note: this connects everything twice, eg. (0, 0) -> (1, 0) and (1, 0) -> (0, 0)
        # Map.addTransition handles not adding duplicates of existing transitions
        m.connect('left', @maps[x - 1][y]) if x > 0
        m.connect('right', @maps[x + 1][y]) if x < @width - 1
        m.connect('up', @maps[x][y - 1]) if y > 0
        m.connect('down', @maps[x][y + 1]) if y < @height - 1
