(function() {

  window.Preloader = (function() {

    function Preloader() {}

    Preloader.prototype.preload = function() {
      var loadingBar, text;
      loadingBar = this.game.add.sprite(0, 0, 'loadingBar');
      loadingBar.x = (this.game.width - loadingBar.width) / 2;
      loadingBar.y = (this.game.height - loadingBar.height) * 2 / 3;
      this.load.setPreloadSprite(loadingBar);
      text = this.game.add.text(0, 0, 'Loading ...', {
        fill: '#fff'
      });
      text.x = (this.game.width - text.width) / 2;
      text.y = (this.game.height - text.height) / 2;
      this.game.load.image('blackout', 'assets/graphics/blackout.png');
      return this.game.load.image('logo', 'assets/graphics/ui/title.png');
    };

    Preloader.prototype.create = function() {
      return this.game.state.start('titleScreen');
    };

    return Preloader;

  })();

}).call(this);
