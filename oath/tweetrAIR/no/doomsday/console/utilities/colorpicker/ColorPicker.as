package no.doomsday.console.utilities.colorpicker 
{
	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import no.doomsday.console.core.text.TextFormats;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class ColorPicker extends Sprite
	{
		private var colorPickerTF:TextField;
		private var _color:uint;
		private var sampleBMD:BitmapData = new BitmapData(3, 3, false);
		private var sampleBMDDisplay:Bitmap = new Bitmap(sampleBMD);
		private var clipRect:Rectangle = new Rectangle(0, 0, 3, 3);
		private var matrix:Matrix;
		public function ColorPicker() 
		{
			colorPickerTF = new TextField();
			addChild(colorPickerTF);
			colorPickerTF.defaultTextFormat = TextFormats.windowDefaultFormat;
			colorPickerTF.text = "Superlong text";
			colorPickerTF.background = true;
			colorPickerTF.border = true;
			colorPickerTF.autoSize = TextFieldAutoSize.LEFT;
			colorPickerTF.y = -colorPickerTF.height;
			addChild(sampleBMDDisplay);
			sampleBMDDisplay.height = colorPickerTF.height;
			sampleBMDDisplay.width = 10;
			sampleBMDDisplay.x = 3;
			sampleBMDDisplay.y = -sampleBMDDisplay.height;
			colorPickerTF.x = sampleBMDDisplay.x + sampleBMDDisplay.width;
			matrix = new Matrix();
			visible = false;
		}
		public function activate():void {
			_color = 0x00000000;
			visible = true;
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.addEventListener(MouseEvent.CLICK, onClick, false, Number.POSITIVE_INFINITY);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			e.stopPropagation();
			e.stopImmediatePropagation();
			Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, "0x" + color);
			dispatchEvent(new Event(Event.CHANGE));
			deactivate();
		}
		
		private function onMouseMove(e:MouseEvent):void 
		{
			x = stage.mouseX;
			y = stage.mouseY;
			//clipRect.x = stage.mouseX;
			//clipRect.y = stage.mouseY;
			matrix.identity();
			matrix.translate( -stage.mouseX, -stage.mouseY);
			sample();
		}
		
		private function sample():void
		{
			sampleBMD.lock();
			sampleBMD.fillRect(sampleBMD.rect, 0x00000000);
			sampleBMD.draw(stage, matrix, null, null, clipRect);
			sampleBMD.unlock();
			_color = sampleBMD.getPixel(1, 1);
			colorPickerTF.text = color;
		}
		public function get color():String {
			return _color.toString(16);
		}
		public function deactivate():void {
			visible = false;
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.removeEventListener(MouseEvent.CLICK, onClick);
		}
		
	}

}