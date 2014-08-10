package model;

/**
 * ...
 * @author Chris
 */

class Vector2d 
{
	public var x : Float;
	public var y : Float;

	public function new( ?xx : Float, ?yy : Float) 
	{
		if (xx == null)
		{
			this.x = 0;
		}
		else
		{
			this.x = xx;
		}
		
		if (yy == null)
		{
			this.y = 0;
		}
		else
		{
			this.y = yy;
		}
	}
	
	public function toString() : String
	{
		return "x:" + x + " y:" + y;
	}
	
	public function clone() : Vector2d
	{
		return new Vector2d(this.x, this.y);
	}
	
	public function add(that : Vector2d) : Vector2d
	{
		var result : Vector2d;
		
		result = new Vector2d(
			this.x + that.x,
			this.y + that.y
		);
			
		return result;
	}
	
	public function multiply(c : Float) : Vector2d
	{
		var result : Vector2d;
		
		result = new Vector2d(
			this.x * c,
			this.y * c
		);
		
		return result;
	}
	
	public function rotate (angle : Float) 
	{
		var angle_rad : Float = angle;
		x = x * Math.cos (angle_rad) - y * Math.sin (angle_rad);
		y = x * Math.sin (angle_rad) + y * Math.cos (angle_rad);
		
		// Might not be needed
		normalize ();
	}
	
	public function normalize () : Void
	{
		var len = mag ();
		if (len != 0)
		{
			x /= len;
			y /= len;
		}
	}		
	
	public function theta () : Float
	{
		if (x == 0) 
		{
			return if (y>0) 0 else (-Math.PI);
		}
		return Math.atan2 (y, x);
	}
	
	public function mag () : Float
	{
		return Math.sqrt (x * x + y * y);
	}
}