class window.Preloader
  preload: () ->  
  
    ## Setup loading bar ##
    loadingBar = @game.add.sprite(0, 0, 'loadingBar')
    loadingBar.x = (@game.width - loadingBar.width) / 2
    loadingBar.y = (@game.height - loadingBar.height) * 2 / 3
    @load.setPreloadSprite(loadingBar)
    
    text = @game.add.text(0, 0, 'Loading ...', { fill: '#fff' })
    text.x = (@game.width - text.width) / 2
    text.y = (@game.height - text.height) / 2
    
    
    ## Load everything! ##
    # Common
    @game.load.image('blackout', 'assets/graphics/blackout.png')
    
    # TitleScreen
    @game.load.image('logo', 'assets/graphics/ui/title.png')

  create: () ->
    @game.state.start('titleScreen')
