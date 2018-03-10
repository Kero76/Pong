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

package ai;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

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
    public var ballXPosition(default, default):Float;
    @:isVar()
    public var ballYPosition(default, default):Float;

    /**
     *  Constructor for an Ai.
     *  
     *  @param X - Initial X position of the Racket used by the AI.
     *  @param Y - Initial Y position of the Racket used by the AI.
     *  @param color - Color of the Racket used by the AI.
     *  @param score - Current score of the racket used by the AI.
     */
    public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor, ?score:Int)
    {
        super(X, Y);
        makeGraphic(WIDTH, HEIGHT, color);
        this.score = score;
        drag.y = 1600;
    }

    /**
     *  The movement of the AI.
     *  
     *  @param elapsed - 
     */
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
        var middleRacket:Float = HEIGHT / 2;
        var movedArea = (Main.WIDTH / 5) * 2.5;

        if (movedArea < (Main.WIDTH - ballXPosition))
        {
            mA = 0;
        }
        else
        {
            /* 
            / If the position of the ball is upper to the current 
            /* y position, then AI move up the racket.
            /**
             *  Three possible cases : 
             *   - The ball is upper to the ai position : Ai move up.
             *   - The ball is down to the ai position : Ai move down.
             *   - The ball and the ai have the same position : Ai not move. 
             */
            if (ballYPosition > y + middleRacket) {
                mA = RIGHT_ANGLE;
            }
            else if (ballYPosition < y + middleRacket)
            {
                mA = -RIGHT_ANGLE;
            }
            else
            {
                mA = 0;
            } 
        }
        
        velocity.set(Ai.MOVEMENT_SPEED, 0);
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
     *  Get the x ball position of the ball.
     */
    public function get_ballXPosition():Float
    {
        return ballXPosition;
    }

    /**
     *  Set the new x position of the ball.
     *  
     *  @param ballXPosition - New position of the ball.
     */
    public function set_ballXPosition(ballXPosition:Float)
    {
        this.ballXPosition = ballXPosition;
    }

    /**
     *  Get the y ball position of the ball.
     */
    public function get_ballYPosition():Float
    {
        return ballYPosition;
    }

    /**
     *  Set the new y position of the ball.
     *  
     *  @param ballYPosition - New position of the ball.
     */
    public function set_ballYPosition(ballYPosition:Float)
    {
        this.ballYPosition = ballYPosition;
    }
}
