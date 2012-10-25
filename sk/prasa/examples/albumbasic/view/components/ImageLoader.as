package sk.prasa.examples.albumbasic.view.components 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;	
	
	/**
	 * Generic image loader. It's a loader instance for the queue loader.
	 * It's a sprite with loading possibilities :) but can have more than one child.
	 * 
	 * @author Michal Gron (michal.gron@gmail.com) 
	 */
	public class ImageLoader extends Sprite
	{
		private var __loader : Loader;
		
		public var id : String;
		public var url : String;
		
		public function ImageLoader(aID : String, aURL : String)
		{			
			id = aID;
			url = aURL;
			
			__loader = new Loader();
			__loader.mouseEnabled = false;	// because if true, MouseEvent.CLICK is sent from Loader and not from this!
			__loader.contentLoaderInfo.addEventListener(Event.COMPLETE, complete);
			__loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			__loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, error);
			__loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, error);
			
			this.addChild(__loader);
			this.addEventListener(MouseEvent.CLICK, click);
		}
		
		public function load() : void
		{
			__loader.load(new URLRequest(url));
		}
		
		public function close() : void
		{
			__loader.close();
		}
		
		protected function complete(evt : Event) : void
		{
			dispatchEvent(evt);
		}
		
		protected function progress(evt : ProgressEvent) : void
		{
			dispatchEvent(evt);
		}
		
		protected function error(evt : ErrorEvent) : void
		{
			dispatchEvent(evt);
		}
		
		protected function click(evt : MouseEvent) : void
		{
		}
	}
}
