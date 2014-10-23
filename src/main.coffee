GAME_WIDTH = 1024
GAME_HEIGHT = 768

window.onload = () ->  
  @game = new Phaser.Game(GAME_WIDTH, GAME_HEIGHT, Phaser.CANVAS, '')
  
  @game.state.add('boot', new window.Boot)
  @game.state.add('preLoader', new window.Preloader)
  @game.state.add('titleScreen', new window.TitleScreen)
  @game.state.add('coreGame', new window.CoreGame)
  
  @game.state.start('boot')

