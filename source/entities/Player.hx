package entities;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

/**
 * ...
 * @author Cxsquared
 */
class Player extends FlxSprite
{
	public static var MOVE_SPEED:Int = 75;
	public static var GRAVITY:Int = 500;
	public static var JUMP_SPEED:Int = 200;
	public static var JUMPS_ALLOWED = 2;
	
	private var jumpTime:Float = -1;
	private var timesJumped:Int = 0;
	private var jumpKeys:Array<String>;
	
	var jumping:Bool = false;

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		
		makeGraphic(16, 16, FlxColor.PURPLE);
		
		drag.set(MOVE_SPEED * 8, MOVE_SPEED * 8);
		maxVelocity.set(MOVE_SPEED, JUMP_SPEED);
		acceleration.y = GRAVITY;
		
		//setSize(12, 12);
		//offset.set(3, 4);
		
		jumpKeys = ["W", "UP", "SPACE"];
	}
	
	override public function update():Void {
		
		acceleration.x = 0;
		acceleration.y = GRAVITY;
		
		if (FlxG.keys.anyPressed(["LEFT", "A"])) {
			acceleration.x = -drag.x;
		} else if (FlxG.keys.anyPressed(["RIGHT", "D"])) {
			acceleration.x = drag.x;
		}
		
		jump();
		
		super.update();
	}
	
	private function jump():Void {
		if (FlxG.keys.anyJustPressed(jumpKeys)) {
			if ((velocity.y == 0) || (timesJumped < JUMPS_ALLOWED)) {
				timesJumped++;
				jumpTime = 0;
			}
		}
		
		if ((FlxG.keys.anyPressed(jumpKeys)) && (jumpTime >= 0)) {
			jumpTime += FlxG.elapsed;
			
			if (jumpTime > 0.25) {
				jumpTime = 1;
			} else if (jumpTime > 0) {
				velocity.y = -0.6 * maxVelocity.y;
			}
		}
	}
	
}