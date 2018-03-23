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

import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

import game.GameDirection;

class PlayerRacket extends AbstractRacket
{
    // Attributes
    private var keys:Map<GameDirection, Array<FlxKey>>;

    /**
     *  Constructor for a Racket.
     *  
     *  @param X - Initial X position of the Racket.
     *  @param Y - Initial Y position of the Racket.
     *  @param color - Color of the Racket.
     *  @param score - Current score of the racket.
     *  @param keys - Control associate to move the racket. 
     */
    public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor, ?score:Int, keys:Map<GameDirection, Array<FlxKey>>)
    {
        super(X, Y, color, score);
        this.keys = keys;
    }

    /**
     *  Method call after each frame execute on game.
     *  It control the movement of the player during the game.
     *  
     *  @param elapsed - 
     */
    override public function update(elapsed:Float)
    {
        move();
        super.update(elapsed);
    }

    /**
        This function control the movement of the Racket.
    **/
    override public function move(?point:FlxPoint)
    {
        var up:Bool = FlxG.keys.anyPressed(this.keys[UP]);
        var down:Bool = FlxG.keys.anyPressed(this.keys[DOWN]);
        var mA:Float = 0;

        if (up && down)
        {
            up = down = false;
        }

        if (up || down)
        {
            if (up)
            {
                mA = -AbstractRacket.RIGHT_ANGLE;
            }
            else if (down)
            {
                mA = AbstractRacket.RIGHT_ANGLE;
            }

            velocity.set(AbstractRacket.MOVEMENT_SPEED, 0);
            velocity.rotate(FlxPoint.weak(0, 0), mA);
        }
    }
}
