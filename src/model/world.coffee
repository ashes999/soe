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

    @_connectMaps()

    # Set the starting map.
    # TODO: make this a specific map.
    @currentMap = @maps[0][0]
    
  # Connect every map to every other adjacent map
  _connectMaps: () ->
    for x in [0 ... @width]
      for y in [0 ... @height]
        m = @maps[x][y]
        console.info("Connecting map #{m.x}, #{m.y}")
        @_connect('left', m, @maps[x - 1][y]) if x > 0
        @_connect('right', m, @maps[x + 1][y]) if x < @width - 1
        @_connect('up', m, @maps[x][y - 1]) if y > 0
        @_connect('down', m, @maps[x][y + 1]) if y < @height - 1
      
  # create a two-way connection between these two maps. Creates it on the
  # <direction> side of the <source> map, and the opposite side of <destination>.
  _connect: (direction, source, destination) ->
    console.info("&nbsp;&nbsp;connecting #{source.x}, #{source.y} to #{destination.x}, #{destination.y}")
    coordinates = @_getCoordinates(source, direction)
    source.clear(coordinates.x, coordinates.y)

    opposite_direction = @_opposite_of(direction)
    coordinates = @_getCoordinates(destination, opposite_direction)
    destination.clear(coordinates.x, coordinates.y)
    
  _opposite_of: (direction) ->
    return 'left' if direction == 'right'
    return 'right' if direction == 'left'
    return 'up' if direction == 'down'
    return 'down' if direction == 'up'
    throw "Unknown direction: #{direction}"
    
  _getCoordinates: (map, direction) ->
    return { 'x': Math.floor(map.width / 2), 'y': 0 } if direction == 'up'
    return { 'x': Math.floor(map.width / 2), 'y': map.height - 1 } if direction == 'down'
    return { 'x': 0, 'y': Math.floor(map.height / 2) } if direction == 'left'
    return { 'x': map.width - 1, 'y': Math.floor(map.height / 2) } if direction == 'right'
    throw "Unknown direction: #{direction}"
