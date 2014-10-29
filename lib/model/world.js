(function() {

  window.Model || (window.Model = {});

  window.Model.World = (function() {

    function World(width, height) {
      var current, map, x, y, _ref, _ref2;
      this.width = width;
      this.height = height;
      this.maps = [];
      for (x = 0, _ref = this.width; 0 <= _ref ? x < _ref : x > _ref; 0 <= _ref ? x++ : x--) {
        current = [];
        for (y = 0, _ref2 = this.height; 0 <= _ref2 ? y < _ref2 : y > _ref2; 0 <= _ref2 ? y++ : y--) {
          map = window.Model.MapGenerator.generate(25, 19);
          map.x = x;
          map.y = y;
          current.push(map);
        }
        this.maps.push(current);
      }
      this._connectMaps();
      this.currentMap = this.maps[0][0];
    }

    World.prototype._connectMaps = function() {
      var m, x, y, _ref, _results;
      _results = [];
      for (x = 0, _ref = this.width; 0 <= _ref ? x < _ref : x > _ref; 0 <= _ref ? x++ : x--) {
        _results.push((function() {
          var _ref2, _results2;
          _results2 = [];
          for (y = 0, _ref2 = this.height; 0 <= _ref2 ? y < _ref2 : y > _ref2; 0 <= _ref2 ? y++ : y--) {
            m = this.maps[x][y];
            if (x > 0) this._connect('left', m, this.maps[x - 1][y]);
            if (x < this.width - 1) this._connect('right', m, this.maps[x + 1][y]);
            if (y > 0) this._connect('up', m, this.maps[x][y - 1]);
            if (y < this.height - 1) {
              _results2.push(this._connect('down', m, this.maps[x][y + 1]));
            } else {
              _results2.push(void 0);
            }
          }
          return _results2;
        }).call(this));
      }
      return _results;
    };

    World.prototype._connect = function(direction, source, destination) {
      var coordinates, opposite_coordinates, opposite_direction;
      coordinates = this._getCoordinates(source, direction);
      opposite_direction = this._oppositeOf(direction);
      opposite_coordinates = this._getCoordinates(destination, opposite_direction);
      this._addTransition(source, coordinates.x, coordinates.y, destination, opposite_coordinates.x, opposite_coordinates.y, direction);
      this._addTransition(destination, opposite_coordinates.x, opposite_coordinates.y, source, coordinates.x, coordinates.y, direction);
      if (direction === 'left' || direction === 'right') {
        if (coordinates.y < source.height - 1) {
          this._addTransition(source, coordinates.x, coordinates.y + 1, destination, opposite_coordinates.x, opposite_coordinates.y, direction);
        }
        if (coordinates.y > 0) {
          this._addTransition(source, coordinates.x, coordinates.y - 1, destination, opposite_coordinates.x, opposite_coordinates.y, direction);
        }
        if (opposite_coordinates.y < destination.height - 1) {
          this._addTransition(destination, opposite_coordinates.x, opposite_coordinates.y + 1, source, coordinates.x, coordinates.y, opposite_direction);
        }
        if (opposite_coordinates.y > 0) {
          this._addTransition(destination, opposite_coordinates.x, opposite_coordinates.y - 1, source, coordinates.x, coordinates.y, opposite_direction);
        }
      }
      if (direction === 'up' || direction === 'down') {
        if (coordinates.x < source.width - 1) {
          this._addTransition(source, coordinates.x + 1, coordinates.y, destination, opposite_coordinates.x, opposite_coordinates.y, direction);
        }
        if (coordinates.x > 0) {
          this._addTransition(source, coordinates.x - 1, coordinates.y, destination, opposite_coordinates.x, opposite_coordinates.y, direction);
        }
        if (opposite_coordinates.x < destination.width - 1) {
          this._addTransition(destination, opposite_coordinates.x + 1, opposite_coordinates.y, source, coordinates.x, coordinates.y, opposite_direction);
        }
        if (opposite_coordinates.x > 0) {
          return this._addTransition(destination, opposite_coordinates.x - 1, opposite_coordinates.y, source, coordinates.x, coordinates.y, opposite_direction);
        }
      }
    };

    World.prototype._oppositeOf = function(direction) {
      if (direction === 'right') return 'left';
      if (direction === 'left') return 'right';
      if (direction === 'down') return 'up';
      if (direction === 'up') return 'down';
      throw "Unknown direction: " + direction;
    };

    World.prototype._getCoordinates = function(map, direction) {
      if (direction === 'up') {
        return {
          'x': Math.floor(map.width / 2),
          'y': 0
        };
      }
      if (direction === 'down') {
        return {
          'x': Math.floor(map.width / 2),
          'y': map.height - 1
        };
      }
      if (direction === 'left') {
        return {
          'x': 0,
          'y': Math.floor(map.height / 2)
        };
      }
      if (direction === 'right') {
        return {
          'x': map.width - 1,
          'y': Math.floor(map.height / 2)
        };
      }
      throw "Unknown direction: " + direction;
    };

    World.prototype._addTransition = function(map, x, y, target, targetX, targetY, direction) {
      map.clear(x, y);
      return map.addTransition(new window.Model.Events.MapTransition(x, y, target, targetX, targetY, direction));
    };

    return World;

  })();

}).call(this);
