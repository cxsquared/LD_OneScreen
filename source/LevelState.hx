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
	
	public function new(levelNumber:Int, tileSize:Int) {
		super();
		this.levelNumber = levelNumber;
		this.tileSize = tileSize;
	}

	override public function create():Void 
	{
		super.create();
		
		level = new MapLevel(levelNumber, tileSize);
		add(level.background);
		add(level.map);
		
		FlxG.worldBounds.set(0, 0, level.map.width, level.map.height);
		
		addPlayer(tileSize);
		setPlayerAttributes();
		
		zoomCamera();
	}
	
	private function addPlayer(size:Int):Void {
		if (levelNumber == 1) {
			add(player = new Player(1, 2, size));
		} else if (levelNumber == 2 ) {
			add(player = new Player(16, 8, size));
		} else if (levelNumber == 3 ) {
			add(player = new Player(256, 32, size));
		} else {
			add(player = new Player(0, 0, size));
		}
	}
	
	private function setPlayerAttributes():Void {
		if (levelNumber == 1) {
			Player.MOVE_SPEED = 25;
			Player.GRAVITY = 100;
			Player.JUMP_SPEED = 0;
			Player.JUMPS_ALLOWED = 0;
			Player.CAN_JUMP = false;
		} else if (levelNumber == 2 ) {
			Player.MOVE_SPEED = 50;
			Player.GRAVITY = 250;
			Player.JUMP_SPEED = 100;
			Player.JUMPS_ALLOWED = 1;
			Player.CAN_JUMP = true;
		} else if (levelNumber == 3 ) {
			Player.MOVE_SPEED = 100;
			Player.GRAVITY = 500;
			Player.JUMP_SPEED = 400;
			Player.JUMPS_ALLOWED = 2;
			Player.CAN_JUMP = true;
		} else {
			Player.MOVE_SPEED = 100;
			Player.GRAVITY = 500;
			Player.JUMP_SPEED = 200;
			Player.JUMPS_ALLOWED = 0;
			Player.CAN_JUMP = true;
		}

	}
	
	private function zoomCamera():Void {
		if (levelNumber == 1) {
			FlxG.camera.zoom = 160;
		} else if (levelNumber == 2) {
			FlxG.camera.zoom = 20;
		} else if (levelNumber == 3) {
			FlxG.camera.zoom = 1.25; 
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
		player.destroy();
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		FlxG.collide(player, level.map);
		
		super.update();	
		
		if (player.y > level.map.height + player.height) {
			FlxG.switchState(new LevelState(levelNumber++, Std.int(level.map.width)));
		}
	}
	
}