package ;

import flixel.FlxState;
import flixel.util.FlxColor;

import rackets.Racket;
import ball.Ball;

class PlayState extends FlxState {

    private var leftRacketPlayer:Racket;
    private var rightRacketPlayer:Racket;
    private var ball:Ball;

    /**
        Constructor of the PlayState state.
        It initialize the object present on game (Rackets and Ball).
    **/
    override public function create() {
        leftRacketPlayer = new Racket(20, 20, FlxColor.BLUE, true);
        add(leftRacketPlayer);

        rightRacketPlayer = new Racket(Main.WIDTH - 20, 20, FlxColor.RED, false);
        add(rightRacketPlayer);

        ball = new Ball(Main.WIDTH / 2, Main.HEIGHT / 2, FlxColor.WHITE);
        add(ball);

        super.create();
    }

    /**
        This function is call after each frame.
        
        @param elapsed
    **/
    override public function update(elapsed:Float) {
        super.update(elapsed);
    }
}