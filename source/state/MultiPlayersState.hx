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
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxColor;

import game.GameDirection;
import game.GameMode;
import racket.AbstractRacket;
import racket.PlayerRacket;

class MultiPlayersState extends PlayState
{
    /**
     *  Constructor of a MultiPlayersState
     *  
     *  @param scorePlayerOne - Score for the player one.
     *  @param scorePlayerTwo - Score for the player two.
     */
    override public function new(scorePlayerOne:Int, scorePlayerTwo:Int)
    {
        super(scorePlayerOne, scorePlayerTwo);
    }

    /**
     *  This function create on instance of MultiPlayersState.
     */
    override public function create()
    {
        super.create();
    }

    /**
      * This function is call after each frame.
      *  
      * @param elapsed - 
      */
    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }

    /**
     *  Instantiate Rackets and ball uses to play.
     */
    override public function instanciateModels()
    {
        super.instanciateModels();
        var keys:Map<GameDirection, Array<FlxKey>> = [
            GameDirection.UP => [P],
            GameDirection.DOWN => [M, SEMICOLON]
        ];
        this.rightRacketPlayer = new PlayerRacket(
            FlxG.width - AbstractRacket.WIDTH,
            FlxG.height / 2,
            FlxColor.RED,
            this.scorePlayerTwo,
            keys
        );
        add(this.rightRacketPlayer);
    }

    /**
     * Reset all positions on the sprite present on game screen.
     */
    override public function resetScreenGame()
    {
        FlxG.switchState(new ScoreState(
            this.leftRacketPlayer.get_score(),
            this.rightRacketPlayer.get_score(),
            GameMode.MULTI_PLAYERS
        ));
    }
}
