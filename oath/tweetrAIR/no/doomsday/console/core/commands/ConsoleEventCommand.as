package no.doomsday.console.core.commands
{
	
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class ConsoleEventCommand extends ConsoleCommand
	{
		public var event:String;
		/**
		 * Creates an instance of ConsoleEventCommand
		 * Console event commands cause the DConsole instance to dispatch a ConsoleEvent of the specified type
		 * Any trailing arguments (separated by a space) are attached to the event "args" property
		 * @param	trigger
		 * The trigger phrase
		 * @param	event
		 * The event type to be dispatched
		 */
		public function ConsoleEventCommand(trigger:String, event:String, grouping:String = "Application", helpText:String = "")
		{
			super(trigger);
			this.event = event;
			this.grouping = grouping;
			this.helpText = helpText;
		}
		
	}
	
}