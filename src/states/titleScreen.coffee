class window.TitleScreen

  create: () ->
    logo = game.add.sprite(game.world.centerX, game.world.centerY, 'logo')
    logo.anchor.setTo(0.5, 0.5)
    
    @blackout = @game.add.sprite(0, 0, 'blackout')
    
    @fadeOutTween = @game.add.tween(@blackout)
    @fadeOutTween.to({ alpha: 1 }, 1000, null)
    @fadeOutTween.onComplete.add(() ->
      @game.state.start('createWorld')
    , this)    
    
    fadeInTween = @game.add.tween(@blackout)
    fadeInTween.to({ alpha: 0 }, 1000, null)
    fadeInTween.start()
    
  update: () ->       
    if (game.input.activePointer.isDown && @blackout.alpha == 0)
      @fadeOutTween.start()
