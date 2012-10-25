package sk.prasa.examples.albumbasic.model.vo 
{
	import flash.geom.Point;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class ToolTipVO 
	{
		public var position : Point;
		public var text : String;
		
		public function ToolTipVO(aPosition : Point = null, aText : String = "")
		{
			position = (aPosition != null) ? aPosition : new Point(0, 0);
			text = aText;
		}
	}
}
