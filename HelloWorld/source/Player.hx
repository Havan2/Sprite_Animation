package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class Player extends FlxSprite{
    public function new(xPos:Int = 0, yPos: Int = 0){
        super(xPos, yPos);

        loadGraphic("assets/images/DeathSheet.png", true, 72, 84);
        }

    function movement(){
        final Death = FlxG.keys.anyPressed([LEFT, D]);
        final Run = FlxG.keys.anyPressed([RIGHT, R]);
        final Attack = FlxG.keys.anyPressed([UP, A]);

        if(Death){

            loadGraphic("assets/images/DeathSheet.png", true, 72, 84);
            animation.add("death", [0, 1, 2, 3, 4, 5], 3);
            animation.play("death");
        }

        if(Run){
            loadGraphic("assets/images/RunSheet.png", true, 64, 64);
            animation.add("run", [0, 1, 2, 3, 4, 5, 6, 7], 3);
            animation.play("run");
        }

        else if(Attack){
            loadGraphic("assets/images/AttackSheet.png", true, 64, 72);
            animation.add("attack", [0, 1, 2, 3, 4, 5, 6, 7, 8], 4);
            animation.play("attack");
        }

    }

    override function update(elapsed: Float){
        super.update(elapsed);
        movement();
    }
}