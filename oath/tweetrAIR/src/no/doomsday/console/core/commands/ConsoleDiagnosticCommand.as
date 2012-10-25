package no.doomsday.console.core.commands
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class ConsoleDiagnosticCommand extends ConsoleCommand
	{
		public var dictionary:Dictionary;
		/**
		 * Creates an instance of ConsoleDiagnosticCommand
		 * Diagnostic commands provides inspection of a list of specified objects
		 * When triggered, arguments are iterated over and used to try and print properties on the object
		 * For instance "readMyMovieClip x y" will try to print out the x and y property values of the stored objects
		 * @param	trigger
		 * The trigger phrase
		 * @param	objects
		 * The objects to inspect. The references are stored in a weak dictionary
		 * WARNING: Solitary references will be GC'd!
		 */
		public function ConsoleDiagnosticCommand(trigger:String, objects:Array, grouping:String = "Application", helpText:String = "") 
		{
			super(trigger);
			this.dictionary = new Dictionary(true);
			this.grouping = grouping;
			this.helpText = helpText;
			for (var i:int = 0; i < objects.length; i++) 
			{
				dictionary["o" + i] = objects[i];
			}
		}
		
	}
	
}