package no.doomsday.console.core.gui 
{
	import flash.events.KeyboardEvent;
	import no.doomsday.console.core.input.KeyboardManager;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class KeyStroke
	{
		public var keyCodes:Array = [];
		private var manager:KeyboardManager;
		public function KeyStroke(manager:KeyboardManager, ...keyCodes:Array) 
		{
			this.manager = manager;
			this.keyCodes = keyCodes;
		}
		public function get valid():Boolean {
			for (var i:int = keyCodes.length; i--; ) 
			{
				if (!manager.keydict[keyCodes[i]]) {
					return false;
				}
			}
			return true;
		}
		
	}

}