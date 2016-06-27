package  {
	
	
	    import flash.display.MovieClip;
		import flash.events.Event;
		 
		import flash.net.URLLoader;
		import flash.net.URLRequest;
		 
		import flash.net.URLRequestHeader;
		import flash.net.URLRequestMethod;
		 
		import flash.net.URLLoaderDataFormat;
		import flash.net.URLVariables;
	
		import flash.events.IOErrorEvent;
	
		import com.hurlant.util.Base64;
		import mx.utils.Base64Encoder;
		import flash.events.HTTPStatusEvent;
		import flash.events.IEventDispatcher;
		import flash.events.ProgressEvent;
		import flash.events.SecurityErrorEvent;
		import flash.events.ErrorEvent;
		import flash.media.Sound; 
		import flash.utils.ByteArray;
		import flash.media.SoundChannel;
		import flash.errors.EOFError;
		import org.as3wavsound.WavSound;
		import org.as3wavsound.WavSoundChannel;
		import flash.net.FileFilter; 
		import flash.net.FileReference; 
		import fr.kikko.lab.ShineMP3Encoder;
		//import com.mauft.OggLibrary.OggStream;
		//import com.mauft.OggLibrary.OggEmbed;

	import cmodule.hookOggVorbisLib.CLibInit;
	import com.jac.ogg.events.OggManagerEvent;
	import com.jac.ogg.OggManager;
		

	
	public class aws4 extends MovieClip {
		
		
	/*	{
    "credentials": {
        "url": "https://stream.watsonplatform.net/text-to-speech/api",
        "password": "oHRxVyUnYZZ4",
        "username": "d3400aeb-af9e-4d78-997b-75b6898fb9d8"
    }
}*/
		
		// https://watson-api-explorer.mybluemix.net/text-to-speech/api/v1/synthesize?accept=audio%2Fwav&voice=en-US_MichaelVoice&text=today%20is%20a%20good%20day		
		
		// first build the URLRequest
		//private	var request:URLRequest = new URLRequest("https://stream.watsonplatform.net/text-to-speech/api/v1/synthesize");  //watson
		//private	var request:URLRequest = new URLRequest("http://api.voicerss.org/");
		private var request:URLRequest = new URLRequest("https://www.yakitome.com/audio/download_mp3/audio.name.bccd956e07e2abd5.617564696f2e6d7033.mp3");
			 
		// the credentials
		private	var credentials:String = Base64.encode("d3400aeb-af9e-4d78-997b-75b6898fb9d8:oHRxVyUnYZZ4");
		
		//qha4ndDY1amd3_BCGuD65HO  yakitome key
		//https://www.yakitome.com/api/rest/tts?api_key=qha4ndDY1amd3_BCGuD65HO&voice=Audrey&speed=5&text=hello+world
		
		//msft
		//key 1 5b3eb2c149144aa592999119ff60f13a
		//key 2 e22fc89f955b41018197edf43075a9ce
		//endpoint https://speech.platform.bing.com/synthesize
		
		//ispeech - not free	
		//api key c138343b9b696d8e861761c6911023f9
		//mobile api key 843e03acee5a24a0c7426a677eaa85d5
		
		//voice rss 350 requests per day
		//api key ff013119f75b411e81f1bdcde7ea8c38
		//http://api.voicerss.org/?<parameters>
		//https://api.voicerss.org/?key=ff013119f75b411e81f1bdcde7ea8c38?src=hellohl=en-gb
		
		//yakitomoe
		// qha4ndDY1amd3_BCGuD65HO
		
	/*	Parameter name	Parameter description
		key	The API key (mandatory)
		src	The textual content for converting to speech (mandatory)
		hl	The textual content language. Allows values: see Languages. (mandatory)
		r	The speech rate (speed). Allows values: from -10 (slowest speed) up to 10 (fastest speed). Default value: 0 (normal speed). (optional)
		c	The speech audio codec. Allows values: see Audio Codecs. Default value: MP3. (optional)
		f	The speech audio formats. Allows values: see Audio Formats. Default value: 8khz_8bit_mono. (optional)
		ssml	The SSML textual content format. Allows values: true and false. Default value: false. (optional)
				*/
				//en-gb
		
	
			 
		// the header to add..
		private	var authHeader:URLRequestHeader = new URLRequestHeader("Authorization", "Basic " + credentials);	
			 
		// create an array to contain the header			
		private	var headers:Array = [];
		
		private var tts_stream:Sound = new Sound();
		private var tts_channel:SoundChannel = new SoundChannel();
		private var fileRef:FileReference; 
		
		private var loader:URLLoader;
		
		private var requestVars:URLVariables;
		
		public var mp3Encoder:ShineMP3Encoder;
		
		//Alchemy Loader object
		private var _loader:CLibInit;
		
		//Alchemy -> AS3 object (our hook to the alchemy methods)
		private var _lib:Object;
		private var _isFullyDecoded:Boolean;
		
		private var ogg_:OggManager;
		
		private var wavLoader:URLLoader;
		
		/*private var tts_stream:Sound = new Sound();
		private var tts_channel:SoundChannel = new SoundChannel();*/
		
		

		public function aws4() {
			
			
			// push your authHeader in there
			//headers.push(authHeader);  //don't need this for some of the services
			 
			// set the headers on the URLRequest object
			request.requestHeaders = headers;
			
			
			requestVars = new URLVariables();
			//requestVars.text = "say it's really a great day todaefwerwerewrwerwerewy, how is your weather in your city and yeah it's nice too";
			requestVars.key = "ff013119f75b411e81f1bdcde7ea8c38";
			//requestVars.key = "4353452345";
			requestVars.src ="Sprechen Sie Deutsch denke ich, dass Sie tun";
			//requestVars.hl = "en-gb";
			requestVars.hl = "de-de";
			requestVars.c = "MP3";
			requestVars.f = "44khz_16bit_stereo";
			//requestVars.accept = "audio%2Fwav";
			//requestVars.accept = "audio/flac";
			//requestVars.voice = "en-US_MichaelVoice";
			//requestVars.voice = "en-US_LisaVoice";
			
			request.data = requestVars;
			 
			// set the request's method to POST
			request.method = URLRequestMethod.GET;
			 
			// build the loader..
			loader = new URLLoader();
			loader.dataFormat = 'binary';  //we're downloading a raw wav file
			
			//loader.dataFormat = 'variables';
			 
			// set the format to text (or whatever you want. URLRequest can be used with other objects too)
			//loader.dataFormat = URLLoaderDataFormat.TEXT;
			 
			configureListeners(loader);
			 
			try    {
                // load the request..
				loader.load(request);
                trace("Loaded");
            }
            catch (error:Error)    {
                trace("Unable to load URL" + error);
            }
			
			
			tts_stream.load(request);
			tts_channel = tts_stream.play();						
			//tts_channel.addEventListener(Event.SOUND_COMPLETE,TTSSoundDone);	
			
			
		}
		
		
			 private function configureListeners(dispatcher:IEventDispatcher):void {
				dispatcher.addEventListener(Event.COMPLETE, completeHandler);
				dispatcher.addEventListener(Event.OPEN, openHandler);
				dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
				dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
				dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
				dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        }

        private function completeHandler(event:Event):void {
			/*loader.removeEventListener(Event.COMPLETE, completeHandler); 
			
			
			trace("went to 1st completeHandler");
			wavLoader = URLLoader(event.target);
			trace("completeHandler: " + wavLoader.data);*/
			
			
			/*var localSound:Sound = wavLoader.data as Sound; 
			localSound.play();*/
			
			//wavLoader.addEventListener(Event.COMPLETE, playWav);
			//
			//try    {
            //    // load the request..
			//	wavLoader.load(request);
            //    trace("Loaded wav");
            //}
            //catch (error:Error)    {
            //    trace("Unable to load URL" + error);
            //}
			//
			//
			//ogg_.initDecoder(wavLoader.data);
			
			//ogg_.decode(wavLoader.data,2048,33,true);
			
			//public function decode($oggBytes:ByteArray, $samplesPerLoop:int=2048, $delayPerLoopInMS:int=33, $progressNotifications:Boolean=true):void
			
			
			//wavLoader.addEventListener(Event.COMPLETE, playWav);
			//wavLoader.dataFormat = 'binary';
          
			
			//var oggTest:OggEmbed = new OggEmbed(wavLoader.data);
			//oggTest.play(0);
			//encodeToMP3(wavLoader.data);
			
			//wavLoader.addEventListener(Event.COMPLETE, playWav);
			
			// var file = new FileReference();
			//file.addEventListener(Event.COMPLETE, fileSaveComplete);
			////file.addEventListener(IOErrorEvent.IO_ERROR, error);
			//
			//file.save(event.target.data as ByteArray, 'FileName.jpg');
			
			
			//var player:WavSound = new WavSound(event.target.data as ByteArray);
			

			//player.play();
			
			
			
			//
			//	try
			//{
			//	var tts:WavSound = new WavSound(event.target.data as ByteArray);
			//	tts.play();
			//}
			//catch( e : EOFError )
			//{
			//	trace( e );     // EOFError: Error #2030: End of file was encountered.
			//}
			
			
						
			
			
			
			//var wavLoader:URLLoader = URLLoader(event.target);
			//wavLoader.dataFormat = 'binary';
            //trace("completeHandler: " + wavLoader.data);
			
			
			//var urlRequest:URLRequest = new URLRequest(event.target);
			//var wav:URLLoader =  URLLoader(event.target);
			//wav.dataFormat = 'binary';
			//wav.load(urlRequest);
			//wavLoader.addEventListener(Event.COMPLETE, playWav);
			
			/*var localSound:Sound = event.target as Sound; 
			localSound.play();*/
			
		//	tts_stream.load(request);
		//				tts_channel = tts_stream.play();						
		//				tts_channel.addEventListener(Event.SOUND_COMPLETE,TTSSoundDone);			
		//				tts_channel.addEventListener (IOErrorEvent.IO_ERROR, TTSPlayError);
			
			
			
        }
		
		private function fileSaveComplete(event : Event):void {
			trace("file has been saved");
			
			var localSound:Sound = wavLoader.data as Sound; 
			localSound.play();
		}
		
		private function encodeToMP3(wavData:ByteArray):void {

			mp3Encoder = new ShineMP3Encoder(wavData);
			mp3Encoder.addEventListener(Event.COMPLETE, mp3EncodeComplete);
			mp3Encoder.addEventListener(ProgressEvent.PROGRESS, mp3EncodeProgress);
			mp3Encoder.addEventListener(ErrorEvent.ERROR, mp3EncodeError);
			mp3Encoder.start();
		}

		private function mp3EncodeProgress(event : ProgressEvent) : void {

		trace(event.bytesLoaded, event.bytesTotal);
		}

		private function mp3EncodeError(event : ErrorEvent) : void {

		trace("Error : ", event.text);
		}

		private function mp3EncodeComplete(event : Event) : void {

		trace("Done !", mp3Encoder.mp3Data.length);
		}
		
		private function playWav(event:Event):void {
			
			
			ogg_.initDecoder(wavLoader.data);
			
			//ogg_.decode(wavLoader.data,2048,33,true);
			
			trace(wavLoader.data);
			
			trace("went to last playWav");
			//var tts:WavSound = new WavSound(event.target.data as ByteArray);
			//tts.play();
			
		}

        private function openHandler(event:Event):void {
            trace("openHandler: " + event);
        }

        private function progressHandler(event:ProgressEvent):void {
            trace("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
        }

        private function securityErrorHandler(event:SecurityErrorEvent):void {
            trace("securityErrorHandler: " + event);
        }

        private function httpStatusHandler(event:HTTPStatusEvent):void {
            trace("httpStatusHandler: " + event);
        }

        private function ioErrorHandler(event:IOErrorEvent):void {
            trace("ioErrorHandler: " + event);
        }	
		
		public function onFileSelected(evt:Event):void 
        { 
            fileRef.addEventListener(ProgressEvent.PROGRESS, onProgress); 
            fileRef.addEventListener(Event.COMPLETE, onComplete); 
            fileRef.load(); 
        } 
 
        public function onProgress(evt:ProgressEvent):void 
        { 
            trace("Loaded " + evt.bytesLoaded + " of " + evt.bytesTotal + " bytes."); 
        } 
        public function onCancel(evt:Event):void 
        { 
            trace("The browse request was canceled by the user."); 
        } 
        public function onComplete(evt:Event):void 
        { 
            trace("File was successfully loaded."); 
            fileRef.removeEventListener(Event.SELECT, onFileSelected); 
            fileRef.removeEventListener(ProgressEvent.PROGRESS, onProgress); 
            fileRef.removeEventListener(Event.COMPLETE, onComplete); 
            fileRef.removeEventListener(Event.CANCEL, onCancel); 
            saveFile(); 
        } 
        public function saveFile():void 
        { 
            fileRef.addEventListener(Event.SELECT, onSaveFileSelected); 
            fileRef.save(fileRef.data,"NewFileName.txt"); 
        } 
 
        public function onSaveFileSelected(evt:Event):void 
        { 
            fileRef.addEventListener(ProgressEvent.PROGRESS, onSaveProgress); 
            fileRef.addEventListener(Event.COMPLETE, onSaveComplete); 
            fileRef.addEventListener(Event.CANCEL, onSaveCancel); 
        } 
 
        public function onSaveProgress(evt:ProgressEvent):void 
        { 
            trace("Saved " + evt.bytesLoaded + " of " + evt.bytesTotal + " bytes."); 
        } 
         
        public function onSaveComplete(evt:Event):void 
        { 
            trace("File saved."); 
            fileRef.removeEventListener(Event.SELECT, onSaveFileSelected); 
            fileRef.removeEventListener(ProgressEvent.PROGRESS, onSaveProgress); 
            fileRef.removeEventListener(Event.COMPLETE, onSaveComplete); 
            fileRef.removeEventListener(Event.CANCEL, onSaveCancel); 
        } 
 
        public function onSaveCancel(evt:Event):void 
        { 
            trace("The save request was canceled by the user."); 
        } 
 
        public function onIOError(evt:IOErrorEvent):void 
        { 
            trace("There was an IO Error."); 
        } 
        public function onSecurityError(evt:Event):void 
        { 
            trace("There was a security error."); 
        } 
		
		

		/*try {
			  String text = "Hello world.";
			  InputStream stream = service.synthesize (text, Voice.EN_ALLISON, "audio/wav");

			  InputStream in = WaveUtils.reWriteWaveHeader(stream);
			  OutputStream out = new FileOutputStream("hello_world.wav");
			  byte[] buffer = new byte[1024];
			  int length;
			  while ((length = in.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			  }
			  out.close();
			  in.close();
			  stream.close();
			} catch (Exception e) {
			  e.printStackTrace();
			}*/
		
			
			
		//	private function say(value:String):void
		//
		//{			 
		//		sound_playing = 1; //set the sound playing flag so something else doesn't play			
		//		
		//		if (tts_stream !=null) {
		//				tts_stream = new Sound(); //try catch, problem is tts stream is null
		//				
		//				var loader:URLLoader = new URLLoader();
		//				configureListeners(loader);
		//				//var header:URLRequestHeader = new URLRequestHeader("Referer","http://translate.google.com/");		
		//				var request:URLRequest = new URLRequest();
		//				if (tts_sendheader != "off") {
		//					var header:URLRequestHeader = new URLRequestHeader(tts_headername,tts_headervalue);			
		//					request = new URLRequest(generateAudioURL(value));
		//					request.method = URLRequestMethod.GET;
		//					request.requestHeaders.push(header);
		//				}
		//				else {
		//					request = new URLRequest(generateAudioURL(value));
		//				}
		//				 
		//				try {
		//					loader.load(request);
		//				} catch (error:Error) {
		//					trace("Unable to load TTS");
		//					//ResetVideoFlags();
		//					//return;
		//				}
		//						
		//				tts_stream.load(request);
		//				tts_channel = tts_stream.play();						
		//				tts_channel.addEventListener(Event.SOUND_COMPLETE,TTSSoundDone);			
		//				tts_channel.addEventListener (IOErrorEvent.IO_ERROR, TTSPlayError);
		//								
		//				if (myXML.lipsync_feature == "on") {
		//					LipsyncTimer.addEventListener(TimerEvent.TIMER,  processSound);
		//					LipsyncTimer.start();
		//				}
		//				}
		//			else {
		//				trace("say tts stream was null so we had to exit out early");
		//				trace("went to speak tweet error handler");
		//				switch_mode();
		//				ResetVideoFlags();
		//			}
		//			//} catch (error:Error) {
		//				//trace("error loading tts_stream");
		//				//ResetVideoFlags();
		//				//return;
		//			//}
		//}
			
			
			
			
			
		

	}
	
}
