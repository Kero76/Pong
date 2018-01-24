package ;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;

import rackets.Racket;
import ball.Ball;

class PlayState extends FlxState {

    private var leftRacketPlayer:Racket;
    private var rightRacketPlayer:Racket;
    private var ball:Ball;
    private var collideWall:FlxGroup;

    /**
        Constructor of the PlayState state.
        It initialize the object present on game (Rackets and Ball).
    **/
    override public function create() {
        this.leftRacketPlayer = new Racket(20, 20, FlxColor.BLUE, [Z, S]);
        add(this.leftRacketPlayer);

        this.rightRacketPlayer = new Racket(FlxG.width - 20, 20, FlxColor.RED, [UP, DOWN]);
        add(this.rightRacketPlayer);

        this.ball = new Ball(0, 0, FlxColor.WHITE);
        this.ball.screenCenter();
        add(this.ball);

        this.collideWall = FlxCollision.createCameraWall(FlxG.camera, true, 1, true);

        super.create();
    }

    /**
        This function is call after each frame.
        
        @param elapsed
    **/
    override public function update(elapsed:Float) {
        if (FlxG.keys.pressed.R) 
        {
            this.ball.kill();
            this.ball = new Ball(0, 0, FlxColor.WHITE);
            this.ball.screenCenter();
            add(this.ball);
        }

        FlxG.collide(this.collideWall, this.leftRacketPlayer);
        FlxG.collide(this.collideWall, this.rightRacketPlayer);

        if (FlxG.collide(this.collideWall, this.ball))
        {
            this.ball.angleAfterCollideWithWall();
        }
        
        super.update(elapsed);
    }
}