(function() {

  window.TitleScreen = (function() {

    function TitleScreen() {}

    TitleScreen.prototype.create = function() {
      var fadeInTween, logo;
      logo = game.add.sprite(game.world.centerX, game.world.centerY, 'logo');
      logo.anchor.setTo(0.5, 0.5);
      this.blackout = this.game.add.sprite(0, 0, 'blackout');
      this.fadeOutTween = this.game.add.tween(this.blackout);
      this.fadeOutTween.to({
        alpha: 1
      }, 1000, null);
      this.fadeOutTween.onComplete.add(function() {
        return this.game.state.start('createWorld');
      }, this);
      fadeInTween = this.game.add.tween(this.blackout);
      fadeInTween.to({
        alpha: 0
      }, 1000, null);
      return fadeInTween.start();
    };

    TitleScreen.prototype.update = function() {
      if (game.input.activePointer.isDown && this.blackout.alpha === 0) {
        return this.fadeOutTween.start();
      }
    };

    return TitleScreen;

  })();

}).call(this);
