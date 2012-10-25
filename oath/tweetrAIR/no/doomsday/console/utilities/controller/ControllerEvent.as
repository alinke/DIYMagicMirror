package no.doomsday.console.utilities.controller 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class ControllerEvent extends Event 
	{
		public static const VALUE_CHANGE:String = "valuechange";
		public function ControllerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new ControllerEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ControllerEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}