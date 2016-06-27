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
		
		
		//OST /CreateSpeech HTTP/1.1
		//Host: tts.eu-west-1.ivonacloud.com
		
		// The Amazon host providing the Product API web service.
		private const AWS_HOST:String = "webservices.amazon.com";
 
		// The HTTP method used to send the request.
		private const AWS_METHOD:String = "GET";
 
		// The path to the Product API web service on the Amazon host.
		private const AWS_PATH:String = "/onca/xml";
 
		// The AWS Access Key ID to use when querying Amazon.com.
		
		private var amazonDeveloperId:String = "GDNAJCFNNDTRADJBQBIQ";
 
		// The AWS Secret Key to use when querying Amazon.com.
		
		private var amazonSecretAccessKey:String = "SDi53TpGCCY1ag8eVtz598nvJgMOV4fdCYvE4xJC";
 
		// The request signature string.
		
		private var signature:String;
 
		// The request timestamp string, in UTC format (YYYY-MM-DDThh:mm:ssZ).
		
		private var timestamp:String;
                                
        public function speakjs() 
        {
            
			
			
			var parameterArray:Array = new Array();
			var parameterCollection:ArrayCollection = new ArrayCollection();
			var parameterString:String = "";
			var sort:Sort = new Sort();
			var hmac:HMAC = new HMAC(new SHA256());
			var requestBytes:ByteArray = new ByteArray();
			var keyBytes:ByteArray = new ByteArray();
			var hmacBytes:ByteArray;
			var encoder:Base64Encoder = new Base64Encoder();
			var formatter:DateFormatter = new DateFormatter();
			var now:Date = new Date();
		 
		 
			// Set the request timestamp using the format: YYYY-MM-DDThh:mm:ss.000Z
			// Note that we must convert to GMT.
			formatter.formatString = "YYYY-MM-DDTHH:NN:SS.000Z";
			now.setTime(now.getTime() + (now.getTimezoneOffset() * 60 * 1000));
			timestamp = formatter.format(now);
		 
			// Process the parameters.
			for (var key:String in AmazonSearch.request )
			{
				// Ignore the "Signature" request parameter.
				if (key != "Signature")
				{
					var urlEncodedKey:String = encodeURIComponent(decodeURIComponent(key));
					var parameterBytes:ByteArray = new ByteArray();
					var valueBytes:ByteArray = new ByteArray();
					var value:String = AmazonSearch.request[key];
					var urlEncodedValue:String = encodeURIComponent(decodeURIComponent(value.replace(/\+/g, "%20")));
		 
		 
					// Use the byte values, not the string values.
					parameterBytes.writeUTFBytes(urlEncodedKey);
					valueBytes.writeUTFBytes(urlEncodedValue);
					parameterCollection.addItem( { parameter : parameterBytes , value : valueBytes } );
				}
			}
		 
			// Sort the parameters and formulate the parameter string to be signed.
			parameterCollection.sort = sort;
			sort.fields = [ new SortField("parameter", true), new SortField("value", true) ];
			parameterCollection.refresh();
			parameterString = AWS_METHOD + "\n" + AWS_HOST + "\n" + AWS_PATH + "\n";
			for (var i:Number = 0; i < parameterCollection.length; i++)
			{
				var pair:Object = parameterCollection.getItemAt(i);
		 
		 
				parameterString += pair.parameter + "=" + pair.value;
		 
				if (i < parameterCollection.length - 1)
					parameterString += "&";
			}
		 
			// Sign the parameter string to generate the request signature.
			requestBytes.writeUTFBytes(parameterString);
			keyBytes.writeUTFBytes(amazonSecretAccessKey);
			hmacBytes = hmac.compute(keyBytes, requestBytes);
			encoder.encodeBytes(hmacBytes);
			signature = encodeURIComponent(encoder.toString());
			}
		
		
		generateSignature();
		AmazonSearch.send();
		 
		
		// Somewhere in your code you'll call the following to generate request signature and perform the search.
	
			
			
			
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
						
						
					
						
			// A HTTPService configured to perform the required Amazon Web Services request.
&lt;mx:HTTPService id="AmazonSearch" url="http://webservices.amazon.com/onca/xml" showBusyCursor="true"&gt;
	&lt;mx:request&gt;
		<awsaccesskeyid>{amazonDeveloperId}</awsaccesskeyid>
		<idtype>EAN</idtype>
		<itemid>9781592400874</itemid>
		<operation>ItemLookup</operation>
		<responsegroup>ItemAttributes,Images,Tracks,EditorialReview</responsegroup>
		<searchindex>Books</searchindex>
		<service>AWSECommerceService</service>
		<signature>{signature}</signature>
		<timestamp>{timestamp}</timestamp>
	&lt;/mx:request&gt;
&lt;mx:HTTPService&gt;

*/	
 

	
			
			
			
     //   }
                                
      
        
    }
}