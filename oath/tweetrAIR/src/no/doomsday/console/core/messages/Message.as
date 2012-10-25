package no.doomsday.console.core.messages
{
	
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public final class Message 
	{
		public var timestamp:String = "";
		public var text:String = "";
		public var repeatcount:int = 0;
		public var type:uint = 0;
		
		public function Message(text:String, timestamp:String, type:uint = 0) 
		{
			this.text = text;
			this.timestamp = timestamp;
			this.type = type;
		}
		
	}
	
}