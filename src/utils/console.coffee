# URL contains "debug" parameter with value
DEBUG_MODE = /[?&]debug=/.test(location.href)

window.toggleConsole = ->
  console = document.getElementById('console')
  link = document.getElementById('toggleConsole')
  showIt = console.style.display is 'none'
  if showIt
    console.style.display = 'block'
    link.innerText = 'Hide Console'
  else
    console.style.display = 'none'
    link.innerText = 'Show Console'

window.clearConsole = ->
  document.getElementById('console').innerHTML = ''

# Take over console.log, console.debug, console.error, and console.info
# Also take over window.onError to log other uncaught errors to the console
log = (color, message) ->
  html = "<p style='color: #{color};'>#{message}</span></p>"
  document.getElementById('console').innerHTML += html
  
if typeof window.console isnt 'undefined' and typeof window.console.log isnt 'undefined'
  window.console.olog = window.console.log
else
  window.console.olog = ->
  
window.console.debug = (message) ->
  if DEBUG_MODE
    window.console.olog(message)
    log('#888', message)

window.console.error = (message) ->
  window.console.olog(message)
  log('#f00', message)

window.onerror = (message, url, lineNumber) ->
  window.console.error("#{url}\tline #{lineNumber}:<br />#{message}")

window.console.info = (message) ->
  if DEBUG_MODE
    window.console.olog(message)
    log('#00f', message)
    
window.console.log = window.console.debug
