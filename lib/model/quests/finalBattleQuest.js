(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  window.Model || (window.Model = {});

  window.Model.FinalBattleQuest = (function(_super) {

    __extends(FinalBattleQuest, _super);

    function FinalBattleQuest() {
      this.description = 'You face off against an ancient evil.';
    }

    return FinalBattleQuest;

  })(window.Model.Quest);

}).call(this);
