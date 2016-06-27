/*
Copyright (c)2011 Hook L.L.C

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

package com.jac.ogg.events 
{//Packge
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author Jake Callery
	 * Hook - http://www.byhook.com
	 * 
	 */
	public class OggManagerEvent extends Event 
	{//OggManagerEvent Class
	
		static public const ENCODE_BEGIN:String = "oggEncodeBegin";
		static public const ENCODE_COMPLETE:String = "oggEncodeComplete";
		static public const ENCODE_PROGRESS:String = "oggEncodeProgress";
		static public const ENCODE_CANCEL:String = "oggEncodeCancel";
		
		static public const DECODE_BEGIN:String = "oggDecodeBegin";
		static public const DECODE_PROGRESS:String = "oggDecodeProgress";
		static public const DECODE_COMPLETE:String = "oggDecodeComplete";
		static public const DECODE_CANCEL:String = "oggDecodeCancel";
		
		static public const WAV_ENCODE_BEGIN:String = "wavEncodeBegin";
		static public const WAV_ENCODE_COMPLETE:String = "wavEncodeComplete";
		static public const WAV_ENCODE_CANCEL:String = "wavEncodeCancel";
		static public const WAV_ENCODE_PROGRESS:String = "wavEncoderProgress";
		
		private var _data:Object;
		
		public function OggManagerEvent(type:String, $data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{//OggManagerEvent 
			super(type, bubbles, cancelable);
			_data = $data;
		}//OggManagerEvent
		
		public override function clone():Event 
		{ 
			return new OggManagerEvent(type, _data, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("OggManagerEvent", "type", "data", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get data():Object { return _data; }
		
	}//OggManagerEvent Class
	
}//Packge