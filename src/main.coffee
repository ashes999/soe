# TODO: check average screen size and increase to 1024x768.
# Note: we need that console for troubleshooting (currently 400px wide).
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
