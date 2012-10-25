package sk.prasa.examples.albumbasic.view.components 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class ToolTipView extends Sprite 
	{	
		public static var FOLLOW_MOUSE : Boolean = true;
		public static var BACKGROUND_COLOR : uint = 0xE2007A;
		public static var COLOR : uint = 0xFFFFFF;
		
		public function ToolTipView()
		{
		}
		
		public function draw(aPoint : Point, aText : String) : void
		{
			if(aText == null)
			{
				return;
			}
			
			this.clear();
			
			if(!FOLLOW_MOUSE)
			{
				this.x = aPoint.x;
				this.y = aPoint.y;
			} else
			{
				this.stage.addEventListener(MouseEvent.MOUSE_MOVE, move);
			}
			
			var tTF : TextField = new TextField();
				tTF.name = "tf";
				tTF.autoSize = "left";
				tTF.embedFonts = true;
				tTF.background = true;
				tTF.backgroundColor = BACKGROUND_COLOR;
			tTF.defaultTextFormat = new TextFormat("PF Ronda Seven", 8, COLOR);
				tTF.text = "" + aText;
				
			this.addChild(tTF);
		}
		
		public function clear() : void
		{
			if(this.getChildByName("tf"))
			{
				if(FOLLOW_MOUSE)
				{
					this.removeEventListener(MouseEvent.MOUSE_MOVE, move);
				}
				
				this.removeChild(this.getChildByName("tf"));
			}
		}
		
		private function move(evt : MouseEvent) : void
		{
			var tOffset : Point = new Point(0, -20);
				
			if((evt.stageX + this.width) > this.stage.stageWidth)
			{
				tOffset.x -= this.width;
			}
			
			this.x = evt.stageX + tOffset.x;
			this.y = evt.stageY + tOffset.y;
		}
	}
}
