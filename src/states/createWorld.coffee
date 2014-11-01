window.Model ||= {}

class window.CreateWorld

  create: () ->  
    @game.data.seed = 1
    console.info("Game world: #{@game.data.seed}")    
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
    console.debug("Created a world of #{quests.length}^2 maps")
    
    Math.seedrandom() # Be unpredictable now that generation is done
    @game.state.start('coreGame')
