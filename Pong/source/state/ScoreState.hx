package state;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class ScoreState extends FlxState 
{
    static inline var SCORE_FONT_SIZE:Int = 64;
    private var txtScore:FlxText;

    /**
     *  Create state about score.
     */
    override public function create()
    {
        this.txtScore = new FlxText(0, 0, 0, "Score\n 0 - 0", SCORE_FONT_SIZE);
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
            FlxG.switchState(new PlayState());
        }

        super.update(elapsed);
    }
}
