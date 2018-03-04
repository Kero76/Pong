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
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
    public static inline var BTN_MARGE:Int = 100;
    public static inline var TITLE_FONT_SIZE:Int = 64;
    public static inline var TRANSITION_TIME:Float = .33;

    private var btnPlay:FlxButton;
    private var btnOption:FlxButton;
    private var txtTitleGame:FlxText;

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
        this.btnPlay.onUp.sound = FlxG.sound.load(AssetPaths.select__ogg);
        add(this.btnPlay);

        this.btnOption = new FlxButton(this.btnPlay.x + MenuState.BTN_MARGE, this.btnPlay.y, "Option", this.clickOption);
        this.btnOption.onUp.sound = FlxG.sound.load(AssetPaths.select__ogg);
        add(this.btnOption);

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
        FlxG.camera.fade(FlxColor.BLACK, TRANSITION_TIME, true, function()
        {
            FlxG.switchState(new ScoreState(0, 0));
        });
    }

    private function clickOption()
    {
        FlxG.camera.fade(FlxColor.BLACK, TRANSITION_TIME, true, function()
        {
            FlxG.switchState(new OptionState());
        });
    }
}