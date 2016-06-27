package  {
	
	
	import flash.display.MovieClip;
    import flash.media.StageWebView;
    import flash.geom.Rectangle;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;
    import flash.desktop.NativeApplication;
	import flash.html.HTMLLoader;
	import flash.display.Sprite;
    import flash.events.Event;
    import flash.html.HTMLLoader;
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.net.URLRequestHeader;
    import flash.net.URLRequestMethod;
    import flash.net.URLVariables;
	import com.amazon.AmazonRequest;
	

	
	
	public class aws extends MovieClip {
		
		
		private var request	: AmazonRequest = new AmazonRequest();
		private var loader : URLLoader = new URLLoader();
		private var vars : URLVariables = new URLVariables();

		public function aws() {
		
 
		vars.Service = 'AWSECommerceService';
		vars.Operation = 'ItemSearch';
		//vars.Keywords = myAlbum;
		vars.Version = "2009-01-06";
		vars.SearchIndex = "Music";
		vars.ResponseGroup = "Images";
 
		request.data = vars;
 
		//loader.addEventListener(Event.COMPLETE, requestCompleteHandler);
		//loader.load(request.urlRequest);
		}

	}
	
}
