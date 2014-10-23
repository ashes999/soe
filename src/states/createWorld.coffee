class window.CreateWorld

  create: () ->
    @game.data.seed = 1
    console.info("Game world: #{@game.data.seed}")    
    Math.seedrandom(@game.data.seed)
    
    intro = window.Model.Quest.create("Introduction")
    mainQuest = window.Model.Quest.create("Main")
    ending = window.Model.Quest.create("FinalBattle")
    quests = [intro, mainQuest, ending]
    @game.data.quests = quests
    alert("Game quests are #{@game.data.quests}")
    
    Math.seedrandom() # Be unpredictable now that generation is done
    #@game.state.start('coreGame')
