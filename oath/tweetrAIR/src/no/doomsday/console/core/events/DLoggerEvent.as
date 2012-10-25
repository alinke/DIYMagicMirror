package no.doomsday.console.core.events
{
	import flash.events.Event;
	
	public class DLoggerEvent extends Event
	{
		public static const LOG:String 			= "log";
		public static const DESCRIBE:String 	= "describe";
		public static const HEADER:String 		= "header";
		public static const CR:String 			= "cr";
		
		public static const CODE_SUCCESS:uint 	= 0;
		public static const CODE_INFO:uint 		= 2;
		public static const CODE_EVENT:uint 	= 2;
		public static const CODE_ERROR:uint 	= 3;
		public static const CODE_WARNING:uint 	= 4;
		public static const CODE_TRACE:uint 	= 5;
		
		public var appendLast:Boolean;
		public var message:Object;
		public var severity:uint;
		public var origin:Object;
		
		public function DLoggerEvent(	$type:String,
										$message:Object,
										$appendLast:Boolean = false,
										$severity:uint = 0,
										$origin:Object = null,
										$bubbles:Boolean = false,
										$cancelable:Boolean = false)
		{
			super($type, $bubbles, $cancelable);
			
			message 	= $message;
			appendLast 	= $appendLast;
			severity 	= $severity;
			origin 		= $origin;
		}
		
		/**
		 * Creates and returns a copy of the current instance.
		 * @return A copy of the current instance.
		 */
		public override function clone():Event
		{
			return new DLoggerEvent(type, message, appendLast, severity, origin, bubbles, cancelable);
		}
		
		/**
		 * Returns a String containing all the properties of the current
		 * instance.
		 * @return A string representation of the current instance.
		 */
		public override function toString():String
		{
			return formatToString("AILoggerEvent","type","message","appendLast","severity","origin","bubbles","cancelable","eventPhase");
		}
	}
}