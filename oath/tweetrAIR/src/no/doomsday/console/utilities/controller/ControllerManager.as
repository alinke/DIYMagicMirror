package no.doomsday.console.utilities.controller 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class ControllerManager extends Sprite
	{
		private var controllers:Vector.<Controller> = new Vector.<Controller>;
		public function ControllerManager() 
		{
			
		}
		public function createController(object:*, properties:Array,x:Number = 0,y:Number = 0):void {
			var c:Controller = new Controller(object, properties, this);
			c.x = x;
			c.y = y;
			controllers.push(addChild(c) as Controller);
		}
		public function removeController(c:Controller):void {
			for (var i:int = 0; i < controllers.length; i++) 
			{
				if (controllers[i] == c) {
					controllers.splice(i, 1);
					removeChild(c);
					break;
				}
			}
		}
		public function start():void {
			addEventListener(Event.ENTER_FRAME, update);
		}
		public function stop():void {
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			for (var i:int = 0; i < controllers.length; i++) 
			{
				controllers[i].update();
			}
		}
		
	}

}