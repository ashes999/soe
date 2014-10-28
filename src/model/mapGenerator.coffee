window.Model ||= {}

class window.Model.MapGenerator
  @generate: (width, height) -> # in tiles
    return new window.Model.Map(width, height)
