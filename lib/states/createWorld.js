(function() {

  window.CreateWorld = (function() {

    function CreateWorld() {}

    CreateWorld.prototype.create = function() {
      var ending, intro, mainQuest, quests;
      this.game.data.seed = 1;
      console.info("Game world: " + this.game.data.seed);
      Math.seedrandom(this.game.data.seed);
      intro = window.Model.Quest.create("introduction");
      mainQuest = window.Model.Quest.create("main quest");
      ending = window.Model.Quest.create("final battle");
      quests = [intro, mainQuest, ending];
      this.game.data.quests = quests;
      alert("Game quests are " + this.game.data.quests);
      return Math.seedrandom();
    };

    return CreateWorld;

  })();

}).call(this);
