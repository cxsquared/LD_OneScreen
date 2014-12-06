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
	var level:Level;
	
	var scaleFactor:Float = 0.8;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		add(level = new Level());
		
		FlxG.worldBounds.set(0, 0, level.map.map.width, level.map.map.height);
		
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
		
		if (FlxG.mouse.justPressed) {
			level.scale *= scaleFactor;
			
			FlxG.worldBounds.set(0, 0, level.map.map.width, level.map.map.height);
		}
		
		super.update();	
	}
}