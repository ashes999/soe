window.Model ||= {}

class window.CreateWorld

  create: () ->  
    @game.data.seed = 1
    console.info("Game world: #{@game.data.seed}")    
    Math.seedrandom(@game.data.seed)
    
    @game.data.world = window.Model.WorldGenerator.generate(2, 1)
    
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
    
    Math.seedrandom() # Be unpredictable now that generation is done
    @game.state.start('coreGame')
