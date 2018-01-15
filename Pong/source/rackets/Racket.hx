package rackets;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Racket extends FlxSprite 
{
    static var WIDTH:Int = 12;
    static var HEIGHT:Int = 100;

    public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor)
    {
        super(X, Y);
        makeGraphic(WIDTH, HEIGHT, color);
    }
}