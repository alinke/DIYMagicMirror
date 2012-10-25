package sk.prasa.examples.albumbasic.view.components 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import gs.TweenLite;		
	
	/**
	 * AlbumView, holds all the photos as PhotoView.
	 * 
	 * @author Michal Gron (michal.gron@gmail.com)
	 */
	public class AlbumView extends Sprite 
	{	
		override public function addChild(aChild : DisplayObject) : DisplayObject
		{
			var tChild : DisplayObject = super.addChild(aChild);
				tChild.alpha = 0;
				
			TweenLite.to(tChild, 0.5, {alpha : 1});
			
			return tChild;
		}
		
		override public function removeChild(aChild : DisplayObject) : DisplayObject
		{ 
			TweenLite.to(aChild, 0.5, {alpha : 0, onComplete : this.onRemoveChild, onCompleteParams : [aChild]});
			
			return aChild;
		}
		
		private function onRemoveChild(aChild : DisplayObject) : void
		{
			super.removeChild(aChild);
		}
	}
}
