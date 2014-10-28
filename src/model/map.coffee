window.Model ||= {}

class window.Model.Map
  constructor: (@width, @height) ->
    @tiles = []
    for x in [0 ... @width]
      current = []      
      current.push(0) for y in [0 ... @height]
      @tiles.push(current)
