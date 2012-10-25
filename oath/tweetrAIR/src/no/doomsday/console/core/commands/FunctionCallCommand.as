package no.doomsday.console.core.commands{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class FunctionCallCommand extends ConsoleCommand
	{
		private var callbackDict:Dictionary;
		/**
		 * Creates a callback command, which calls a function when triggered
		 * @param	trigger
		 * The trigger phrase
		 * @param	callback
		 * The function to call
		 */
		public function FunctionCallCommand(trigger:String, callback:Function, grouping:String = "Application", helpText:String = "")
		{
			callbackDict = new Dictionary(true);
			callbackDict["callback"] = callback;
			super(trigger);
			this.grouping = grouping;
			this.helpText = helpText;
		}
		public function get callback():Function {
			return callbackDict["callback"] as Function;
		}
		
	}
	
}