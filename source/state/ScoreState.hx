package state;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class ScoreState extends FlxState 
{
    static inline var SCORE_FONT_SIZE:Int = 64;
    private var txtScore:FlxText;
    private var scorePlayerOne:Int;
    private var scorePlayerTwo:Int;
    private var playState:FlxState;

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
        var showScore = this.scorePlayerOne + " - " + this.scorePlayerTwo;
        this.txtScore = new FlxText(0, 0, 0, "Score\n" + showScore, SCORE_FONT_SIZE);
        this.txtScore.screenCenter();
        add(this.txtScore);

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
        if (FlxG.keys.pressed.ENTER || FlxG.keys.pressed.SPACE) 
        {
            FlxG.switchState(new PlayState(this.scorePlayerOne, this.scorePlayerTwo));
        }

        super.update(elapsed);
    }
}
