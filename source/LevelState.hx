package  ;

import entities.MapLevel;
import entities.Player;
import flixel.FlxState;
import flixel.FlxG;

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
			startingX = 1152;
			startingY = 70;
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
			Player.MOVE_SPEED = 750;
			Player.GRAVITY = 2000;
			Player.JUMP_SPEED = 625;
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
			FlxG.camera.zoom = 0.5; 
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
		level.background.destroy();
		level.map.destroy();
		if (levelNumber >= 4) {
			//level.spike.destroy();
		}
		player.destroy();
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		if (FlxG.collide(player, level.map)) {
			Player.CAN_MOVE = true;
		} else {
			if (levelNumber >= 4) {
				if (FlxG.collide(player, level.spike)) {
					player.x = startingX;
					player.y = startingY;
				}
			}
		}
		
		super.update();	
		
		if (player.y > level.map.height + player.height) {
			Player.CAN_MOVE = false;
			if (levelNumber >= 3) {
				FlxG.switchState(new LevelState(++levelNumber, 64));
			} else {
				FlxG.switchState(new LevelState(++levelNumber, Std.int(level.map.width) - tileSize));
			}
		}
	}
	
}