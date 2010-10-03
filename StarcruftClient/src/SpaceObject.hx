package ;
import flash.display.Sprite;
import haxe.Timer;

/**
 * ...
 * @author Chris
 */

class SpaceObject extends Sprite
{
	
	var _location              : Vector2d;
	var _velocity              : Vector2d;
	var _forward_acceleration  : Float;
	var _bearing               : Float;
	var _rotation_speed        : Float;
	var _rotation_acceleration : Float;
	
	var _timer : Timer;
	
	static var TIME_BETWEEN_UPDATES : Int = 10; // In milliseconds

	public function new() 
	{
		super();
		
		_location = new Vector2d();
		_velocity = new Vector2d();
		_forward_acceleration = 0;
		_bearing = 0;
		_rotation_speed = 0;
		_rotation_acceleration = 0;
		
		_timer = new Timer(TIME_BETWEEN_UPDATES);
		_timer.run = update;
	}
	
	public function setLocation(location : Vector2d) : Void
	{
		_location = location.clone();
		
		x = _location.x;
		y = _location.y;
	}
	
	public function getLocation() : Vector2d
	{
		return _location.clone();
	}
	
	public function setVelocity(velocity : Vector2d) : Void
	{
		_velocity = velocity.clone();
	}
	
	public function getVelocity() : Vector2d
	{
		return _velocity.clone();
	}
	
	public function setForwardAcceleration(forward_acceleration : Float) : Void
	{
		_forward_acceleration = forward_acceleration;
	}
	
	public function getForwardAcceleration() : Float
	{
		return _forward_acceleration;
	}
	
	public function setBearing(bearing : Float) : Void
	{
		_bearing = bearing;
		
		rotation = bearing;
	}
	
	public function getBearing() : Float
	{
		return _bearing;
	}
	
	public function setRotationSpeed(rotation_speed : Float) : Void
	{
		_rotation_speed = rotation_speed;
	}
	
	public function getRotationSpeed() : Float
	{
		return _rotation_speed;
	}
	
	public function setRotationAcceleration(rotation_acceleration : Float) : Void
	{
		_rotation_acceleration = rotation_acceleration;
	}
	
	public function getRotationAcceleration() : Float
	{
		return _rotation_acceleration;
	}
	
	public function update() : Void
	{
		var acceleration : Vector2d;
		
		acceleration = new Vector2d(
			_forward_acceleration * Math.sin(_bearing * 2 * Math.PI / 360) * TIME_BETWEEN_UPDATES / 1000.0,
			_forward_acceleration * Math.cos(_bearing * 2 * Math.PI / 360) * TIME_BETWEEN_UPDATES / 1000.0
		);
		
		var new_velocity : Vector2d;
		
		new_velocity = _velocity.add(acceleration);
		
		setVelocity(new_velocity);
		
		var new_location : Vector2d;
		
		new_location = _location.add(_velocity.multiply(TIME_BETWEEN_UPDATES / 1000.0));
		
		setLocation(new_location);
		
		var new_rotation_speed : Float;
		
		new_rotation_speed = _rotation_speed + _rotation_acceleration * TIME_BETWEEN_UPDATES / 1000.0;
		
		setRotationSpeed(new_rotation_speed);
		
		var new_bearing : Float;
		
		new_bearing = _bearing + _rotation_speed * TIME_BETWEEN_UPDATES / 1000.0;
		
		while (new_bearing >= 360)
		{
			new_bearing -= 360;
		}
		
		while (new_bearing < 0)
		{
			new_bearing += 360;
		}
		
		setBearing(new_bearing);
	}
	
}