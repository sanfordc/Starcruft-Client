package view;
import flash.display.Sprite;
import haxe.Timer; // TODO: this should probably belong somewhere else
import model.Object;
import view.Constants;

/**
 * ...
 * @author Ivan Hamer
 */

class SpaceObject extends Sprite
{
	private var _parent 								: SpaceObject;
	var _battlefield : Battlefield;
	var _timer : Timer;
	var _physical_object : Object;
	
	static var TIME_BETWEEN_UPDATES : Int = 10; // In milliseconds

	public function new(field : Battlefield, parent : SpaceObject = null ) 
	{
		super();
		_parent = parent;
		_battlefield = field;
		_battlefield.addSpaceObject(this);
		
		_timer = new Timer(TIME_BETWEEN_UPDATES);
		_timer.run = update;
		
		_physical_object = new Object (get_max_speed(), 0.1);
	}

	static var iter : Int = 0;
	
	public function update() : Void
	{
		update ();
		_physical_object.move_to_bounds (Constants.BATTLEFIELD_WIDTH, Constants.BATTLEFIELD_HEIGHT);

		x = Math.round (_physical_object._location.x) % Constants.BATTLEFIELD_WIDTH ; 
		y = Math.round (_physical_object._location.y) % Constants.BATTLEFIELD_HEIGHT ;
		rotation = (_physical_object._location.theta () / (2 * Math.PI) * 360) + 90;
	}	
	
	public function get_max_speed () : Float { return 5;}

	public function trace () : Void
	{
		trace ("");
	}
}