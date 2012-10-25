package sk.prasa.examples.albumbasic.view 
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.puremvc.as3.patterns.observer.Notifier;
	
	import sk.prasa.examples.albumbasic.ApplicationFacade;
	import sk.prasa.examples.albumbasic.model.ApplicationProxy;
	import sk.prasa.examples.albumbasic.model.vo.RequestVO;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class ApplicationMediator extends Mediator implements IMediator 
	{
		public static const NAME : String = "ApplicationMediator";

		public function ApplicationMediator(viewComponent : Object = null)
		{
			super(NAME, viewComponent);
			
			facade.registerMediator(new AlbumMediator(app.album));
			facade.registerMediator(new ThumbsMediator(app.thumbs));
			facade.registerMediator(new PreloaderMediator(app.preloader));
			facade.registerMediator(new TitleMediator(app.title));
			facade.registerMediator(new NavigationMediator(app.navigation));
			facade.registerMediator(new ToolTipMediator(app.tooltip));
		}
		
		override public function onRegister() : void
		{
			var tAppProxy : ApplicationProxy = facade.retrieveProxy(ApplicationProxy.NAME) as ApplicationProxy;
			var tRequest : RequestVO = tAppProxy.getRequest(); 
			
			this.sendNotification(ApplicationFacade.LOAD_EVENT, tRequest);
		}

		override public function listNotificationInterests() : Array 
		{
			return [ApplicationFacade.RESIZE_EVENT, 
					ApplicationFacade.FULLSCREEN_EVENT];
		}

		override public function handleNotification(notification : INotification) : void 
		{
			switch (notification.getName()) 
			{
				case ApplicationFacade.RESIZE_EVENT : break;				case ApplicationFacade.FULLSCREEN_EVENT : break;
				default : break;
			}
		}
		
		protected function get app() : AlbumBasic
		{
			return viewComponent as AlbumBasic;
		}
	}
}
