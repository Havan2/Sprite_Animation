package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		bgColor = 0xf7bbcadc;
		var text = new FlxText(150, 0, 0, "     Hello, User!
		     Follow Below Instructions  
		     For Running: 'Right' key or 'R' key,
		     For Attack: 'UP' key or 'A' key,
		     For Death: 'Left' key or 'D' key.", 24, true);
		text.setFormat('Times New Roman', 18, FlxColor.RED, FlxTextAlign.CENTER);
		final player = new Player(300, 200);
		add(text);
		add(player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
