package no.doomsday.console.core.commands
{
	
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class ConsoleCommand 
	{
		public var trigger:String;
		public var helpText:String = "";
		public var returnType:String = "";
		public var grouping:String = "Application";
		/**
		 * Abstract ConsoleCommand class
		 * @param	trigger
		 */
		public function ConsoleCommand(trigger:String) 
		{
			this.trigger = trigger;
		}
		
	}
	
}