GAME_WIDTH = 1024
GAME_HEIGHT = 768

class State
  constructor: () ->
  
  preload: () ->    
    game.load.image('logo', 'assets/graphics/ui/title.png')

  create: () ->
      logo = game.add.sprite(game.world.centerX, game.world.centerY, 'logo')
      logo.anchor.setTo(0.5, 0.5)

window.onload = () ->  
  @game = new Phaser.Game(GAME_WIDTH, GAME_HEIGHT, Phaser.AUTO, '', new State)

