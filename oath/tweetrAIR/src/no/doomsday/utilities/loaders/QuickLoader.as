package no.doomsday.utilities.loaders 
{
	import flash.display.Loader;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class QuickLoader extends Loader
	{
		
		public function QuickLoader(url:String) 
		{
			super();
			load(new URLRequest(url));
		}
		
	}

}