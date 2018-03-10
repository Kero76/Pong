package ai;

class Ai extends FlxSprite 
{
    // Static attributes.
    public static inline var WIDTH:Int = 12;
    public static inline var HEIGHT:Int = 100;
    public static inline var MOVEMENT_SPEED:Int = 300;
    public static inline var RIGHT_ANGLE:Int = 90;

    private var canMove:Bool;

    @:isVar()
    public var score(default, default):Int;

    @:isVar()
    public var ballPosition(default, default):Float;

    /**
     *  Constructor for a Racket.
     *  
     *  @param X - Initial X position of the Racket.
     *  @param Y - Initial Y position of the Racket.
     *  @param color - Color of the Racket.
     *  @param keys - Control associate to move the racket. 
     *  @param score - Current score of the racket.
     */
    public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor, keys:Array<FlxKey>, ?score:Int)
    {
        super(X, Y);
        makeGraphic(WIDTH, HEIGHT, color);
        this.keys = keys;
        this.score = score;
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
     *  This function control the movement of the Racket.
     */
    private function movement()
    {
        var mA:Float = 0;
        
        // If the position of the ball is upper to the current 
        // y position, then AI move up the racket.
        if (ballPosition.y > y) {
            mA = -RIGHT_ANGLE;
        }
        // Otherwise, the AI move down the racket.
        else
        {
            mA = RIGHT_ANGLE;
        }

        velocity.set(Racket.MOVEMENT_SPEED, 0);
        velocity.rotate(FlxPoint.weak(0, 0), mA);
    }

    /**
     *  Get the score of the racket.
     */
    public function get_score():Int
    {
        return score;
    }

    /**
     *  Set the score of the racket.
     *  
     *  @param score - New score for the racket.
     */
    public function set_score(score:Int)
    {
        this.score = score;
    }

    /**
     *  Get the ball position of the ball.
     */
    public function get_ballPosition():Int
    {
        return ballPosition;
    }

    /**
     *  Set the new position of the ball.
     *  
     *  @param ballPosition - New position of the ball.
     */
    public function set_ballPosition(ballPosition:Int)
    {
        this.ballPosition = ballPosition;
    }
}
