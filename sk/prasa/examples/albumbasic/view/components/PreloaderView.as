package sk.prasa.examples.albumbasic.view.components 
{
	import flash.display.Sprite;
	
	import com.bit101.components.ProgressBar;	

	/**
	 * Preloader. 
	 * 
	 * @author Michal Gron (michal.gron@gmail.com) 
	 */
	public class PreloaderView extends Sprite 
	{
		private var indicator : ProgressBar;

		public function PreloaderView()
		{
			initializeIndicator();
		}

		private function initializeIndicator() : void
		{
			indicator = new ProgressBar(this, 0, 0);
			// we need to set the size here, because it breaks the bar 
			// when setting size while setting the value! 
			indicator.setSize(320, 4);
			indicator.maximum = 100;
			indicator.visible = false;
		}

		public function setProgress(aValue : Number) : void
		{
			indicator.visible = aValue >= 0 && aValue < 100;
			indicator.value = aValue;
		}
	}
}
