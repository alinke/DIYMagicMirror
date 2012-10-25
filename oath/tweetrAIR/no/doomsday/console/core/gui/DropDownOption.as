package no.doomsday.console.core.gui 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import no.doomsday.console.core.text.TextFormats;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public final class DropDownOption extends Sprite
	{
		public var title:String;
		private var titleField:TextField;
		public var index:int = -1;
		public function DropDownOption(title:String = "Blah") 
		{
			this.title = title;
			titleField = new TextField();
			addChild(titleField);
			titleField.autoSize = TextFieldAutoSize.LEFT;
			titleField.defaultTextFormat = TextFormats.windowTitleFormat;
			titleField.text = title;
			titleField.mouseEnabled = false;
			titleField.y = -2;
			titleField.backgroundColor = 0;
		}
		public function set background(b:Boolean):void {
			titleField.background = b;
		}
		
	}

}