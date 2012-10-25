package sk.prasa.examples.albumbasic.controller 
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import sk.prasa.examples.albumbasic.model.ServiceProxy;
	import sk.prasa.examples.albumbasic.model.vo.RequestVO;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class LoadCommand extends SimpleCommand implements ICommand 
	{	
		override public function execute(notification : INotification) : void
		{
			var tAlbumVO : RequestVO = notification.getBody() as RequestVO;
			var tServiceProxy : ServiceProxy = facade.retrieveProxy(ServiceProxy.NAME) as ServiceProxy;
				tServiceProxy.getPhotosList(tAlbumVO.userid, tAlbumVO.albumid);
		}
	}
}
