package sk.prasa.examples.albumbasic.view.components 
{
	import flash.display.DisplayObject;
	
	import com.yahoo.astra.layout.LayoutContainer;
	import com.yahoo.astra.layout.modes.FlowLayout;
	
	import gs.TweenLite;	
	
	/**
	 * Thumbs view. In general it's a flow-layout container.
	 * 
	 * @author Michal Gron (michal.gron@gmail.com)
	 */
	public class ThumbsView extends LayoutContainer 
	{
		public static var HORIZONTAL_GAP : Number = 2;
		public static var VERTICAL_GAP : Number = 2;
		
		public function ThumbsView()
		{
			super();
			
			var tThumbsLayoutMode : FlowLayout = new FlowLayout();
				tThumbsLayoutMode.horizontalGap = HORIZONTAL_GAP;
				tThumbsLayoutMode.verticalGap = VERTICAL_GAP;
			
			this.layoutMode = tThumbsLayoutMode;
		}
		
		override public function addChild(child : DisplayObject) : DisplayObject
		{
			var tChild : DisplayObject = super.addChild(child);
				tChild.alpha = 0;
				
			TweenLite.to(tChild, 0.5, {alpha:1});
			
			return tChild;
		}
	}
}
