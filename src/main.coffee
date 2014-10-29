# TODO: 1024x768.
GAME_WIDTH = 800
GAME_HEIGHT = 600

window.onload = () ->  
  @game = new Phaser.Game(GAME_WIDTH, GAME_HEIGHT, Phaser.CANVAS, '')
  
  @game.state.add('boot', new window.Boot)
  @game.state.add('preLoader', new window.Preloader)
  @game.state.add('titleScreen', new window.TitleScreen)
  @game.state.add('createWorld', new window.CreateWorld)
  @game.state.add('coreGame', new window.CoreGame)
  
  @game.data = {} # my game data
  @game.state.start('boot')
  
  fail()
