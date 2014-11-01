window.Model ||= {}

class window.Model.World
  constructor: (@width, @height) ->
    @maps = []
    for x in [0 ... @width]
      current = []      
      for y in [0 ... @height]
        map = window.Model.MapGenerator.generate(25, 19, 'wilderness')
        map.x = x
        map.y = y
        current.push(map)
        
      @maps.push(current)

    townX = Math.floor(Math.random() * @width)
    townY = Math.floor(Math.random() * @height)
    
    console.debug("Town generated at #{townX}, #{townY}")
    @maps[townX][townY] = window.Model.MapGenerator.generate(25, 19, 'town')

    @_connectMaps()

    # Set the starting map.
    # TODO: make this a specific map.
    @currentMap = @maps[0][0]
    
  # Connect every map to every other adjacent map
  _connectMaps: () ->
    for x in [0 ... @width]
      for y in [0 ... @height]
        m = @maps[x][y]
        # Note: this connects everything twice, eg. (0, 0) -> (1, 0) and (1, 0) -> (0, 0)
        # Map.addTransition handles not adding duplicates of existing transitions
        @_connect('left', m, @maps[x - 1][y]) if x > 0
        @_connect('right', m, @maps[x + 1][y]) if x < @width - 1
        @_connect('up', m, @maps[x][y - 1]) if y > 0
        @_connect('down', m, @maps[x][y + 1]) if y < @height - 1
      
  # create a two-way connection between these two maps. Creates it on the
  # <direction> side of the <source> map, and the opposite side of <destination>.
  _connect: (direction, source, destination) ->
    coordinates = @_getCoordinates(source, direction)
    opposite_direction = @_oppositeOf(direction)    
    opposite_coordinates = @_getCoordinates(destination, opposite_direction)
    
    @_addTransition(source, coordinates.x, coordinates.y, destination, opposite_coordinates.x, opposite_coordinates.y, direction)
    @_addTransition(destination, opposite_coordinates.x, opposite_coordinates.y, source, coordinates.x, coordinates.y, opposite_direction)
    
    if (direction == 'left' || direction == 'right')
      @_addTransition(source, coordinates.x, coordinates.y + 1, destination, opposite_coordinates.x, opposite_coordinates.y, direction) if coordinates.y < source.height - 1
      @_addTransition(source, coordinates.x, coordinates.y - 1, destination, opposite_coordinates.x, opposite_coordinates.y, direction) if coordinates.y > 0        
      @_addTransition(destination, opposite_coordinates.x, opposite_coordinates.y + 1, source, coordinates.x, coordinates.y, opposite_direction) if opposite_coordinates.y < destination.height - 1
      @_addTransition(destination, opposite_coordinates.x, opposite_coordinates.y - 1, source, coordinates.x, coordinates.y, opposite_direction) if opposite_coordinates.y > 0
    
    if (direction == 'up' || direction == 'down')
      @_addTransition(source, coordinates.x + 1, coordinates.y, destination, opposite_coordinates.x, opposite_coordinates.y, direction) if coordinates.x < source.width - 1
      @_addTransition(source, coordinates.x - 1, coordinates.y, destination, opposite_coordinates.x, opposite_coordinates.y, direction) if coordinates.x > 0        
      @_addTransition(destination, opposite_coordinates.x + 1, opposite_coordinates.y, source, coordinates.x, coordinates.y, opposite_direction) if opposite_coordinates.x < destination.width - 1
      @_addTransition(destination, opposite_coordinates.x - 1, opposite_coordinates.y, source, coordinates.x, coordinates.y, opposite_direction) if opposite_coordinates.x > 0

  _oppositeOf: (direction) ->
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
    
  # Clears a square on <map> at <x, y> and creates a transition to <target>.
  _addTransition: (map, x, y, target, targetX, targetY, direction) ->
    map.clear(x, y)
    t = new (Classes.get('Transition'))(x, y, target, targetX, targetY, direction)
    map.addTransition(t)
  
