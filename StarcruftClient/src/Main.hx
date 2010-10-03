package ;

import flash.Lib;

/**
 * ...
 * @author Chris
 */

class Main 
{
	
	static function main() 
	{
		var client : Client = new Client();
		
		Lib.current.addChild(client);
	}
	
}