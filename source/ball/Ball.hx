package ball;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;

import racket.Racket;

class Ball extends FlxSprite 
{
    public static inline var SPRITE_SIZE:Int = 16;
    public static inline var INITIAL_SPEED:Float = 200;
    public static inline var MAX_SPEED:Float = 500;
    
    private var movementBallAngle:Float;
    private var speed:Float;

    /**
     * Constructor of a Ball object.
     *
     * @param X Initial X position of the Ball.
     * @param Y Initial Y position of the Ball.
     * @param color Color of the Ball.
     **/
    public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor)
    {
        super(X, Y);
        makeGraphic(SPRITE_SIZE, SPRITE_SIZE, color);
        this.movementBallAngle = initializeMovementDirection();
        this.speed = INITIAL_SPEED;
    }

    /**
     *  This function update the current state of the ball.
     *  
     *  @param elapsed - 
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
        // The ball touch the top or the bottom of the game screen.
        if (y == 0 || y == Main.HEIGHT - SPRITE_SIZE) {
            this.movementBallAngle = -this.movementBallAngle;
        } 
        // The ball touch the left or the right wall screen and the game is terminate.
        else {
            this.movementBallAngle = (this.movementBallAngle + 180) * -1;
        }
    }

    /**
     *  This function compute the new angle after racket collision.
     */
    public function angleAfterCollideWithRacket()
    {
        if (x == SPRITE_SIZE || x == Main.WIDTH - SPRITE_SIZE) {
            this.movementBallAngle = -this.movementBallAngle;
        } else {
            this.movementBallAngle = (this.movementBallAngle + 180) * -1;
        }

        if (this.speed < MAX_SPEED)
        {
            this.speed += 10;
        }
    }
        
    /**
     *  This function indicate if the ball is in the goal or not.
     *  
     *  @return Bool
     *   True if the ball is in the goal. Otherwise, it return false.
     */
    public function isInTheGoal():Bool
    {
        return this.isInLeftGoal() || this.isInRightGoal();  
    }

    /**
     *  The ball is in the left goal.
     *  
     *  @return Bool
     *   The ball is in the left goal. 
     */
    public function isInLeftGoal():Bool
    {
        return x < (SPRITE_SIZE - Racket.WIDTH);
    }

    /**
     *  The ball is in the rigth goal.
     *  
     *  @return Bool
     *   The ball is in the right goal. 
     */
    public function isInRightGoal():Bool 
    {
        return x > Main.WIDTH - SPRITE_SIZE;
    }

    /**
     *  This function is used to move the ball.
     */
    private function movement() 
    {
        velocity.set(this.speed, 0);
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
