package sk.prasa.examples.albumbasic.controller 
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import sk.prasa.examples.albumbasic.model.ApplicationProxy;
	import sk.prasa.examples.albumbasic.model.ServiceProxy;
	import sk.prasa.examples.albumbasic.model.vo.RequestVO;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class ModelPrepCommand extends SimpleCommand implements ICommand 
	{
		override public function execute(notification : INotification) : void
		{
			var tRequestVO : RequestVO = new RequestVO();
				tRequestVO.userid = "thisispinkfu";
				//tRequestVO.albumid = "5094406297232552993";	// sample album				tRequestVO.albumid = "5161355527636525521";	//diana
			
			facade.registerProxy(new ApplicationProxy(tRequestVO));
			facade.registerProxy(new ServiceProxy(ServiceProxy.NAME));
		}
	}
}
