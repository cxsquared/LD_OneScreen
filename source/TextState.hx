package ;

import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.util.FlxRandom;

/**
 * ...
 * @author Cxsquared
 */
class TextState extends FlxState
{
	var text:FlxText;
	
	var levelNumber:Int;
	var tileSize:Int;
	
	var timer:FlxTimer;

	public function new(levelNumber:Int, tileSize:Int) 
	{
		super();
		this.levelNumber = levelNumber;
		this.tileSize = tileSize;
	}
	
	override public function create():Void {
		super.create();
		
		FlxG.camera.zoom = 1;
		
		setTimer();
		
		text = new FlxText(0,0, 400);
		
		setText();
		
		FlxSpriteUtil.screenCenter(text, true, true);
		
		add(text);
	}
	
	private function setTimer():Void {
		if (levelNumber == 1) {
			timer = new FlxTimer(5.0, levelTimer, 1);
		} else if (levelNumber == 2) {
			timer = new FlxTimer(4.0, levelTimer, 1);
		} else if (levelNumber == 3) {
			timer = new FlxTimer(4.0, levelTimer, 1);
		} else if (levelNumber == 4) {
			timer = new FlxTimer(3.0, levelTimer, 1);
		} else if (levelNumber == 5) {
			timer = new FlxTimer(4.0, levelTimer, 1);
		}else if (levelNumber == 6) {
			timer = new FlxTimer(3.0, levelTimer, 1);
		}else if (levelNumber == 6) {
			timer = new FlxTimer(4.0, levelTimer, 1);
		} else {
			timer = new FlxTimer(5.0, levelTimer, 1);
		}
	}
	
	private function setText():Void {
		if (levelNumber == 1) {
			text.text = "Begin at the beginning, and go on till you come to the end: then stop.";
			text.setFormat(24, FlxRandom.color(100), "center");
		} else if (levelNumber == 2) {
			text.text = "Would you tell me, please, which way I ought to go from here?";
			text.setFormat(24, FlxRandom.color(100), "center");
		}else if (levelNumber == 3) {
			text.text = "That depends a good deal on where you want to get to.";
			text.setFormat(24, FlxRandom.color(100), "center");
		}else if (levelNumber == 4) {
			text.text = "I don't much care where –";
			text.setFormat(24, FlxRandom.color(100), "center");
		}else if (levelNumber == 5) {
			text.text = "Then it doesn't matter which way you go.";
			text.setFormat(24, FlxRandom.color(100), "center");
		}else if (levelNumber == 6) {
			text.text = "Curiouser and curiouser!";
			text.setFormat(24, FlxRandom.color(100), "center");
		}else if (levelNumber == 7) {
			text.text = "I knew who I was this morning, but I've changed a few times since then.";
			text.setFormat(24, FlxRandom.color(100), "center");
		} else {
			text.text = "You shouldn't see this.";
		}
	}
	
	override public function destroy():Void {
		text.destroy();
		super.destroy();
	}
	
	override public function update():Void {
		if (FlxG.keys.anyJustPressed(["SPACE", "W", "S", "D", "A", "UP", "DOWN", "LEFT", "RIGHT"])) {
			changeLevel();
		}
		
		if (FlxG.keys.anyJustPressed(["M"])) {
			SoundController.toggleSound();
		}
	}
	
	private function levelTimer(Timer:FlxTimer):Void {
		changeLevel();
	}
	
	private function changeLevel():Void {
		FlxG.camera.fade(FlxColor.BLACK, 0.5, false, function() {
			FlxG.switchState(new LevelState(levelNumber, tileSize));
		});
	}
}