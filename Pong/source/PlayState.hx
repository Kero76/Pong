package ;

import flixel.FlxState;
import flixel.util.FlxColor;

import rackets.Racket;

class PlayState extends FlxState {

    private var _leftRacketPlayer:Racket;
    private var _rightRacketPlayer:Racket;

    override public function create() {
        _leftRacketPlayer = new Racket(20, 20, FlxColor.BLUE);
        add(_leftRacketPlayer);

        _rightRacketPlayer = new Racket(Main.WIDTH - 20, 20, FlxColor.RED);
        add(_rightRacketPlayer);

        super.create();
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);
    }
}