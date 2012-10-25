package sk.prasa.examples.albumbasic.view 
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import sk.prasa.examples.albumbasic.ApplicationFacade;
	import sk.prasa.examples.albumbasic.view.components.TitleView;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class TitleMediator extends Mediator implements IMediator 
	{
		public static const NAME : String = "TitleMediator";
		
		public function TitleMediator(viewComponent : Object = null)
		{
			super(NAME, viewComponent);
		}
		
		override public function listNotificationInterests() : Array
		{
			return [ApplicationFacade.TITLE_CHANGE_EVENT];
		}
		
		override public function handleNotification(notification : INotification) : void
		{
			switch(notification.getName())
			{
				case ApplicationFacade.TITLE_CHANGE_EVENT:
					this.title.text = notification.getBody() as String;
					break;
			}
		}
		
		private function get title() : TitleView
		{
			return viewComponent as TitleView;
		}
	}
}
