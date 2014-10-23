window.Model ||= {}

class window.Model.Quest

  @validTypes = ['introduction', 'main quest', 'final battle']
  
  constructor: (@type) ->
  
  @create: (type) ->
    # TODO: randomly create a type of this.
    validate(type)
    
    # TODO: should there be subclasses, or factories? Certainly, there shouldn't
    # be one class that knows how to make all types of quests.
    return new window.Model.Quest(type)
  
  toString: () ->
    @type
  
  ## private methods ##
  
  validate = (type) ->
    throw "Invalid quest of type '#{type}'" if type not in Quest.validTypes
