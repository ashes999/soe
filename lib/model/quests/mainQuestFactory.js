(function() {

  window.Model || (window.Model = {});

  window.Model.MainQuestFactory = (function() {

    function MainQuestFactory() {}

    MainQuestFactory.createQuests = function(intro, ending) {
      var i, numSubQuests, subQuest, subQuests;
      numSubQuests = 2 + Math.floor(Math.random() * 3);
      subQuests = [];
      for (i = 0; 0 <= numSubQuests ? i <= numSubQuests : i >= numSubQuests; 0 <= numSubQuests ? i++ : i--) {
        subQuest = window.Model.Quest.create('PowerUp');
        subQuests.push(subQuest);
      }
      return subQuests;
    };

    return MainQuestFactory;

  })();

}).call(this);
