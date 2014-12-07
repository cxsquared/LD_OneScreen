package  ;

import entities.MapLevel;
import entities.Player;
import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxColor;
/**
 * ...
 * @author Cxsquared
 */
class LevelState extends FlxState
{
	var level:MapLevel;
	var player:Player;
	
	var levelNumber:Int;
	var tileSize:Int;
	
	var startingX:Int;
	var startingY:Int;
	
	var collided:Bool;
	
	var starting:Bool = true;
	
	public function new(levelNumber:Int, tileSize:Int) {
		super();
		//trace("Starting level " + levelNumber + " with tile size of " + tileSize);
		this.levelNumber = levelNumber;
		this.tileSize = tileSize;
	}

	override public function create():Void 
	{
		super.create();
		
		level = new MapLevel(levelNumber, tileSize);
		add(level.background);
		add(level.map);
		
		if (levelNumber >= 4) {
			add(level.spike);
		}
		
		if( levelNumber != 1){ // 1 causes it to crash for some reason
			FlxG.worldBounds.set(0, 0, level.map.width, level.map.height);
			//FlxG.camera.setBounds(0, 0, level.map.width, level.map.height);
		}
		
		setPlayerAttributes();
		addPlayer(tileSize);
		
		zoomCamera();
		
		
	}
	
	private function addPlayer(size:Int):Void {
		if (levelNumber == 1) {
			startingX = 1;
			startingY = 2;
		} else if (levelNumber == 2 ) {
			startingX = 16;
			startingY = -8;
		} else if (levelNumber == 3 ) {
			startingX = 256;
			startingY = -32;
		} else if (levelNumber == 4 ) {
			startingX = 576;
			startingY = 40;
		}else if (levelNumber == 5 ) {
			startingX = 40;
			startingY = -32;
		}else if (levelNumber == 6 ) {
			startingX = 690;
			startingY = -32;
		}else if (levelNumber == 7 ) {
			startingX = 45;
			startingY = -32;
		} else {
			startingX = 0;
			startingY = 0;
		}
		add(player = new Player(startingX, startingY, size));
	}
	
	private function setPlayerAttributes():Void {
		if (levelNumber == 1) {
			Player.MOVE_SPEED = 15;
			Player.GRAVITY = 100;
			Player.JUMP_SPEED = 0;
			Player.JUMPS_ALLOWED = 0;
			Player.CAN_JUMP = false;
			//trace("Level 1 stats set");
		} else if (levelNumber == 2 ) {
			Player.MOVE_SPEED = 40;
			Player.GRAVITY = 500;
			Player.JUMP_SPEED = 50;
			Player.JUMPS_ALLOWED = 1;
			Player.CAN_JUMP = true;
			//trace("Level 2 stats set");
		} else if (levelNumber == 3 ) {
			Player.MOVE_SPEED = 175;
			Player.GRAVITY = 850;
			Player.JUMP_SPEED = 325;
			Player.JUMPS_ALLOWED = 2;
			Player.CAN_JUMP = true;
			//trace("Level 3 stats set");
		}else if (levelNumber == 4 ) {
			Player.MOVE_SPEED = 125;
			Player.GRAVITY = 850;
			Player.JUMP_SPEED = 300;
			Player.JUMPS_ALLOWED = 2;
			Player.CAN_JUMP = true;
			//trace("Level 3 stats set");
		} else if (levelNumber == 5 ) {
			Player.MOVE_SPEED = 125;
			Player.GRAVITY = 850;
			Player.JUMP_SPEED = 375;
			Player.JUMPS_ALLOWED = 2;
			Player.CAN_JUMP = true;
			//trace("Level 3 stats set");
		}else if (levelNumber == 6 ) {
			Player.MOVE_SPEED = 125;
			Player.GRAVITY = 850;
			Player.JUMP_SPEED = 375;
			Player.JUMPS_ALLOWED = 2;
			Player.CAN_JUMP = true;
			//trace("Level 3 stats set");
		} else if (levelNumber == 7 ) {
			Player.MOVE_SPEED = 125;
			Player.GRAVITY = 850;
			Player.JUMP_SPEED = 375;
			Player.JUMPS_ALLOWED = 2;
			Player.CAN_JUMP = true;
			//trace("Level 3 stats set");
		} else {
			Player.MOVE_SPEED = 175;
			Player.GRAVITY = 1000;
			Player.JUMP_SPEED = 325;
			Player.JUMPS_ALLOWED = 2;
			Player.CAN_JUMP = true;
		}
			//trace(Player.MOVE_SPEED);
			//trace(Player.GRAVITY);
			//trace(Player.JUMP_SPEED);
			//trace(Player.JUMPS_ALLOWED);
			//trace(Player.CAN_JUMP);

	}
	
	private function zoomCamera():Void {
		if (levelNumber == 1) {
			FlxG.camera.zoom = 160;
		} else if (levelNumber == 2) {
			FlxG.camera.zoom = 20;
		} else if (levelNumber == 3) {
			FlxG.camera.zoom = 1.25; 
		} else if (levelNumber == 4) {
			FlxG.camera.zoom = 1; 
		}else if (levelNumber == 5) {
			FlxG.camera.zoom = .8333;
		}else if (levelNumber == 6) {
			FlxG.camera.zoom = 0.833; 
		}else if (levelNumber == 7) {
			FlxG.camera.zoom = 0.833; 
		} else {
			FlxG.camera.zoom = 1;
		}
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		level.background = FlxDestroyUtil.destroy(level.background);
		level.map = FlxDestroyUtil.destroy(level.map);
		if (levelNumber >= 4) {
			//level.spike.destroy();
		}
		player = FlxDestroyUtil.destroy(player);
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		if (FlxG.collide(player, level.map)) {
			Player.CAN_MOVE = true;
			if (starting) {
				if (levelNumber != 1 && levelNumber != 4) {
					SoundController.playHit();
				}
				starting = false;
			} else {
				//FlxG.camera.shake(0.001, 0.001);
			}
		} else if (levelNumber >= 4) {
			if (FlxG.collide(player, level.spike)) {
				collided = true;
			} else {
				collided = false;
			}
		} else {
			collided = false;
		}
		
		super.update();	
		
		if (FlxG.keys.anyJustPressed(["M"])) {
			SoundController.toggleSound();
		}
		
		if (collided) {
			Player.CAN_MOVE = false;
			starting = true;
			player.x = startingX;
			player.y = startingY;
			SoundController.playHurt();
		}
		
		if (player.y > level.map.height + player.height) {
			Player.CAN_MOVE = false;
			FlxG.camera.fade(FlxColor.BLACK, .33, false, function() {
				if (levelNumber >= 3) {
					FlxG.switchState(new TextState(++levelNumber, 32));
				} else {
					FlxG.switchState(new TextState(++levelNumber, Std.int(level.map.width) - tileSize));
				}
			});
		}
	}
	
	
	
}