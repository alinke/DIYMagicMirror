package sk.prasa.examples.albumbasic.view 
{
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import sk.prasa.examples.albumbasic.ApplicationFacade;
	import sk.prasa.examples.albumbasic.view.components.NavigationView;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class NavigationMediator extends Mediator implements IMediator 
	{
		public static const NAME : String = "NavigationMediator";
		
		public function NavigationMediator(viewComponent : Object = null)
		{
			super(NAME, viewComponent);
			
			navigation.addEventListener(NavigationView.PREV_PAGE_EVENT, onPrevPage);
			navigation.addEventListener(NavigationView.NEXT_PAGE_EVENT, onNextPage);
			
			navigation.addEventListener(NavigationView.PREV_PHOTO_EVENT, onPrevPhoto);
			navigation.addEventListener(NavigationView.NEXT_PHOTO_EVENT, onNextPhoto);
		}
		
		override public function listNotificationInterests() : Array
		{
			return [];
		}
		
		override public function handleNotification(notification : INotification) : void
		{
		}
		
		private function onPrevPage(evt : Event) : void
		{
			this.sendNotification(ApplicationFacade.PREV_PAGE_EVENT);
		}
		
		private function onNextPage(evt : Event) : void
		{
			this.sendNotification(ApplicationFacade.NEXT_PAGE_EVENT);
		}
		
		private function onPrevPhoto(evt : Event) : void
		{
			this.sendNotification(ApplicationFacade.PREV_PHOTO_EVENT);
		}
		
		private function onNextPhoto(evt : Event) : void
		{
			this.sendNotification(ApplicationFacade.NEXT_PHOTO_EVENT);
		}
		
		private function get navigation() : NavigationView
		{
			return viewComponent as NavigationView;
		}
	}
}
