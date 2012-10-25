package no.doomsday.console.core.gui 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class ScaleHandle extends Sprite
	{
		
		public function ScaleHandle() 
		{
			buttonMode = true;
			tabEnabled = false;
			alpha = 0;
			graphics.beginFill(0x333333);
			graphics.drawRect(0, 0, 30, 10);
			var dsf:DropShadowFilter = new DropShadowFilter(0, 90, 0, 1, 4, 4, 1, 1, true);
			filters = [dsf];
			addEventListener(MouseEvent.ROLL_OVER, onRollOver, false, 0, true);
			addEventListener(MouseEvent.ROLL_OUT, onRollOut, false, 0, true);
			addEventListener(MouseEvent.MOUSE_DOWN, startScale, false, 0, true);
		}
		
		private function startScale(e:MouseEvent):void 
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, scale,false,0,true);
			stage.addEventListener(MouseEvent.MOUSE_UP, stopScale,false,0,true);
			removeEventListener(MouseEvent.ROLL_OVER, onRollOver);
			removeEventListener(MouseEvent.ROLL_OUT, onRollOut);
		}
		
		private function stopScale(e:MouseEvent):void 
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, scale);
			stage.removeEventListener(MouseEvent.MOUSE_UP, stopScale);
			addEventListener(MouseEvent.ROLL_OVER, onRollOver, false, 0, true);
			addEventListener(MouseEvent.ROLL_OUT, onRollOut, false, 0, true);
			alpha = 0;
		}
		
		private function scale(e:MouseEvent):void 
		{
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		private function onRollOut(e:MouseEvent):void 
		{
			alpha = 0;
		}
		
		private function onRollOver(e:MouseEvent):void 
		{
			alpha = .8;
		}
		
	}

}