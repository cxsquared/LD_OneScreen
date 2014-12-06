package;

import entities.Player;
import flixel.addons.nape.FlxNapeSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTile;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import openfl.Assets;
import flixel.FlxObject;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var map:FlxTilemap;
	var background:FlxTilemap;
	var player:Player;
	
	var speed:Float;
	var jumping:Bool = false;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		map = new FlxTilemap();
		map.allowCollisions = FlxObject.ANY;
		background = new FlxTilemap();
		
		add(background.loadMap(Assets.getText("assets/data/background.txt"), "assets/images/testLevel.png", 16, 16));
		
		add(map.loadMap(Assets.getText("assets/data/testLevel.txt"), "assets/images/testLevel.png", 16, 16));
		
		FlxG.worldBounds.set(0, 0, map.width, map.height);
		
		add(player = new Player(100, 100));
		
		FlxG.camera.zoom = 2;

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
		FlxG.collide(player, map);
		
		super.update();	
	}
}