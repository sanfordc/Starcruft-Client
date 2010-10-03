package ;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.PixelSnapping;

/**
 * ...
 * @author Chris
 */

class RedShip extends BitmapData {public function new(){super(0,0);}}

class Ship extends SpaceObject
{
	static var FORWARD_THRUSTER_POWER : Float = 100.0;
	static var REVERSE_THRUSTER_POWER : Float = -100.0;
	static var LEFT_JET_POWER         : Float = -100.0;
	static var RIGHT_JET_POWER        : Float = 100.0;

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
		setForwardAcceleration(getForwardAcceleration() + FORWARD_THRUSTER_POWER);
	}
	
	public function disengageForwardThruster() : Void
	{
		setForwardAcceleration(getForwardAcceleration() - FORWARD_THRUSTER_POWER);
	}
	
	public function engageReverseThruster() : Void
	{
		setForwardAcceleration(getForwardAcceleration() + REVERSE_THRUSTER_POWER);
	}
	
	public function disengageReverseThruster() : Void
	{
		setForwardAcceleration(getForwardAcceleration() - REVERSE_THRUSTER_POWER);
	}
	
	public function engageLeftJet() : Void
	{
		setRotationAcceleration(getRotationAcceleration() + LEFT_JET_POWER);
	}
	
	public function disengageLeftJet() : Void
	{
		setRotationAcceleration(getRotationAcceleration() - LEFT_JET_POWER);
	}
	
	public function engageRightJet() : Void
	{
		setRotationAcceleration(getRotationAcceleration() + RIGHT_JET_POWER);
	}
	
	public function disengageRightJet() : Void
	{
		setRotationAcceleration(getRotationAcceleration() - RIGHT_JET_POWER);
	}
	
	public function engageCannon() : Void
	{
		
	}
	
	public function disengageCannon() : Void
	{
		
	}
}