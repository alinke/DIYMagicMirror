package sk.prasa.examples.albumbasic.controller 
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import sk.prasa.examples.albumbasic.ApplicationFacade;
	import sk.prasa.examples.albumbasic.model.ContentProxy;		
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class DataCommand extends SimpleCommand implements ICommand 
	{	
		override public function execute(notification : INotification) : void
		{
			if(facade.hasProxy(ContentProxy.NAME))
			{
				facade.removeProxy(ContentProxy.NAME);
			}
			
			facade.registerProxy(new ContentProxy(notification.getBody()));
			
			this.sendNotification(ApplicationFacade.CHANGE_THUMBS_EVENT);
		}
	}
}
