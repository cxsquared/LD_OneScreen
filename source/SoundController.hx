package ;

import flixel.util.FlxRandom;
import vault.Sfxr;
import vault.SfxrParams;

/**
 * ...
 * @author Cxsquared
 */
class SoundController
{

	public static function playHit():Void {
		var random:Int = FlxRandom.intRanged(0, 3);
		var params:SfxrParams;
		if (random == 0) {
			params = SfxrParams.fromString("3,,0.1447,0.6422,0.3158,0.0433,,0.0373,,,,-0.53,0.7842,,,0.3412,,,1,,,,,0.32");
		} else if (random == 1) {
			params = SfxrParams.fromString("3,,0.1447,0.6422,0.3158,0.06,,0.0373,,,,-0.53,0.7842,,,0.3412,,,1,,,,,0.32");
		}else if (random == 2) {
			params = SfxrParams.fromString("3,,0.1447,0.6422,0.3158,0.1,,0.0373,,,,-0.53,0.7842,,,0.3412,,,1,,,,,0.32");
		}else if (random == 3) {
			params = SfxrParams.fromString("3,,0.1447,0.6422,0.3158,0.1,,0.0373,,,,-0.53,0.66,,,0.3412,,,1,,,,,0.32");
		} else {
			params = SfxrParams.fromString("3,,0.1447,0.6422,0.3158,0.1,,-0.02,,,,-0.5,0.66,,,0.3412,,,1,,,,,0.32");
		}
		var sfxr = new Sfxr(params);
		sfxr.play();
	}
	
	public static function playJump():Void {
		var random:Int = FlxRandom.intRanged(0, 3);
		var params:SfxrParams;
		if (random == 0) {
			params = SfxrParams.fromString("0,,0.1034,,0.1865,0.3564,,0.1139,,,,,,0.5998,,,,,0.5059,,,0.1747,,0.32");
		} else if (random == 1) {
			params = SfxrParams.fromString("0,,0.1034,,0.1865,0.38,,0.1139,,,,,,0.5998,,,,,0.5059,,,0.1747,,0.32");
		}else if (random == 2) {
			params = SfxrParams.fromString("0,,0.1034,,0.1865,0.34,,0.1139,,,,-0.12,0.28,0.51,,,,,0.5059,,,0.1747,,0.32");
		}else if (random == 3) {
			params = SfxrParams.fromString("0,,0.1034,,0.1865,0.34,,0.1139,,,,-0.12,0.28,0.75,,,,,0.5059,,,0.1747,,0.32");
		} else {
			params = SfxrParams.fromString("0,,0.1034,,0.1865,0.27,,0.1139,,,,-0.12,0.28,0.75,,,,,0.5059,,,0.1747,,0.32");
		}
		var sfxr = new Sfxr(params);
		sfxr.play();
	}
	
		public static function playHurt():Void {
		var random:Int = FlxRandom.intRanged(0, 3);
		var params:SfxrParams;
		if (random == 0) {
			params = SfxrParams.fromString("1,,0.01,,0.2403,0.5943,,-0.4399,,,,,,,,,,,1,,,,,0.41");
		} else if (random == 1) {
			params = SfxrParams.fromString("1,,0.01,,0.2403,0.6,,-0.4399,,,,,,,,,,,1,,,,,0.41");
		}else if (random == 2) {
			params = SfxrParams.fromString("1,,0.01,,0.2403,0.6,,-0.4399,0.3,,,,,,,,,,1,,,,,0.41");
		}else if (random == 3) {
			params = SfxrParams.fromString("1,,0.01,,0.2403,0.6,,-0.4399,0.3,,,,,,,,,,0.8,,,,,0.41");
		} else {
			params = SfxrParams.fromString("1,,0.01,,0.2403,0.6,,-0.4399,0.3,,,,,,,,,,0.8,,,,,0.41");
		}
		var sfxr = new Sfxr(params);
		sfxr.play();
	}
	
}