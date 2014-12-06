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

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	var cube1:FlxSprite;
	var cube2:FlxSprite;
	
	var cubes:FlxSpriteGroup;
	
	var scaleFactor:Float = 0.8;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		cubes = new FlxSpriteGroup();
		
		addCubes(1000);
		
		add(cubes);
/*		cube1 = new FlxSprite();
		cube2 = new FlxSprite();
		
		cube1.makeGraphic(50, 50, FlxColor.BLUE);
		cube2.makeGraphic(50, 50, FlxColor.RED);
		
		cube1.scale.x = cube1.scale.y = 1;
		cube2.scale.x = cube2.scale.y = 50;
		
		FlxSpriteUtil.screenCenter(cube1, true, true);
		FlxSpriteUtil.screenCenter(cube2, true, true);
		
		add(cube2);
		add(cube1);*/
	}
	
	private function addCubes(numberOfCubes:Int):Void {
		var maxSize:Int = numberOfCubes * 25;
		var color:Int = 1;
		for ( i in 0...numberOfCubes ) {

			var cube:FlxSprite = new FlxSprite();
			
			if (color % 2 == 0) {
				//trace("Graphic made");
				cube.makeGraphic(50, 50, FlxColor.BLUE);
				color = 1;
			} else {
				//trace("Graphic made");
				cube.makeGraphic(50, 50, FlxColor.RED);
				color++;
			}
			
			cube.scale.x = cube.scale.y = maxSize - 25;
			//trace("Max size = " + maxSize);
			maxSize -= 25;
			FlxSpriteUtil.screenCenter(cube, true, true);
			cubes.add(cube);
		}
		//trace("add cube called");
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
		cubes.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		if (FlxG.mouse.justPressed) {
			for (cube in cubes.members) {
				cube.scale.x = cube.scale.y *= scaleFactor;
				if (cube.scale.x < 0.05) {
					cube.kill();
				}
			}
		}
		
		cubes.update();
	}	
}