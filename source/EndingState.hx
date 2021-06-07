package;
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author bbpanzu
 */
class EndingState extends FlxState
{

	var _goodEnding:Bool = false;
	
	public function new(goodEnding:Bool = true) 
	{
		super();
		_goodEnding = goodEnding;
		
	}
	
	override public function create():Void 
	{
		super.create();
		var end:FlxSprite = new FlxSprite(0, 0);
		if (_goodEnding){
			end.loadGraphic(Paths.image("ending"));
			FlxG.sound.playMusic(Paths.music("Deedge"),1,false);
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
		}else{
			if(FlxG.random.bool(70)){
			end.loadGraphic(Paths.image("ending"));
			FlxG.sound.playMusic(Paths.music("Deedge"), 1, false);
			FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
			}else{
			end.loadGraphic(Paths.image("Deedge"));
			FlxG.sound.playMusic(Paths.music("ThwokThree"), 1, false);
			}
		}
		add(end);
		
		
		new FlxTimer().start(8, endIt);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.ENTER){
			endIt();
		}
		
	}
	
	
	public function endIt(e:FlxTimer=null){
		trace("ENDING");
		FlxG.switchState(new StoryMenuState());
	}
	
}