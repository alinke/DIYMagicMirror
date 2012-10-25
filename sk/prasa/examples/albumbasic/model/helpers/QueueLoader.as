package sk.prasa.examples.albumbasic.model.helpers 
{
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	
	import sk.prasa.examples.albumbasic.view.components.ImageLoader;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 * Based on http://library.sfug.ch/trac/
	 * Thank you guys!
	 */
	public class QueueLoader extends EventDispatcher 
	{
		private var __queue : Array;
		private var __current : int;
		private var __running : Boolean;

		public function QueueLoader() 
		{
			super();
			
			__queue = new Array();
		}

		/**
		 * starts to download the queue
		 */
		public function run() : void 
		{
			__current = 0;
			
			loadStart();
			loadNext();
		}

		/**
		 * adds a loader to the queue
		 */
		public function add(aLoader : ImageLoader) : void 
		{
			if(aLoader != null)
			{
				__queue.push(aLoader);
			}
		}

		/**
		 * removes all loaders from the queue
		 */
		public function removeAll() : void 
		{
			__queue = new Array();
		}

		/**
		 * stops the loaders
		 */
		public function stop() : void 
		{
			if(running) 
			{
				var loader : ImageLoader = ImageLoader(__queue[__current - 1]);
				
				if(loader != null)
				{
					loader.removeEventListener(Event.COMPLETE, onLoaded);
					loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
					loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
					
					loader.close();
				}
			}
		}

		/**
		 * returns true when the queueloader is running
		 */
		public function get running() : Boolean 
		{
			return __running;
		}

		/**
		 * catches the event from a loader when its finished with loading
		 */
		protected function onLoaded(evt : Event) : void 
		{
			var loader : ImageLoader = ImageLoader(evt.target);
				loader.removeEventListener(Event.COMPLETE, onLoaded);
				loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
				loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
				
			dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, __current, __queue.length));
			
			loadNext();
		}
		
		protected function onError(evt : ErrorEvent) : void
		{
			var loader : ImageLoader = ImageLoader(evt.target);
				loader.removeEventListener(Event.COMPLETE, onLoaded);
				loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
				loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
				
			dispatchEvent(evt);
			
			loadNext();
		}

		/**
		 * loads the next loader.
		 */
		protected function loadNext() : void 
		{
			if(__queue.length > __current && running) 
			{ 
				var tLoader : ImageLoader = ImageLoader(__queue[__current++]);

				tLoader.addEventListener(IOErrorEvent.IO_ERROR, onError);
				tLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
				tLoader.addEventListener(Event.COMPLETE, onLoaded);
				tLoader.load();
				
			} else 
			{
				loadEnd();
			}
		}

		/**
		 * dispatches the open event. and sets the run state to true.
		 */
		protected function loadStart() : void 
		{
			__running = true;
			
			dispatchEvent(new Event(Event.OPEN));
		}

		/**
		 * dispatches the complete event. and sets the run state to false.
		 */
		protected function loadEnd() : void 
		{
			__running = false;
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}