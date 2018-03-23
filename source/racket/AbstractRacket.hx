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

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;

class AbstractRacket extends FlxSprite
{
    // Static attributes.
    public static inline var WIDTH:Int = 12;
    public static inline var HEIGHT:Int = 100;
    public static inline var MOVEMENT_SPEED:Int = 300;
    public static inline var RIGHT_ANGLE:Int = 90;

    // Attributes
    private var canMove:Bool;

    @:isVar()
    public var score(default, default):Int;

    override public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor, ?score:Int)
    {
        super(X, Y);
        makeGraphic(WIDTH, HEIGHT, color);
        this.score = score;
        drag.y = 1600;
    }

    /**
     *  The body of the method implements the movement
     *  of the sub racket objects present on project.
     */
    public function move(?point:FlxPoint) {}

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
}
