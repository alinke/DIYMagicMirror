package sk.prasa.examples.albumbasic.view 
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import sk.prasa.examples.albumbasic.ApplicationFacade;
	import sk.prasa.examples.albumbasic.model.vo.ToolTipVO;
	import sk.prasa.examples.albumbasic.view.components.ToolTipView;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class ToolTipMediator extends Mediator implements IMediator 
	{
		public static const NAME : String = "ToolTipMediator";
		
		public function ToolTipMediator(viewComponent : Object = null)
		{
			super(NAME, viewComponent);
		}
		
		override public function listNotificationInterests() : Array
		{
			return [ApplicationFacade.THUMB_MOUSE_OVER,
					ApplicationFacade.THUMB_MOUSE_OUT];
		}
		
		override public function handleNotification(notification : INotification) : void
		{	
			switch(notification.getName())
			{
				case ApplicationFacade.THUMB_MOUSE_OVER:
					
					var tVO : ToolTipVO = notification.getBody() as ToolTipVO;
					this.tooltip.draw(tVO.position, tVO.text);
					
					break;
					
				case ApplicationFacade.THUMB_MOUSE_OUT:
					
					this.tooltip.clear();
					break;
			}
		}
		
		private function get tooltip() : ToolTipView
		{
			return viewComponent as ToolTipView;
		}
	}
}
