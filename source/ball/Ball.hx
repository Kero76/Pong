/*
 * Copyright (c) 2018 Nicolas GILLE
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package ball;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;

import racket.AbstractRacket;

class Ball extends FlxSprite
{
    // Static attributes
    public static inline var SPRITE_SIZE:Int = 16;
    public static inline var INITIAL_SPEED:Int = 200;
    public static inline var MAX_SPEED:Int = 500;
    public static inline var INCREASE_BALL_SPEED:Int = 25;

    public static inline var FLAT_ANGLE:Int = 180;
    public static inline var RIGHT_ANGLE:Int = 90;
    public static inline var THIRTY_ANGLE:Int = 30;

    private var ballAngle:Float;
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
        ballAngle = this.initializeMovementDirection();
        speed = INITIAL_SPEED;
    }

    /**
     *  This function update the current state of the ball.
     *  
     *  @param elapsed - 
     **/
    override public function update(elapsed:Float)
    {
        this.move();
        super.update(elapsed);
    }

    /**
     *  This function is used to move the ball.
     */
    private function move()
    {
        velocity.set(speed, 0);
        velocity.rotate(FlxPoint.weak(0, 0), ballAngle);
    }

    /**
     *  This function compute the new angle after a wall collision.
     */
    public function angleAfterCollideWithWall()
    {
        // The ball touch the top or the bottom of the game screen.
        if (y == 0 || y == Main.HEIGHT - SPRITE_SIZE)
        {
            ballAngle = -ballAngle;
        }
    }

    /**
     *  This function compute the new angle after racket collision.
     *  
     *  To generate more difficulties during the party, 
     *  each collision with the racket increase the speed of the ball
     *  until a maximum speed define in game.
     *  
     *  Likewise, each bounce on the racket suffered a random
     *  angle modification to preventing the player to
     *  compute easily the next impact of the ball on his goal.
     */
    public function angleAfterCollideWithRacket()
    {
        // Compute the angle when the ball is in collision with right racket.
        if (x == SPRITE_SIZE || x == Main.WIDTH - SPRITE_SIZE)
        {
            ballAngle = ballAngle * -1;
        }
        // Compute the angle when the ball is in collision with left racket.
        else
        {
            ballAngle = (ballAngle + FLAT_ANGLE) * -1;
        }

        // Randomize bounce modifier bewteen -15 and 15 degrees.
        var bounceModifier = Math.random() * THIRTY_ANGLE - (THIRTY_ANGLE / 2);
        ballAngle += bounceModifier;

        // Increase ball speed when ball touch rackets.
        if (speed < MAX_SPEED)
        {
            speed += INCREASE_BALL_SPEED;
        }
    }

    /**
     *  This function indicate if the ball is in the goal or not.
     *  
     *  @return Bool
     *   True if the ball is in the goal. Otherwise, it return false.
     *  @see isInLeftGoal()
     *  @see isInRightGoal()
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
        return x < (SPRITE_SIZE - AbstractRacket.WIDTH);
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
     *  This function initialize the first movement of the 
     *  ball when the party is started.
     */
    private function initializeMovementDirection():Float
    {
        var angle = Math.random() * RIGHT_ANGLE - (RIGHT_ANGLE / 2);
        var direction = Math.round(Math.random());

        return direction == 0 ? angle : angle + FLAT_ANGLE;
    }
}
