Quest = window.Classes.get('Quest')
window.Classes.register('soe.model.quests.FinalBattleQuest', class FinalBattleQuest extends Quest
  constructor: () ->
    # Spoiler: you thought it was the weapon that was being powered up all along.
    # But it was you. Your eman reflects through the weapon. It's all you.
    @description = 'You face off against an ancient evil.'
)

window.Model.FinalBattleQuest = FinalBattleQuest
