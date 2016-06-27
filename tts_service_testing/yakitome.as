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
		import flash.events.HTTPStatusEvent;
		import flash.events.IEventDispatcher;
		import flash.events.ProgressEvent;
		import flash.events.SecurityErrorEvent;
		import flash.events.ErrorEvent;
		import flash.media.Sound; 
		import flash.utils.ByteArray;
		import flash.media.SoundChannel;
		import flash.errors.EOFError;
		import flash.utils.Timer;
		import flash.events.TimerEvent;

	
	public class yakitome extends MovieClip {
		
		
			
		private	var YakitomeURLHeader:Array = [];
		private var Yakitometts_stream:Sound = new Sound();
		private var Yakitometts_channel:SoundChannel = new SoundChannel();
		private var YakitomeURLLoader:URLLoader;
		private var YakitomeURLRequestVars:URLVariables;
		private var YakitomeURLRequest:URLRequest;
		private var TTSBookIDTimer:Timer;
		private var bookIDData:Object;
		private var TTSmp3Status:Object;
		private var YakitomeResponse:String;
		
		//https://www.yakitome.com/api/rest/tts?api_key=your_api_key&voice=Audrey&speed=5&text=hello+world
		//https://www.yakitome.com/audio/download_mp3/audio.name.bccd956e07e2abd5.617564696f2e6d7033.mp3

		public function yakitome() {
			
			
			/*Here's home the Yakitome API works
			First we have to make a request and then the book id is returned
			Then we have to check if the MP3 is ready, we do this with a Timer and make calls until MP3 is ready
			Once the MP3 is ready, we get a URL returned to us with the MP3 file
			Then lastly we load this MP3 and now have it in Flash */
			
			//The possibles voices are:{"free": {"German": [["de", "Female", "Klara"], ["de", "Male", "Reiner"]], "Spanish": [["es", "Male", "Alberto"]], "French": [["ca", "Male", "Arnaud"], ["fr", "Female", "Juliette"], ["fr", "Male", "Alain"]], "English": [["gb", "Female", "Anjali"], ["gb", "Female", "Audrey"], ["us", "Female", "Crystal"], ["us", "Female", "Julia"], ["us", "Female", "Lauren"], ["us", "Female", "Randy"], ["us", "Male", "Dave"], ["us", "Male", "Mike"]]}
			 
			YakitomeURLRequest = new URLRequest("https://www.yakitome.com/api/rest/tts");
			YakitomeURLRequest.requestHeaders = YakitomeURLHeader;
			
			YakitomeURLRequestVars = new URLVariables();
			YakitomeURLRequestVars.api_key = "qha4ndDY1amd3_BCGuD65HO";
			//YakitomeURLRequestVars.api_key = "4353452345";
			YakitomeURLRequestVars.text ="Cats are the best!";
			YakitomeURLRequestVars.voice = "Reiner";
			YakitomeURLRequestVars.speed = "5";
			
			YakitomeURLRequest.data = YakitomeURLRequestVars;
			// set the request's method to POST
			YakitomeURLRequest.method = URLRequestMethod.GET;
			 
			// build the loader..
			YakitomeURLLoader = new URLLoader();
			 
			// set the format to text (or whatever you want. URLRequest can be used with other objects too)
			YakitomeURLLoader.dataFormat = URLLoaderDataFormat.TEXT;
			 
			configureListeners(YakitomeURLLoader);
			 
			try    {
				YakitomeURLLoader.load(YakitomeURLRequest);
                trace("Loaded:" + YakitomeURLRequest);
            }
            catch (error:Error)    {
                trace("Unable to load URL" + error);
            }
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
			removeEventListener(Event.COMPLETE, completeHandler);
			removeEventListener(Event.COMPLETE, openHandler);
			removeEventListener(Event.COMPLETE, progressHandler);
			removeEventListener(Event.COMPLETE, securityErrorHandler);
			removeEventListener(Event.COMPLETE, httpStatusHandler);
			removeEventListener(Event.COMPLETE, ioErrorHandler);
			
			trace("compete Handler");
			
			YakitomeResponse = event.target.data as String;
			trace(YakitomeResponse);
			
			bookIDData = JSON.parse(YakitomeResponse);
			trace("The answer is " + bookIDData.eta+" ; "+ bookIDData.msg+" ; "+bookIDData.book_id);
			
			//https://www.yakitome.com/api/rest/status?api_key=qha4ndDY1amd3_BCGuD65HO&book_id=1806397
			//https://www.yakitome.com/api/rest/audio?api_key=qha4ndDY1amd3_BCGuD65HO&book_id=1806298&format=mp3
			
			if (bookIDData.msg == "INVALID API_KEY") {
				trace ("Yakitome API key is wrong");
			}
			
			else {
				//we need to add a delay here
				TTSBookIDTimer = new Timer(500, 20);  //to do modify this to change the timer to fire often and check for status each time
				TTSBookIDTimer.addEventListener(TimerEvent.TIMER, TTSBookIDTimerDone);
				TTSBookIDTimer.start();
			}
			
		}
		
		private function TTSBookIDTimerDone(e:TimerEvent):void{
				 trace("Times Fired: " + e.currentTarget.currentCount);
				 trace("Time Delayed: " + e.currentTarget.delay);
			
				// set the headers on the URLRequest object
				YakitomeURLRequest = new URLRequest("https://www.yakitome.com/api/rest/audio");
				YakitomeURLRequest.requestHeaders = YakitomeURLHeader;
				YakitomeURLRequestVars = new URLVariables();
				YakitomeURLRequestVars.api_key = "qha4ndDY1amd3_BCGuD65HO";
				YakitomeURLRequestVars.book_id = bookIDData.book_id;
				YakitomeURLRequestVars.format = "mp3";
				
				YakitomeURLRequest.data = YakitomeURLRequestVars;
				trace(YakitomeURLRequest.data);
				YakitomeURLRequest.method = URLRequestMethod.GET;
				 
				// build the loader..
				YakitomeURLLoader = new URLLoader();
				YakitomeURLLoader.dataFormat = URLLoaderDataFormat.TEXT;
				 
				configureListenersBookID(YakitomeURLLoader);
				 
				try    {
					YakitomeURLLoader.load(YakitomeURLRequest);
					trace("Loaded TTS MP3 Status:");
				}
				catch (error:Error)    {
					trace("Unable to load URL" + error);
				}
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
		
		
		private function configureListenersBookID(dispatcher:IEventDispatcher):void {
				dispatcher.addEventListener(Event.COMPLETE, completeHandlerBookID);
				dispatcher.addEventListener(Event.OPEN, openHandlerBookID);
				dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandlerBookID);
				dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandlerBookID);
				dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandlerBookID);
				dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandlerBookID);
        }
		
		private function httpStatusHandlerBookID(event:Event):void {
			 trace("book id http status handler: " + event);
		}	
		
		private function ioErrorHandlerBookID(event:Event):void {
			 trace("book id io error handler");
		}	
		
		private function openHandlerBookID(event:Event):void {
            trace("book id openHandler: " + event);
        }

        private function progressHandlerBookID(event:ProgressEvent):void {
            trace("book idprogressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
        }

        private function securityErrorHandlerBookID(event:SecurityErrorEvent):void {
            trace("book id securityErrorHandler: " + event);
        }

        private function completeHandlerBookID(event:Event):void {
			
			YakitomeResponse = event.target.data as String;
			trace(YakitomeResponse);
			
			TTSmp3Status = JSON.parse(YakitomeResponse);
			trace("ttsmp3status " + TTSmp3Status.status + " " + TTSmp3Status.audios);
			
			if (TTSmp3Status.status == "TTS DONE") {
				
				TTSBookIDTimer.stop();
				
				//now let's play the mp3
				
				YakitomeURLRequest = new URLRequest(TTSmp3Status.audios);
				 
				// build the loader..
				YakitomeURLLoader = new URLLoader();
				YakitomeURLLoader.dataFormat = 'binary'; 
				 
				configureListenersMP3Play(YakitomeURLLoader);
				 
				try    {
					// load the request..
					YakitomeURLLoader.load(YakitomeURLRequest);
					trace("Loaded TTS MP3 Status:");
				}
				catch (error:Error)    {
					trace("Unable to load URL" + error);
				}
				
				Yakitometts_stream.load(YakitomeURLRequest);
				Yakitometts_channel = Yakitometts_stream.play();	
			}
		}	
		
	
		private function configureListenersMP3Play(dispatcher:IEventDispatcher):void {
				dispatcher.addEventListener(Event.COMPLETE, completeHandlerMP3Play);
				dispatcher.addEventListener(Event.OPEN, openHandlerMP3Play);
				dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandlerMP3Play);
				dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandlerMP3Play);
				dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandlerMP3Play);
				dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandlerMP3Play);
        }
		
		private function httpStatusHandlerMP3Play(event:Event):void {
			 trace("mp3 play http status" + event);
		}	
		
		private function ioErrorHandlerMP3Play(event:Event):void {
			 trace("io error for mp3 play");
		}	
		
		private function openHandlerMP3Play(event:Event):void {
            trace("mp3 play book id openHandler: " + event);
        }

        private function progressHandlerMP3Play(event:ProgressEvent):void {
            trace("mp3 play progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
        }

        private function securityErrorHandlerMP3Play(event:SecurityErrorEvent):void {
            trace("book id securityErrorHandler: " + event);
        }

        private function completeHandlerMP3Play(event:Event):void {
			trace("mp3 played complete handler");
			removeEventListener(Event.COMPLETE, completeHandlerBookID);
			removeEventListener(Event.COMPLETE, openHandlerBookID);
			removeEventListener(Event.COMPLETE, progressHandlerBookID);
			removeEventListener(Event.COMPLETE, securityErrorHandlerBookID);
			removeEventListener(Event.COMPLETE, httpStatusHandlerBookID);
			removeEventListener(Event.COMPLETE, ioErrorHandlerBookID);
			
			removeEventListener(Event.COMPLETE, completeHandlerMP3Play);
			removeEventListener(Event.COMPLETE, openHandlerMP3Play);
			removeEventListener(Event.COMPLETE, progressHandlerMP3Play);
			removeEventListener(Event.COMPLETE, securityErrorHandlerMP3Play);
			removeEventListener(Event.COMPLETE, httpStatusHandlerMP3Play);
			removeEventListener(Event.COMPLETE, ioErrorHandlerMP3Play);
				
		}
	
		
		
		
		
		
		
		
		
		

		
		
		
		
		}
		
		
}
