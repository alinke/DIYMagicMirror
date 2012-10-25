package
{
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import jp.maaash.ObjectDetection.ObjectDetector;
	import jp.maaash.ObjectDetection.ObjectDetectorOptions;
	import jp.maaash.ObjectDetection.ObjectDetectorEvent;

	public class FaceDetector extends Sprite{
		private var debug :Boolean = false;

		private var detector    :ObjectDetector;
		private var options     :ObjectDetectorOptions;
		private var faceImage   :Loader;
		private var bmpTarget   :Bitmap;

		private var view :Sprite;
		private var faceRectContainer :Sprite;
		private var tf :TextField;

		public function FaceDetector() {
			initUI();
			initDetector();
			faceImage.load( new URLRequest("013.jpg") );
		}

		private function initUI():void{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			view = new Sprite;
			addChild(view);

			faceImage = new Loader;
			faceImage.contentLoaderInfo.addEventListener( Event.COMPLETE, function(e :Event) :void {
				startDetection();
			});
			view.addChild( faceImage );

			faceRectContainer = new Sprite;
			view.addChild( faceRectContainer );

			tf = new TextField;
			tf.x = 256;
			tf.width  = 600;
			tf.height = 300;
			tf.textColor = 0x000000;
			tf.multiline = true;
			view.addChild( tf );
		}

		private function initDetector():void{
			detector = new ObjectDetector;
			detector.options = getDetectorOptions();
			detector.addEventListener(ObjectDetectorEvent.DETECTION_COMPLETE,function( e :ObjectDetectorEvent ):void{
				logger("[ObjectDetectorEvent.COMPLETE]");
				tf.appendText( "\ntime: "+(new Date)+" "+e.type );
				detector.removeEventListener( ObjectDetectorEvent.DETECTION_COMPLETE, arguments.callee );

				if( e.rects ){
					var g :Graphics = faceRectContainer.graphics;
					g.clear();
					g.lineStyle( 2 );	// black 2pix
					e.rects.forEach( function( r :Rectangle, idx :int, arr :Array ) :void {
						g.drawRect( r.x, r.y, r.width, r.height );
					});
				}
			});
			var events :Array = [ ObjectDetectorEvent.DETECTION_START, ObjectDetectorEvent.HAARCASCADES_LOAD_COMPLETE, ObjectDetectorEvent.HAARCASCADES_LOADING ];
			events.forEach( function(t :String, idx :int, arr :Array ) :void {
				detector.addEventListener( t, function(e :ObjectDetectorEvent) :void {
					tf.appendText( "\ntime: "+(new Date)+" "+e.type );
				});
			});
			detector.loadHaarCascades( "face.zip" );
		}

		private function startDetection():void{
			logger("[startDetection]");

			bmpTarget = new Bitmap( new BitmapData( faceImage.width, faceImage.height, false ) )
			bmpTarget.bitmapData.draw( faceImage );
			detector.detect( bmpTarget );
		}

		private function getDetectorOptions() :ObjectDetectorOptions {
			options = new ObjectDetectorOptions;
			options.min_size  = 50;
			options.startx    = ObjectDetectorOptions.INVALID_POS;
			options.starty    = ObjectDetectorOptions.INVALID_POS;
			options.endx      = ObjectDetectorOptions.INVALID_POS;
			options.endy      = ObjectDetectorOptions.INVALID_POS;
			return options;
		}

		private function logger(... args):void{
			if(!debug){ return; }
			log(args);
		}
	}
}
