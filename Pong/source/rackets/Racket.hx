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

    public function new(?X:Float = 0, ?Y:Float = 0, color:FlxColor, firstPlayer:Bool, ?modeTwoPlayer:Bool)
    {
        super(X, Y);
        makeGraphic(WIDTH, HEIGHT, color);
        this.firstPlayer = firstPlayer;
        this.modeTwoPlayer = modeTwoPlayer;
    }

    override public function update(elapsed:Float)
    {
        movement();
        super.update(elapsed);
    }

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

    private function moveTo(direction:MoveDirection) 
    {
        if (!canMove) 
        {
            directionToMove = direction;
            canMove = true;
        }
    }

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