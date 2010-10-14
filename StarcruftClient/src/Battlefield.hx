package ;
import flash.display.Sprite;
import flash.Lib;

/**
 * ...
 * @author Chris
 */

class Battlefield extends Sprite
{
	/* Dimensions of the battlefield in space units */
	var _width : Float;
	var _height : Float;

	var _space_objects : Array<SpaceObject>;
	
	public function new(width : Float, height : Float) 
	{
		super();
		
		_space_objects = new Array<SpaceObject>();
		
		_width = width;
		_height = height;
		
		draw();
	}
	
	public function addSpaceObject(object : SpaceObject) : Void
	{
		_space_objects.push(object);
		addChild(object);
	}
	
	public function removeSpaceObject(object : SpaceObject) : Void
	{
		_space_objects.remove (object);
		removeChild (object);
	}
	
	
	private function draw() : Void
	{
  		graphics.beginFill(0x000000);
//		graphics.beginFill(0xffffff);
		graphics.drawRect(0, 0, _width, _height);
		graphics.endFill();
		
		var NUM_STARS = 30;
		var MIN_STAR_RADIUS = 1;
		var MAX_STAR_RADIUS = 2;
		
		var i_star : UInt;
		
		for (i_star in 0 ... NUM_STARS)
		{
			var x : Float;
			var y : Float;
			var radius : Float;
			
			x = Math.random() * _width;
			y = Math.random() * _height;
			radius = Math.random() * (MAX_STAR_RADIUS - MIN_STAR_RADIUS) + MIN_STAR_RADIUS;
			
			graphics.beginFill(0xAAAAAA);
			graphics.drawCircle(x, y, radius);
			graphics.endFill();
		}
	}
}