window.Model ||= {}

TILE_INDICIES = {
  'clear': 0,
  'wall': 1
}

class window.Model.Map
  constructor: (@width, @height) ->
    @tiles = []
    @objects = [] # solid objects
    
    for x in [0 ... @width]
      current = []
      # Tile data is just the image frame
      for y in [0 ... @height]
        # Create a walled perimeter
        tile = TILE_INDICIES['clear']
        tile = TILE_INDICIES['wall'] if (x == 0 || y == 0 || x == @width - 1 || y == @height - 1)
        current.push(tile)
      @tiles.push(current)
      
    @transitions = []
      
  get: (x, y) ->
    return @tiles[x][y]
    
  clear: (x, y) ->
    @tiles[x][y] = TILE_INDICIES['clear']
    
  addObject: (o) ->
    @objects.push(o)
    
  transitionAt: (x, y) ->
    return t for t in @transitions when t.x == x && t.y == y
  
  # create a two-way connection between these two maps. Creates it on the
  # <direction> side of the <source> map, and the opposite side of <destination>.
  connect: (direction, destination) ->
    source = this
    coordinates = @_getCoordinates(source, direction)
    opposite_direction = @_oppositeOf(direction)    
    opposite_coordinates = @_getCoordinates(destination, opposite_direction)
    
    source.addTransition(coordinates.x, coordinates.y, destination, opposite_coordinates.x, opposite_coordinates.y, direction)
    destination.addTransition(opposite_coordinates.x, opposite_coordinates.y, source, coordinates.x, coordinates.y, opposite_direction)
    
    if (direction == 'left' || direction == 'right')
      source.addTransition(coordinates.x, coordinates.y + 1, destination, opposite_coordinates.x, opposite_coordinates.y, direction) if coordinates.y < source.height - 1
      source.addTransition(coordinates.x, coordinates.y - 1, destination, opposite_coordinates.x, opposite_coordinates.y, direction) if coordinates.y > 0        
      destination.addTransition(opposite_coordinates.x, opposite_coordinates.y + 1, source, coordinates.x, coordinates.y, opposite_direction) if opposite_coordinates.y < destination.height - 1
      destination.addTransition(opposite_coordinates.x, opposite_coordinates.y - 1, source, coordinates.x, coordinates.y, opposite_direction) if opposite_coordinates.y > 0
    
    if (direction == 'up' || direction == 'down')
      source.addTransition(coordinates.x + 1, coordinates.y, destination, opposite_coordinates.x, opposite_coordinates.y, direction) if coordinates.x < source.width - 1
      source.addTransition(coordinates.x - 1, coordinates.y, destination, opposite_coordinates.x, opposite_coordinates.y, direction) if coordinates.x > 0        
      destination.addTransition(opposite_coordinates.x + 1, opposite_coordinates.y, source, coordinates.x, coordinates.y, opposite_direction) if opposite_coordinates.x < destination.width - 1
      destination.addTransition(opposite_coordinates.x - 1, opposite_coordinates.y, source, coordinates.x, coordinates.y, opposite_direction) if opposite_coordinates.x > 0

  # Clears a square on <map> at <x, y> and creates a transition to <target>.
  addTransition: (x, y, target, targetX, targetY, direction) ->
    this.clear(x, y)
    t = new window.Model.MapTransition(x, y, target, targetX, targetY, direction)
    this._addTransition(t)

  _addTransition: (t) ->
    dupe = e for e in @transitions when e.x == t.x && e.y == t.y
    if !dupe?      
      @transitions.push(t)

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
  
  toString: () ->
    return "Map (#{@x}, #{@y})"
