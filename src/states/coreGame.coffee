class window.CoreGame
  # He has to feel fast, not sluggish. Fighting skill is big in this game.
  PLAYER_MOVE_SPEED = 256
  PLAYER_FRAME_RATE = 6
  
  create: () ->
    # TODO: world is only one map big. Make it bigger.
    # TODO: map is only as big as your screen. Make it bigger.
    # TODO: data-driven. events drive map locations, which use template maps. OR,
    #       alternatively, generate everything with PCG factories
    #       (eg. MapMaker.Make("Meadow"), MapMaker.Make("Dungeon")
        
    TILE_SIZE = { width: 64, height: 64 }        
    mapWidth = Math.ceil(@game.width / TILE_SIZE.width)
    mapHeight = Math.ceil(@game.height / TILE_SIZE.height)
    console.debug("Map is #{mapWidth}x#{mapHeight} tiles")
    
    for y in [0 .. mapHeight]
      for x in [0 .. mapWidth]
          tile = game.add.sprite(game.world.centerX, game.world.centerY, 'top outside tiles')
          tile.x = x * TILE_SIZE.width
          tile.y = y * TILE_SIZE.height
          
    @game.physics.startSystem(Phaser.Physics.ARCADE) # needed for velocity
    
    @player = game.add.sprite(game.world.centerX, game.world.centerY, 'hero 1')
    @player.animations.add('down', [0, 1, 2], PLAYER_FRAME_RATE, true)
    @player.animations.add('left', [3, 4, 5], PLAYER_FRAME_RATE, true)
    @player.animations.add('right', [6, 7, 8], PLAYER_FRAME_RATE, true)
    @player.animations.add('up', [9, 10, 11], PLAYER_FRAME_RATE, true)
    @game.physics.enable(@player, Phaser.Physics.ARCADE)
    
    @game.camera.follow(@player)
    @cursors = game.input.keyboard.createCursorKeys()
    
  update: () ->
    if @cursors.left.isDown
      @player.body.velocity.x = -1 * PLAYER_MOVE_SPEED;
      @player.animations.play('left')
    else if @cursors.right.isDown
      @player.body.velocity.x = PLAYER_MOVE_SPEED;
      @player.animations.play('right')
    else
      @player.body.velocity.x = 0

    if @cursors.up.isDown
      @player.body.velocity.y = -1 * PLAYER_MOVE_SPEED;
      @player.animations.play('up')
    else if @cursors.down.isDown
      @player.body.velocity.y = PLAYER_MOVE_SPEED;
      @player.animations.play('down')
    else
      @player.body.velocity.y = 0
      
    @player.animations.stop() unless @cursors.up.isDown || @cursors.down.isDown ||
      @cursors.left.isDown || @cursors.right.isDown
