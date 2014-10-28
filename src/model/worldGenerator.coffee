window.Model ||= {}

class window.Model.WorldGenerator
    @generate: (width, height) -> # in maps
      return new window.Model.World(width, height)
