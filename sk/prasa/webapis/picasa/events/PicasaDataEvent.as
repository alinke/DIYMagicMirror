/*
 * The MIT License
 * 
 * Copyright (c) 2008 Michal Gron (michal.gron@gmail.com)
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package sk.prasa.webapis.picasa.events
{
	import sk.prasa.webapis.picasa.objects.feed.IAtom;	
	
	import flash.events.Event;	

	/**
	 * Event constructed when the feed data is successfuly downloaded and parsed
	 * 
	 * @author Michal Gron (michal.gron@gmail.com) 
	 */
	public class PicasaDataEvent extends Event
	{
		/**
		 * On DATA Event type. 
		 */
		public static const DATA : String = "data";
		
		private var __data : IAtom;

		/**
		 * Picasa data event constructor.
		 * 
		 * @param type String
		 * @param bubbles Boolean
		 * @param cancelable Boolean
		 * @param data IAtom
		 */
		public function PicasaDataEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false, data : IAtom = null)
		{
			super(type, bubbles, cancelable);
			
			__data = data;
		}
		
		/**
		 * The data property. Contains IAtom feed. 
		 */
		public function get data() : IAtom
		{ 
			return __data; 
		}
		
		/**
		 * @private
		 */
		public function set data(data : IAtom) : void 
		{ 
			__data = data; 
		}
	}
}