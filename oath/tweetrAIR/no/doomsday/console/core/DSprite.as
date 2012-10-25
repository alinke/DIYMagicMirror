package no.doomsday.console.core 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class DSprite extends Sprite
	{
		
		public function DSprite() 
		{
			
		}
		protected function systemTrace(...args:Array):void {
			trace.apply(this, args);
		}
		
	}

}