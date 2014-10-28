window.Model ||= {}

class window.Model.Map
  constructor: (@width, @height) ->
    @tiles = []
    for y in [0 ... @height]
      current = []      
      current.push(0) for x in [0 ... @width]
      @tiles.push(current)
