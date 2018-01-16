package ball;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Ball extends FlxSprite 
{
    public static inline var SPRITE_SIZE:Int = 16;

    /**
        Constructor of a Ball object.
    **/
    public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor) 
    {
        super(X, Y);
        makeGraphic(SPRITE_SIZE, SPRITE_SIZE, color);
    }
}