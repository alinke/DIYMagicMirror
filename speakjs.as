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

	import flash.external.*;
	import flash.net.*;
                
    public class speakjs extends MovieClip{

        private var webView:StageWebView = new StageWebView();
		private var html_browser:HTMLLoader; 
		private var loader:URLLoader;
                                
        public function speakjs() 
        {
            
			/*
			var url:String = "http://diymagicmirror.com/speak.html";
            var variables:URLVariables = new URLVariables();
            //variables.exampleSessionId = new Date().getTime();
            //variables.exampleUserLabel = "Your Name";
			variables.tts = "get ready for some football oh yeah";
			variables.voice = "1";
            var request:URLRequest = new URLRequest(url);
            request.data = variables;
            try {            
                navigateToURL(request,"_parent");
            }
            catch (e:Error) {
                // handle error here
            }
			
			
			//public function URLRequestHeaderExample() {
            //loader = new ();
            //configureListeners(loader);

            var header:URLRequestHeader = new URLRequestHeader("pragma", "no-cache");
            var request:URLRequest = new URLRequest("http://diymagicmirror.com/speak.html");
            request.data = new URLVariables("tts=John+Doe");
            request.method = URLRequestMethod.POST;
            request.requestHeaders.push(header);
            try {
                loader.load(request);
            } catch (error:Error) {
                trace("Unable to load requested document.");
            }
        
			*/
			
			var loader:URLLoader = new URLLoader();
						//configureListeners(loader);
						//var header:URLRequestHeader = new URLRequestHeader("Referer","http://translate.google.com/");		
						var request:URLRequest = new URLRequest();
						//if (tts_sendheader != "off") {
							var header:URLRequestHeader = new URLRequestHeader("Referer","http://diymagicmirror.com/speak.html");			
							request = new URLRequest(generateAudioURL(value));
							request.method = URLRequestMethod.GET;
							request.requestHeaders.push(header);
						//}
						//else {
					//		request = new URLRequest(generateAudioURL(value));
					//	}
						 
						try {
							loader.load(request);
						} catch (error:Error) {
							trace("Unable to load TTS");
							//ResetVideoFlags();
							//return;
						}
			
			
			
			
        }
                                
      
        
    }
}