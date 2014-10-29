window.Model ||= {}
window.Model.Events ||= {}

class window.Model.Events.MapTransition
  constructor: (@x, @y, @destination, @destX, @destY, @direction) ->
