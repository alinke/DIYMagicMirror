package sk.prasa.examples.albumbasic.controller 
{
	import flash.display.DisplayObject;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import sk.prasa.examples.albumbasic.view.ApplicationMediator;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class ViewPrepCommand extends SimpleCommand implements ICommand 
	{
		override public function execute(notification : INotification) : void
		{
			facade.registerMediator(new ApplicationMediator(notification.getBody() as DisplayObject));
		}
	}
}
