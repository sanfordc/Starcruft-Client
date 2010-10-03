package ;

import flash.events.Event;
import flash.Lib;

/**
 * ...
 * @author Chris
 */

class Starcruft 
{

	public function new() 
	{
		var battlefield : Battlefield = new Battlefield();
		var battle_view : BattleView = new BattleView(battlefield);
		var ship : Ship = new Ship();
		
		Lib.current.addChild(battle_view);
		
		battlefield.addShip(ship);
		
		ship.engageForwardThruster();
		
		Lib.current.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}
	
	private function onEnterFrame(event : Event) : Void
	{
	}
	
}