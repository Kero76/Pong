package state;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;

import ball.Ball;
import racket.Racket;

class PlayState extends FlxState {

    private var leftRacketPlayer:Racket;
    private var rightRacketPlayer:Racket;
    private var ball:Ball;
    private var collideWall:FlxGroup;
    private var racketGroup:FlxGroup;
    private var scorePlayerOne:Int;
    private var scorePlayerTwo:Int;
    
    /**
      * Constructor of the PlayState state.
      * It initialize the object present on game (Rackets and Ball).
      */
    override public function create() {
        this.leftRacketPlayer = new Racket(0, FlxG.height / 2, FlxColor.BLUE, [Z, S], 0);
        add(this.leftRacketPlayer);

        this.rightRacketPlayer = new Racket(FlxG.width - Racket.WIDTH, FlxG.height / 2, FlxColor.RED, [UP, DOWN], 0);
        add(this.rightRacketPlayer);

        this.ball = new Ball(0, 0, FlxColor.WHITE);
        this.ball.screenCenter();
        add(this.ball);

        this.collideWall = FlxCollision.createCameraWall(FlxG.camera, true, 1, true);

        this.racketGroup = new FlxGroup();
        this.racketGroup.add(this.leftRacketPlayer);
        this.racketGroup.add(this.rightRacketPlayer);

        this.scorePlayerOne = 0;
        this.scorePlayerTwo = 0;

        super.create();
    }

    /**
      * This function is call after each frame.
      *  
      * @param elapsed
      */
    override public function update(elapsed:Float) {
        if (FlxG.keys.pressed.R) 
        {
            this.resetScreenGame();
        }

        FlxG.collide(this.collideWall, this.racketGroup);

        if (FlxG.collide(this.collideWall, this.ball))
        {
            this.ball.angleAfterCollideWithWall();
        }

        if (FlxG.collide(this.ball, this.racketGroup)) 
        {
            this.ball.angleAfterCollideWithRacket();
        }
        
        super.update(elapsed);
    }

    /**
     * Reset all positions on the sprite present on game screen.
     */
    private function resetScreenGame()
    {
        FlxG.switchState(new ScoreState(this.leftRacketPlayer.get_score(), this.rightRacketPlayer.get_score()));
    }
}
