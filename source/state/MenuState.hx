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
        FlxG.switchState(new ScoreState(0, 0));
    }
}
