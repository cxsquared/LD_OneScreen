package entities;

import flixel.addons.editors.tiled.TiledMap;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.tile.FlxTilemap;
import flixel.FlxG;

/**
 * ...
 * @author Cxsquared
 */
class MapPlayer extends FlxSpriteGroup
{
	public static var MOVE_SPEED:Int = 75;
	public static var GRAVITY:Int = 0;
	public static var JUMP_SPEED:Int = 200;
	public static var JUMPS_ALLOWED = 2;
	
	private var jumpTime:Float = -1;
	private var timesJumped:Int = 0;
	private var jumpKeys:Array<String>;
	
	var jumping:Bool = false;

	public function new(X:Float=0, Y:Float=0, MaxSize:Int=0) 
	{
		super(X, Y, MaxSize);
		
	}
	
	public function mapToSprite(map:FlxTilemap) {
		for ( y in 0...map.heightInTiles) {
			for (x in 0...map.widthInTiles) {
				add(map.tileToFlxSprite(x, y));
			}
		}
		
		for (i in this._sprites) {
			i.drag.set(MOVE_SPEED * 8, MOVE_SPEED * 8);
			i.maxVelocity.set(MOVE_SPEED, JUMP_SPEED);
			i.acceleration.y = GRAVITY;
		}
	}
	
	override public function update():Void {
		for (i in this._sprites){
			i.acceleration.x = 0;
			i.acceleration.y = GRAVITY;
		
			if (FlxG.keys.anyPressed(["LEFT", "A"])) {
				i.acceleration.x = -i.drag.x;
			} else if (FlxG.keys.anyPressed(["RIGHT", "D"])) {
				i.acceleration.x = i.drag.x;
			}
		
			jump(i);
			
			i.update();
		}
	}
	
	private function jump(sprite:FlxSprite):Void {
		if (FlxG.keys.anyJustPressed(jumpKeys)) {
			if ((sprite.velocity.y == 0) || (timesJumped < JUMPS_ALLOWED)) {
				timesJumped++;
				jumpTime = 0;
			}
		}
		
		if ((FlxG.keys.anyPressed(jumpKeys)) && (jumpTime >= 0)) {
			jumpTime += FlxG.elapsed;
			
			if (jumpTime > 0.25) {
				jumpTime = 1;
			} else if (jumpTime > 0) {
				sprite.velocity.y = -0.6 * sprite.maxVelocity.y;
			}
		}
	}
	
}