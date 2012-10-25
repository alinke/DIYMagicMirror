package sk.prasa.examples.albumbasic.model 
{
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import sk.prasa.examples.albumbasic.model.vo.RequestVO;		
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class ApplicationProxy extends Proxy implements IProxy 
	{	
		public static const NAME : String = "ApplicationProxy";

		public function ApplicationProxy(data : Object = null)
		{
			super(NAME, data);
		}
		
		public function getRequest() : RequestVO
		{
			return data as RequestVO;
		}
	}
}
