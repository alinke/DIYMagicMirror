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

package sk.prasa.webapis.picasa.core.observer 
{	
	import sk.prasa.webapis.picasa.core.observer.IObservable;
	
	
	[ExcludeClass]
	/**
	 * Observable. Part of the Observer Pattern.
	 * 
	 * @author Michal Gron (michal.gron@gmail.com) 
	 * @private
	 */
	public class Observable implements IObservable 
	{
		private var __o : *;
		private var __observers : Array;

		public function Observable()
		{
			__observers = new Array();
		}

		/**
		 * Subscribes the IObserver instance to the IObservable object
		 * 
		 * @param o IObserver An IObserver instance.
		 */
		public function subscribe(o : IObserver) : void
		{
			__observers.push(o);
		}

		/**
		 * Subscribes the IObserver instance to the IObservable object
		 * 
		 * @param o IObserver An IObserver instance.
		 */
		public function unsubscribe(o : IObserver) : void
		{
			for(var a : int = 0; a < __observers.length; a++)
			{
				if(__observers[a] == o)
				{
					__observers.splice(a, 1);
					break;
				}
			}
		}

		/**
		 * Notify all observers.
		 */
		public function notify() : void
		{
			for(var key : String in __observers)
			{
				IObserver(__observers[key]).update(__o);
			}
		}
		
		/**
		 * Set object to be dispatched.
		 */
		public function setObject(o : *) : void
		{
			__o = o;
			
			notify();
		}
	}
}