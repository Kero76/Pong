package ;

import flixel.FlxState;
import flixel.util.FlxColor;

import rackets.Racket;
import ball.Ball;

class PlayState extends FlxState {

    private var leftRacketPlayer:Racket;
    private var rightRacketPlayer:Racket;
    private var ball:Ball;

    override public function create() {
        leftRacketPlayer = new Racket(20, 20, FlxColor.BLUE, true);
        add(leftRacketPlayer);

        rightRacketPlayer = new Racket(Main.WIDTH - 20, 20, FlxColor.RED, false);
        add(rightRacketPlayer);

        ball = new Ball(Main.WIDTH / 2, Main.HEIGHT / 2, FlxColor.WHITE);
        add(ball);

        super.create();
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);
    }
}