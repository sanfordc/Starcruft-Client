package ;
import flash.display.Sprite;
import haxe.Timer;

/**
 * ...
 * @author Chris
 */

class SpaceObject extends Sprite
{
	private var _mass (default, default) 			    : Float;
	private var _location (get_location, set_location)  : Vector2d;
	private var _velocity (default, default)            : Vector2d;
	private var _acceleration (default, default)        : Vector2d;

	private var _moment_of_inertia (default, default)   : Float;
	private var _bearing (get_bearing, set_bearing)		: Vector2d;
	private var _angular_velocity (default, default)     : Float;    // + is clockwise
	private var _angular_acceleration (default, default) : Float;
	
	private var _forward_thrust (default, set_forward_thrust) : Float;
	private var _angular_thrust (default, set_angular_thrust) : Float;
	
	var _timer : Timer;
	
	static var TIME_BETWEEN_UPDATES : Int = 10; // In milliseconds

	public function set_angular_thrust (at : Float) : Float { _angular_thrust = at; return at;  }
	public function set_forward_thrust (ft : Float) : Float { _forward_thrust = ft; return ft;  }
	public function get_location () : Vector2d { return _location; }
	public function set_location (l : Vector2d) : Vector2d { _location = l;  return _location; }
	public function get_bearing () : Vector2d { return _bearing; }
	public function set_bearing (b : Vector2d) : Vector2d { _bearing = b;  return _bearing; }
	public function get_max_speed () : Float { return 5;}
	public function get_max_angular_velocity () : Float { return 0.1;}
	
	public function new() 
	{
		super();
		
		_mass = 1;
		_location  = new Vector2d (0, 0);            
		_velocity  = new Vector2d (0, 0);           
		_acceleration = new Vector2d (0, 0); 
				
		_moment_of_inertia = 1;
		_bearing = new Vector2d (1, 0);
		_angular_velocity = 0;
		_angular_acceleration = 0;
		
		_forward_thrust = 0;
		_angular_thrust = 0;
		
		_timer = new Timer(TIME_BETWEEN_UPDATES);
		_timer.run = update;
	}

	static var iter : Int = 0;
	
	public function update() : Void
	{
		_acceleration = _bearing.clone();
		_acceleration = _acceleration.multiply (_forward_thrust * _mass);
		_velocity = _velocity.add (_acceleration);
	
		var vel_mag = _velocity.mag();
		_velocity.normalize ();

	    if (vel_mag > get_max_speed ()) 
		{     		
			_velocity = _velocity.multiply (get_max_speed ());
		}
		else
		{
			_velocity = _velocity.multiply (vel_mag);
		}		
		
		_location = _location.add (_velocity );
		_angular_acceleration = _angular_thrust * _moment_of_inertia;
		_angular_velocity += _angular_acceleration;
		_angular_velocity = _angular_velocity * .9;
		
		if (_angular_velocity > get_max_angular_velocity()) _angular_velocity = get_max_angular_velocity();
		if (_angular_velocity < -get_max_angular_velocity()) _angular_velocity = -get_max_angular_velocity();
		
		_bearing.rotate (_angular_velocity);
		
		while (_location.x > Constants.BATTLEFIELD_WIDTH) _location.x -= Constants.BATTLEFIELD_WIDTH;
		while (_location.x < 0) _location.x += Constants.BATTLEFIELD_WIDTH;
		while (_location.y > Constants.BATTLEFIELD_HEIGHT) _location.y -= Constants.BATTLEFIELD_HEIGHT;
		while (_location.y < 0) _location.y += Constants.BATTLEFIELD_HEIGHT;
		
		x = Math.round (_location.x) % Constants.BATTLEFIELD_WIDTH ; 
		y = Math.round (_location.y) % Constants.BATTLEFIELD_HEIGHT;
		
		rotation = (_bearing.theta () / (2 * Math.PI) * 360) + 90;
	
		iter ++;
		if ((iter % 100) == 0)
		{
		//	trace ();		
		//	trace ("ROTATION     : " + rotation);
		}
	}	
	
	public function trace () : Void
	{
		trace ("loc (" + _location.x + ", " + _location.y + ")");
		trace ("bea (" + _bearing.x + ", " + _bearing.y + ")");
		trace ("vel (" + _velocity.x + ", " + _velocity.y + ")");
		trace ("ang vel (" + _angular_velocity + ", " + _angular_acceleration + ")");
		trace ("acc (" + _acceleration.x + ", " + _acceleration.y + ")");
		trace ("");
	}
}