(function() {
  var TILE_INDICIES;

  window.Model || (window.Model = {});

  TILE_INDICIES = {
    'clear': 0,
    'wall': 1
  };

  window.Model.Map = (function() {

    function Map(width, height) {
      var current, tile, x, y, _ref, _ref2;
      this.width = width;
      this.height = height;
      this.tiles = [];
      for (x = 0, _ref = this.width; 0 <= _ref ? x < _ref : x > _ref; 0 <= _ref ? x++ : x--) {
        current = [];
        for (y = 0, _ref2 = this.height; 0 <= _ref2 ? y < _ref2 : y > _ref2; 0 <= _ref2 ? y++ : y--) {
          tile = TILE_INDICIES['clear'];
          if (x === 0 || y === 0 || x === this.width - 1 || y === this.height - 1) {
            tile = TILE_INDICIES['wall'];
          }
          current.push(tile);
        }
        this.tiles.push(current);
      }
      this.transitions = [];
    }

    Map.prototype.get = function(x, y) {
      return this.tiles[x][y];
    };

    Map.prototype.clear = function(x, y) {
      return this.tiles[x][y] = TILE_INDICIES['clear'];
    };

    Map.prototype.addTransition = function(t) {
      return this.transitions.push(t);
    };

    Map.prototype.transitionAt = function(x, y) {
      var t, _i, _len, _ref;
      _ref = this.transitions;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        t = _ref[_i];
        if (t.x === x && t.y === y) return t;
      }
    };

    return Map;

  })();

}).call(this);
