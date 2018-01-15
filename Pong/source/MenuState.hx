package ;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState 
{
    static var BTN_MARGE:Int = 100;
    static var TITLE_FONT_SIZE:Int = 64;

    private var _btnPlay : FlxButton;
    private var _txtTitleGame : FlxText;

    override public function create()
    {
        _txtTitleGame = new FlxText(0, 0, 0, "Pong", TITLE_FONT_SIZE);
        _txtTitleGame.screenCenter();
        add(_txtTitleGame);
        
        _btnPlay = new FlxButton(_txtTitleGame.x, _txtTitleGame.y + BTN_MARGE, "Play", clickPlay);
        add(_btnPlay);
        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }

    private function clickPlay()
    {
        FlxG.switchState(new FlxState());
    }
}
