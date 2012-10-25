package no.doomsday.console.core.text 
{
	import com.adobe.serialization.json.JSON;
	import no.doomsday.console.core.commands.CommandArgument;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class ParseUtils
	{
		
		public function ParseUtils() 
		{
			
		}
		public static function parseForJson(arg:String):* {
			try {
				var ret:* = JSON.decode(arg);
				return ret;
			}catch (e:Error) {
				return arg
			}
		}
		public static function parseForArrays(commandArgs:Vector.<CommandArgument>):Vector.<CommandArgument> {
			for (var i:int = 0; i < commandArgs.length; i++) 
			{
				try {
					var test:* = JSON.decode(commandArgs[i].data);
					commandArgs[i].data = test;
				}catch (e:Error) {
					
				}
			}
			return commandArgs
		}
		
	}

}