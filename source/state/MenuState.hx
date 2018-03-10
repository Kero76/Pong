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

import game.GameMode;

class MenuState extends FlxState
{
    public static inline var BTN_MARGE:Int = 100;
    public static inline var TITLE_FONT_SIZE:Int = 64;
    public static inline var TRANSITION_TIME:Float = .33;

    private var btnTwoPlayers:FlxButton;
    private var btnSinglePlayer:FlxButton;
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

        this.btnSinglePlayer = new FlxButton(this.txtTitleGame.x - 50, this.txtTitleGame.y + BTN_MARGE, "Single Player", this.clickPlaySinglePlayerButton);
        this.btnSinglePlayer.onUp.sound = FlxG.sound.load(AssetPaths.select__ogg);
        add(this.btnSinglePlayer);

        this.btnTwoPlayers = new FlxButton(this.btnSinglePlayer.x + BTN_MARGE, this.btnSinglePlayer.y, "Mutliplayer", this.clickPlayMultiPlayersButton);
        this.btnTwoPlayers.onUp.sound = FlxG.sound.load(AssetPaths.select__ogg);
        add(this.btnTwoPlayers);

        this.btnOption = new FlxButton(this.btnTwoPlayers.x + BTN_MARGE, this.btnTwoPlayers.y, "Options", this.clickOptionsButton);
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
     *  This function is call when a player would
     *  played in single player mode.
     */
    private function clickPlaySinglePlayerButton()
    {
        FlxG.camera.fade(FlxColor.BLACK, TRANSITION_TIME, true, function()
        {
            FlxG.switchState(new ScoreState(0, 0, GameMode.SINGLE_PLAYER));
        });
    }

    /**
     *  This function is call when a player would
     *  played in single player mode.
     */
    private function clickPlayMultiPlayersButton()
    {
        FlxG.camera.fade(FlxColor.BLACK, TRANSITION_TIME, true, function()
        {
            FlxG.switchState(new ScoreState(0, 0, GameMode.MULTI_PLAYERS));
        });
    }
    
    /**
     *  This function is call when a player would 
     *  consult the option screen to change settings on game.
     */
    private function clickOptionsButton()
    {
        FlxG.camera.fade(FlxColor.BLACK, TRANSITION_TIME, true, function()
        {
            FlxG.switchState(new OptionState());
        });
    }
}
