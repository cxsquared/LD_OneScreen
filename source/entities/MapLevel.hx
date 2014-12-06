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

	public function new() 
	{
		
		map = new FlxTilemap();
		map.allowCollisions = FlxObject.ANY;
		background = new FlxTilemap();
		
		background.loadMap(Assets.getText("assets/data/background.txt"), "assets/images/testLevel.png", 16, 16);
		map.loadMap(Assets.getText("assets/data/testLevel.txt"), "assets/images/testLevel.png", 16, 16);
	}
}