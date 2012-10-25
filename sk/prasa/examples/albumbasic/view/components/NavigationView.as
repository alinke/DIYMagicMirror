package sk.prasa.examples.albumbasic.view.components 
{
	import flash.events.KeyboardEvent;	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import com.bit101.components.PushButton;
	import com.bit101.components.Style;	
	
	/**
	 * Navigation view. 
	 * Holds the prev/next photo links and prev/next page links 
	 * 
	 * @author Michal Gron (michal.gron@gmail.com) 
	 */
	public class NavigationView extends Sprite 
	{	
		public static const PREV_PAGE_EVENT : String = "prev_page_event";
		public static const NEXT_PAGE_EVENT : String = "next_page_event";
		
		public static const PREV_PHOTO_EVENT : String = "prev_photo_event";
		public static const NEXT_PHOTO_EVENT : String = "next_photo_event";
		
		public function NavigationView()
		{
			Style.BACKGROUND = 0x9B0054;
			Style.BUTTON_FACE = 0xE2007A;
			
			Style.LABEL_TEXT = 0xFFFFFF;
			Style.DROPSHADOW = 0xE2007A;
			
			var tPrevPage : PushButton = new PushButton(this, 0, 0, "<<", onPrevPage);
				tPrevPage.width = 16; tPrevPage.height = 14;
				
			var tPrevPhoto : PushButton = new PushButton(this, 30, 0, "<", onPrevPhoto);
				tPrevPhoto.width = 14; tPrevPhoto.height = 14;
				
			var tNextPhoto : PushButton = new PushButton(this, 50, 0, ">", onNextPhoto);
				tNextPhoto.width = 14; tNextPhoto.height = 14;
				
			var tNextPage : PushButton = new PushButton(this, 80, 0, ">>", onNextPage);
				tNextPage.width = 16; tNextPage.height = 14;
				
			this.addEventListener(Event.ADDED_TO_STAGE, initializeKeyboard);
		}
		
		private function initializeKeyboard(evt : Event) : void
		{
			this.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}

		private function onKeyUp(evt : KeyboardEvent) : void
		{
			switch(evt.keyCode)
			{
				case 37: dispatchEvent(new Event(PREV_PHOTO_EVENT)); break;	// arrow left
				case 39: dispatchEvent(new Event(NEXT_PHOTO_EVENT)); break;	// arrow right
				case 38: dispatchEvent(new Event(PREV_PAGE_EVENT)); break;	// arrow up
				case 40: dispatchEvent(new Event(NEXT_PAGE_EVENT)); break;	// arrow down
			}
		}
		
		private function onPrevPage(evt : Event) : void
		{
			dispatchEvent(new Event(PREV_PAGE_EVENT));
		}
		
		private function onNextPage(evt : Event) : void
		{
			dispatchEvent(new Event(NEXT_PAGE_EVENT));
		}
		
		private function onPrevPhoto(evt : Event) : void
		{
			dispatchEvent(new Event(PREV_PHOTO_EVENT));
		}
		
		private function onNextPhoto(evt : Event) : void
		{
			dispatchEvent(new Event(NEXT_PHOTO_EVENT));
		}
	}
}
