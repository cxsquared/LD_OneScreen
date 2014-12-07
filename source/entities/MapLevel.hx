package entities;

import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import openfl.Assets;
import flixel.FlxG;

/**
 * ...
 * @author Cxsquared
 */
class MapLevel
{
	public var map:FlxTilemap;
	public var background:FlxTilemap;
	public var spike:FlxTilemap;

	public function new(levelNumber:Int=1, tileSize:Int=1) 
	{
		
		map = new FlxTilemap();
		map.allowCollisions = FlxObject.ANY;
		background = new FlxTilemap();
		
		background.loadMap(Assets.getText("assets/data/maps/background" + levelNumber + ".txt"), "assets/images/tilesets/level" + levelNumber + ".png", tileSize, tileSize);
		map.loadMap(Assets.getText("assets/data/maps/level" + levelNumber + ".txt"), "assets/images/tilesets/level" + levelNumber + ".png", tileSize, tileSize);
		
		if (levelNumber >= 4) {
			spike = new FlxTilemap();
			spike.allowCollisions = FlxObject.ANY;
			spike.loadMap(Assets.getText("assets/data/maps/spike" + levelNumber + ".txt"), "assets/images/tilesets/level" + levelNumber + ".png", tileSize, tileSize);
		}
	}
}