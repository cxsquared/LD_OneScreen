package;

import flixel.addons.nape.FlxNapeSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.addons.nape.FlxNapeTilemap;
import openfl.Assets;
import flixel.FlxObject;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var map:FlxNapeTilemap;
	var player:FlxNapeSprite;
	
	var speed:Float;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		map = new FlxNapeTilemap();
		
		map.loadMap(Assets.getText("assets/data/testLevel.txt"), AssetPaths.testLevel__png, 16, 16);
		map.scale.x = map.scale.y = 2;
		
		map.setTileProperties(2, FlxObject.NONE);
		map.setTileProperties(3, FlxObject.LEFT);
		map.setTileProperties(4, FlxObject.CEILING);
		map.setTileProperties(5, FlxObject.RIGHT);
		map.setTileProperties(6, FlxObject.FLOOR);
		map.setTileProperties(7, FlxObject.FLOOR);
		
		add(map);
		
		player = new FlxNapeSprite();
		player.makeGraphic(32, 32, FlxColor.PURPLE);
		
		player.x = 70;
		player.y = FlxG.height - 70;
		
		player.createRectangularBody(32, 32);
		
		add(player);
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
		
		FlxG.collide(player, map);
		
		map.update();
		player.update();
	}	
}