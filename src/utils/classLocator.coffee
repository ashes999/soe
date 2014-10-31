# Class locator
class window.Classes
  @data = {}
  
  @register: (key, clazz) ->
    Classes.data[key] = clazz
  
  @get: (keySubstring) ->
    candidates = Object.keys(Classes.data).filter (key) -> key.indexOf(keySubstring) > -1

    throw "Can't find a class matching #{keySubstring}; options are: #{Object.keys(Classes.data)}" if candidates.length == 0

    # only match
    return Classes.data[candidates[0]] if candidates.length == 1

    # exact match: ends with .keySubstring (eg. .Map)
    return Classes.data[key] for key in candidates when key.indexOf(".#{keySubstring}") == key.length - keySubstring.length - 1      

    throw "Found multiple classes for #{keySubstring}: #{candidates}"
