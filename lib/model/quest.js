(function() {
  var __indexOf = Array.prototype.indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  window.Model || (window.Model = {});

  window.Model.Quest = (function() {
    var validate;

    Quest.validTypes = ['introduction', 'main quest', 'final battle'];

    function Quest(type) {
      this.type = type;
    }

    Quest.create = function(type) {
      validate(type);
      return new window.Model.Quest(type);
    };

    Quest.prototype.toString = function() {
      return this.type;
    };

    validate = function(type) {
      if (__indexOf.call(Quest.validTypes, type) < 0) {
        throw "Invalid quest of type '" + type + "'";
      }
    };

    return Quest;

  })();

}).call(this);
