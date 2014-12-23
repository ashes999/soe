package deenGames.swordOfEman.state;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import flixel.plugin.MouseEventManager;
/**
 * A FlxState which can be used for the game's menu.
 */
class LocationMapState extends FlxState
{
	private static inline var TILE_WIDTH = 32;
	private static inline var TILE_HEIGHT = 32;

	private static inline var MAP_WIDTH = 1024;
	private static inline var MAP_HEIGHT = 768;

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		var horizontalTiles:Int = Math.ceil(MAP_WIDTH / TILE_WIDTH);
		var verticalTiles:Int = Math.ceil(MAP_HEIGHT / TILE_HEIGHT);

		for (y in 0 ... verticalTiles) {
			for (x in 0 ... horizontalTiles) {
				var tile:FlxSprite = new FlxSprite(16, 16);
				tile.loadGraphic("assets/images/top-down/outside.png", true, 32, 32);
				tile.x = x * TILE_WIDTH;
				tile.y = y * TILE_HEIGHT;
				add(tile);
			}
		}
		super.create();
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}
}
