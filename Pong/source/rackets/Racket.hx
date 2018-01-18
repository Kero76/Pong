package rackets;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxPoint;

class Racket extends FlxSprite 
{
    public static inline var WIDTH:Int = 12;
    public static inline var HEIGHT:Int = 100;
    public static inline var MOVEMENT_SPEED:Float = 200;

    private var canMove:Bool;
    private var directionToMove:MoveDirection;
    private var keys:Array<FlxKey>;

    /**
        Constructor for a Racket.

        @param X Initial X position of the Racket.
        @param Y Initial Y position of the Racket.
        @param color Color of the Racket.
        @param firstPlayer Boolean to check if the racket is tthe player one or two.
    **/
    public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor, keys:Array<FlxKey>)
    {
        super(X, Y);
        makeGraphic(WIDTH, HEIGHT, color);
        this.keys = keys;
        drag.y = 1600;
    }

    /**
        This function is call after each frame.
        It used to represent the movement of the Racket on the PlayState screen.

        @param elapsed
    **/
    override public function update(elapsed:Float)
    {
        movement();
        super.update(elapsed);
    }

    /**
        This function control the movement of the Racket.
    **/
    private function movement()
    {
        var up:Bool = FlxG.keys.anyPressed([this.keys[0]]);
        var down:Bool = FlxG.keys.anyPressed([this.keys[1]]);
        var mA:Float = 0;

        if (up && down)
        {
            up = down = false;
        }

        if (up || down) 
        {
            if (up)
            {
                mA = -90;
            }
            else if (down)
            {
                mA = 90;
            }

            velocity.set(Racket.MOVEMENT_SPEED, 0);
            velocity.rotate(FlxPoint.weak(0, 0), mA);
        }
    }
}