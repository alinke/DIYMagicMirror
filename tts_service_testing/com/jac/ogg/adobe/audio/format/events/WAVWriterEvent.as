package com.jac.ogg.adobe.audio.format.events 
{//Packge
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jake Callery
	 */
	public class WAVWriterEvent extends Event 
	{//WAVWriterEvent Class

		static public const ENCODE_COMPLETE:String = "wavWriterEncodeComplete";
		static public const ENCODE_CANCEL:String = "wavWriterEncodeCancel";
		static public const ENCODE_PROGRESS:String = "wavWriterEncodeProgress";
		
		private var _data:Object;
		
		public function WAVWriterEvent(type:String, $data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{//WAVWriterEvent 
			super(type, bubbles, cancelable);
			_data = $data;
		}//WAVWriterEvent
		
		public override function clone():Event 
		{ 
			return new WAVWriterEvent(type, data, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("WAVWriterEvent", "type", "data", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get data():Object { return _data; }
		
	}//WAVWriterEvent Class
	
}//Packge