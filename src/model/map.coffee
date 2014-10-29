window.Model ||= {}

TILE_INDICIES = {
  'clear': 0,
  'wall': 1
}

class window.Model.Map
  constructor: (@width, @height) ->
    @tiles = []
    for x in [0 ... @width]
      current = []
      # Tile data is just the image frame
      for y in [0 ... @height]
        # Create a walled perimeter
        tile = TILE_INDICIES['clear']
        tile = TILE_INDICIES['wall'] if (x == 0 || y == 0 || x == @width - 1 || y == @height - 1)
        current.push(tile)
      @tiles.push(current)
      
  get: (x, y) ->
    return @tiles[x][y]
    
  clear: (x, y) ->
    @tiles[x][y] = TILE_INDICIES['clear']
    console.info("&nbsp;&nbsp;&nbsp;&nbsp;clearing #{x}, #{y} on #{@x}, #{@y}")
