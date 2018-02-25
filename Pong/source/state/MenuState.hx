package state;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState 
{
    static inline var BTN_MARGE:Int = 100;
    static inline var TITLE_FONT_SIZE:Int = 64;

    private var btnPlay : FlxButton;
    private var txtTitleGame : FlxText;

    /**
     * Constructor of the MenuState state.
     * It initialize the object presenton the menu screen title.
     */
    override public function create()
    {
        this.txtTitleGame = new FlxText(0, 0, 0, "Pong", TITLE_FONT_SIZE);
        this.txtTitleGame.screenCenter();
        add(this.txtTitleGame);
        
        this.btnPlay = new FlxButton(this.txtTitleGame.x, this.txtTitleGame.y + MenuState.BTN_MARGE, "Play", this.clickPlay);
        add(this.btnPlay);
        
        super.create();
    }

    /**
     * This function is call after each frame..
     * 
     * @param elapsed
     */
    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }

    /**
     * This function is call when the player click on button
     * to start a party.
     */
    private function clickPlay()
    {
        FlxG.switchState(new ScoreState());
    }
}
