package no.doomsday.console.core.errors 
{
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class NotImplementedError extends Error
	{
		
		public function NotImplementedError(message:String = "Not implemented", id:int = 0)
		{
			super(message, id);
		}
		
	}

}