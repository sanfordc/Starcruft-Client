package ;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.PixelSnapping;
/**
 * ...
 * @author Chris
 */
class YellowProjectile extends BitmapData { public function new() { super(0, 0); }}

class Projectile extends SpaceObject
{
	static var SPEED : Int = 10;
	static var MAX_LIFE : Int = 100;
	var _life : Int;
	var _dead : Bool;
	
	public override function get_max_speed () : Float { return 25;}
	
	public function new(field : Battlefield, parent : SpaceObject) 
	{
		super(field, parent);
		_life = 0;
		_dead = false;

		var bitmap_data : BitmapData;
		bitmap_data = new YellowProjectile();
		var bitmap : Bitmap = new Bitmap(bitmap_data, PixelSnapping.AUTO, false);
		
//		bitmap.scaleX = 1;
//		bitmap.scaleY = 1;
		bitmap.x = -2; // HACK: Offset a bit to get in the middle of ship 'cannon'
//		bitmap.y = -30;

		_location = parent.get_location().clone();
		_bearing = parent.get_bearing().clone();
		addChild(bitmap);
		var par_vel : Vector2d = parent.get_bearing().clone();
		par_vel = par_vel.multiply (SPEED);
		// _velocity = _velocity.add (parent.get_bearing().multiply (SPEED));
		_velocity = _velocity.add (parent.get_velocity());
		_velocity = _velocity.add (par_vel);
//		trace ("Fired!");
//		trace ();
	}
	
	public override function update() : Void
	{	// TODO: This should be moved to parent class...
		if (!_dead)
		{
			if (_life > MAX_LIFE)
			{
				_battlefield.removeSpaceObject (this);
				_dead = true;
			}
			else
			{
				_life++;
				super.update();
			}
		}
		// trace ();
	}
}