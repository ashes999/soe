window.Model ||= {}

class window.Model.MainQuestFactory
  @createQuests: (intro, ending) ->
    numSubQuests = 2 + Math.floor(Math.random() * 3) # 2-4
    
    subQuests = []        
    for i in [0 .. numSubQuests]
      subQuest = window.Model.Quest.create('PowerUp')
      subQuests.push(subQuest)
      
    return subQuests
