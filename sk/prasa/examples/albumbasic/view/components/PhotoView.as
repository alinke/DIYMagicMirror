package sk.prasa.examples.albumbasic.view.components 
{
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	
	import sk.prasa.examples.albumbasic.view.components.ImageLoader;	
	
	/**
	 * PhotoView. Extending Imageloader, so it can be easily added to QueueLoader.
	 * 
	 * @author Michal Gron (michal.gron@gmail.com) 
	 */
	public class PhotoView extends ImageLoader 
	{
		public function PhotoView(aID : String, aURL : String)
		{
			super(aID, aURL);
		}
		
		override protected function complete(evt : Event) : void
		{
			evt.stopImmediatePropagation();
			dispatchEvent(evt);
		}
		
		override protected function progress(evt : ProgressEvent) : void
		{
			evt.stopImmediatePropagation();
			dispatchEvent(evt);
		}
		
		override protected function error(evt : ErrorEvent) : void
		{
			trace("PhotoView.error: " + evt.text);
		}
		
		override protected function click(evt : MouseEvent) : void
		{
		}
	}
}
