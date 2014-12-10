package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/graphics/ui/title.png", "assets/graphics/ui/title.png");
			type.set ("assets/graphics/ui/title.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/graphics/blackout.png", "assets/graphics/blackout.png");
			type.set ("assets/graphics/blackout.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/graphics/originals/gallery_2356_7_504823.png", "assets/graphics/originals/gallery_2356_7_504823.png");
			type.set ("assets/graphics/originals/gallery_2356_7_504823.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/graphics/originals/shin-t14.jpg", "assets/graphics/originals/shin-t14.jpg");
			type.set ("assets/graphics/originals/shin-t14.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/graphics/originals/10nthnb.jpg", "assets/graphics/originals/10nthnb.jpg");
			type.set ("assets/graphics/originals/10nthnb.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/graphics/originals/rpg_maker_tiles_by_ayene_chan-d48exyx.png", "assets/graphics/originals/rpg_maker_tiles_by_ayene_chan-d48exyx.png");
			type.set ("assets/graphics/originals/rpg_maker_tiles_by_ayene_chan-d48exyx.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/graphics/top-down/house-1.png", "assets/graphics/top-down/house-1.png");
			type.set ("assets/graphics/top-down/house-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/graphics/top-down/cave-entrance.png", "assets/graphics/top-down/cave-entrance.png");
			type.set ("assets/graphics/top-down/cave-entrance.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/graphics/top-down/outside.png", "assets/graphics/top-down/outside.png");
			type.set ("assets/graphics/top-down/outside.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/graphics/top-down/hero-1.png", "assets/graphics/top-down/hero-1.png");
			type.set ("assets/graphics/top-down/hero-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
