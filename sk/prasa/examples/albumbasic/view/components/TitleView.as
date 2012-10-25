package sk.prasa.examples.albumbasic.view.components 
{
	import flash.display.Sprite;
	
	import com.bit101.components.Label;
	import com.bit101.components.Style;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class TitleView extends Sprite 
	{
		private var __title : Label;
		
		public static var COLOR : uint = 0xFFFFFF;
		
		public function TitleView()
		{
			Style.LABEL_TEXT = COLOR;
			
			__title = new Label(this, 0, 0, "");
		}

		public function set text(aText : String) : void
		{
			__title.text = aText != null ? aText : "";
		}

		public function get text() : String
		{
			return __title.text;
		}
	}
}
