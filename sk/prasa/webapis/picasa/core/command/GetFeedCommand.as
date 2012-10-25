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

package sk.prasa.webapis.picasa.core.command 
{
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import sk.prasa.webapis.picasa.core.receiver.IReceiver;
	import sk.prasa.webapis.picasa.objects.UrlParams;	
	
	/**
	 * Loads the feed, adds event handlers to the receiver. 
	 * Part of the Command Pattern
	 * 
	 * @author Michal Gron (michal.gron@gmail.com) 
	 * @private
	 */
	public class GetFeedCommand implements ICommand
	{
		private var receiver : IReceiver;
		private var params : UrlParams;
		
		/**
		 * Command constructor.
		 * 
		 * @param r IReceiver A IReceiver instance.
		 * @param p UrlParams Parameters to alter the feed url.
		 */
		public function GetFeedCommand(r : IReceiver, p : UrlParams)
		{
			receiver = r;
			params = p;
		}

		/**
		 * Executes the command.
		 * 
		 * @throws Error, generic.
		 */
		public function execute() : void
		{
			var tRequest : URLRequest = params.getURLRequest();

			trace("(" + tRequest.method + ") " + tRequest.url);
		
			var tLoader : URLLoader = receiver.responder;
				tLoader.addEventListener(Event.COMPLETE, receiver.result);
			
			try
			{
				tLoader.load(tRequest);
				
			} catch(e : Error)
			{
				throw new Error("Loading feed failed. Reasong: " + e.message);
			}
		}		
	}
}