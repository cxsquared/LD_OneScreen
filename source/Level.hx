package ;

import entities.MapLevel;
import entities.MapPlayer;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import entities.Player;
import openfl.Assets;
import flixel.FlxG;
import flixel.FlxObject;

/**
 * ...
 * @author Cxsquared
 */
class Level extends FlxGroup
{
	public var map:MapLevel;
	public var player:Player;
	public var mapPlayer:MapPlayer;
	
	public var scale:Float = 1;

	public function new() 
	{
		super();
		
		map = new MapLevel();
		
		mapPlayer = new MapPlayer();
		mapPlayer.mapToSprite(map.background);
		mapPlayer.mapToSprite(map.map);
		
		add(mapPlayer);
		
		add(player = new Player(100, 100));
	}
	
	override public function update():Void
	{		
		FlxG.collide(player, map.map);
		
		player.scale.x = player.scale.y = scale;
		map.map.scale.x = map.map.scale.y = scale;
		map.background.scale.x = map.background.scale.y = scale;
		
		mapPlayer.update();
		super.update();
	}
}