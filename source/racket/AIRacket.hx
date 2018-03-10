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

package racket;

import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class AIRacket extends AbstractRacket
{
    /**
     *  Constructor of an AIRacket.
     *  
     *  @param X - Initial X position of the Racket used by the AI.
     *  @param Y - Initial Y position of the Racket used by the AI.
     *  @param color - Color of the Racket used by the AI.
     *  @param score - Current score of the racket used by the AI.
     */
    public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor, ?score:Int)
    {
        super(X, Y, color, score);
    }

    /**
     *  Method call after each frame execute on game.
     *  It contains only the method movement 
     *  who is override on child classes.
     *  
     *  @param elapsed - 
     */
    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }

    /**
     *  This function control the movement of the Racket.
     */
    override public function move(?point:FlxPoint)
    {        
        var mA:Float = 0;
        var middleRacket:Float = AbstractRacket.HEIGHT / 2;
        var movedArea = (Main.WIDTH / 5) * 2.5;

        if (movedArea < (Main.WIDTH - point.x))
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
            if (point.y > y + middleRacket) {
                mA = AbstractRacket.RIGHT_ANGLE;
            }
            else if (point.y < y + middleRacket)
            {
                mA = -AbstractRacket.RIGHT_ANGLE;
            }
            else
            {
                mA = 0;
            } 
        }
        
        velocity.set(AbstractRacket.MOVEMENT_SPEED, 0);
        velocity.rotate(FlxPoint.weak(0, 0), mA);
    }
}
