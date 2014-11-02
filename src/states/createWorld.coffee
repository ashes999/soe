window.Model ||= {}

class window.CreateWorld

  create: () ->
    # Check for an integer seed as a URL paramter
    paramSeed = @game.net.getQueryString('universe')
    paramSeed = parseInt(paramSeed, 10) unless !paramSeed?
    paramSeed = null if isNaN(paramSeed) || paramSeed < 0
    @game.data.seed = paramSeed || 1
    console.info("Game world: #{@game.data.seed}") 

    text = @game.add.text(0, 0, '', { fill: '#fff', font: '72px Arial' })
    text.text = "Universe: ##{@game.data.seed}"
    text.x = (@game.width - text.width) / 2
    text.y = (@game.height - text.height) / 2

    Math.seedrandom(@game.data.seed)
    
    intro = window.Model.Quest.create("Introduction")
    ending = window.Model.Quest.create("FinalBattle")
    mainQuests = window.Model.Quest.createMainQuests(intro, ending)
    
    quests = []
    quests.push(intro)
    quests.push(q) for q, i in mainQuests
    quests.push(ending)
    
    @game.data.quests = quests
    console.debug("Quests:")
    console.debug("\t#{i + 1}: #{quest}") for quest, i in quests

    @game.data.world = window.Model.WorldGenerator.generate(quests.length, quests.length)
    console.debug("Created a world of #{quests.length}x#{quests.length} maps")
    
    Math.seedrandom() # Be unpredictable now that generation is done
    
    # Fade out and in
    @blackout = @game.add.sprite(0, 0, 'blackout')
    
    @fadeOutTween = @game.add.tween(@blackout)
    @fadeOutTween.to({ alpha: 1 }, 1000, null)
    @fadeOutTween.onComplete.add(() ->
      @game.state.start('coreGame')
    , this)    
    
    fadeInTween = @game.add.tween(@blackout)
    fadeInTween.to({ alpha: 0 }, 1000, null)
    fadeInTween.start()
    
  update: () ->       
    if (@game.input.activePointer.isDown && @blackout.alpha == 0)
      @fadeOutTween.start()
