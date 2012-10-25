package sk.prasa.examples.albumbasic.view.components 
{
	import flash.display.Sprite;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	
	import sk.prasa.examples.albumbasic.view.components.ImageLoader;	
	
	/**
	 * Container for the single thumb. Extends ImageLoader, so it's sprite 
	 * with loading possibilities and can be passed to the QueueLoader.
	 * 
	 * @author Michal Gron (michal.gron@gmail.com) 
	 */
	public class ThumbView extends ImageLoader 
	{
		public var title : String;
		
		public static var HIGHLIGHT_COLOR : uint = 0xE2007A;

		public function ThumbView(aID : String, aURL : String, aTitle : String)
		{
			super(aID, aURL);
			
			title = aTitle;
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
			trace("ThumbView.error: " + evt.text);
		}
		
		override protected function click(evt : MouseEvent) : void
		{
		}
		
		public function highlight(aValue : Boolean) : void
		{
			if(aValue)
			{
				this.graphics.beginFill(HIGHLIGHT_COLOR);
				this.graphics.drawRect(-2, -2, 4, 4);
				this.graphics.endFill();
			} else
			{
				this.graphics.clear();
			}
		}
	}
}
