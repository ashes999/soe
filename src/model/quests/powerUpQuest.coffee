Quest = window.Classes.get('Quest')

window.Classes.register('soe.model.quests.PowerUpQuest', class PowerUpQuest extends Quest
  constructor: () ->    
    @description = 'You power up your weapon by travelling to a location.'
)

window.Model.PowerUpQuest = PowerUpQuest
