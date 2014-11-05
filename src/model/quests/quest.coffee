window.Model ||= {}

window.Classes.register('soe.model.model.quests.Quest', class Quest
  ###
  # A basic quest (go somewhere and do something). Not a composite.
  # Base type with common attributes. Handles factory-like construction.
  # Delegates to specific types, eg. new IntroductionQuest
  ###

  @validTypes = ['Introduction', 'FinalBattle', 'PowerUp']
  
  constructor: (@type) ->
  
  @create: (type) ->
    # TODO: randomly create a variation of this.
    validate(type)

    # Create based on type, eg. "Introduction" creates a new window.Model.IntroductionQuest    
    return new window.Model["#{type}Quest"]()

  @createMainQuests: (intro, ending) ->
    numSubQuests = 2 + Math.ceil(Math.random() * 3) # 3-5
    console.debug("#{numSubQuests} sub-quests")
    
    subQuests = []        
    for i in [0 ... numSubQuests]
      subQuest = Quest.create('PowerUp')
      subQuests.push(subQuest)
      
    return subQuests
  
  # For debugging only. Remove it later.
  toString: () ->
    "#{@constructor.name}: #{@description}"
      
  ## private methods ##
  
  validate = (type) ->
    throw "Invalid quest of type '#{type}'" if type not in Quest.validTypes
)

window.Model.Quest = Quest
