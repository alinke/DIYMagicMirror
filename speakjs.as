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
            var request:URLRequest = new URLRequest(url);
            request.data = variables;
            try {            
                navigateToURL(request);
            }
            catch (e:Error) {
                // handle error here
            }
			//navugateToURL(new URLRequest("http://diymagicmirror.com/speak2.html"));
			
			
			
			var html:HTMLLoader = new HTMLLoader();
			html.addEventListener(Event.COMPLETE, splash);
			//html.load(new URLRequest("http://diymagicmirror.com/speak2.html"));

			 function splash(e:Event):void
			{
				// try to access the element by its ID and call the Javascript click() function on it
				html.window.document.getElementById('Play').click(); // this gives error "click is not a function"

				// try to call the Javascript function directly by its name
				//html.window.submitAssistantForm('next'); // this gives error "TypeError: Result of expression 'document.theForm' [undefined] is not an object."
			}
        }
                                
      
        
    }
}