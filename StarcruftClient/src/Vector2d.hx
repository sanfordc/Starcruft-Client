package ;

/**
 * ...
 * @author Chris
 */

class Vector2d 
{
	public var x : Float;
	public var y : Float;

	public function new( ?x : Float, ?y : Float) 
	{
		if (x == null)
		{
			this.x = 0;
		}
		else
		{
			this.x = x;
		}
		
		if (y == null)
		{
			this.y = 0;
		}
		else
		{
			this.y = x;
		}
	}
	
	public function toString() : String
	{
		return "x:" + x + " y:" + y;
	}
	
	public function clone() : Vector2d
	{
		return new Vector2d(x, y);
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
	
}