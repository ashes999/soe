class window.CreateWorld

  create: () ->
    @game.data.seed = 1
    console.info("Game world: #{@game.data.seed}")    
    Math.seedrandom(@game.data.seed)
    
    intro = window.Model.Quest.create("introduction")
    mainQuest = window.Model.Quest.create("main quest")
    ending = window.Model.Quest.create("final battle")
    quests = [intro, mainQuest, ending]
    @game.data.quests = quests
    alert("Game quests are #{@game.data.quests}")
    
    Math.seedrandom() # Be unpredictable now that generation is done
    #@game.state.start('coreGame')
