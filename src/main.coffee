class State
  constructor: () ->
  
  preload: () ->    
    game.load.image('logo', 'assets/graphics/phaser.png')

  create: () ->
      logo = game.add.sprite(game.world.centerX, game.world.centerY, 'logo')
      logo.anchor.setTo(0.5, 0.5)

window.onload = () ->  
  @game = new Phaser.Game(800, 600, Phaser.AUTO, '', new State)

