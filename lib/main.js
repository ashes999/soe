(function() {
  var GAME_HEIGHT, GAME_WIDTH;

  GAME_WIDTH = 800;

  GAME_HEIGHT = 600;

  window.onload = function() {
    this.game = new Phaser.Game(GAME_WIDTH, GAME_HEIGHT, Phaser.CANVAS, '');
    this.game.state.add('boot', new window.Boot);
    this.game.state.add('preLoader', new window.Preloader);
    this.game.state.add('titleScreen', new window.TitleScreen);
    this.game.state.add('createWorld', new window.CreateWorld);
    this.game.state.add('coreGame', new window.CoreGame);
    this.game.data = {};
    return this.game.state.start('boot');
  };

}).call(this);
