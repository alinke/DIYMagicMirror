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
	import flash.external.*;
	import flash.net.*;
                
    public class speakjs extends MovieClip{

        private var webView:StageWebView = new StageWebView();
		private var html_browser:HTMLLoader; 
                                
        public function speakjs() 
        {
            
			
			var url:String = "http://diymagicmirror.com/speak.html";
            var variables:URLVariables = new URLVariables();
            //variables.exampleSessionId = new Date().getTime();
            //variables.exampleUserLabel = "Your Name";
			variables.tts = "the quick brown";
			variables.voice = "2";
            var request:URLRequest = new URLRequest(url);
            request.data = variables;
            try {            
                navigateToURL(request);
            }
            catch (e:Error) {
                // handle error here
            }
        }
                                
      
        
    }
}