(function() {

  window.Model || (window.Model = {});

  window.CreateWorld = (function() {

    function CreateWorld() {}

    CreateWorld.prototype.create = function() {
      var ending, i, intro, mainQuests, q, quest, quests, _len, _len2;
      this.game.data.seed = 1;
      console.info("Game world: " + this.game.data.seed);
      Math.seedrandom(this.game.data.seed);
      this.game.data.world = window.Model.WorldGenerator.generate(2, 2);
      intro = window.Model.Quest.create("Introduction");
      ending = window.Model.Quest.create("FinalBattle");
      mainQuests = window.Model.Quest.createMainQuests(intro, ending);
      quests = [];
      quests.push(intro);
      for (i = 0, _len = mainQuests.length; i < _len; i++) {
        q = mainQuests[i];
        quests.push(q);
      }
      quests.push(ending);
      this.game.data.quests = quests;
      console.debug("Quests:");
      for (i = 0, _len2 = quests.length; i < _len2; i++) {
        quest = quests[i];
        console.debug("\t" + (i + 1) + ": " + quest);
      }
      Math.seedrandom();
      return this.game.state.start('coreGame');
    };

    return CreateWorld;

  })();

}).call(this);
