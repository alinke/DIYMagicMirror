package no.doomsday.console.core.errors 
{
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class ConsoleAuthError extends Error
	{
		
		public function ConsoleAuthError(message:String = "Not authenticated",id:int = 0)
		{
			super(message, id);
		}
		
	}

}