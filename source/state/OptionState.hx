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
import flixel.ui.FlxBar;
import flixel.ui.FlxButton;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import flixel.util.FlxSave;

class OptionState extends FlxState
{
    public static inline var TRANSITION_TIME:Float = .33;
    public static inline var DEFAULT_SOUND_VALUE:Float = .5;
    public static inline var UPDATE_SOUND_VALUE:Float = .1;
    public static inline var GREY_COLOR:FlxColor = 0xFF464646;

    private var txtTitle:FlxText;
    private var txtVolume:FlxText;
    private var txtVolumeBar:FlxText;
    private var barVolume:FlxBar;
    private var btnVolumeDown:FlxButton;
    private var btnVolumeUp:FlxButton;
    private var btnBack:FlxButton;
    private var btnReset:FlxButton;

    // Settings save
    private var save:FlxSave;

    /**
     *  Create the Optionstate interface.
     */
    override public function create()
    {
        // Option title.
        txtTitle = new FlxText(0, 20, 0, "Options", 22);
        txtTitle.alignment = CENTER;
        txtTitle.screenCenter(FlxAxes.X);
        add(txtTitle);

        // Bar title to indicate volume
        txtVolume = new FlxText(0, txtTitle.y + 40, txtTitle.height + 10, "Volume", 8);
        txtVolume.alignment = CENTER;
        txtVolume.screenCenter(FlxAxes.X);
        add(txtVolume);

        // Button to put down volume.
        btnVolumeDown = new FlxButton(8, txtVolume.y + txtVolume.height + 2, "-", clickVolumeDown);
        btnVolumeDown.loadGraphic(AssetPaths.button__png, true, 20, 20);
        btnVolumeDown.onUp.sound = FlxG.sound.load(AssetPaths.select__ogg);
        add(btnVolumeDown);

        // Button to put up volume.
        btnVolumeUp = new FlxButton(FlxG.width - 28, btnVolumeDown.y, "+", clickVolumeUp);
        btnVolumeUp.loadGraphic(AssetPaths.button__png, true, 20, 20);
        btnVolumeUp.onUp.sound = FlxG.sound.load(AssetPaths.select__ogg);
        add(btnVolumeUp);

        // Bar to indicate the current volume between 0 and 100.
        barVolume = new FlxBar(
            btnVolumeDown.x + btnVolumeDown.width + 4,
            btnVolumeDown.y,
            LEFT_TO_RIGHT,
            Std.int(FlxG.width - 64),
            Std.int(btnVolumeUp.height)
        );
        barVolume.createFilledBar(GREY_COLOR, FlxColor.WHITE, true, FlxColor.WHITE);
        add(barVolume);

        // Text show on bar volume.
        txtVolumeBar = new FlxText(0, 0, 200, (FlxG.sound.volume * 100) + "%", 8);
        txtVolumeBar.alignment = CENTER;
        txtVolumeBar.borderStyle = FlxTextBorderStyle.OUTLINE;
        txtVolumeBar.borderColor = GREY_COLOR;
        txtVolumeBar.y = barVolume.y + (barVolume.height / 2) - (txtVolumeBar.height / 2);
        txtVolumeBar.screenCenter(FlxAxes.X);
        add(txtVolumeBar);

        // Button to return on game.
        btnBack = new FlxButton(
            (FlxG.width / 2) + 15,
            FlxG.height - 28,
            "Back",
            clickBack
        );
        btnBack.onUp.sound = FlxG.sound.load(AssetPaths.select__ogg);
        add(btnBack);

        btnReset = new FlxButton(
            (FlxG.width / 2) - btnBack.width - 15,
            FlxG.height - 28,
            "Reset option",
            clickResetOption
        );
        btnReset.onUp.sound = FlxG.sound.load(AssetPaths.select__ogg);
        add(btnReset);

        save = new FlxSave();
        save.bind("settings");

        // Set the volume to the current value.
        this.updateVolume();

        // Add fade between screens.
        FlxG.camera.fade(FlxColor.BLACK, TRANSITION_TIME, true);

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
        this.updateVolume();
    }

    /**
     *  Trigger when player click on back button on option screen.
     */
    private function clickBack()
    {
        save.close();
        FlxG.camera.fade(FlxColor.BLACK, TRANSITION_TIME, false, function()
        {
            FlxG.switchState(new MenuState());
        });
    }

    /**
     *  This fucntion reset the default volume by 50% 
     *  and remove option saved previously.
     */
    private function clickResetOption()
    {
        save.erase();
        FlxG.sound.volume = DEFAULT_SOUND_VALUE;
        this.updateVolume();
    }

    /**
     *  Method call to show the value of volume.
     *  Call this method change the value of the bar and update text inside.
     */
    private function updateVolume()
    {
        var vol:Int = Math.round(FlxG.sound.volume * 100);
        barVolume.value = vol;
        txtVolumeBar.text = vol + "%";
    }

    /**
     *  This function put the sound down by 0.1
     *  
     *  @see SOUND_VALUE_UPDATE
     */
    private function clickVolumeDown()
    {
        FlxG.sound.volume -= UPDATE_SOUND_VALUE;
    }

    /**
     *  This function put the sound up by 0.1
     *  
     *  @see SOUND_VALUE_UPDATE
     */
    private function clickVolumeUp()
    {
        FlxG.sound.volume += UPDATE_SOUND_VALUE;
    }
}
