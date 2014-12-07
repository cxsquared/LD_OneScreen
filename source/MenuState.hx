package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxRandom;


/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	var title:FlxText;
	var ludum:FlxText;
	var instruction:FlxText;
	var space:FlxText;
	var by:FlxText;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		if (!SoundController.playing) {
			SoundController.playMusic();
		}
		
		title= new FlxText(50, 50, 400, "Down The Rabbit Hole");
		title.setFormat(24, FlxRandom.color(100), "center");
		add (title);
		
		ludum = new FlxText(50, 100, 400, "Ludum Dare 31/48");
		ludum.setFormat(18, FlxRandom.color(100), "center");
		add(ludum);
		
		instruction = new FlxText(50, 500, 400, "Use the arrow keys or WSAD to move. Space to jump or double jump. Press M to mute sound.");
		instruction.setFormat(14, FlxRandom.color(100) , "center");
		add(instruction);
		
		space = new FlxText(320, 600, 100, "Press Space to Start");
		space.setFormat(16, FlxRandom.color(100), "center");
		add(space);
		
		by = new FlxText(600, 600, 110, "Cody Claborn @Cxsquared");
		by.setFormat(14, FlxRandom.color(100), "right");
		add(by);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		title.destroy();
		ludum.destroy();
		instruction.destroy();
		space.destroy();
		by.destroy();
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"])) {
			FlxG.camera.fade(FlxColor.BLACK, .33, false, function() {
				FlxG.switchState(new TextState(1, 1));
			});
		}
		super.update();
	}	
}