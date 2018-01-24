package ball;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;

class Ball extends FlxSprite 
{
    public static inline var SPRITE_SIZE:Int = 16;
    public static inline var MOVEMENT_SPEED:Float = 200;
    
    private var movementBallAngle:Float;

    /**
        Constructor of a Ball object.

        @param X Initial X position of the Ball.
        @param Y Initial Y position of the Ball.
        @param color Color of the Ball.
    **/
    public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor)
    {
        super(X, Y);
        makeGraphic(SPRITE_SIZE, SPRITE_SIZE, color);
        this.movementBallAngle = initializeMovementDirection();
    }

    /**
     *  This function update the current state of the ball.
    **/
    override public function update(elapsed:Float) 
    {
        movement();
        super.update(elapsed);
    }

    /**
     *  This function compute the new angle after a wall collision.
     */
    public function angleAfterCollideWithWall()
    {
        if (y == 0  || y == Main.HEIGHT - SPRITE_SIZE) {
            this.movementBallAngle = -this.movementBallAngle;
        } else {
            this.movementBallAngle = (this.movementBallAngle + 180) * -1;
        }
    }

    /**
     *  This function compute the new angler after racket collision.
     */
    public function angleAfterCollideWithRacket()
    {
        if (x == 0 || x == Main.WIDTH - SPRITE_SIZE) {
            this.movementBallAngle = -this.movementBallAngle;
        } else {
            this.movementBallAngle = (this.movementBallAngle + 180) * -1;
        }
    }

    /**
     *  This function is used to move the ball.
     */
    private function movement() 
    {
        velocity.set(Ball.MOVEMENT_SPEED, 0);
        velocity.rotate(FlxPoint.weak(0, 0), this.movementBallAngle);
    }

    /**
     *  This function initialize the first movement of the 
     *  ball when the party is started.
     */
    private function initializeMovementDirection() 
    {
        var angle = Math.random() * 90 - 45;
        var direction = Math.round(Math.random());

        return direction == 0 ? angle : angle + 180;
    }
}