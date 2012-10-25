package no.doomsday.console 
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import no.doomsday.console.core.DLogger;
	import no.doomsday.console.core.interfaces.ILogger;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class LoggerUtil
	{
		private static var _instance:DLogger;
		public static function set pass(password:String):void {
			_instance.setPassword(password);
		}
		public static function set width(n:Number):void {
			var rect:Rectangle = _instance.getDims();
			rect.width = n;
			_instance.setDims(rect);
		}
		public static function get width():Number {
			return _instance.getDims().width;
			
		}
		public static function set height(n:Number):void {
			var rect:Rectangle = _instance.getDims();
			rect.height = n;
			_instance.setDims(rect);
		}
		public static function get height():Number{
			return _instance.getDims().height;	
		}
		public static function get instance():DLogger {
			if (!_instance)_instance = new DLogger();
			return _instance;
		}
		/**
		 * Log a message
		 * @param	...args
		 */
		public static function log(...args):void {
			instance.log.apply(instance, args);
		}
		/**
		 * Print out a message with specific coloring
		 * @param	message
		 * The message string
		 * @param	messageType
		 * The message type (found in the console.core.messages.MessageTypes enum)
		 * @param	appendLast
		 * Flag to force-append the message to the end of the stack
		 */
		public static function print(message:String, messageType:int,appendLast:Boolean = false):void {
			_instance.addMessage(message, messageType, appendLast);
		}
		
		public function LoggerUtil() 
		{
			throw new Error("Use static methods");
		}
		
	}

}