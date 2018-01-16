package rackets;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Racket extends FlxSprite 
{
    public static inline var WIDTH:Int = 12;
    public static inline var HEIGHT:Int = 100;
    public static inline var MOVEMENT_SPEED:Float = 5;

    private var canMove:Bool;
    private var directionToMove:MoveDirection;
    private var modeTwoPlayer:Bool;
    private var firstPlayer:Bool;

    /**
        Constructor for a Racket.

        @param X Initial X position of the Racket.
        @param Y Initial Y position of the Racket.
        @param color Color of the Racket.
        @param firstPlayer Boolean to check if the racket is tthe player one or two.
    **/
    public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor, firstPlayer:Bool)
    {
        super(X, Y);
        makeGraphic(WIDTH, HEIGHT, color);
        this.firstPlayer = firstPlayer;
    }

    /**
        This function is call after each frame.
        It used to represent the movement of the Racket on the PlayState screen.

        @param elapsed
    **/
    override public function update(elapsed:Float)
    {
        movement();
        super.update(elapsed);
    }

    /**
        This function control the movement of the Racket.
    **/
    private function movement()
    {
        if (canMove) 
        {
            computeMovement(directionToMove);
            if (firstPlayer == true) 
            {
                movementFirstPlayer();
            }
            else 
            {
                movementSecondPlayer();
            }
        }

        movementSecondPlayer();
    }


    /**
        This function compute the movement for the Racket.

        @param direction The new direction pressed by the user for the Racket movement.
    **/
    private function computeMovement(direction:MoveDirection) 
    {
        switch(direction) 
            {
                case MoveDirection.UP :
                    y -= MOVEMENT_SPEED;
                    canMove = false;

                case MoveDirection.DOWN :
                    y += MOVEMENT_SPEED;
                    canMove = false;
            }
    }

    /**
        This function get the direction of the movement and check if the Racket can move.

        @param direction The direction pressed by the player for the Racket movement.
    **/
    private function moveTo(direction:MoveDirection) 
    {
        if (!canMove) 
        {
            directionToMove = direction;
            canMove = true;
        }
    }

    /**
        This function control the movement for the first player.
    **/
    private function movementFirstPlayer() 
    {
        if (FlxG.keys.anyPressed([S]))
		{
            moveTo(MoveDirection.DOWN);
		}
		else if (FlxG.keys.anyPressed([Z]))
		{
            moveTo(MoveDirection.UP);
        }
    }

    /**
        This function control the movement for the second player.
    **/
    private function movementSecondPlayer() 
    {
        if (FlxG.keys.anyPressed([DOWN]))
		{
            moveTo(MoveDirection.DOWN);
		}
		else if (FlxG.keys.anyPressed([UP]))
		{
            moveTo(MoveDirection.UP);
        }
    }
}