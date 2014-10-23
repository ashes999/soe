window.Model ||= {}

class window.Model.Quest

  @validTypes = ['Introduction', 'Main', 'FinalBattle']
  
  constructor: (@type) ->
  
  @create: (type) ->
    # TODO: randomly create a type of this.
    validate(type)

    # Create based on type, eg. "Introduction" creates a new window.Model.IntroductionQuest    
    return new window.Model["#{type}Quest"]()
  
  toString: () ->
    @constructor.name
      
  ## private methods ##
  
  validate = (type) ->
    throw "Invalid quest of type '#{type}'" if type not in Quest.validTypes
