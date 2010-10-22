package view;
import flash.display.Sprite;
import haxe.Timer; // TODO: this should probably belong somewhere else
import model.Object;
import view.Constants;

/**
 * ...
 * @author Ivan Hamer
 */

class SpaceObject extends Object
{
	private var _parent 								: SpaceObject;
	var _battlefield : Battlefield;
	var _timer : Timer;
	public var _sprite : Sprite;
	
	static var TIME_BETWEEN_UPDATES : Int = 10; // In milliseconds

	public function new(field : Battlefield, parent : SpaceObject = null ) 
	{
		super(get_max_speed(), get_max_angular_velocity ());
		_parent = parent;
		_battlefield = field;
		
		_timer = new Timer(TIME_BETWEEN_UPDATES);
		_timer.run = update;
		
		_sprite = new Sprite ();
		_battlefield.addSpaceObject(this);
	}

	static var iter : Int = 0;
	
	public override function update() : Void
	{
		super.update ();
		move_to_bounds (Constants.BATTLEFIELD_WIDTH, Constants.BATTLEFIELD_HEIGHT);

		_sprite.x = Math.round (_location.x) % Constants.BATTLEFIELD_WIDTH ; 
		_sprite.y = Math.round (_location.y) % Constants.BATTLEFIELD_HEIGHT ;
		_sprite.rotation = (_bearing.theta () / (2 * Math.PI) * 360) + 90;
	}	
	
	public function get_max_speed () : Float { return 5;}
	public function get_max_angular_velocity () : Float { return 0.1;}

}