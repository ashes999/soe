(function() {
  var _base;

  window.Model || (window.Model = {});

  (_base = window.Model).Events || (_base.Events = {});

  window.Model.Events.MapTransition = (function() {

    function MapTransition(x, y, destination, destX, destY, direction) {
      this.x = x;
      this.y = y;
      this.destination = destination;
      this.destX = destX;
      this.destY = destY;
      this.direction = direction;
    }

    return MapTransition;

  })();

}).call(this);
