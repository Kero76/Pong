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
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;

import ball.Ball;
import racket.Racket;

class PlayState extends FlxState
{
    // Sounds 
    private var sndRacketBall:FlxSound;
    private var sndBallWall:FlxSound;

    // Models 
    private var leftRacketPlayer:Racket;
    private var rightRacketPlayer:Racket;
    private var ball:Ball;

    // Groups
    private var collideWall:FlxGroup;
    private var racketGroup:FlxGroup;

    // Another variables
    private var scorePlayerOne:Int;
    private var scorePlayerTwo:Int;

    /**
     *  Constructor of PlayState.
     *  
     *  @param scorePlayerOne - The score of the player one.
     *  @param scorePlayerTwo - The score of the player two.
     */
    override public function new(?scorePlayerOne:Int, ?scorePlayerTwo:Int)
    {
        this.scorePlayerOne = scorePlayerOne;
        this.scorePlayerTwo = scorePlayerTwo;
        super();
    }

    /**
      * Constructor of the PlayState state.
      * It initialize the object present on game (Rackets and Ball).
      */
    override public function create()
    {
        this.leftRacketPlayer = new Racket(0, FlxG.height / 2, FlxColor.BLUE, [Z, S], this.scorePlayerOne);
        add(this.leftRacketPlayer);

        this.rightRacketPlayer = new Racket(FlxG.width - Racket.WIDTH, FlxG.height / 2, FlxColor.RED, [P, M], this.scorePlayerTwo);
        add(this.rightRacketPlayer);

        this.ball = new Ball(0, 0, FlxColor.WHITE);
        this.ball.screenCenter();
        add(this.ball);

        this.collideWall = FlxCollision.createCameraWall(FlxG.camera, true, 1, true);

        this.racketGroup = new FlxGroup();
        this.racketGroup.add(this.leftRacketPlayer);
        this.racketGroup.add(this.rightRacketPlayer);

        this.scorePlayerOne = 0;
        this.scorePlayerTwo = 0;

        super.create();

        // Asset loading
        this.sndRacketBall = FlxG.sound.load(AssetPaths.racket__ogg);
        this.sndBallWall = FlxG.sound.load(AssetPaths.ball__ogg);
    }

    /**
      * This function is call after each frame.
      *  
      * @param elapsed - 
      */
    override public function update(elapsed:Float)
    {
        if (FlxG.keys.pressed.R)
        {
            this.resetScreenGame();
        }

        // If the ball is in one of the two goal, 
        // the current round is complete and the score is updated.
        if (this.ball.isInTheGoal())
        {
            if (this.ball.isInLeftGoal())
            {
                var newScore = this.rightRacketPlayer.get_score() + 1;
                this.rightRacketPlayer.set_score(newScore);
            }
            if (this.ball.isInRightGoal())
            {
                var newScore = this.leftRacketPlayer.get_score() + 1;
                this.leftRacketPlayer.set_score(newScore);
            }
            this.resetScreenGame();
        }

        // Collision section.
        FlxG.collide(this.collideWall, this.racketGroup);
        if (FlxG.collide(this.collideWall, this.ball))
        {
            this.ball.angleAfterCollideWithWall();
            this.sndBallWall.play(true);
        }

        if (FlxG.collide(this.ball, this.racketGroup))
        {
            this.ball.angleAfterCollideWithRacket();
            this.sndRacketBall.play(true);
        }

        super.update(elapsed);
    }

    /**
     * Reset all positions on the sprite present on game screen.
     */
    private function resetScreenGame()
    {
        FlxG.switchState(new ScoreState(this.leftRacketPlayer.get_score(), this.rightRacketPlayer.get_score()));
    }
}