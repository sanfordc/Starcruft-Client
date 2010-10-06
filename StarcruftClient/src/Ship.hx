package ;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.PixelSnapping;

/**
 * ...
 * @author Chris
 */

class RedShip extends BitmapData {public function new(){super(0,0);}}
class BlueShip extends BitmapData {public function new(){super(0,0);}}
class GreenShip extends BitmapData {public function new(){super(0,0);}}

class Ship extends SpaceObject
{
	static var FORWARD_THRUSTER_POWER : Float = 40.0;
	static var REVERSE_THRUSTER_POWER : Float = -10.0;
	static var LEFT_JET_POWER         : Float = -1;
	static var RIGHT_JET_POWER        : Float = 1;
	static var POWER_SCALE_FACTOR     : Float = 1/100.0;
	static var ROTATION_VELOCITY_CAP  : Float = 1;
	static var VELOCITY_CAP  : Float = 1;

	public function new() 
	{
		super();
		
		var red_ship_bitmap_data : BitmapData;
		
		red_ship_bitmap_data = new RedShip();
		
		var red_ship_bitmap : Bitmap = new Bitmap(red_ship_bitmap_data, PixelSnapping.AUTO, false);
		
		red_ship_bitmap.x = -30;
		red_ship_bitmap.y = -30;
		
		red_ship_bitmap.scaleX = 0.5;
		red_ship_bitmap.scaleY = 0.5;
		
		addChild(red_ship_bitmap);
	}
	
	public function engageForwardThruster() : Void
	{
		_forward_thrust += FORWARD_THRUSTER_POWER * POWER_SCALE_FACTOR;
	}
	
	public function disengageForwardThruster() : Void
	{
		_forward_thrust -= FORWARD_THRUSTER_POWER * POWER_SCALE_FACTOR;
	}
	
	public function engageReverseThruster() : Void
	{
		_forward_thrust += REVERSE_THRUSTER_POWER * POWER_SCALE_FACTOR;
	}
	
	public function disengageReverseThruster() : Void
	{
		_forward_thrust -= REVERSE_THRUSTER_POWER * POWER_SCALE_FACTOR;
	}
	
	public function engageLeftJet() : Void
	{
		_angular_thrust += LEFT_JET_POWER * POWER_SCALE_FACTOR;
	}
	
	public function disengageLeftJet() : Void
	{
		_angular_thrust -= LEFT_JET_POWER * POWER_SCALE_FACTOR;
	}
	
	public function engageRightJet() : Void
	{
		_angular_thrust += RIGHT_JET_POWER * POWER_SCALE_FACTOR;
	}
	
	public function disengageRightJet() : Void
	{
		_angular_thrust -= RIGHT_JET_POWER * POWER_SCALE_FACTOR;
	}
	
	public function engageCannon() : Void
	{
		
	}
	
	public function disengageCannon() : Void
	{
		
	}
}