(function() {

  window.Model || (window.Model = {});

  window.Model.MapGenerator = (function() {

    function MapGenerator() {}

    MapGenerator.generate = function(width, height) {
      return new window.Model.Map(width, height);
    };

    return MapGenerator;

  })();

}).call(this);
