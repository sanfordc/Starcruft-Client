package model;

/**
 * ...
 * @author Chris
 */

class Object 
{
	public var _mass : Float;
	public var _location : Vector2d;
	public var _velocity : Vector2d;
	public var _acceleration : Vector2d;

	public var _moment_of_inertia : Float;
	public var _bearing : Vector2d;
	public var _angular_velocity : Float;    // + is clockwise
	public var _angular_acceleration : Float;
	
	public var _forward_thrust : Float;
	public var _angular_thrust : Float;
	public var _max_speed : Float;
	public var _max_angular_velocity : Float;
	
	public function move_to_bounds (X_MAX : Float, Y_MAX : Float) : Void {
		while (_location.x > X_MAX) _location.x -= X_MAX;
		while (_location.x < 0) _location.x += X_MAX;
		while (_location.y > Y_MAX) _location.y -= Y_MAX;
		while (_location.y < 0) _location.y += Y_MAX;
	}
	
	public function new(ms : Float, mav : Float) 
	{
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
		
		_max_speed = ms;
		_max_angular_velocity = mav;
	}

	public function update() : Void
	{
		_acceleration = _bearing.clone();
		_acceleration = _acceleration.multiply (_forward_thrust * _mass);
		_velocity = _velocity.add (_acceleration);
	
		var vel_mag = _velocity.mag();
		_velocity.normalize ();

	    if (vel_mag > _max_speed) 
		{     		
			_velocity = _velocity.multiply (_max_speed);
		}
		else
		{
			_velocity = _velocity.multiply (vel_mag);
		}		
		
		_location = _location.add (_velocity );
		_angular_acceleration = _angular_thrust * _moment_of_inertia;
		_angular_velocity += _angular_acceleration;
		_angular_velocity = _angular_velocity * .9;
		
		if (_angular_velocity > _max_angular_velocity) _angular_velocity = _max_angular_velocity;
		if (_angular_velocity < -_max_angular_velocity) _angular_velocity = -_max_angular_velocity;
		
		_bearing.rotate (_angular_velocity);
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