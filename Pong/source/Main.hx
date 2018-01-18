package ;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public static var WIDTH:Int = 640;
	public static var HEIGHT:Int = 480;

	public function new()
	{
		super();
		addChild(new FlxGame(Main.WIDTH, Main.HEIGHT, MenuState));
	}
}
