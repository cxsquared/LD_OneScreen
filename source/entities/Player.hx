package entities;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxRandom;
import flixel.util.FlxMath;
import openfl.geom.ColorTransform;
import flixel.util.FlxColorUtil;
/**
 * ...
 * @author Cxsquared
 */
class Player extends FlxSprite
{
	public static var MOVE_SPEED:Int = 100;
	public static var GRAVITY:Int = 500;
	public static var JUMP_SPEED:Int = 200;
	public static var JUMPS_ALLOWED:Int = 2;
	public static var CAN_JUMP:Bool = false;
	public static var CAN_MOVE:Bool = true;
	
	private var jumpTime:Float = -1;
	private var timesJumped:Int = 0;
	private var jumpKeys:Array<String>;
	
	private var previousVelocity:Float = -1;
	
	var jumping:Bool = false;

	public function new(X:Float=0, Y:Float=0, size:Int=16) 
	{
		super(X, Y);
		
		if (size >= 32) {
			loadCharacter();
		} else {
			makeGraphic(size, size, FlxRandom.color());
		}
		
		drag.set(MOVE_SPEED * 8, MOVE_SPEED * 8);
		maxVelocity.set(MOVE_SPEED, JUMP_SPEED);
		acceleration.y = GRAVITY;
		
		jumpKeys = ["W", "UP", "SPACE"];
	}
	
	private function loadCharacter():Void {
		var ran:Int = FlxRandom.intRanged(0, 4);
		
		if (ran == 1) {
			loadGraphic(AssetPaths.char1__png, false, 32, 32);
		} else if (ran == 2) {
			loadGraphic(AssetPaths.char2__png, false, 32, 32);
		} else {
			loadGraphic(AssetPaths.char3__png, false, 32, 32);
		}
	}
	
	override public function update():Void {
		
		acceleration.x = 0;
		acceleration.y = GRAVITY;
		
		if (CAN_MOVE) {
			if (FlxG.keys.anyPressed(["LEFT", "A"])) {
				acceleration.x = -drag.x;
			} else if (FlxG.keys.anyPressed(["RIGHT", "D"])) {
				acceleration.x = drag.x;
			}
			
			if (CAN_JUMP) {
				jump();
				
				if (previousVelocity == maxVelocity.y && velocity.y == 0) {
					SoundController.playHit();
				}
			
				previousVelocity = Math.abs(velocity.y);
			}
		}
		super.update();
	}
	
	private function jump():Void {
		if (FlxG.keys.anyJustPressed(jumpKeys)) {
			if ((velocity.y == 0) || (timesJumped < JUMPS_ALLOWED)) {
				timesJumped++;
				jumpTime = 0;
				SoundController.playJump();					
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