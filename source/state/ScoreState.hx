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

package state;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class ScoreState extends FlxState
{
    public static inline var SCORE_FONT_SIZE:Int = 64;
    public static inline var ADVICE_FONT_SIZE:Int = 16;

    private var txtScore:FlxText;
    private var txtAdvice:FlxText;
    private var playState:FlxState;
    private var scorePlayerOne:Int;
    private var scorePlayerTwo:Int;

    /**
     *  Create new instance of ScoreState.
     *  
     *  @param scorePlayerOne - The current score of the player one.
     *  @param scorePlayerTwo - The current score of the player two.
     */
    override public function new(scorePlayerOne:Int, scorePlayerTwo:Int)
    {
        this.scorePlayerOne = scorePlayerOne;
        this.scorePlayerTwo = scorePlayerTwo;
        super();
    }

    /**
     *  Create state about score.
     */
    override public function create()
    {
        var showScore = scorePlayerOne + " - " + scorePlayerTwo;
        txtScore = new FlxText(0, 0, 0, "Score\n" + showScore, SCORE_FONT_SIZE);
        txtScore.screenCenter();
        add(txtScore);

        txtAdvice = new FlxText(txtScore.x, txtScore.y + txtScore.height + 10, 0, "Press Enter to play", ADVICE_FONT_SIZE);
        add(txtAdvice);

        super.create();
    }

    /**
     * This function is call after each frame..
     *  
     * @param elapsed
     */
    override public function update(elapsed:Float)
    {
        // When players are ready, start game.
        if (FlxG.keys.pressed.ENTER)
        {
            FlxG.switchState(new PlayState(this.scorePlayerOne, this.scorePlayerTwo));
        }

        super.update(elapsed);
    }
}
