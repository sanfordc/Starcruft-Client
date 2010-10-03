package ;
import flash.display.Sprite;

/**
 * ...
 * @author Chris
 */

class BattleView extends Sprite
{
	public function new(battlefield : Battlefield) 
	{
		super();
		
		graphics.beginFill(0x4488FF);
		graphics.moveTo(10, 10);
		graphics.lineTo(110, 10);
		graphics.lineTo(110, 110);
		graphics.lineTo(10, 110);
		graphics.lineTo(10, 10);
		graphics.endFill();
	}
	
}