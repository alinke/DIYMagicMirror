package sk.prasa.examples.albumbasic.controller 
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.patterns.observer.Notifier;
	
	import sk.prasa.examples.albumbasic.model.ServiceProxy;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 *  
	 */
	public class NextPageCommand extends SimpleCommand implements ICommand 
	{
		override public function execute(notification : INotification) : void
		{
			var tServiceProxy : ServiceProxy = facade.retrieveProxy(ServiceProxy.NAME) as ServiceProxy;
				tServiceProxy.getNextPage();
		}
	}
}
