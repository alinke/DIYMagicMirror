package {
	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;	
	import flash.net.URLLoaderDataFormat;
	import flash.events.NetStatusEvent;
	import flash.events.HTTPStatusEvent;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import fl.controls.TextArea;
	import fl.controls.Button;
	import net.eriksjodin.arduino.Arduino;
	import net.eriksjodin.arduino.events.ArduinoEvent;
	import flash.display.Sprite;
/*	import sk.prasa.webapis.picasa.events.PicasaDataEvent;
	import sk.prasa.webapis.picasa.PicasaResponder;
	import sk.prasa.webapis.picasa.PicasaService;*/
	import flash.display.Loader;
	import fl.video.MetadataEvent; 
	import fl.video.CuePointType;	
	import fl.video.IVPEvent;
	import fl.video.VideoEvent;
	import flash.display.*;	  
	import flash.events.TimerEvent;
	import flash.utils.*;
	import flash.system.fscommand;
	import flash.ui.Mouse;
	import flash.media.Sound;
    import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.display.Sprite;
    import flash.events.*;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.AntiAliasType;
	import flash.text.TextFormat;
	import flash.text.*;
	import flash.errors.*;
	import flash.events.ErrorEvent;
	import flash.errors.IOError;
	import flash.events.IOErrorEvent;	
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import com.dynamicflash.util.Base64;
	import MJPEG; //ip camera class for MJPEG
	import fl.video.FLVPlayback;
	import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.net.URLRequest;
	import fl.containers.UILoader;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;	
	import com.yahoo.astra.fl.managers.AlertManager;	
	import flash.net.URLRequestHeader;
    import flash.net.URLRequestMethod;
    import flash.net.URLVariables;
	import flash.events.HTTPStatusEvent;
	import flash.events.EventDispatcher;
	import ascb.util.NumberUtilities;
	//import com.swfjunkie.tweetr.events.TweetEvent;
	//import com.swfjunkie.tweetr.utils.TweetUtil;
	//import com.swfjunkie.tweetr.data.objects.StatusData;
	//import com.swfjunkie.tweetr.data.objects.SearchResultData;
	//import com.swfjunkie.tweetr.Tweetr;
	import flash.system.Capabilities;
	import flash.display.NativeWindow;	
	import flash.media.Video;	
	import flash.media.Camera;	
	import flash.utils.Timer;		
	import flash.events.TimerEvent;	
	import flash.display.Graphics;	
	import flash.display.BitmapData;	
	import flash.display.Bitmap;
	import flash.display.Sprite;
				
	import gs.easing.Cubic;	
	import gs.TweenLite;	
	
	import jp.maaash.ObjectDetection.ObjectDetector;	
	import jp.maaash.ObjectDetection.ObjectDetectorEvent;	
	import jp.maaash.ObjectDetection.ObjectDetectorOptions;	
	
	/*import com.swfjunkie.tweetr.Tweetr;
    import com.swfjunkie.tweetr.oauth.OAuth;
    import com.swfjunkie.tweetr.oauth.events.OAuthEvent;
	
	import com.swfjunkie.tweetr.events.TweetEvent;
	import com.swfjunkie.tweetr.utils.TweetUtil;
	import com.swfjunkie.tweetr.data.objects.StatusData;
	import com.swfjunkie.tweetr.data.objects.SearchResultData*/
	
	import flash.display.Sprite;
    import flash.geom.Rectangle;
    import flash.html.HTMLLoader;
	
	import flash.printing.PrintJobOptions;
	import flash.printing.PrintJobOrientation; 
	import flash.printing.PaperSize; 
	import flash.printing.PrintJob;
	import flash.printing.PrintUIOptions;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.geom.Rectangle;
	import com.adobe.images.PNGEncoder;
	import com.adobe.images.JPGEncoder;
	import jpegencoder.JPEGEncoder;
	import com.pfp.utils.JPEGAsyncEncoder;
	import com.pfp.events.JPEGAsyncCompleteEvent;
	import sk.yoz.image.ImageResizer;
	import sk.yoz.math.ResizeMath;
	
	import models.MentionModel;
	import models.SearchModel;
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONParseError;
	import com.adobe.serialization.json.JSONDecoder;
	
	
	
	//Library we use for Twitter
	import isle.susisu.twitter.Twitter;
	import isle.susisu.twitter.TwitterRequest;
	import isle.susisu.twitter.TwitterTokenSet;
	import isle.susisu.twitter.events.TwitterErrorEvent;
	import isle.susisu.twitter.events.TwitterRequestEvent;
	import isle.susisu.twitter.utils.objectToQueryString;
	
	
	
	
				
	public class mirror extends MovieClip {
	  
		//***** Webcam vars ****************
		//How long a rectangle will remain visible after no faces are found
		//private const __noFaceTimeout : int = 500;
		
		//how often to analyze the webcam image
		
		//private const __faceDetectInterval : int = 50;
		//private const __faceDetectInterval : int = 200;
		//color of the rectangle
		//private const __rectColor : int = 0xff0000;
		private var __noFaceTimeout : int = 500;
		private var __faceDetectInterval : int = 200;
		private var __rectColor : int = 0xff0000;

		private var _detector    :ObjectDetector;
		private var _options     :ObjectDetectorOptions;
		private var _bmpTarget   :Bitmap;

		private var _detectionTimer : Timer;
		
		private var _rects:Array;
		
		private var webcamvideo : Video;
		private var _noFaceTimer : Timer;
		
		public var cameraContainer : Sprite;
		private var webcamMask: Shape;
	    //**********************************
		
		//***********used for webcam facial recognition to trigger the photobooth
		private var photoboothnoFaceTimeout : int = 500;
		private var photoboothfaceDetectInterval : int = 200;
		private var photoboothrectColor : int = 0xff0000;

		private var photoboothdetector    :ObjectDetector;
		private var photoboothoptions     :ObjectDetectorOptions;
		private var photoboothbmpTarget   :Bitmap;

		private var photoboothdetectionTimer : Timer;		
		private var photoboothrects:Array;
		
		private var photoboothnoFaceTimer : Timer;		
		//public var cameraContainer : Sprite; //not used				
		//**********************************
	  
	  private var xmlLoader:URLLoader;		
	  private var WeatherLoader:URLLoader;
	  private var PicasaLoader:URLLoader;
	  private var stockLoader:URLLoader;
	  private var num_stocks:int;
	  private var stockPriceChange:Number = 0;
	  private var mirror_mode:String;
	  private var mode_select:String;
	  private var hardware_mode_select:String;
	  private var initial_hardware_mode_select_value:int;
	  private var initial_switch1_value:int;
	  private var initial_switch2_value:int;
	  private var initial_switch3_value:int;
	  private var initial_switch4_value:int;
	  private var initial_switch5_value:int;
	  private var initial_switch6_value:int;
	  private var initial_touch1_value:int;
	  private var initial_touch2_value:int;
	  private var initial_touch3_value:int;
	  private var hardware_mode_select_value:int;
	  private var initial_values_done:int=0;
	  private var idle_start_playing:int=0;
	  private var idle_end_seek_flag:int=0;
	  private var quizloop_end_seek_flag:int=0;
	  private var QuizReadytoAnswerFlag:int=0;
	  private var foundArduino:int=0;
	  private var Alcohol_Counter:int=5;
	  private var Alcohol_Reset_Counter:int;
	  private var Alcohol_Reading:Number;
	  private var Alcohol_ReadingNoSwitchLast:Number = 100;
	  private var Alcohol_ReadingNoSwitchCurrent:Number = 100;
	  private var alcohol_no_switch_trigger_delta:int;
	  private var alcohol_no_switch_ready_flag:int = 0;
	  private var BreathalyzerInProgress:int = 0;
	 
	  private var switch1_value:int;
	  private var switch2_value:int;
	  private var switch3_value:int;
	  private var switch4_value:int;
	  private var switch5_value:int;
	  private var switch6_value:int;
	  
	  private var switch1_trigger:int;
	  private var switch2_trigger:int;
	  private var switch3_trigger:int;
	  private var switch4_trigger:int;
	  private var switch5_trigger:int;
	  private var switch6_trigger:int;
	  
	  private var touch1_value:int;
	  private var touch2_value:int;
	  private var touch3_value:int;
	  
	  private var idle_videos;
	  private var reg_code:String;	 
	  private var video_resolution:String;
	  private var full_screen;	 
	  private var video_scaling_factor:Number;	 
	  private var x_position:Number;
	  private var y_position:Number;
	  private var video_rotation:Number;
	  private var myVidx_original:Number;
	  private var myVidy_original:Number;
	  private var proximity_sensor_on;
	  private var digital_switches;
	  private var switch1;
	  private var switch2;
	  private var switch3;
	  private var switch4;
	  private var switch5;
	  private var switch6;
	  private var test_switch;
	  private var analog_sensors;
	  private var analog_input1;
	  private var analog_input2;
	  private var analog_input3;	
	  private var alcohol_sensor;
	  
	  private var proximity_sensor_trigger1_distance_lower;
	  private var proximity_sensor_trigger1_distance_upper;
	  private var proximity_sensor_trigger1_time;
	  
	  private var proximity_sensor_trigger2_distance;	 //used for prox1 cannot play before prox 2
	  private var proximity_sensor_trigger2_distance_lower;
	  private var proximity_sensor_trigger2_distance_upper;
	  private var proximity_sensor_trigger2_time;  
	  private var prox2_before_prox1:String;
	  
	  private var proximity_flag=0;
	  private var proximity_counter:int = 0;
	  private var proximity_counter2:int = 0;
	  private var proximity1_do_not_play_again = 0;
	  private var proximity_flag3 = 0;							
	  private var x10_on_off_flag = 0;
	  private var prox_flag:int = 0; //this one used for the alternating prox videos if play prox videos instead of x10 is on in touch sensor 3
	  
	  private var alcohol_baseline:Number;
	  private var alcohol_level1:Number;
      private var alcohol_level2:Number;
	  private var alcohol_level3:Number;
	  private var alcohol_countdown:int;
	  private var alcohol_reset_seconds:int;
	  private var alcohol_text_duration:int;
	//  private var alcohol_circle:Sprite = new Sprite();
	  
	  private var stock_good_threshold:Number;
	  private var stock_bad_threshold:Number;
	  
	  private var pictLdr:Loader = new Loader();
	  private var weather_zip:String;
	  private var weather_woeid:String;
	  private var weather_reading:String;
	  private var weather_display:String;
	  private var forecast_cutoff:String;
	  private var stock_string:String;
	
	  //private var weather_graphic:Sprite = new Sprite();
	   
	  private var verbose:String;
	  private var internet:int = 0; //for checking if internet connection
	  
	  private var idle_clip:String;	
	  private var idle_dup_clip:String;	
	  private var proximity1_clip:String;	
	  private var proximity2_clip:String;	
	  private var touch1_clip:String;	
	  private var weather_good_clip:String;	
	  private var weather_ok_clip:String;	
	  private var weather_rain_clip:String;	
	  private var no_internet_clip:String;	
	  private var stock_up_clip:String;	
	  private var stock_no_change_clip:String;	
	  private var stock_down_clip:String;	
	  private var doorbell_clip:String;	
	  private var phone_clip:String;	
	  private var video1_clip:String;	
	  private var video2_clip:String;	
	  private var video3_clip:String;	
	  private var video4_clip:String;	
	  private var proximity3_clip:String;	
	  private var x10_on_clip:String;	
	  private var x10_off_clip:String;	
	  private var idle_black:String; //used for no idle vides mode
	  private var drink1_clip:String;	
	  private var drink2_clip:String;	
	  private var drink3_clip:String;	
	  private var drink4_clip:String;	
	  private var quizloop_clip:String;	
	  
	  private var idle_clipp:String;	
	  private var idle_dup_clipp:String;	
	  private var proximity1_clipp:String;	
	  private var proximity2_clipp:String;	
	  private var touch1_clipp:String;	
	  private var weather_good_clipp:String;	
	  private var weather_ok_clipp:String;	
	  private var weather_rain_clipp:String;	
	  private var no_internet_clipp:String;	
	  private var stock_up_clipp:String;	
	  private var stock_no_change_clipp:String;	
	  private var stock_down_clipp:String;	
	  private var doorbell_clipp:String;	
	  private var phone_clipp:String;	
	  private var video1_clipp:String;	
	  private var video2_clipp:String;	
	  private var video3_clipp:String;	
	  private var video4_clipp:String;	
	  private var proximity3_clipp:String;	
	  private var x10_on_clipp:String;	
	  private var x10_off_clipp:String;	
	  private var drink1_clipp:String;	
	  private var drink2_clipp:String;	
	  private var drink3_clipp:String;	
	  private var drink4_clipp:String;	
	  private var quizloop_clipp:String;	
	  
	  private var idle_cliph:String;	
	  private var idle_dup_cliph:String;	
	  private var proximity1_cliph:String;	
	  private var proximity2_cliph:String;	
	  private var touch1_cliph:String;	
	  private var weather_good_cliph:String;	
	  private var weather_ok_cliph:String;	
	  private var weather_rain_cliph:String;	
	  private var no_internet_cliph:String;	
	  private var stock_up_cliph:String;	
	  private var stock_no_change_cliph:String;	
	  private var stock_down_cliph:String;	
	  private var doorbell_cliph:String;	
	  private var phone_cliph:String;	
	  private var video1_cliph:String;	
	  private var video2_cliph:String;	
	  private var video3_cliph:String;	
	  private var video4_cliph:String;	
	  private var proximity3_cliph:String;	
	  private var x10_on_cliph:String;	
	  private var x10_off_cliph:String;	
	  private var drink1_cliph:String;	
	  private var drink2_cliph:String;	
	  private var drink3_cliph:String;	
	  private var drink4_cliph:String;	
	  private var quizloop_cliph:String;	
	  
	  private var idle_clippi:String;	
	  private var idle_dup_clippi:String;	
	  private var proximity1_clippi:String;	
	  private var proximity2_clippi:String;	
	  private var touch1_clippi:String;	
	  private var weather_good_clippi:String;	
	  private var weather_ok_clippi:String;	
	  private var weather_rain_clippi:String;	
	  private var no_internet_clippi:String;	
	  private var stock_up_clippi:String;	
	  private var stock_no_change_clippi:String;	
	  private var stock_down_clippi:String;	
	  private var doorbell_clippi:String;	
	  private var phone_clippi:String;	
	  private var video1_clippi:String;	
	  private var video2_clippi:String;	
	  private var video3_clippi:String;	
	  private var video4_clippi:String;	
	  private var proximity3_clippi:String;	
	  private var x10_on_clippi:String;	
	  private var x10_off_clippi:String;	
	  private var drink1_clippi:String;	
	  private var drink2_clippi:String;	
	  private var drink3_clippi:String;	
	  private var drink4_clippi:String;	
	  private var quizloop_clippi:String;	
	  
	  private var idle_clipi:String;	
	  private var idle_dup_clipi:String;	
	  private var proximity1_clipi:String;	
	  private var proximity2_clipi:String;	
	  private var touch1_clipi:String;	
	  private var weather_good_clipi:String;	
	  private var weather_ok_clipi:String;	
	  private var weather_rain_clipi:String;	
	  private var no_internet_clipi:String;	
	  private var stock_up_clipi:String;	
	  private var stock_no_change_clipi:String;	
	  private var stock_down_clipi:String;	
	  private var doorbell_clipi:String;	
	  private var phone_clipi:String;	
	  private var video1_clipi:String;	
	  private var video2_clipi:String;	
	  private var video3_clipi:String;	
	  private var video4_clipi:String;	
	  private var proximity3_clipi:String;	
	  private var x10_on_clipi:String;	
	  private var x10_off_clipi:String;
	  private var drink1_clipi:String;	
	  private var drink2_clipi:String;	
	  private var drink3_clipi:String;	
	  private var drink4_clipi:String;	
	  private var quizloop_clipi:String;	
	  
	  private var idle_cliptts:String;	
	  private var idle_dup_cliptts:String;	
	  private var proximity1_cliptts:String;	
	  private var proximity2_cliptts:String;	
	  private var touch1_cliptts:String;	
	  private var weather_good_cliptts:String;	
	  private var weather_ok_cliptts:String;	
	  private var weather_rain_cliptts:String;	
	  private var no_internet_cliptts:String;	
	  private var stock_up_cliptts:String;	
	  private var stock_no_change_cliptts:String;	
	  private var stock_down_cliptts:String;	
	  private var doorbell_cliptts:String;	
	  private var phone_cliptts:String;	
	  private var video1_cliptts:String;	
	  private var video2_cliptts:String;	
	  private var video3_cliptts:String;	
	  private var video4_cliptts:String;	
	  private var proximity3_cliptts:String;	
	  private var x10_on_cliptts:String;	
	  private var x10_off_cliptts:String;
	  private var drink1_cliptts:String;	
	  private var drink2_cliptts:String;	
	  private var drink3_cliptts:String;	
	  private var drink4_cliptts:String;	
	  private var quizloop_cliptts:String;	
	  
	  
	  private var proximity1_tts:String;
      private var proximity2_tts:String;
  	  private var proximity3_tts:String;
  	  private var weather_good_tts:String;
  	  private var weather_ok_tts:String;
  	  private var weather_rain_tts:String;
  	  private var no_internet_tts:String;
	  private var stock_up_tts:String;
	  private var stock_no_change_tts:String;
	  private var stock_down_tts:String;
	  private var doorbell_tts:String;
	  private var x10_on_tts:String;
	  private var x10_off_tts:String;
	  private var drink1_tts:String;
	  private var drink2_tts:String;
	  private var drink3_tts:String;
	  private var drink4_tts:String;
	  private var blow_tts:String;
	  private var wait_tts:String;
	  private var warning_tts:String;
	  
	  private var lipsync_clip:String;
      	
	//  private var tweetr:Tweetr;
	
	
    
	
	 private var custom_audio:String;
	 private var custom_audio_clip:String;
	 private var custom_audio_lip_pattern:String;
	 
	 private var lipLoader:Loader = new Loader();
	 private var lipRequest:URLRequest = new URLRequest();
	 
	 private var proximity1_mp3:String;
	 private var  proximity2_mp3:String;
	 private var proximity3_mp3:String;
	 private var weather_good_mp3:String;
	 private var weather_ok_mp3:String;
	 private var weather_rain_mp3:String;
	 private var no_internet_mp3:String;
	 private var stock_up_mp3:String;
	 private var stock_no_change_mp3:String;
	 private var stock_down_mp3:String;
	 private var doorbell_mp3:String;
	 private var x10_on_mp3:String;
	 private var x10_off_mp3:String;
	 private var drink1_mp3:String;
	 private var drink2_mp3:String;
	 private var drink3_mp3:String;
	 private var drink4_mp3:String;
	 private var blow_mp3:String;
	 private var wait_mp3:String;
	  
	 //***************declare Arduino pins, these settings can be overriden from mirrorconfig.xml load further below **************
	private var RTS_pin:Number = 8;	               // RTS line for C17A - DB9 pin 7
	private var DTR_pin:Number = 12;
	private var switch3_pin = 4; //switch 3 - stock, was window_front_switch pin
	//private var AboveFireLed_pin = 5;
	private var AboveFireLed_pin;
	private var switch5_pin = 5; 
	private var switch6_pin = 6; 
	private var LED1_pin:Number = 6;
	private var switch4_pin:Number = 7; //switch 4 - picasa picture frame switch
	private var switch1_pin:Number = 2; //switch 1 - door sensor
	private var LED2_pin:Number = 9;
	private var LED3_pin:Number = 10;
	private var LED4_pin:Number = 11;
	private var LED_mode:String;
	private var switch2_pin = 3; //switch 2 - weather
	private var Fiber_Led_pin=13;	
	//// analog pins
	private var proximity_sensor_pin:Number=0;
	private var analog_input1_pin:Number=1; //change back to 1 or 5 analog touch sensor 1 weather
	private var analog_input2_pin:Number=2; //analog touch sensor 2 stock
	private var analog_input3_pin:Number=3; //analog touch sensor 3 video 1
	private var hardware_mode_select_pin:Number=4; // hardware mode select pot
	private var alcohol_sensor_pin:Number=1; // hardware mode select pot
	//**************************************************
	
	//*************** For lipsync***********************
	private var lipsync_feature:String;
	private var ba:ByteArray=new ByteArray; //byte array for sound spectrum
	private var volumeTotal:int = 0;
	private var lip1:Loader = new Loader();
	private var lip1_url:String="images/lip1.png";
	private var lip1_request:URLRequest=new URLRequest(lip1_url);		
	private var lip2:Loader = new Loader();
	private var lip2_url:String="images/lip2.png";
	private var lip2_request:URLRequest=new URLRequest(lip2_url);		
	private var lip3:Loader = new Loader();
	private var lip3_url:String="lip3.png";
	private var lip3_request:URLRequest=new URLRequest(lip3_url);		
	private var lip4:Loader = new Loader();
	private var lip4_url:String="images/lip4.png";
	private var lip4_request:URLRequest=new URLRequest(lip4_url);		
	private var lip5:Loader = new Loader();
	private var lip5_url:String="images/lip5.png";
	private var lip5_request:URLRequest=new URLRequest(lip5_url);	
	private var lip6:Loader = new Loader();
	private var lip6_url:String="images/lip6.png";
	private var lip6_request:URLRequest=new URLRequest(lip6_url);		
	private var lip7:Loader = new Loader();
	private var lip7_url:String="images/lip7.png";
	private var lip7_request:URLRequest=new URLRequest(lip7_url);		
	private var lip8:Loader = new Loader();
	private var lip8_url:String="images/lip8.png";
	private var lip8_request:URLRequest=new URLRequest(lip8_url);		
	private var lip9:Loader = new Loader();
	private var lip9_url:String="images/ip9.png";
	private var lip9_request:URLRequest=new URLRequest(lip9_url);		
	private var lip10:Loader = new Loader();
	private var lip10_url:String="images/lip10.png";
	private var lip10_request:URLRequest=new URLRequest(lip10_url);
	//***************************************************************
		 
	private var com_port;
	private var a:Arduino;
	private var weather_code;	
	private var weather_high:int;
	private var good_weather_threshold:int;
	private var x10_commands;   
	private var sw_version:String;
	//private var version:TextField = new TextField();
	
	///**** these are delays for the x10 codes
	private var SLEEP1:int = 1;  
	private var SLEEP35:int = 35;  
	private var SLEEP1000:int = 1000;  
	//100 has been working
	///***************************************
	
	///**** arduino delays ********************
	private var startup_delay:int;   
	private var find_arduino_delay:int;   ///the delay from socket connected to requesting firmware
	//private var first_video_play_delay:int;  /// because the first init routine must not play until after firmware found
	///****************************************
	private var startTime = getTimer();
	private var pwmValue:Number=0;
	private var rising:Boolean=true;
	private var step:Number=50;  	
	
	///******* Picture Frame Variables **********	
	private var google_id:String;
	private var picasa_album_id:String;
	private var slide_delay:int;
	private var slide_delay_seconds:int;
	private var imageArray:Array = new Array();	
	private var imageTimer:Timer;
	private var debounceTimer:Timer;
	private var debounceTimer2:Timer;
	private var debounceCounter:int = 0;
	private var i:int = 0;
	private var URLString:String ;		
	private var SlideShowRunning:int = 0;
	private var SlideShowStarted:int = 0;
	private var PicasaLoaded:int = 0;
	private var picture_x_position:Number;
	private var picture_y_position:Number;
	private var picture_rotation:Number;
	private var picture_scale:Number;
	private var display_stock_text;
	private var display_weather_text;
	private var display_weather_image;
	private var picAURLRequest:URLRequest = new URLRequest;
	private var picA1URLRequest:URLRequest = new URLRequest;
	private var picBURLRequest:URLRequest = new URLRequest;
	private var picAImageLoader:Loader = new Loader();
	private var picA1ImageLoader:Loader = new Loader();
	private var picBImageLoader:Loader = new Loader();
	private var picAurl:String;
	private var picA1url:String;
	private var picBurl:String;
	//private var picABitmapData:BitmapData = new BitmapData();
	private var picABitmapData:BitmapData;
	private var picA1BitmapData:BitmapData;
	private var picA:Bitmap = new Bitmap;
	private var picA1:Bitmap = new Bitmap;
	private var picBBitmapData:BitmapData;
	private var picB:Bitmap = new Bitmap;	
	private var picATimer:Timer;
	private var picBTimer:Timer;
	private var delayTimer:Timer;	
	private var num_images:int;
	private var LEDOffFlag:int=1;
	private var FirstProxVideoPlaying:int=0;
	private var AProxVideoPlaying:int = 0; //tells us that any of the prox videos are playing, another one should not interrupt
	private var QuizModeStopProxFlag:int = 0; //if in quiz mode and this is set, then don't play the prox video again until the correct answer is entered
	private var QuizQuestionPlayed:int = 0;
	private var wrongAnswerFlag:int = 1; //start with answer flag wrong until the right one is given
	private var doorBellTimer:Timer;
	private var doorbell_delay:int;
	private var quiz_timer_delay:int;
	private var AlcoholNoSwitchTimer:Timer;
	private var AlcoholNoSwitchTimerDelay:Timer;
	private var QuizTimer:Timer;
	private var inDigitalFunction:int = 0;
	
	private var LEDTimer:Timer = new Timer(100, 1); //timer for the LEDs to blink with proximity sensor matches
	private var LEDTimerOff:Timer = new Timer(100, 1); //timer for the LEDs to blink with proximity sensor matches
	
	private var ModeSelectTimer:Timer = new Timer(500, 1); //timer for the LEDs to blink with proximity sensor matches
	private var Touch1Timer:Timer = new Timer(3000,1);
	private var Touch2Timer:Timer = new Timer(3000,1);
	private var Touch3Timer:Timer = new Timer(3000,1);
	
	private var Touch1PressedTimer:Timer = new Timer(100,1);
	private var Touch2PressedTimer:Timer = new Timer(100,1);
	private var Touch3PressedTimer:Timer = new Timer(100,1);
	
	private var StockDisplayTextTimer:Timer = new Timer(1100,1);
	private var WeatherDisplayTextTimer:Timer = new Timer(1100,1);
	private var StockDisplayTextTimer5s:Timer = new Timer(5000,1);
	private var WeatherDisplayTextTimer5s:Timer = new Timer(5000,1);
	
		
	//private var Alcohol_Countdown:Timer = new Timer(1000,5);
	private var Alcohol_CountdownTimer:Timer;
	private var Alcohol_CountdownTimer2:Timer;
	private var Alcohol_ResetTimer:Timer;
	private var Alcohol_LEDTimer:Timer;
	private var BeerImageFadeTimer:Timer;
	private var Alcohol_Sensor_Value:Number;
	private var TextClearTimer:Timer;
	private var WarningMessageClearTimer:Timer;
	private var PleaseWaitTextClearTimer:Timer;
	private var BreathalyzerStatusTextClearTimer:Timer;
	private var TweetBirdTimer:Timer;
	private var TweetBirdClearTimer:Timer;
	private var WeatherForecastText:String;
	private var WeatherForecastTextTTS:String;
	
	private var LipsyncTimer:Timer;
	
	private var alcohol_baseline_difference_allowance:Number;
	private var alcohol_baseline_difference:Number;
	private var original_alcohol_baseline:Number;
	
	private var doorcamTimer:Timer;
	
	private var x10_in_progress:int=0;
	private var x10_counter:int=0;
	//********** x-10 packet timers **********
	private var x10_sleep_initial:Timer = new Timer(1,1);
	private var x10_sleep35:Timer = new Timer(35,1);
	private var x10_done1:Timer = new Timer(1,1);	
	private var x10_done2:Timer = new Timer(1,1);	
	//private var x10_sleep1000:Timer = new Timer(1000,1);		
	private var x10_sleep1000:Timer;
	private var sensor_delayTimer:Timer;	
	private var noArduinoFoundTimer:Timer;
	
	private var touch_counter:int=0;
	private var video_playing:int=1; //flag that tells me if a sensor video (not idle) is currently playing, onclip done resets it
                                     //start with this one so things don't play and set it to 0 when initial values routine is finished	
	private var stockweatherplaying:int=0;
	private var x10_array:Array; //x10 byte array	
	
	private var x10_house1:String;
	private var x10_house2:String;
	private var x10_house3:String;
	private var x10_house4:String;
	
	private var x10_unit1:String;
	private var x10_unit2:String;
	private var x10_unit3:String;
	private var x10_unit4:String;  
	
	private var x10_address1:String;
	private var x10_address2:String;
	private var x10_address3:String;
	private var x10_address4:String;
	
	private var x10_last:String;
	private var x10_wait:int;
	private var x10_resends:int;
	
	private var X10_ON_ARRAY:Array;
	private var X10_OFF_ARRAY:Array;	
	private var X10_BRIGHT_ARRAY:Array;
	private var X10_DIM_ARRAY:Array;	
	
	private var character_change_sound_princess:Sound;
	private var character_change_sound_pirate:Sound;
	private var character_change_sound_halloween:Sound;
	private var character_change_sound_insult:Sound;
	private var character_change_sound_tts:Sound;
	
	private var beep_sound:Sound;
	private var notready_sound:Sound;
	
	private var wait_sound:Sound;
	private var blow_sound:Sound;
	private var warning_sound:Sound;
	
	private var wait_sound_princess:Sound;
	private var wait_sound_pirate:Sound;
	private var wait_sound_halloween:Sound;
	private var wait_sound_insult:Sound;
	
	private var blow_sound_princess:Sound;
	private var blow_sound_pirate:Sound;
	private var blow_sound_halloween:Sound;
	private var blow_sound_insult:Sound;
	
	private var warning_sound_princess:Sound;
	private var warning_sound_pirate:Sound;
	private var warning_sound_halloween:Sound;
	private var warning_sound_insult:Sound;
	
	private var doorbell_sound:Sound;
	
	private var tts_stream:Sound = new Sound();
	private var tts_channel:SoundChannel = new SoundChannel();
	
	private var tts_stream_breath:Sound = new Sound();
	private var tts_channel_breath:SoundChannel = new SoundChannel();
	
	private var custom_audio_sound:Sound = new Sound();
	private var custom_audio_channel:SoundChannel = new SoundChannel();
	
	private var tts_feature:String;		
	private var tts_charlimit:int;
	private var tts_avatar:String;
	private var tts_url:String;
	private var	tts_language:String;
	private var	tts_sendheader:String;
	private var	tts_headername:String;
	private var	tts_headervalue:String;
	
	private var twitter_feature:String;
	private var twitter_breathalyzer:String;
	private var twitter_breathalyzer_value:String;
	private var twitter_authenticated:String;
    private var twitter_username:String;
    private var twitter_password:String;
    private var twitter_frequency:int;
	private var twitter_my_tweets_only:String;
	private var twitter_search_term:String;
	private var twitter_mode:String;
	private var twitter_do_not_speak_search_term:String;
	
	
	private var tts_stream_tweet1:Sound = new Sound();
	private var tts_channel_tweet1:SoundChannel = new SoundChannel();
	private var tts_stream_tweet2:Sound = new Sound();
	private var tts_channel_tweet2:SoundChannel = new SoundChannel();
	private var tweet_array:Array = new Array();
	private var full_tweet:String;
	private var tweet1_text:String;
	private var tweet2_text:String;
	private var tweet_username:String;	
	private var current_tweet:String;
	private var last_tweet:String;		
	private var tweet_over_100:int = 0;
	private var TwitterTimer:Timer;
   // private var tweetr:Tweetr;
	//private var oauth:OAuth;
    private var htmlLoader:HTMLLoader;
	
	private var request:TwitterRequest;
	private	var complete:Function;
	
	//private var url_door:String = "sounds/doorbell.mp3"; //not using these anymore but if need to track an event when sound is done playing will need this
  	//private var doorbell_sound:Sound = new Sound();
	//private var sound_channel_sound:SoundChannel;
	//private var request:URLRequest = new URLRequest(url_door);
	
	private var myFont:Font = new MyriadFont();	//used for stock text													
	private var StockTextFormat:TextFormat = new TextFormat(); //this is the formatter for the stock_display field
	private var BreathTextFormat:TextFormat = new TextFormat(); //this is the formatter for the stock_display field
	private var WeatherTextFormat:TextFormat = new TextFormat(); //this is the formatter for the weather_display field
	private var ProximityTextFormat:TextFormat = new TextFormat(); //this is the formatter for the weather_display field
	private var StartUpTextFormat:TextFormat = new TextFormat(); //this is the formatter for the startup text field
	private var ErrorTextFormat:TextFormat = new TextFormat(); //this is the formatter for the error field that comes if the Arduino was not found
	private var stock_display:TextField = new TextField();
	private var AlcoholReadingText:TextField = new TextField();
	private var weather_display2:TextField = new TextField();
	private var proximity_readout:TextField = new TextField();
	private var StartUpText:TextField = new TextField;
	private var AlcoholTextFormat:TextFormat = new TextFormat(); //this is the formatter for the startup text field
	private var AlcoholText:TextField = new TextField;
	private var AlcoholResultsFormat:TextFormat = new TextFormat(); //this is the formatter for the startup text field
	private var WarningMessageFormat:TextFormat = new TextFormat(); //this is the formatter for the startup text field
	private var WarningMessage:TextField = new TextField;
	private var AlcoholResults:TextField = new TextField;
	private var AlcoholResetCounterFormat:TextFormat = new TextFormat(); //this is the formatter for the startup text field
	private var AlcoholResetCounter:TextField = new TextField;
	private var mirror_did_not_init_text:TextField = new TextField();
	
	private var myVid:FLVPlayback = new FLVPlayback();
	private var myVid2:FLVPlayback = new FLVPlayback();
	private var pic:UILoader = new UILoader();
	private var myXML:XML = new XML();
	
	private var doorcam:MJPEG;
	private var doorcam_on;
	private var doorcam_host;
	private var doorcam_path;
    private var doorcam_port;
    private var doorcam_x:Number;
    private var doorcam_y:Number;
    private var doorcam_rotate:Number;
    private var doorcam_scale:Number;	
	private var doorcamWidth:Number;
	private var	doorcamHeight:Number;
	private var doorcamMaskingShape:Shape;	
	private var doorcam_username:String;	
	private var doorcam_password:String;
	private var	doorcam_width:Number;
	private var doorcam_height:Number;
	private var doorcam_timer:Number;
	private var doorcam_video_scale:Number;
	private var doorcam_video_x:Number;
	private var doorcam_video_y:Number;
	private var doorcamPlayingFlag:int = 0; //tells us whether or not the doorcam video is playing, if yes, then don't start another video
	
	private var webcam_on;
	private var webcam_x:Number;
    private var webcam_y:Number;
    private var webcam_rotate:Number;
    private var webcam_scale:Number;	
	private var webcam_width:int;
	private var	webcam_height:int;
	private var	webcam_fps:int;
	private var display_frame:String;	
	private var selected_frame_index:int;
	private var frame_selected:String;	
	private var frame_x:Number;
	private var frame_y:Number;
	private var frame_rotation:Number;
	private var frame_scale:Number;	
	private var webcamfound:int = 0; //if this is 1, then a webcam was found, otherwise its 0
	
	private var stand_alone:String;
	private var stand_alone_weather:String;
	private var stand_alone_stock:String;
		
	private var thoughtsLoader:Loader = new Loader();
	private var thoughts_image:Bitmap;
	private var thoughts_bitmapdata:BitmapData;
	private var thoughts_image_x:Number;
	private var thoughts_image_y:Number;
	private var thoughts_image_rotate:Number;
	private var thoughts_image_scale:Number;
	
	private var avatarLoader:Loader = new Loader();
	private var avatar_image:Bitmap;
	private var avatar_bitmapdata:BitmapData;
	private var avatar_image_x:Number;
	private var avatar_image_y:Number;
	private var avatar_image_rotate:Number;
	private var avatar_image_scale:Number;
	
	private var frameLoader:Loader = new Loader();
	private var frame:Bitmap;
	private var frame_bitmapdata:BitmapData;
	private var frame_image_x:Number;
	private var frame_image_y:Number;
	private var frame_image_rotate:Number;
	private var frame_image_scale:Number;
	
	private var WebcamMirrorLoader:Loader = new Loader();
	private var WebcamMirror:Bitmap;
	private var WebcamMirror_bitmapdata:BitmapData;
	private var WebcamMirror_image_x:Number;
	private var WebcamMirror_image_y:Number;
	private var WebcamMirror_image_rotate:Number;
	private var WebcamMirror_image_scale:Number;
	
	private var TwitterBird:Loader = new Loader();
	private var TwitterBirdURL:String="images/twitter_bird.png";
	private var TwitterBirdRequest:URLRequest=new URLRequest(TwitterBirdURL);
	private var TweetSound:Sound;
	
	private var sound_playing:int = 0; //flag that tells us if there is a TTS sound playing, if yes, don't do anything and wait until its done and flag has been cleared
	
	private var screen_mode;	
	private var weather_image:Bitmap = new Bitmap();
	private var weather_images_url:String;
	
	private var beer_image:Bitmap = new Bitmap();
	private var beer_images_url:String;
	private var beer_image_Loader:Loader = new Loader();
	private var beer_image_bitmapdata:BitmapData;
	private var beer_image_alpha:Number = 1;
		
	private var weather_image_no_arduino:Bitmap = new Bitmap();
	private var weather_images_url_no_arduino:String;
	private var weather_images_loader_no_arduino:Loader = new Loader();
	
	private var stock_image_no_arduino:Bitmap = new Bitmap();
	private var stock_images_url_no_arduino:String;
	private var stock_images_loader_no_arduino:Loader = new Loader();
	
	private var stock_image_sprite: Sprite = new Sprite(); //need those so we can add an event listener to the bitmaps, can only do with sprites
	private var weather_image_sprite: Sprite = new Sprite();
	
	private var stock_text_x:Number;
	private var stock_text_y:Number;
	private var	stock_text_fontsize:Number;		
	private var	stock_text_rotation:Number;		
	private var weather_text_x:Number;
	private var weather_text_y:Number;
	private var	weather_text_fontsize:Number;		
	private var	weather_text_rotation:Number;		
	private var weather_image_x:Number;
	private var weather_image_y:Number;
	private var weather_image_rotation:Number;
	private var weather_image_scale:Number;
	private var weatherImageDisplayedFlag:int = 0;
	
	private var beer_image_x:Number;
	private var beer_image_y:Number;
	private var beer_image_rotation:Number;
	private var beer_image_scale:Number;
	
	//private var myXML:XML = new XML();
	private var file:File = new File(); 
	private var filestream:FileStream = new FileStream();
	private var AlertTextFormat:TextFormat = new TextFormat();
	private var slideshow_flag:int = 0;
	
	private var version:TextArea = new TextArea;
	private var two:TextArea = new TextArea;
	private var three:TextArea = new TextArea;
	private var four:TextArea = new TextArea;
	private var seven:TextArea = new TextArea;
	private var five:TextArea = new TextArea;
	private var six:TextArea = new TextArea;
	private var x10_label:TextArea = new TextArea;
	private var idle:TextArea = new TextArea;
	private var demo:TextArea = new TextArea;
	private var ArduinoFound:TextArea = new TextArea;
	private var raw_distance:TextArea = new TextArea;
	private var error:TextArea = new TextArea;
	private var SensorText:TextArea = new TextArea;	
	private var Stock:TextArea = new TextArea;
	private var WeatherText:TextArea = new TextArea;
	private var Weather:TextArea = new TextArea;
	private var modeSelect:TextArea = new TextArea;
	private var three_analog:TextArea = new TextArea;
	private var two_analog:TextArea = new TextArea;
	private var one_analog:TextArea = new TextArea;
	private var zero_analog:TextArea = new TextArea;
	private var touch_counter_text:TextArea = new TextArea;
	private var alcohol_sensor_text:TextArea = new TextArea;
	private var tweet_text:TextArea = new TextArea;	
	private var LabelTextFormat:TextFormat = new TextFormat();
	private var vidButton2:Button = new Button();
	private var x10_bright_button:Button = new Button();
	private var x10_on_lights_button:Button = new Button();
	private var x10_off_lights_button:Button = new Button();
	private var x10_on_button:Button = new Button();
	private var x10_off_button:Button = new Button();
	private var doorButton:Button = new Button();
	private var vidButton:Button = new Button();
	private var stockButton:Button = new Button();
	private var SlideStartButton:Button = new Button();
	private var SlideStopButton:Button = new Button();
	private var tweet_button:Button = new Button();
	private var photobooth_Startbutton:Button = new Button();
	private var photobooth_Stopbutton:Button = new Button();	
	private var alcohol_reading_now:Number = 0;
	
	//********* Photobooth variables ********************
	private	var cam:Camera;
	private	var video:Video = new Video();
	
	private var myEncoder:JPEGEncoder = new JPEGEncoder(100);
	//private var file:File = new File(); 
	//private var filestream:FileStream = new FileStream();
	
	private var EXT_JPEG:String = ".jpg";
	private var EXT_PNG:String = ".png";
	private var IMAGE_FOLDER:String;
	public static const FORMAT_JPEG:uint = 0x00;
	public static const FORMAT_PNG:uint = 0x01;
	
	private var asyncEncoder:JPEGAsyncEncoder;
	
	//private var AlertTextFormat:TextFormat = new TextFormat();
	//private var myXML:XML = new XML();	
	
	private	var photoboothBitmapData1:BitmapData;
	private var photobooth_capturetemp1:BitmapData;
	private	var photobooth_capture1:Bitmap;
	private	var photobooth_gallery1:Bitmap;
	private	var photobooth_proof1a:Bitmap;
	private	var photobooth_proof1b:Bitmap;
	private	var photobooth_byteArray1:ByteArray;	
	
	private	var photoboothBitmapData2:BitmapData;
	private var photobooth_capturetemp2:BitmapData;
	private	var photobooth_capture2:Bitmap;
	private	var photobooth_gallery2:Bitmap;
	private	var photobooth_proof2a:Bitmap;
	private	var photobooth_proof2b:Bitmap;
	private	var photobooth_byteArray2:ByteArray;	
	
	private	var photoboothBitmapData3:BitmapData;
	private var photobooth_capturetemp3:BitmapData;
	private	var photobooth_capture3:Bitmap;
	private	var photobooth_gallery3:Bitmap;
	private	var photobooth_proof3a:Bitmap;
	private	var photobooth_proof3b:Bitmap;
	private	var photobooth_byteArray3:ByteArray;	
	
	private	var photoboothBitmapData4:BitmapData;
	private var photobooth_capturetemp4:BitmapData;
	private	var photobooth_capture4:Bitmap;
	private	var photobooth_gallery4:Bitmap;
	private	var photobooth_proof4a:Bitmap;
	private	var photobooth_proof4b:Bitmap;
	private	var photobooth_byteArray4:ByteArray;		
	
	private var photoboothWhiteRectangleBitmapData = new BitmapData (384,577,false,0xffffffff);
	private var photoboothWhiteRectangle = new Bitmap (photoboothWhiteRectangleBitmapData);
	
	private var photoboothCountdownTimer:Timer;
	private var photoboothPleaseWaitTimer1:Timer;
	private var photoboothPreGalleryTimer:Timer;
	private var shotDelayTimer:Timer;
	private var photoboothFlashTimer:Timer;
	private var photoboothGalleryTimer:Timer;
	private var	photoboothDelayAfterCameraSound:Timer;
	private var	photoboothProofDisplayTime:Timer;
	private var	photoboothThanksBoxTimer:Timer;
	private var photoboothFacialRecDelayTimer:Timer;
	
	private var photoboothPicCounter:int = 0;
	private var photoboothStarted:int = 0;
	private var photoboothRunning:int = 0;
	private var photoboothIdle:int = 0;
	
	private var photobooth_IntroSound:Sound;
	private var photobooth_getReadySound:Sound;
	private var photobooth_pic2Sound:Sound;
	private var photobooth_pic3Sound:Sound;
	private var photobooth_pic4Sound:Sound;
	private var photobooth_developingSound:Sound;
	private var photobooth_developingSound_channel:SoundChannel = new SoundChannel();
	private var photobooth_thanksSound:Sound;
	private var photobooth_thanksSound_channel:SoundChannel = new SoundChannel();
	
	private var photobooth_beepSound:Sound;
	private var photobooth_cameraSound:Sound;
	private var photobooth_developingfilmSound:Sound;
	
	private var cameraSoundPlayedChannel:SoundChannel = new SoundChannel();
	private var photoboothSayCheeseChannel:SoundChannel = new SoundChannel();
	
	private var photobooth_IntroSoundPath:String;
	private var photobooth_getReadySoundPath:String;	
	private var photobooth_pic2SoundPath:String;	
	private var photobooth_pic3SoundPath:String;	
	private var photobooth_pic4SoundPath:String;	
	private var photobooth_developingSoundPath:String;	
	private var photobooth_thanksSoundPath:String;
	
	private var photobooth_IntroSoundPathp:String;
	private var photobooth_getReadySoundPathp:String;	
	private var photobooth_pic2SoundPathp:String;	
	private var photobooth_pic3SoundPathp:String;	
	private var photobooth_pic4SoundPathp:String;	
	private var photobooth_developingSoundPathp:String;	
	private var photobooth_thanksSoundPathp:String;	
	
	private var photobooth_IntroSoundPathh:String;
	private var photobooth_getReadySoundPathh:String;	
	private var photobooth_pic2SoundPathh:String;	
	private var photobooth_pic3SoundPathh:String;	
	private var photobooth_pic4SoundPathh:String;	
	private var photobooth_developingSoundPathh:String;	
	private var photobooth_thanksSoundPathh:String;	
	
	private var photobooth_IntroSoundPathpi:String;
	private var photobooth_getReadySoundPathpi:String;	
	private var photobooth_pic2SoundPathpi:String;	
	private var photobooth_pic3SoundPathpi:String;	
	private var photobooth_pic4SoundPathpi:String;	
	private var photobooth_developingSoundPathpi:String;	
	private var photobooth_thanksSoundPathpi:String;	
	
	private var photobooth_IntroSoundPathi:String;
	private var photobooth_getReadySoundPathi:String;	
	private var photobooth_pic2SoundPathi:String;	
	private var photobooth_pic3SoundPathi:String;	
	private var photobooth_pic4SoundPathi:String;	
	private var photobooth_developingSoundPathi:String;	
	private var photobooth_thanksSoundPathi:String;	
	
	private var photobooth_videoBandwidth:int = 0; // Maximum amount of bandwidth that the current outgoing video feed can use, in bytes per second.
	private var photobooth_videoQuality:int = 100; // This value is 0-100 with 1 being the lowest quality. 
	private var photobooth_videoWidth:int = 320;
	private var photobooth_videoHeight:int = 240;
	private var photobooth_fps:int = 24;
	
	//private	var header:URLRequestHeader = new URLRequestHeader("Content-type", "application/octet-stream");	
	//private var urlLoader:URLLoader = new URLLoader();
	
	private var photoboothBoxesLoader:Loader = new Loader();
	private var photoboothBoxesImage:Bitmap;
	private var photoboothBoxesImage_bitmapdata:BitmapData;
	
	private var photoboothWebcamNotFound:int = 0;
	
	private var CountdownLoader:Loader = new Loader();
	private var CountdownImage:Bitmap;
	private var CountdownImage_bitmapdata:BitmapData;
	
	private var photoboothRoundRectangle:Shape = new Shape();
	private var photoboothFlashRectangle:Shape = new Shape();
	
	private var CountdownTextFormat:TextFormat = new TextFormat(); 
	private var CountdownText:TextField = new TextField();
	
	private var photoboothMessageFormat:TextFormat = new TextFormat(); 
	private var photoboothMessage:TextField = new TextField();
	
	private var photoboothBackgroundLoader:Loader = new Loader();
	private var photoboothBackgroundImage:Bitmap;
	private var photoboothBackgroundImage_bitmapdata:BitmapData;
	
	private var photoboothLogoLoader:Loader = new Loader();
	private var photoboothLogoImage:Bitmap;
	private var photoboothLogoImage_bitmapdata:BitmapData;
	
	private var photoboothCustomBackgroundLoader:Loader = new Loader();
	private var photoboothCustomBackground_image:Bitmap;
	private var photoboothCustomBackground_bitmapdata:BitmapData;
	private var photoboothCustomBackground_image_x:Number;
	private var photoboothCustomBackground_image_y:Number;
	private var photoboothCustomBackground_rotate:Number;
	private var photoboothCustomBackground_image_scale:Number;
	
	private var printJob:PrintJob = new PrintJob();
	private var uiOpt:PrintUIOptions = new PrintUIOptions();
	private var PrintImageMC:MovieClip  = new MovieClip(); //this is what we'll print
	private var PrintOptions:PrintJobOptions = new PrintJobOptions();
	private var printSprite = new Sprite();
	private var bitmapData:BitmapData = new BitmapData(stage.stageWidth,stage.stageHeight);
	private var screenShot:Bitmap = new Bitmap(bitmapData);
	private var myScale:Number;
	private var printArea:Rectangle;
	//private var mode_select:String;
	//private var mirror_mode:String;
	private var CountdownTimerCounter:int;
	
	private var _twitter:Twitter;
	private var _token:TwitterTokenSet;

	private var _stage:Stage;
	
	private var _mentionedSinceID:String;
	private var _mentions:Vector.<MentionModel>;
	private var _mentionChecker:Timer;
	
	private var _searchSinceID:String;
	private var _search:Vector.<SearchModel>;
	private var __searchChecker:Timer;
	
	private	var headers:Array = [];
	private var requestVars:URLVariables;
	private	var TTSrequest:URLRequest;
	private var TTSloader:URLLoader;
	private var TTSTotalBytes:int  = 0;
	
	
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
	
	private var TTSengine:String = "voicerss";
	private var _functionToCall:String;
	
	//*****************************************************
	
	
	//private var osArray:Array = flashPlayerVersion.split(' ');
	//private var osType:String = osArray[0]; //The operating system: WIN, MAC, LNX
	//private var versionArray:Array = osArray[1].split(',');//The player versions. 9,0,115,0
		
	//private var X10_ADDRESS:String;
	///******************************************	
	//var service : PicasaService = new PicasaService();	
	
		//// ***************************************////
	public function mirror():void {
			
			//stage.align = StageAlign.TOP_LEFT;
			//stage.scaleMode = StageScaleMode.EXACT_FIT;
			//stage.scaleMode = StageScaleMode.NO_SCALE;
			
			// *********************************************************
			// Load the XML config file			
			var window:NativeWindow = stage.nativeWindow;
			window.maximize();  
			BuildUI();
			
			//service.imgmax = "1600";	// 1600 largest size possible to use from Picasa
			//service.thumbsize = "64c";  // not used
				
			AlertTextFormat.color = 0x000000; //black
			AlertTextFormat.font = myFont.fontName;
			AlertTextFormat.size = 30;  //70 default		
			AlertManager.overlayAlpha = .8;
			AlertManager.maxWidth = 800;
			AlertManager.hasDropShadow = true;
			AlertManager.setMessageBoxStyle("textFormat", AlertTextFormat);	
			
			file = File.documentsDirectory; 						
			file = file.resolvePath("diymagicmirror-settings/mirrorconfig.xml"); //now see if the config file is there			
			
			//switch (osType) {
					//case "MAC":												
						//file = File.desktopDirectory;
						//file = file.resolvePath("../../../Applications/DIY Magic Mirror/mirror.app/Contents/Resources/mirrorconfig.xml");
						//break;
					//case "WIN":													
						//file = File.documentsDirectory; 						
						//file = file.resolvePath("diymagicmirror-settings/mirrorconfig.xml"); //now see if the config file is there			
						//break;						
					//case "LNX":
						//file = File.desktopDirectory;
						//file = file.resolvePath("../../../opt/DIY Magic Mirror/mirror/share/mirrorconfig.xml");						
						//break;
					//default:
						//output.text = "Unable to detect OS";
						//trace ("Unable to detect OS");					
				//}  //end switch
										
			character_change_sound_princess = new Sound(new URLRequest("sounds/character_change_princess.mp3"));
			character_change_sound_pirate = new Sound(new URLRequest("sounds/character_change_pirate.mp3"));
			character_change_sound_halloween = new Sound(new URLRequest("sounds/character_change_halloween.mp3"));
			character_change_sound_insult = new Sound(new URLRequest("sounds/character_change_insult.mp3"));		
			character_change_sound_tts = new Sound(new URLRequest("sounds/character_change_tts.mp3"));		
			beep_sound = new Sound(new URLRequest("sounds/beep.mp3"));		
			
			wait_sound_princess = new Sound(new URLRequest("sounds/wait_princess.mp3"));
			wait_sound_pirate = new Sound(new URLRequest("sounds/wait_pirate.mp3"));
			wait_sound_halloween = new Sound(new URLRequest("sounds/wait_halloween.mp3"));
			wait_sound_insult = new Sound(new URLRequest("sounds/wait_insult.mp3"));
		
			blow_sound_princess = new Sound(new URLRequest("sounds/blow_princess.mp3"));
			blow_sound_pirate = new Sound(new URLRequest("sounds/blow_pirate.mp3"));
			blow_sound_halloween = new Sound(new URLRequest("sounds/blow_halloween.mp3"));
			blow_sound_insult = new Sound(new URLRequest("sounds/blow_insult.mp3"));
		
			warning_sound_princess = new Sound(new URLRequest("sounds/warning_princess.mp3"));
			warning_sound_pirate = new Sound(new URLRequest("sounds/warning_pirate.mp3"));
			warning_sound_halloween = new Sound(new URLRequest("sounds/warning_halloween.mp3"));
			warning_sound_insult = new Sound(new URLRequest("sounds/warning_insult.mp3"));
			
			doorbell_sound = new Sound(new URLRequest("sounds/doorbell.mp3"));
			TweetSound = new Sound(new URLRequest("sounds/tweet_sound.mp3"));
			
			notready_sound = new Sound(new URLRequest("sounds/notready.mp3"));	
			
					
			if (file.exists == false) {  //config file not there so prompt error box
				AlertManager.createAlert(this, "Your configuration file, mirrorconfig.xml, is missing. Please exit this program and run the Magic Mirror Configuration program and your configuration file will be created automatically.");
			}
			else {					
				RunMirror();  //now that we have the path to mirror.xml, continue
			}
             //************* old xmlLoader code when mirrorconfig.xml was in the mirror sub-directory, it is now in the user directory, diymagicmirror-settings/
			//xmlLoader = new URLLoader();
			//xmlLoader.load(new URLRequest("mirrorconfig.xml")); //load the local config file for the mirror
			//xmlLoader.addEventListener(Event.COMPLETE, RunMirror);			
	}   // end mirror function *************************************
			
	
		
		
		//public function RunMirror(event:Event):void { //triggered after config file loaded
		public function RunMirror():void { //triggered after config file loaded
			
			

		   

			//nativeWindow.x = (Capabilities.screenResolutionX - nativeWindow.width) ;
          //  nativeWindow.y = (Capabilities.screenResolutionY - nativeWindow.height) ;
			
			//myXML = new XML(xmlLoader.data);
			var registered:int = 0;
			
			filestream.open(file, FileMode.READ);
			myXML = XML(filestream.readUTFBytes(filestream.bytesAvailable));
			//trace (myXML);
			filestream.close();									
			
			if (Number(myXML.version) < 7.10) {  //this means user's config file was old and needs to be updated but we'll also save the user's settings so they don't have to re-type
				AlertManager.createAlert(this, "Your configuration file is an older version, please exit this program now and run the Configuration program which will update your configuration file while maintaining your existing configuration settings.");
			}
			
			startup_delay = myXML.startup_delay;			
			google_id = myXML.google_id;
			picasa_album_id = myXML.picasa_album_id;
			slide_delay = myXML.slide_delay;
			slide_delay_seconds = slide_delay * 1000;			
			picture_x_position = myXML.picture_x_position;
			picture_y_position = myXML.picture_y_position;
			picture_rotation = myXML.picture_rotation;
			picture_scale = myXML.picture_scale;			
			//Stage.showMenu = false;
			/*var responder : PicasaResponder = service.photos.list(google_id, picasa_album_id);  //google stop supporting flash
			responder.addEventListener(PicasaDataEvent.DATA, onGetAlbumsComplete);*/
			
			
			//responder.addEventListener(ErrorEvent.ERROR, onError);				
			//**************************************			
			com_port = myXML.com_port;		
			stand_alone = myXML.stand_alone;
			
			if (stand_alone != "on") {  //magic mirror is set for stand alone mode/no arduino on purpose	so don't need to show this					
				a = new Arduino("127.0.0.1", com_port); //connect to serial proxy server
				a.addEventListener(Event.CONNECT,onSocketConnect); 
				a.addEventListener(Event.CLOSE,onSocketClose);			
				// listen for Arduino data
				a.addEventListener(ArduinoEvent.FIRMWARE_VERSION, onReceiveFirmwareVersion);
				a.addEventListener(ArduinoEvent.DIGITAL_DATA, onReceiveDigitalData);
				a.addEventListener(ArduinoEvent.ANALOG_DATA, onReceiveAnalogData); 				
			}
			
			
			//var test:MJPEG = new MJPEG("thepoolcam.dyndns.tv", "/axis-cgi/mjpg/video.cgi", 80);
			//var test:MJPEG = new MJPEG("thepoolcam.dyndns.tv", "/axis-cgi/mjpg/video.cgi", 1000);
			
			//sw_version = "Version " + myXML.version;
			//this is the software version
			sw_version = "Version 7.10";
			
			//use this code later when a new config XML needs to be created
			
			if (Number(myXML.version) < 7.0) {
				AlertManager.createAlert(this, "Your configuration file is an older version, please exit this program now and run the Configuration program to update it and then re-start this program.");
			}
			
					
			idle_videos = myXML.idle_videos;
			video_resolution = myXML.video_resolution;
			idle_black = myXML.idle_black;
			reg_code = myXML.reg_code;
			mirror_mode = myXML.mirror_mode;  //sets princess, halloween, pirate, or insult mode
			trace (mirror_mode);
			verbose = myXML.verbose; //sets verbose mode if yes 
			
			video_scaling_factor = myXML.video_scaling_factor; //sets the video scaling factor
			x_position = myXML.x_position;
			y_position = myXML.y_position;
			video_rotation = myXML.video_rotation;
						
			hardware_mode_select = myXML.hardware_mode_select; // if on, then set the mode from hardware, i,e. keypad, will need a pot with three settings, then use analog input
			full_screen = myXML.full_screen; //full screen mode
			find_arduino_delay = myXML.find_arduino_delay;
			//first_video_play_delay = myXML.first_video_play_delay;
			
			digital_switches = myXML.digital_switches;
			switch1 = myXML.switch1;
			switch2 = myXML.switch2;
			switch3 = myXML.switch3;
			switch4 = myXML.switch4;
			switch5 = myXML.switch5;
			switch6 = myXML.switch6;
			
			switch1_trigger = myXML.switch1_trigger;
	  		switch2_trigger = myXML.switch2_trigger;
	  		switch3_trigger = myXML.switch3_trigger;
	  		switch4_trigger = myXML.switch4_trigger;
	  		switch5_trigger = myXML.switch5_trigger;
	  		switch6_trigger = myXML.switch6_trigger;
			
			//test_switch = myXML.test_switch;
			analog_input1 = myXML.analog_input1;
			analog_input2 = myXML.analog_input2;
			analog_input3 = myXML.analog_input3;	
			alcohol_sensor = myXML.alcohol_sensor;
			alcohol_baseline = Number(myXML.alcohol_baseline);
			alcohol_level1 = Number(myXML.alcohol_level1);
			alcohol_level2 = Number(myXML.alcohol_level2);
			alcohol_level3 = Number(myXML.alcohol_level3);
			alcohol_baseline_difference_allowance = Number(myXML.alcohol_baseline_difference_allowance);
			original_alcohol_baseline = Number(myXML.alcohol_baseline);	
			alcohol_text_duration = myXML.alcohol_text_duration;
			alcohol_no_switch_trigger_delta = myXML.alcohol_no_switch_trigger_delta;
	     	//**** get the pins from mirrorconfig.xml ************************
	        switch1_pin = Number(myXML.switch1_pin); //switch 1 - door sensor
	    	switch2_pin = Number(myXML.switch2_pin); //switch 2 - weather
			switch3_pin = Number(myXML.switch3_pin); //switch 3 - stock
			switch4_pin = Number(myXML.switch4_pin); //switch 4 - picasa picture frame switch
			switch5_pin = Number(myXML.switch5_pin); //switch 5 - breathalzyer
			switch6_pin = Number(myXML.switch6_pin); //switch 6 - x10 on/off
	        proximity_sensor_pin = Number(myXML.proximity_sensor_pin);
			analog_input1_pin = Number(myXML.analog_input1_pin); //analog touch sensor 1 weather
			analog_input2_pin = Number(myXML.analog_input2_pin); //analog touch sensor 2 stock
			analog_input3_pin = Number(myXML.analog_input3_pin); //analog touch sensor 3 video 1
			
			
			hardware_mode_select_pin = Number(myXML.hardware_mode_select_pin); // hardware mode select pot		
			alcohol_sensor_pin = Number(myXML.alcohol_sensor_pin); // alcohol sensor pin	
			
			
			//***********************************************************
						
			proximity_sensor_on = myXML.proximity_sensor_on;
	  		proximity_sensor_trigger1_distance_lower = myXML.proximity_sensor_trigger1_distance_lower;
	  		proximity_sensor_trigger1_distance_upper = myXML.proximity_sensor_trigger1_distance_upper;
	  		proximity_sensor_trigger1_time = myXML.proximity_sensor_trigger1_time;
	  		proximity_sensor_trigger2_distance = myXML.proximity_sensor_trigger2_distance;
			
			proximity_sensor_trigger2_distance_lower = myXML.proximity_sensor_trigger2_distance_lower;
			proximity_sensor_trigger2_distance_upper = myXML.proximity_sensor_trigger2_distance_upper;
			proximity_sensor_trigger2_time = myXML.proximity_sensor_trigger2_time;
			prox2_before_prox1 = myXML.prox2_before_prox1;
				
			stock_good_threshold = Number(myXML.stock_good_threshold);
			stock_bad_threshold = Number(myXML.stock_bad_threshold);
			weather_display = myXML.weather_display;
			forecast_cutoff = myXML.forecast_cutoff;
			x10_commands = myXML.x10_commands;
			screen_mode = myXML.screen_mode;
			display_stock_text = myXML.display_stock_text;
			display_weather_text = myXML.display_weather_text;
			display_weather_image = myXML.display_weather_image;
			weather_images_url = myXML.weather_images_url;
			
			stock_text_x = myXML.stock_text_x;
			stock_text_y = myXML.stock_text_y;
			stock_text_fontsize = myXML.stock_text_fontsize;		
			stock_text_rotation = myXML.stock_text_rotation;
			
			weather_text_x = myXML.weather_text_x;
			weather_text_y = myXML.weather_text_y;
			weather_text_fontsize = myXML.weather_text_fontsize;		
			weather_text_rotation = myXML.weather_text_rotation;
			
			weather_image_x = myXML.weather_image_x;
			weather_image_y = myXML.weather_image_y;
			weather_image_rotation = myXML.weather_image_rotation;		
			weather_image_scale = myXML.weather_image_scale;	
			
			beer_image_x = myXML.beer_image_x;
			beer_image_y = myXML.beer_image_y;
			beer_image_rotation = myXML.beer_image_rotation;		
			beer_image_scale = myXML.beer_image_scale;	
			
			x10_house1 = myXML.x10_house1;
			x10_house2 = myXML.x10_house2;
			x10_house3 = myXML.x10_house3;
			x10_house4 = myXML.x10_house4;
			x10_unit1 = myXML.x10_unit1;	 			
			x10_unit2 = myXML.x10_unit2;	
			x10_unit3 = myXML.x10_unit3;	
			x10_unit4 = myXML.x10_unit4;	
			
			x10_wait = myXML.x10_wait;
			x10_resends = myXML.x10_resends;
			
			//x10_address1 = String.concat(x10_house1,x10_unit1);
			x10_address1 = x10_house1 + x10_unit1;
			x10_address2 = x10_house2 + x10_unit2;
			x10_address3 = x10_house3 + x10_unit3;
			x10_address4 = x10_house4 + x10_unit4;
			trace (x10_house1);
			trace (x10_address1);
			trace(x10_address4);
			//SLEEP1000 = myXML.x10_delay; //from the old x10 routine
			trace (reg_code);
			x10_sleep1000 = new Timer(x10_wait,1);		//default for x10_wait is 1000
			
			if (reg_code == "440537" || reg_code == "110534" || reg_code == "768223" || reg_code == "998765" || reg_code == "233229" || reg_code == "643229" || reg_code == "876233" ) {
				demo.visible = false;
				removeChild(demo);
				registered = 1;
			} 
			
			if (test_switch == "off") { //if using pin 5 for proximity LED instead of a test switch
				AboveFireLed_pin = 5;				
			}
			else {
				AboveFireLed_pin = 13; //using a test switch on pin 5 and pin 13 for the proximity LED
			}
			
			doorcam_on = myXML.doorcam_on;		
			doorcam_host = myXML.doorcam_host;		
			doorcam_path = myXML.doorcam_path;		
			doorcam_port = myXML.doorcam_port;					
			doorcam_x = myXML.doorcam_x;		
			doorcam_y = myXML.doorcam_y;		
			doorcam_rotate = myXML.doorcam_rotate;		
			doorcam_scale = myXML.doorcam_scale;		
			doorcam_username = 	myXML.doorcam_username;
			doorcam_password = myXML.doorcam_password;
	 		doorcam_width = myXML.doorcam_width;
			doorcam_height= myXML.doorcam_height;
			doorcam_timer = myXML.doorcam_timer;
			
			webcam_on = myXML.webcam_on;
			webcam_x = myXML.webcam_x;
			webcam_y = myXML.webcam_y;
			webcam_rotate = myXML.webcam_rotate;
			webcam_scale = myXML.webcam_scale;			
			
			webcam_width = myXML.webcam_width;
			webcam_height = myXML.webcam_height;
			webcam_fps = myXML.webcam_fps;
			
			display_frame = myXML.frame;
			frame_x = myXML.frame_x;
			frame_y = myXML.frame_y;
			frame_rotation = myXML.frame_rotation;
			frame_scale = myXML.frame_scale;
			///**** face detection variables *****
			__faceDetectInterval = myXML.faceDetectInterval;			
			__noFaceTimeout = myXML.noFaceTimeout;
			__rectColor = myXML.faceDetectrectColor;
			
			photoboothfaceDetectInterval = myXML.faceDetectInterval;			
			photoboothnoFaceTimeout = myXML.noFaceTimeout;
			photoboothrectColor = myXML.faceDetectrectColor;
			///************************************
			
			selected_frame_index = myXML.frame_selected_index;		
				switch (selected_frame_index)  
						{
						case 0: 			
							frame_selected = myXML.frame_path[0]
							break;
						case 1:
							frame_selected = myXML.frame_path[1]
							break;
						case 2: 
							frame_selected = myXML.frame_path[2]
							break;
						case 3: 
							frame_selected = myXML.frame_path[3]
							break;	
						case 4: 
							frame_selected = myXML.frame_path[4]
							break;	
						case 5: 
							frame_selected = myXML.frame_path[5]
							break;	
				  }				
			
			
			stand_alone_weather = myXML.stand_alone_weather;
			stand_alone_stock = myXML.stand_alone_stock;
						
			doorcam_video_scale = myXML.doorcam_video_scale;
			doorcam_video_x = myXML.doorcam_video_x;
			doorcam_video_y = myXML.doorcam_video_y;
			
			thoughts_image_x = myXML.thoughts_image_x;
			thoughts_image_y = myXML.thoughts_image_y;
			thoughts_image_rotate = myXML.thoughts_image_rotate;
			thoughts_image_scale = myXML.thoughts_image_scale;
			
			avatar_image_x = myXML.avatar_image_x;
			avatar_image_y = myXML.avatar_image_y;
			avatar_image_rotate = myXML.avatar_image_rotate;
			avatar_image_scale = myXML.avatar_image_scale;
			
		  //tts_feature = myXML.tts_feature;		
		  tts_feature = "on";  //made this change after adding custom mp3
		  tts_avatar = myXML.tts_avatar;
		  tts_charlimit = myXML.tts_charlimit;
		  tts_url = myXML.tts_url;
		  tts_language = myXML.tts_language;
		  tts_sendheader = myXML.tts_sendheader;
		  tts_headername = myXML.tts_headername;
		  tts_headervalue = myXML.tts_headervalue;
		  
		  twitter_feature = myXML.twitter_feature;
		  twitter_breathalyzer = myXML.twitter_breathalyzer;
		  twitter_breathalyzer_value = myXML.twitter_breathalyzer_value;
		  twitter_authenticated = myXML.twitter_authenticated;
   		  twitter_username = myXML.twitter_username;
    	  twitter_password = myXML.twitter_password;
    	  twitter_frequency = myXML.twitter_frequency;
		  twitter_my_tweets_only = myXML.twitter_my_tweets_only;		  
		  twitter_search_term = myXML.twitter_search_term;
		  twitter_mode = myXML.twitter_mode;
		  twitter_do_not_speak_search_term = myXML.twitter_do_not_speak_search_term;
		  
		  proximity1_tts = myXML.proximity1_tts;
		  proximity2_tts = myXML.proximity2_tts;
		  proximity3_tts = myXML.proximity3_tts;
		  weather_good_tts = myXML.weather_good_tts;
		  weather_ok_tts = myXML.weather_ok_tts;
		  weather_rain_tts = myXML.weather_rain_tts;
		  no_internet_tts = myXML.no_internet_tts;
		  stock_up_tts = myXML.stock_up_tts;
		  stock_no_change_tts = myXML.stock_no_change_tts;
		  stock_down_tts = myXML.stock_down_tts;
		  doorbell_tts = myXML.doorbell_tts;
		  x10_on_tts = myXML.x10_on_tts;
		  x10_off_tts = myXML.x10_off_tts;
		  drink1_tts = myXML.drink1_tts;
		  drink2_tts = myXML.drink2_tts;
		  drink3_tts = myXML.drink3_tts;
		  drink4_tts = myXML.drink4_tts;
		  
		  blow_tts = myXML.blow_tts;
		  wait_tts = myXML.wait_tts;
		  warning_tts = myXML.warning_tts;
		  
			if (doorcam_on == "on") {
					//var test:MJPEG = new MJPEG("thepoolcam.dyndns.tv", "/axis-cgi/mjpg/video.cgi", 80);			
					//doorcam = new MJPEG(ipcamera_url.text, ipcamera_path.text, int(ipcamera_port.text),ipcamera_username.text,ipcamera_password.text ); 
					doorcam = new MJPEG(doorcam_host, doorcam_path, doorcam_port,doorcam_username,doorcam_password); //connect to serial proxy server
					addChild(doorcam)
					doorcam.visible = false;
					doorcam.rotation = doorcam_rotate;
					doorcam.x = doorcam_x;		
					doorcam.y = doorcam_y;
					doorcam.scaleX = doorcam_scale; //whether or not the reduce the video
					doorcam.scaleY = doorcam_scale;									
					doorcamWidth = doorcam_width * doorcam_scale; //for the mask
					doorcamHeight = doorcam_height * doorcam_scale;														
					//doorcam.width = doorcam_width; //now set the size of the video from the config settings
					//doorcam.height = doorcam_height;				
					doorcamMaskingShape = new Shape();						
					doorcamMaskingShape.graphics.beginFill(0xFF0000);
					doorcamMaskingShape.graphics.drawEllipse(0,0,doorcamWidth,doorcamHeight);			
					//doorcamMaskingShape.graphics.drawEllipse(0,0,doorcam.width,doorcam.height);			
					trace ("width " + doorcam.width);
					trace ("height " + doorcam.height);
					addChild(doorcamMaskingShape);
					doorcamMaskingShape.x = doorcam.x;
					doorcamMaskingShape.y = doorcam.y;		
					doorcamMaskingShape.rotation = doorcam.rotation;
					doorcam.mask = doorcamMaskingShape;			//the ellipse mask
					doorcamTimer = new Timer(doorcam_timer,1);
					doorcamTimer.addEventListener(TimerEvent.TIMER_COMPLETE, doorcamTimerEvent);	
					
					thoughtsLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,thoughtsLoaded);
					thoughtsLoader.load(new URLRequest("images/thoughts.png"));				
			}
				
					
			avatarLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,avatarLoaded);
			avatarLoader.load(new URLRequest("images/avatar.png"));					
										
			sensor_delayTimer = new Timer(3000 + (startup_delay * 1000),1); //have at least a half second delay
			noArduinoFoundTimer = new Timer(6000 + (startup_delay * 1000),1); //have this come up after the startup delay timer
				
			sensor_delayTimer.addEventListener(TimerEvent.TIMER_COMPLETE, initial_values);	
			noArduinoFoundTimer.addEventListener(TimerEvent.TIMER_COMPLETE, noArduinoFoundTimerEvent);
			
			
			alcohol_countdown = myXML.alcohol_countdown;
			//alcohol_reset_seconds = myXML.alcohol_reset_seconds;
			Alcohol_Reset_Counter = alcohol_reset_seconds; //initialize this counter, to be used to countdown when the alcohol sensor is ready to go again after being used
			
			//Alcohol_CountdownTimer = new Timer (3000,1);  //this used to be the please wait delay but we've eliminated that
			Alcohol_CountdownTimer = new Timer (50,1);
			Alcohol_CountdownTimer2 = new Timer (1000,alcohol_countdown);
			//Alcohol_ResetTimer = new Timer (1000,alcohol_reset_seconds); //this timer should go off every second for how many seconds it takes to reset the alcohol sensor, say 60 seconds
			Alcohol_ResetTimer = new Timer (1000); //this timer should go off every second for how many seconds it takes to reset the alcohol sensor, say 60 seconds
			TextClearTimer = new Timer (alcohol_text_duration * 1000,1); //6 seconds default
			WarningMessageClearTimer = new Timer (8000,1); //10 seconds default
			PleaseWaitTextClearTimer = new Timer (3000,1); //6 seconds default
			BreathalyzerStatusTextClearTimer = new Timer (5000,1); //this timer will clear the breahalyzer status text after 5 seconds
			debounceTimer = new Timer (int(myXML.debounce1),1); //button debounce timer
			debounceTimer2 = new Timer (int(myXML.debounce2),1); //button debounce timer
			TweetBirdTimer = new Timer (3000,1); //6 seconds default
			TweetBirdClearTimer = new Timer (1000,1); //this timer will clear the breahalyzer status text after 5 seconds
			
			Alcohol_LEDTimer = new Timer (500); //go off every half second
			BeerImageFadeTimer = new Timer (1000,alcohol_countdown);
			LipsyncTimer = new Timer (int(myXML.lipsync_interval)); //timer for lipsync, goes off every 83 ms is the lipsync bkm timing
			lipsync_feature = myXML.lipsync_feature;   
			
			if (myXML.LED_mode != undefined) { 
				LED_mode = myXML.LED_mode; 
			}
			else {
				LED_mode = "indicator"; 
			}			
			
			if (myXML.doorbell_delay != undefined) { //if the key exists
				doorbell_delay = myXML.doorbell_delay;
			}
			else {
				doorbell_delay = 3;
			}
			
			if (myXML.quiz_timer != undefined) { //if the key exists
				quiz_timer_delay = myXML.quiz_timer;
			}
			else {
				quiz_timer_delay = 120;
			}
			
			doorBellTimer = new Timer (doorbell_delay * 1000,1);
			QuizTimer = new Timer (quiz_timer_delay * 1000,1); //had to add the 10 because the timer goes off when prox1 plays so need to count that time
			
			var AlcoholNoSwitchTimerDuration = myXML.alcohol_no_switch_interval;
			AlcoholNoSwitchTimer = new Timer (AlcoholNoSwitchTimerDuration);
			AlcoholNoSwitchTimerDelay = new Timer (5000,1); //delays the noalcholswitch option so we don't get a false reading while the sensor is warming up
						
			//version.text = "Version 3.0"; //set the software version
			version.text = sw_version; //set the software version
			ArduinoFound.visible = false; //turn off text field by default
			Weather.visible = false; 
			SensorText.visible = false; 
			AlcoholReadingText.visible = false;
			WeatherText.visible = false;
			zero_analog.visible = false;
			one_analog.visible = false;
			two_analog.visible = false;
			three_analog.visible = false;
			modeSelect.visible = false;
			four.visible = false;
			seven.visible = false;
			two.visible = false;
			three.visible = false;
			five.visible = false;
			six.visible = false;
			vidButton.visible = false;
			vidButton2.visible = false;
			Stock.visible = false;
			stockButton.visible = false;
			doorButton.visible = false;
			x10_off_button.visible = false;			
			x10_on_button.visible = false;			
			x10_bright_button.visible = false;		
			x10_label.visible = false;
			version.visible = false;
			raw_distance.visible = false; 
			idle.visible = false; 		
			//pic.visible = false;
			SlideStartButton.visible = false;
			SlideStopButton.visible = false;
			tweet_button.visible = false;
			photobooth_Startbutton.visible = false;
	        photobooth_Stopbutton.visible = false;
			touch_counter_text.visible = false; 
			alcohol_sensor_text.visible = false; 
			tweet_text.visible = false; 
			x10_on_lights_button.visible = false;
			x10_off_lights_button.visible = false;
						
			trace ("verbose: " + verbose);			
						
			if (verbose == "yes") {
				//trace ("went here");
				ArduinoFound.visible = true;
				SensorText.visible = true;	
				WeatherText.visible = true;
				zero_analog.visible = true;
				one_analog.visible = true;
				two_analog.visible = true;
				three_analog.visible = true;
				modeSelect.visible = true;
				four.visible = true;
				seven.visible = true;
				two.visible = true;
				three.visible = true;
				five.visible = true;
				
				if (Number(myXML.board_version) >= 99 ) {  // only show for board 4 and above
					six.visible = true;
				}
				
				vidButton.visible = true;
				vidButton2.visible = true;
				stockButton.visible = true;				
				doorButton.visible = true;				
				Stock.visible = true;
				x10_label.visible = true;
				x10_off_button.visible = true;
				
				if (stand_alone!= "on") {
					x10_on_button.visible = true;
				}
				
				x10_bright_button.visible = true;
				version.visible = true;
				raw_distance.visible = true; 
				idle.visible = true; 
				SlideStartButton.visible = true;
				SlideStopButton.visible = true;
				tweet_button.visible = true;
				photobooth_Startbutton.visible = true;
	            photobooth_Stopbutton.visible = true;
				touch_counter_text.visible = true; 
				alcohol_sensor_text.visible = true; 
				tweet_text.visible = true; 
				x10_on_lights_button.visible = true;
				x10_off_lights_button.visible = true;
				vidButton.addEventListener(MouseEvent.CLICK, al); //don't turn on the event listeners for the buttons if verbose mode not on
				vidButton2.addEventListener(MouseEvent.CLICK, al2);
				stockButton.addEventListener(MouseEvent.CLICK, stock_button);
				doorButton.addEventListener(MouseEvent.CLICK, door_button);
				x10_off_button.addEventListener(MouseEvent.CLICK,x10off);
				x10_on_button.addEventListener(MouseEvent.CLICK,x10on); //really is a breathalyzer test
				x10_bright_button.addEventListener(MouseEvent.CLICK,x10bright);
				SlideStartButton.addEventListener(MouseEvent.CLICK,StartSlideShowButton);
				SlideStopButton.addEventListener(MouseEvent.CLICK,StopSlideShowButton);
				x10_on_lights_button.addEventListener(MouseEvent.CLICK,x10_on_lights_buttonEvent);
				x10_off_lights_button.addEventListener(MouseEvent.CLICK,x10_off_lights_buttonEvent);
			} //turn on verbose mode if yes in config file
									
			if (display_frame == "on") {
					frameLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,frameLoaded);
					//frameLoader.load(new URLRequest("images/frame.png"));		
					frameLoader.load(new URLRequest(frame_selected));	
			}
			
			if (alcohol_sensor == "on" && myXML.alcohol_display_value == "on") {				
				AlcoholReadingText.visible = true;	
			}
			
			// beer_image_Loader.contentLoaderInfo.addEventListener(Event.COMPLETE,beer_image_Loaded);
			// beer_image_Loader.load(new URLRequest("images/beer_icon.png"));		
				
			weather_zip = myXML.weather_zip; //sets zip code for the weather
			weather_woeid = myXML.weather_woeid; //sets zip code for the weather
			weather_reading = myXML.weather_reading;		
			good_weather_threshold = myXML.good_weather_threshold;			
			
			if (verbose == "no" && stand_alone == "off") {
				Mouse.hide();  //hide the mouse if in normal mode, otherwise show in verbose mode
			}
									
			if (weather_display == "yes") {
				Weather.visible = true;
			} 
			
			StartUpTextFormat.font = myFont.fontName;
			StartUpTextFormat.size = 30; 
			StartUpText.autoSize = TextFieldAutoSize.CENTER;		
			StartUpText.embedFonts = true;
			StartUpText.selectable = false;
			StartUpTextFormat.color = 0x00CC33; //green			
			StartUpText.antiAliasType = AntiAliasType.ADVANCED;	
			
			// screen mode values are: portrait90   portrait270 landscape0 landscape180
					
			StartUpText.visible = true;	
			StartUpText.defaultTextFormat = StartUpTextFormat;
			
			//********* End Startup Text *********************
			ErrorTextFormat.font = myFont.fontName;
			ErrorTextFormat.size = 20; 
			mirror_did_not_init_text.autoSize = TextFieldAutoSize.CENTER;		
			mirror_did_not_init_text.wordWrap = true;
			mirror_did_not_init_text.embedFonts = true;
			mirror_did_not_init_text.selectable = false;
			ErrorTextFormat.color = 0xFF0033; //red			
			mirror_did_not_init_text.antiAliasType = AntiAliasType.ADVANCED;	
			mirror_did_not_init_text.width = 400;
			mirror_did_not_init_text.height = 100;		
			mirror_did_not_init_text.visible = true;				
			mirror_did_not_init_text.defaultTextFormat = ErrorTextFormat;
			
			///**********Alcohol text ************************
			AlcoholTextFormat.font = myFont.fontName;
			AlcoholTextFormat.size = 110; 
			AlcoholText.autoSize = TextFieldAutoSize.CENTER;		
			AlcoholText.embedFonts = true;
			AlcoholText.selectable = false;
			AlcoholTextFormat.color = 0x00CC33; //green			
			AlcoholText.antiAliasType = AntiAliasType.ADVANCED;						
			AlcoholText.visible = true;	
			
			AlcoholResetCounterFormat.font = myFont.fontName;
			AlcoholResetCounterFormat.size = 30; 
			AlcoholResetCounter.autoSize = TextFieldAutoSize.CENTER;		
			AlcoholResetCounter.embedFonts = true;
			AlcoholResetCounter.selectable = false;
			AlcoholResetCounterFormat.color = 0xFF0033; //red			
			AlcoholResetCounter.antiAliasType = AntiAliasType.ADVANCED;						
			AlcoholResetCounter.visible = true;	
			
			
			//*** AlcoholResults is the text that's displayed from the Breathalyzer reading, few drinks, buzzed, you're drunk, etc. and its positioning settings from the XML
			AlcoholResultsFormat.font = myFont.fontName;
			AlcoholResultsFormat.size = myXML.alcohol_results_text_fontsize; //75 default
			//AlcoholResultsFormat.size = 75; 
			AlcoholResults.autoSize = TextFieldAutoSize.CENTER;		
			AlcoholResults.embedFonts = true;
			AlcoholResults.selectable = false;
			AlcoholResultsFormat.color = 0xFF0033; //red			
			AlcoholResults.antiAliasType = AntiAliasType.ADVANCED;						
			AlcoholResults.visible = true;	
			
			WarningMessageFormat.font = myFont.fontName;
			WarningMessageFormat.size = 20;
			WarningMessage.autoSize = TextFieldAutoSize.CENTER;		
			WarningMessage.embedFonts = true;
			WarningMessage.selectable = false;
			WarningMessageFormat.color = 0xFF0033; //red			
			WarningMessage.antiAliasType = AntiAliasType.ADVANCED;					
			WarningMessage.wordWrap = true;
			WarningMessage.width = 300;
            WarningMessage.height = 200;

			WarningMessage.visible = true;	
			
			WarningMessage.x = myXML.weather_text_x;   
			WarningMessage.y = myXML.weather_text_y;   
			WarningMessage.rotation = myXML.weather_text_rotation;
			
			AlcoholResults.x = myXML.alcohol_results_text_x;   
			AlcoholResults.y = myXML.alcohol_results_text_y;   
			AlcoholResults.rotation = myXML.alcohol_results_text_rotation;
			
			trace("screen mode is: " + screen_mode);
			
			if (screen_mode == "portrait90") {
				AlcoholResetCounter.x = 820;   
				AlcoholResetCounter.y = 350;   
				AlcoholResetCounter.rotation = 90; 	
				
				//AlcoholResults.x = 820;   
				//AlcoholResults.y = 350;   
				//AlcoholResults.rotation = 90; 	
				
				AlcoholText.x = 650;   
				AlcoholText.y = 350;   
				AlcoholText.rotation = 90; 					
				
				mirror_did_not_init_text.x = 580;   
				mirror_did_not_init_text.y = 200;   
				mirror_did_not_init_text.rotation = 90; 		
				StartUpText.x = 580;   
				StartUpText.y = 350;   
				StartUpText.rotation = 90; 			
				
				AlcoholReadingText.autoSize = TextFieldAutoSize.LEFT; //this is to display the alcohol sensor reading if parameter turned on
				AlcoholReadingText.defaultTextFormat = BreathTextFormat;
				AlcoholReadingText.embedFonts = true;
				//AlcoholReadingText.x = stock_text_x + 240;   
				AlcoholReadingText.x = stock_text_x + 80;    
				AlcoholReadingText.y = int(myXML.alcohol_results_text_y) + 120; 		
				AlcoholReadingText.selectable = false;
				AlcoholReadingText.rotation = stock_text_rotation; //0 default for landscape
				AlcoholReadingText.antiAliasType = AntiAliasType.ADVANCED;		
				addChild(AlcoholReadingText);
				AlcoholReadingText.text = "100";
				AlcoholReadingText.visible = false;	
			}
			
			if (screen_mode == "landscape0") {
				AlcoholResetCounter.x = 500;  
				AlcoholResetCounter.y = 100;    
				AlcoholResetCounter.rotation = 0; 
				
				//AlcoholResults.x = 500;  
				//AlcoholResults.y = 100;    
				//AlcoholResults.rotation = 0; 
				
				AlcoholText.x = 480;   //500 default for landscape
				AlcoholText.y = 350;    //120 default for landscape
				AlcoholText.rotation = 0; //0 default for landscape
				
				mirror_did_not_init_text.x = 300;   //500 default for landscape
				mirror_did_not_init_text.y = 230;    //120 default for landscape
				mirror_did_not_init_text.rotation = 0; //0 default for landscape
				StartUpText.x = 480;   //500 default for landscape
				StartUpText.y = 350;    //120 default for landscape
				StartUpText.rotation = 0; //0 default for landscape
				
				AlcoholReadingText.autoSize = TextFieldAutoSize.LEFT; //this is to display the alcohol sensor reading if parameter turned on
				AlcoholReadingText.defaultTextFormat = BreathTextFormat;
				AlcoholReadingText.embedFonts = true;
				//AlcoholReadingText.x = stock_text_x + 240;   
				AlcoholReadingText.x = stock_text_x + 60;    
				AlcoholReadingText.y = int(myXML.alcohol_results_text_y) + 60; 		
				AlcoholReadingText.selectable = false;
				AlcoholReadingText.rotation = stock_text_rotation; //0 default for landscape
				AlcoholReadingText.antiAliasType = AntiAliasType.ADVANCED;		
				addChild(AlcoholReadingText);
				AlcoholReadingText.text = "100";
				AlcoholReadingText.visible = false;
				trace("went here to landscape0");
			}
			
			if (screen_mode == "landscape180") {
				AlcoholResetCounter.x = 630;  
				AlcoholResetCounter.y = 550;    
				AlcoholResetCounter.rotation = 180; 
				
				//AlcoholResults.x = 630;  
				//AlcoholResults.y = 550;    
				//AlcoholResults.rotation = 180; 
				
				AlcoholText.x = 580;   //500 default for landscape
				AlcoholText.y = 400;    //120 default for landscape
				AlcoholText.rotation = 180; //0 default for landscape
				
				mirror_did_not_init_text.x = 680;   
				mirror_did_not_init_text.y = 450;   
				mirror_did_not_init_text.rotation = 180; 		
				StartUpText.x = 580;   
				StartUpText.y = 350;   
				StartUpText.rotation = 180; 			
			}
			
			if (screen_mode == "portrait270") {
				AlcoholResetCounter.x = 300;  
				AlcoholResetCounter.y = 370;    
				AlcoholResetCounter.rotation = 270; 
				
				//AlcoholResults.x = 300;  
				//AlcoholResults.y = 370;    
				//AlcoholResults.rotation = 270; 
				
				AlcoholText.x = 480;   //500 default for landscape
				AlcoholText.y = 450;    //120 default for landscape
				AlcoholText.rotation = 270; //0 default for landscape
				
				mirror_did_not_init_text.x = 400;   
				mirror_did_not_init_text.y = 500;   
				mirror_did_not_init_text.rotation = 270; 		
				StartUpText.x = 500;   
				StartUpText.y = 350;   
				StartUpText.rotation = 270; 	
				
				AlcoholReadingText.autoSize = TextFieldAutoSize.LEFT; //this is to display the alcohol sensor reading if parameter turned on
				AlcoholReadingText.defaultTextFormat = BreathTextFormat;
				AlcoholReadingText.embedFonts = true;
				//AlcoholReadingText.x = stock_text_x + 240;   
				AlcoholReadingText.x = stock_text_x + 20;    
				AlcoholReadingText.y = int(myXML.alcohol_results_text_y) + 120; 		
				AlcoholReadingText.selectable = false;
				AlcoholReadingText.rotation = stock_text_rotation; //0 default for landscape
				AlcoholReadingText.antiAliasType = AntiAliasType.ADVANCED;		
				addChild(AlcoholReadingText);
				AlcoholReadingText.text = "100";
				AlcoholReadingText.visible = false;	
			}
					
			addChild(mirror_did_not_init_text);
			mirror_did_not_init_text.visible = false;
			
			addChild(StartUpText);
			StartUpText.text = "Just a moment, starting up...";
			
			AlcoholText.defaultTextFormat = AlcoholTextFormat;
			addChild(AlcoholText);
			AlcoholText.visible = false;
			
			AlcoholResetCounter.defaultTextFormat = AlcoholResetCounterFormat;
			addChild(AlcoholResetCounter);
			AlcoholResetCounter.visible = false;
			
			AlcoholResults.defaultTextFormat = AlcoholResultsFormat;
			addChild(AlcoholResults);
			AlcoholResults.visible = false;
			
			WarningMessage.defaultTextFormat = WarningMessageFormat;
			addChild(WarningMessage);
			WarningMessage.visible = false;
			///**************************************************
			////*** this we only have to do once since the stocks cannot be dynamically changed after the program has started
			var stockArray:Array = new Array();
			var i:int = 0;
			for each (var item:XML in myXML.stocks.symbol)
					{
						stockArray.push(myXML.stocks.symbol[i]);
						i++;
					}
			num_stocks = stockArray.length;
			//stock_string = stockArray.join("+");  //changed to , for the new stock API from https://iextrading.com/
			stock_string = stockArray.join(",");
			trace (stock_string);						
			////*****************************************************************
			stockLoader = new URLLoader();
			//stockLoader.load(new URLRequest("http://download.finance.yahoo.com/d/quotes.csv?s=" + stock_string + "&f=c1&e=.csv"));
			//stockLoader.addEventListener(Event.COMPLETE, stockLoaded);	
			stockLoader.addEventListener(Event.COMPLETE, stockLoadediextrading);	
			WeatherLoader = new URLLoader();
		    //WeatherLoader.load(new URLRequest("http://weather.yahooapis.com/forecastrss?p=" + weather_zip + "&u=" + weather_reading));
			WeatherLoader.addEventListener(Event.COMPLETE, WeatherXMLLoaded);								
			pictLdr.contentLoaderInfo.addEventListener(Event.COMPLETE,imgLoaded);
			
			
			///****** if running in stand alone mode
		    if (stand_alone == "on") {
				weather_images_loader_no_arduino.contentLoaderInfo.addEventListener(Event.COMPLETE,weather_image_no_arduino_event);
				weather_images_loader_no_arduino.load(new URLRequest("images/weather_icon.png"));
				addChild(weather_images_loader_no_arduino);
				
				stock_images_loader_no_arduino.contentLoaderInfo.addEventListener(Event.COMPLETE,stock_image_no_arduino_event);
				stock_images_loader_no_arduino.load(new URLRequest("images/money_icon.png"));
				addChild(stock_images_loader_no_arduino);
			}
			
			//io/network event handlers in case a problem loading URL *****
			stockLoader.addEventListener(IOErrorEvent.IO_ERROR, stockLoaderioErrorHandler);			
			WeatherLoader.addEventListener(IOErrorEvent.IO_ERROR, WeatherLoaderioErrorHandler);
			pictLdr.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, pictLdrioErrorHandler);			
			//*************************************************************
		
		
			if (myXML.lipsync_feature == "on") {
				lip1.load(lip1_request);		
				lip1.contentLoaderInfo.addEventListener(Event.COMPLETE, lip1Loaded);
				lip2.load(lip2_request);		
				lip2.contentLoaderInfo.addEventListener(Event.COMPLETE, lip2Loaded);	
				lip3.load(lip3_request);		
				lip3.contentLoaderInfo.addEventListener(Event.COMPLETE, lip3Loaded);	
				lip4.load(lip4_request);		
				lip4.contentLoaderInfo.addEventListener(Event.COMPLETE, lip4Loaded);	
				lip5.load(lip5_request);		
				lip5.contentLoaderInfo.addEventListener(Event.COMPLETE, lip5Loaded);
				lip6.load(lip6_request);		
				lip6.contentLoaderInfo.addEventListener(Event.COMPLETE, lip6Loaded);	
				lip7.load(lip7_request);		
				lip7.contentLoaderInfo.addEventListener(Event.COMPLETE, lip7Loaded);
				lip8.load(lip8_request);		
				lip8.contentLoaderInfo.addEventListener(Event.COMPLETE, lip8Loaded);
				lip9.load(lip9_request);		
				lip9.contentLoaderInfo.addEventListener(Event.COMPLETE, lip9Loaded);	
				lip10.load(lip10_request);		
				lip10.contentLoaderInfo.addEventListener(Event.COMPLETE, lip10Loaded);	
			}
			
			//lip1.visible = true;
			
		TwitterBird.load(TwitterBirdRequest);		
		TwitterBird.contentLoaderInfo.addEventListener(Event.COMPLETE, TwitterBirdLoaded);	
		
		////***** setup the text readout displays ***********************
		StockTextFormat.font = myFont.fontName;
		StockTextFormat.size = stock_text_fontsize;  //70 default
		// we set the font color down in the stock function depending on how the stock did for the day
		
		BreathTextFormat.font = myFont.fontName;
		BreathTextFormat.size = stock_text_fontsize;  //70 default
		BreathTextFormat.color = 0xFF0033;
		
		stock_display.autoSize = TextFieldAutoSize.LEFT;
		stock_display.defaultTextFormat = StockTextFormat;
		stock_display.embedFonts = true;
		stock_display.x = stock_text_x;    //620 default for landscape
		stock_display.y = stock_text_y;    //120 default for landscape
		stock_display.selectable = false;
		stock_display.rotation = stock_text_rotation; //0 default for landscape
		stock_display.antiAliasType = AntiAliasType.ADVANCED;		
		addChild(stock_display);
		stock_display.visible = false;	
		
		//AlcoholReadingText.autoSize = TextFieldAutoSize.LEFT; //this is to display the alcohol sensor reading if parameter turned on
		//AlcoholReadingText.defaultTextFormat = StockTextFormat;
		//AlcoholReadingText.embedFonts = true;
		//AlcoholReadingText.x = stock_text_x;    //620 default for landscape
		//AlcoholReadingText.y = stock_text_y;    //120 default for landscape
		//AlcoholReadingText.selectable = false;
		//AlcoholReadingText.rotation = stock_text_rotation; //0 default for landscape
		//AlcoholReadingText.antiAliasType = AntiAliasType.ADVANCED;		
		//addChild(AlcoholReadingText);
		//AlcoholReadingText.text = "100";
		//AlcoholReadingText.visible = false;	
				
		WeatherTextFormat.font = myFont.fontName;
		WeatherTextFormat.size = weather_text_fontsize; //30 default
		// we set the font color down in the stock function depending on how the stock did for the day
		weather_display2.autoSize = TextFieldAutoSize.CENTER;		
		weather_display2.embedFonts = true;
		weather_display2.x = weather_text_x;   //500 default for landscape
		weather_display2.y = weather_text_y;    //120 default for landscape
		weather_display2.selectable = false;
		WeatherTextFormat.color = 0xF5F5F5; //white
		weather_display2.rotation = weather_text_rotation; //0 default for landscape
		weather_display2.antiAliasType = AntiAliasType.ADVANCED;		
		weather_display2.defaultTextFormat = WeatherTextFormat;
		addChild(weather_display2);
		weather_display2.visible = false;
		
		if (verbose == "yes" && proximity_sensor_on =="on") {  //show the proximity sensor in big font so people can see it while installing
			ProximityTextFormat.font = myFont.fontName;
			ProximityTextFormat.size = 70; 
			proximity_readout.autoSize = TextFieldAutoSize.CENTER;		
			proximity_readout.embedFonts = true;
			ProximityTextFormat.color = 0x00CC33; //green			
			proximity_readout.antiAliasType = AntiAliasType.ADVANCED;					
			proximity_readout.visible = true;			
			if (screen_mode == "landscape0") {  //landscape
				proximity_readout.x = 620;   
				proximity_readout.y = 180;   
				proximity_readout.rotation = 0; 
			}
			else {
				proximity_readout.x = 780;   //500 default for landscape
				proximity_readout.y = 380;    //120 default for landscape
				proximity_readout.rotation = 90; //0 default for landscape
			}
			proximity_readout.defaultTextFormat = ProximityTextFormat;
			addChild(proximity_readout);
		}
				
		
		////*******************************************************	
		
		if (doorcam_on == "on") {
			addChildAt(myVid2,0);
			myVid2.visible = false;		
			myVid2.rotation = video_rotation;
			myVid2.setScale(doorcam_video_scale,doorcam_video_scale);
			myVid2.x = doorcam_video_x;	
			myVid2.y = doorcam_video_y;
			myVid2.autoPlay = false;
			myVid2.addEventListener(Event.COMPLETE, onClipDone);  // call the idle loop when a clip has finished playing
		}
		
		if (myXML.no_resize == "on") {
		     myVid.scaleMode = "exactFit";
			 myVid.width = 1024;
			 myVid.height = 768;
			 myVid.x = (stage.stageWidth - myVid.width) / 2;
			 myVid.y = (stage.stageHeight - myVid.height) / 2;
		}
		else {
			myVid.rotation = video_rotation;
			myVid.setScale(video_scaling_factor,video_scaling_factor);
			myVid.x = x_position;	
			myVid.y = y_position;
		}
		
		addChildAt(myVid,1);
	    myVid.visible = true;	
		
        ////******* scale and position the picture frame mode **********
		pic.rotation = picture_rotation;
		pic.scaleX = picture_scale;
		pic.scaleY = picture_scale;				
		pic.x = picture_x_position;		
		pic.y = picture_y_position;
		addChildAt(pic,2);
		pic.visible = false;
		
		////************************************************************		
		myVid.addEventListener(MetadataEvent.CUE_POINT , NavigationCuePoints);
		myVid.addEventListener(Event.COMPLETE, onClipDone);  // call the idle loop when a clip has finished playing
		//myVid.addEventListener(VideoEvent.SEEKED, onSeekedEvent); // Listen for seeked event
		myVid.addEventListener(fl.video.VideoEvent.SEEKED, onSeekedEvent);
		 
		 
		 
		 

		x10_label.text = String("x10 Command");
		ArduinoFound.text = String("Arduino Not Found! Check to see if serial proxy is running.");
		
		if (myXML.stand_alone == "on") {
				StandAloneModeWarningMsg(); //show the warning message to the user that the software is in stand alone mode and therefore will not recognize the sensor hub				
		}
		
		//***** set variables *****************
       
			if (video_resolution == "high") {	
		   
				idle_clipp =   		 myXML.princess[0];  
				idle_dup_clipp =	 myXML.princess[0];  
				proximity1_clipp = 	 myXML.princess[1];
				proximity2_clipp =    myXML.princess[2];
				touch1_clipp =        myXML.princess[3];
				weather_good_clipp =  myXML.princess[4];
				weather_ok_clipp =    myXML.princess[5];
				weather_rain_clipp =  myXML.princess[6];
				no_internet_clipp =  myXML.princess[7];
				stock_up_clipp = 	 myXML.princess[8];
				stock_no_change_clipp=  myXML.princess[9];
				stock_down_clipp =    myXML.princess[10];
				doorbell_clipp =      myXML.princess[11];
				phone_clipp = 		 myXML.princess[12];
				video1_clipp = 		 myXML.princess[13];
				video2_clipp = 		 myXML.princess[14];
				video3_clipp = 		 myXML.princess[15];
				video4_clipp = 		 myXML.princess[16];
				proximity3_clipp =    myXML.princess[17];	
	 			x10_on_clipp = 		 myXML.princess[18];	
				x10_off_clipp = 	 myXML.princess[19];	
				drink1_clipp =  	myXML.princess[20];	 	
	  			drink2_clipp =  	myXML.princess[21];		
	  			drink3_clipp =  	myXML.princess[22];		
	  			drink4_clipp =  	myXML.princess[23];		
				quizloop_clipp =  	 myXML.princess[24];		
				
				idle_cliph =   		 myXML.halloween[0];  
				idle_dup_cliph =   	 myXML.halloween[0]; 
				proximity1_cliph = 	 myXML.halloween[1];
				proximity2_cliph =    myXML.halloween[2];
				touch1_cliph =        myXML.halloween[3];
				weather_good_cliph =  myXML.halloween[4];
				weather_ok_cliph =    myXML.halloween[5];
				weather_rain_cliph =  myXML.halloween[6];
				no_internet_cliph =  myXML.halloween[7];
				stock_up_cliph = 	 myXML.halloween[8];
				stock_no_change_cliph =  myXML.halloween[9];
				stock_down_cliph =    myXML.halloween[10];
				doorbell_cliph =     myXML.halloween[11];
				phone_cliph = 		 myXML.halloween[12];
				video1_cliph = 		 myXML.halloween[13];
				video2_cliph = 		 myXML.halloween[14];
				video3_cliph = 		 myXML.halloween[15];
				video4_cliph = 		 myXML.halloween[16];				
				proximity3_cliph =   myXML.halloween[17];	
	 			x10_on_cliph = 		 myXML.halloween[18];	
				x10_off_cliph = 	 myXML.halloween[19];	
				drink1_cliph =  	myXML.halloween[20];		
	  			drink2_cliph =  	myXML.halloween[21];		
	  			drink3_cliph =  	myXML.halloween[22];		
	  			drink4_cliph =  	myXML.halloween[23];	
				quizloop_cliph =  	myXML.halloween[24];	
				
				idle_clippi =   	 myXML.pirate[0];  
				idle_dup_clippi =  	 myXML.pirate[0];  
				proximity1_clippi =  myXML.pirate[1];
				proximity2_clippi =    myXML.pirate[2];
				touch1_clippi =        myXML.pirate[3];
				weather_good_clippi =  myXML.pirate[4];
				weather_ok_clippi =    myXML.pirate[5];
				weather_rain_clippi =  myXML.pirate[6];
				no_internet_clippi = 	 myXML.pirate[7];
				stock_up_clippi = 		 myXML.pirate[8];
				stock_no_change_clippi=  myXML.pirate[9];
				stock_down_clippi =    myXML.pirate[10];
				doorbell_clippi =      myXML.pirate[11];
				phone_clippi = 			 myXML.pirate[12];
				video1_clippi = 		 myXML.pirate[13];
				video2_clippi = 		 myXML.pirate[14];
				video3_clippi = 		 myXML.pirate[15];
				video4_clippi = 		 myXML.pirate[16];								
				proximity3_clippi =  	 myXML.pirate[17];	
	 			x10_on_clippi = 		 myXML.pirate[18];	
				x10_off_clippi = 		 myXML.pirate[19];	
				drink1_clippi =  		myXML.pirate[20];		
	  			drink2_clippi =  		myXML.pirate[21];		
	  			drink3_clippi =  		myXML.pirate[22];		
	  			drink4_clippi =  		myXML.pirate[23];	
				quizloop_clippi =  		myXML.pirate[24];	
				
				idle_clipi =   		 myXML.insult[0];  
				idle_dup_clipi =  	 myXML.insult[0];  
				proximity1_clipi = 	 myXML.insult[1];
				proximity2_clipi =   myXML.insult[2];
				touch1_clipi =       myXML.insult[3];
				weather_good_clipi = myXML.insult[4];
				weather_ok_clipi =   myXML.insult[5];
				weather_rain_clipi = myXML.insult[6];
				no_internet_clipi =  myXML.insult[7];
				stock_up_clipi = 	 myXML.insult[8];
				stock_no_change_clipi= myXML.insult[9];
				stock_down_clipi =  myXML.insult[10];
				doorbell_clipi =    myXML.insult[11];
				phone_clipi = 		myXML.insult[12];
				video1_clipi = 		myXML.insult[13];
				video2_clipi = 		myXML.insult[14];
				video3_clipi = 		myXML.insult[15];
				video4_clipi = 		myXML.insult[16];								
				proximity3_clipi = 	myXML.insult[17];	
	 			x10_on_clipi = 		myXML.insult[18];	
				x10_off_clipi = 	myXML.insult[19];	
				drink1_clipi =  	myXML.insult[20];		
	  			drink2_clipi =  	myXML.insult[21];		
	  			drink3_clipi =  	myXML.insult[22];		
	  			drink4_clipi =  	myXML.insult[23];	
				quizloop_clipi =	  myXML.insult[24];
				
				idle_cliptts =   	 myXML.tts[0];  
				idle_dup_cliptts =   myXML.tts[0];  
				proximity1_cliptts = myXML.tts[1];
				proximity2_cliptts =   myXML.tts[2];
				touch1_cliptts =       myXML.tts[3];
				weather_good_cliptts = myXML.tts[4];
				weather_ok_cliptts =   myXML.tts[5];
				weather_rain_cliptts = myXML.tts[6];
				no_internet_cliptts =  myXML.tts[7];
				stock_up_cliptts = 	 	myXML.tts[8];
				stock_no_change_cliptts= myXML.tts[9];
				stock_down_cliptts =  myXML.tts[10];
				doorbell_cliptts =    myXML.tts[11];
				phone_cliptts = 	myXML.tts[12];
				video1_cliptts = 		myXML.tts[13];
				video2_cliptts = 		myXML.tts[14];
				video3_cliptts = 		myXML.tts[15];
				video4_cliptts = 		myXML.tts[16];								
				proximity3_cliptts = 	myXML.tts[17];	
				x10_on_cliptts = 		myXML.tts[18];	
				x10_off_cliptts = 	myXML.tts[19];	
				drink1_cliptts =  	myXML.tts[20];		
				drink2_cliptts =  	myXML.tts[21];		
				drink3_cliptts =  	myXML.tts[22];		
				drink4_cliptts =  	myXML.tts[23];	
				quizloop_cliptts =  myXML.tts[24];
				
				lipsync_clip =  	myXML.lipsync_clip;	
				
				
	   	}
	   else { //get the lower res videos instead
	   			idle_clipp =  myXML.princess[0].substr(0,myXML.princess[0].lastIndexOf('.')) + "l" + myXML.princess[0].substr(-4);   
				idle_dup_clipp =  myXML.princess[0].substr(0,myXML.princess[0].lastIndexOf('.')) + "l" + myXML.princess[0].substr(-4);; 
				proximity1_clipp = 	 myXML.princess[1].substr(0,myXML.princess[1].lastIndexOf('.')) + "l" + myXML.princess[1].substr(-4);
				proximity2_clipp =    myXML.princess[2].substr(0,myXML.princess[2].lastIndexOf('.')) + "l" + myXML.princess[2].substr(-4);
				touch1_clipp =        myXML.princess[3].substr(0,myXML.princess[3].lastIndexOf('.')) + "l" + myXML.princess[3].substr(-4);
				weather_good_clipp =  myXML.princess[4].substr(0,myXML.princess[4].lastIndexOf('.')) + "l" + myXML.princess[4].substr(-4);
				weather_ok_clipp =    myXML.princess[5].substr(0,myXML.princess[5].lastIndexOf('.')) + "l" + myXML.princess[5].substr(-4);
				weather_rain_clipp =  myXML.princess[6].substr(0,myXML.princess[6].lastIndexOf('.')) + "l" + myXML.princess[6].substr(-4);
				no_internet_clipp =  myXML.princess[7].substr(0,myXML.princess[7].lastIndexOf('.')) + "l" + myXML.princess[7].substr(-4);
				stock_up_clipp = 	 myXML.princess[8].substr(0,myXML.princess[8].lastIndexOf('.')) + "l" + myXML.princess[8].substr(-4);
				stock_no_change_clipp =  myXML.princess[9].substr(0,myXML.princess[9].lastIndexOf('.')) + "l" + myXML.princess[9].substr(-4);
				stock_down_clipp =    myXML.princess[10].substr(0,myXML.princess[10].lastIndexOf('.')) + "l" + myXML.princess[10].substr(-4);
				doorbell_clipp =      myXML.princess[11].substr(0,myXML.princess[11].lastIndexOf('.')) + "l" + myXML.princess[11].substr(-4);
				phone_clipp = 		 myXML.princess[12].substr(0,myXML.princess[12].lastIndexOf('.')) + "l" + myXML.princess[12].substr(-4);
				video1_clipp = 		 myXML.princess[13].substr(0,myXML.princess[13].lastIndexOf('.')) + "l" + myXML.princess[13].substr(-4);
				video2_clipp = 		 myXML.princess[14].substr(0,myXML.princess[14].lastIndexOf('.')) + "l" + myXML.princess[14].substr(-4);
				video3_clipp = 		 myXML.princess[15].substr(0,myXML.princess[15].lastIndexOf('.')) + "l" + myXML.princess[15].substr(-4);
				video4_clipp = 		 myXML.princess[16].substr(0,myXML.princess[16].lastIndexOf('.')) + "l" + myXML.princess[16].substr(-4);
				proximity3_clipp =   myXML.princess[17].substr(0,myXML.princess[17].lastIndexOf('.')) + "l" + myXML.princess[17].substr(-4);
	 			x10_on_clipp = 		 myXML.princess[18].substr(0,myXML.princess[18].lastIndexOf('.')) + "l" + myXML.princess[18].substr(-4);
				x10_off_clipp = 	 myXML.princess[19].substr(0,myXML.princess[19].lastIndexOf('.')) + "l" + myXML.princess[19].substr(-4);
				drink1_clipp = 		 myXML.princess[20].substr(0,myXML.princess[20].lastIndexOf('.')) + "l" + myXML.princess[20].substr(-4);
				drink2_clipp =  	 myXML.princess[21].substr(0,myXML.princess[21].lastIndexOf('.')) + "l" + myXML.princess[21].substr(-4);
	 			drink3_clipp = 		 myXML.princess[22].substr(0,myXML.princess[22].lastIndexOf('.')) + "l" + myXML.princess[22].substr(-4);
				drink4_clipp = 	 	 myXML.princess[23].substr(0,myXML.princess[23].lastIndexOf('.')) + "l" + myXML.princess[23].substr(-4);
				quizloop_clipp = 	 myXML.princess[24].substr(0,myXML.princess[24].lastIndexOf('.')) + "l" + myXML.princess[24].substr(-4);
				
				idle_cliph =  myXML.halloween[0].substr(0,myXML.halloween[0].lastIndexOf('.')) + "l" + myXML.halloween[0].substr(-4);   
				idle_dup_cliph =  myXML.halloween[0].substr(0,myXML.halloween[0].lastIndexOf('.')) + "l" + myXML.halloween[0].substr(-4);; 
				proximity1_cliph = 	 myXML.halloween[1].substr(0,myXML.halloween[1].lastIndexOf('.')) + "l" + myXML.halloween[1].substr(-4);
				proximity2_cliph =    myXML.halloween[2].substr(0,myXML.halloween[2].lastIndexOf('.')) + "l" + myXML.halloween[2].substr(-4);
				touch1_cliph =        myXML.halloween[3].substr(0,myXML.halloween[3].lastIndexOf('.')) + "l" + myXML.halloween[3].substr(-4);
				weather_good_cliph =  myXML.halloween[4].substr(0,myXML.halloween[4].lastIndexOf('.')) + "l" + myXML.halloween[4].substr(-4);
				weather_ok_cliph =    myXML.halloween[5].substr(0,myXML.halloween[5].lastIndexOf('.')) + "l" + myXML.halloween[5].substr(-4);
				weather_rain_cliph =  myXML.halloween[6].substr(0,myXML.halloween[6].lastIndexOf('.')) + "l" + myXML.halloween[6].substr(-4);
				no_internet_cliph =  myXML.halloween[7].substr(0,myXML.halloween[7].lastIndexOf('.')) + "l" + myXML.halloween[7].substr(-4);
				stock_up_cliph = 	 myXML.halloween[8].substr(0,myXML.halloween[8].lastIndexOf('.')) + "l" + myXML.halloween[8].substr(-4);
				stock_no_change_cliph =  myXML.halloween[9].substr(0,myXML.halloween[9].lastIndexOf('.')) + "l" + myXML.halloween[9].substr(-4);
				stock_down_cliph =    myXML.halloween[10].substr(0,myXML.halloween[10].lastIndexOf('.')) + "l" + myXML.halloween[10].substr(-4);
				doorbell_cliph =      myXML.halloween[11].substr(0,myXML.halloween[11].lastIndexOf('.')) + "l" + myXML.halloween[11].substr(-4);
				phone_cliph = 		 myXML.halloween[12].substr(0,myXML.halloween[12].lastIndexOf('.')) + "l" + myXML.halloween[12].substr(-4);
				video1_cliph = 		 myXML.halloween[13].substr(0,myXML.halloween[13].lastIndexOf('.')) + "l" + myXML.halloween[13].substr(-4);
				video2_cliph = 		 myXML.halloween[14].substr(0,myXML.halloween[14].lastIndexOf('.')) + "l" + myXML.halloween[14].substr(-4);
				video3_cliph = 		 myXML.halloween[15].substr(0,myXML.halloween[15].lastIndexOf('.')) + "l" + myXML.halloween[15].substr(-4);
				video4_cliph = 		 myXML.halloween[16].substr(0,myXML.halloween[16].lastIndexOf('.')) + "l" + myXML.halloween[16].substr(-4);
				proximity3_cliph =   myXML.halloween[17].substr(0,myXML.halloween[17].lastIndexOf('.')) + "l" + myXML.halloween[17].substr(-4);
	 			x10_on_cliph = 		 myXML.halloween[18].substr(0,myXML.halloween[18].lastIndexOf('.')) + "l" + myXML.halloween[18].substr(-4);
				x10_off_cliph = 	 myXML.halloween[19].substr(0,myXML.halloween[19].lastIndexOf('.')) + "l" + myXML.halloween[19].substr(-4);
				drink1_cliph = 		 myXML.halloween[20].substr(0,myXML.halloween[20].lastIndexOf('.')) + "l" + myXML.halloween[20].substr(-4);
				drink2_cliph =  	 myXML.halloween[21].substr(0,myXML.halloween[21].lastIndexOf('.')) + "l" + myXML.halloween[21].substr(-4);
	 			drink3_cliph = 		 myXML.halloween[22].substr(0,myXML.halloween[22].lastIndexOf('.')) + "l" + myXML.halloween[22].substr(-4);
				drink4_cliph = 	 	 myXML.halloween[23].substr(0,myXML.halloween[23].lastIndexOf('.')) + "l" + myXML.halloween[23].substr(-4);
				quizloop_cliph = 	 myXML.halloween[24].substr(0,myXML.halloween[24].lastIndexOf('.')) + "l" + myXML.halloween[24].substr(-4);
				
				
				idle_clippi =  myXML.pirate[0].substr(0,myXML.pirate[0].lastIndexOf('.')) + "l" + myXML.pirate[0].substr(-4);   
				idle_dup_clippi =  myXML.pirate[0].substr(0,myXML.pirate[0].lastIndexOf('.')) + "l" + myXML.pirate[0].substr(-4);; 
				proximity1_clippi = 	 myXML.pirate[1].substr(0,myXML.pirate[1].lastIndexOf('.')) + "l" + myXML.pirate[1].substr(-4);
				proximity2_clippi =    myXML.pirate[2].substr(0,myXML.pirate[2].lastIndexOf('.')) + "l" + myXML.pirate[2].substr(-4);
				touch1_clippi =        myXML.pirate[3].substr(0,myXML.pirate[3].lastIndexOf('.')) + "l" + myXML.pirate[3].substr(-4);
				weather_good_clippi =  myXML.pirate[4].substr(0,myXML.pirate[4].lastIndexOf('.')) + "l" + myXML.pirate[4].substr(-4);
				weather_ok_clippi =    myXML.pirate[5].substr(0,myXML.pirate[5].lastIndexOf('.')) + "l" + myXML.pirate[5].substr(-4);
				weather_rain_clippi =  myXML.pirate[6].substr(0,myXML.pirate[6].lastIndexOf('.')) + "l" + myXML.pirate[6].substr(-4);
				no_internet_clippi =  myXML.pirate[7].substr(0,myXML.pirate[7].lastIndexOf('.')) + "l" + myXML.pirate[7].substr(-4);
				stock_up_clippi = 	 myXML.pirate[8].substr(0,myXML.pirate[8].lastIndexOf('.')) + "l" + myXML.pirate[8].substr(-4);
				stock_no_change_clippi =  myXML.pirate[9].substr(0,myXML.pirate[9].lastIndexOf('.')) + "l" + myXML.pirate[9].substr(-4);
				stock_down_clippi =    myXML.pirate[10].substr(0,myXML.pirate[10].lastIndexOf('.')) + "l" + myXML.pirate[10].substr(-4);
				doorbell_clippi =      myXML.pirate[11].substr(0,myXML.pirate[11].lastIndexOf('.')) + "l" + myXML.pirate[11].substr(-4);
				phone_clippi = 		 myXML.pirate[12].substr(0,myXML.pirate[12].lastIndexOf('.')) + "l" + myXML.pirate[12].substr(-4);
				video1_clippi = 		 myXML.pirate[13].substr(0,myXML.pirate[13].lastIndexOf('.')) + "l" + myXML.pirate[13].substr(-4);
				video2_clippi = 		 myXML.pirate[14].substr(0,myXML.pirate[14].lastIndexOf('.')) + "l" + myXML.pirate[14].substr(-4);
				video3_clippi = 		 myXML.pirate[15].substr(0,myXML.pirate[15].lastIndexOf('.')) + "l" + myXML.pirate[15].substr(-4);
				video4_clippi = 		 myXML.pirate[16].substr(0,myXML.pirate[16].lastIndexOf('.')) + "l" + myXML.pirate[16].substr(-4);
				proximity3_clippi =   myXML.pirate[17].substr(0,myXML.pirate[17].lastIndexOf('.')) + "l" + myXML.pirate[17].substr(-4);
	 			x10_on_clippi = 		 myXML.pirate[18].substr(0,myXML.pirate[18].lastIndexOf('.')) + "l" + myXML.pirate[18].substr(-4);
				x10_off_clippi = 	 myXML.pirate[19].substr(0,myXML.pirate[19].lastIndexOf('.')) + "l" + myXML.pirate[19].substr(-4);
				drink1_clippi = 		 myXML.pirate[20].substr(0,myXML.pirate[20].lastIndexOf('.')) + "l" + myXML.pirate[20].substr(-4);
				drink2_clippi =  	 myXML.pirate[21].substr(0,myXML.pirate[21].lastIndexOf('.')) + "l" + myXML.pirate[21].substr(-4);
	 			drink3_clippi = 		 myXML.pirate[22].substr(0,myXML.pirate[22].lastIndexOf('.')) + "l" + myXML.pirate[22].substr(-4);
				drink4_clippi = 	 	 myXML.pirate[23].substr(0,myXML.pirate[23].lastIndexOf('.')) + "l" + myXML.pirate[23].substr(-4);
				quizloop_clippi = 	 	 myXML.pirate[24].substr(0,myXML.pirate[24].lastIndexOf('.')) + "l" + myXML.pirate[24].substr(-4);
				
				idle_clipi =  myXML.insult[0].substr(0,myXML.insult[0].lastIndexOf('.')) + "l" + myXML.insult[0].substr(-4);   
				idle_dup_clipi =  myXML.insult[0].substr(0,myXML.insult[0].lastIndexOf('.')) + "l" + myXML.insult[0].substr(-4);; 
				proximity1_clipi = 	 myXML.insult[1].substr(0,myXML.insult[1].lastIndexOf('.')) + "l" + myXML.insult[1].substr(-4);
				proximity2_clipi =    myXML.insult[2].substr(0,myXML.insult[2].lastIndexOf('.')) + "l" + myXML.insult[2].substr(-4);
				touch1_clipi =        myXML.insult[3].substr(0,myXML.insult[3].lastIndexOf('.')) + "l" + myXML.insult[3].substr(-4);
				weather_good_clipi =  myXML.insult[4].substr(0,myXML.insult[4].lastIndexOf('.')) + "l" + myXML.insult[4].substr(-4);
				weather_ok_clipi =    myXML.insult[5].substr(0,myXML.insult[5].lastIndexOf('.')) + "l" + myXML.insult[5].substr(-4);
				weather_rain_clipi =  myXML.insult[6].substr(0,myXML.insult[6].lastIndexOf('.')) + "l" + myXML.insult[6].substr(-4);
				no_internet_clipi =  myXML.insult[7].substr(0,myXML.insult[7].lastIndexOf('.')) + "l" + myXML.insult[7].substr(-4);
				stock_up_clipi = 	 myXML.insult[8].substr(0,myXML.insult[8].lastIndexOf('.')) + "l" + myXML.insult[8].substr(-4);
				stock_no_change_clipi =  myXML.insult[9].substr(0,myXML.insult[9].lastIndexOf('.')) + "l" + myXML.insult[9].substr(-4);
				stock_down_clipi =    myXML.insult[10].substr(0,myXML.insult[10].lastIndexOf('.')) + "l" + myXML.insult[10].substr(-4);
				doorbell_clipi =      myXML.insult[11].substr(0,myXML.insult[11].lastIndexOf('.')) + "l" + myXML.insult[11].substr(-4);
				phone_clipi = 		 myXML.insult[12].substr(0,myXML.insult[12].lastIndexOf('.')) + "l" + myXML.insult[12].substr(-4);
				video1_clipi = 		 myXML.insult[13].substr(0,myXML.insult[13].lastIndexOf('.')) + "l" + myXML.insult[13].substr(-4);
				video2_clipi = 		 myXML.insult[14].substr(0,myXML.insult[14].lastIndexOf('.')) + "l" + myXML.insult[14].substr(-4);
				video3_clipi = 		 myXML.insult[15].substr(0,myXML.insult[15].lastIndexOf('.')) + "l" + myXML.insult[15].substr(-4);
				video4_clipi = 		 myXML.insult[16].substr(0,myXML.insult[16].lastIndexOf('.')) + "l" + myXML.insult[16].substr(-4);
				proximity3_clipi =   myXML.insult[17].substr(0,myXML.insult[17].lastIndexOf('.')) + "l" + myXML.insult[17].substr(-4);
	 			x10_on_clipi = 		 myXML.insult[18].substr(0,myXML.insult[18].lastIndexOf('.')) + "l" + myXML.insult[18].substr(-4);
				x10_off_clipi = 	 myXML.insult[19].substr(0,myXML.insult[19].lastIndexOf('.')) + "l" + myXML.insult[19].substr(-4);		
				drink1_clipi = 		 myXML.insult[20].substr(0,myXML.insult[20].lastIndexOf('.')) + "l" + myXML.insult[20].substr(-4);
				drink2_clipi =  	 myXML.insult[21].substr(0,myXML.insult[21].lastIndexOf('.')) + "l" + myXML.insult[21].substr(-4);
	 			drink3_clipi = 		 myXML.insult[22].substr(0,myXML.insult[22].lastIndexOf('.')) + "l" + myXML.insult[22].substr(-4);
				drink4_clipi = 	 	 myXML.insult[23].substr(0,myXML.insult[23].lastIndexOf('.')) + "l" + myXML.insult[23].substr(-4);
				quizloop_clipi = 	 myXML.insult[24].substr(0,myXML.insult[24].lastIndexOf('.')) + "l" + myXML.insult[24].substr(-4);
				
				idle_cliptts =  myXML.tts[0].substr(0,myXML.tts[0].lastIndexOf('.')) + "l" + myXML.tts[0].substr(-4);   
				idle_dup_cliptts =  myXML.tts[0].substr(0,myXML.tts[0].lastIndexOf('.')) + "l" + myXML.tts[0].substr(-4);; 
				proximity1_cliptts = 	 myXML.tts[1].substr(0,myXML.tts[1].lastIndexOf('.')) + "l" + myXML.tts[1].substr(-4);
				proximity2_cliptts =    myXML.tts[2].substr(0,myXML.tts[2].lastIndexOf('.')) + "l" + myXML.tts[2].substr(-4);
				touch1_cliptts =        myXML.tts[3].substr(0,myXML.tts[3].lastIndexOf('.')) + "l" + myXML.tts[3].substr(-4);
				weather_good_cliptts =  myXML.tts[4].substr(0,myXML.tts[4].lastIndexOf('.')) + "l" + myXML.tts[4].substr(-4);
				weather_ok_cliptts =    myXML.tts[5].substr(0,myXML.tts[5].lastIndexOf('.')) + "l" + myXML.tts[5].substr(-4);
				weather_rain_cliptts =  myXML.tts[6].substr(0,myXML.tts[6].lastIndexOf('.')) + "l" + myXML.tts[6].substr(-4);
				no_internet_cliptts =  myXML.tts[7].substr(0,myXML.tts[7].lastIndexOf('.')) + "l" + myXML.tts[7].substr(-4);
				stock_up_cliptts = 	 myXML.tts[8].substr(0,myXML.tts[8].lastIndexOf('.')) + "l" + myXML.tts[8].substr(-4);
				stock_no_change_cliptts =  myXML.tts[9].substr(0,myXML.tts[9].lastIndexOf('.')) + "l" + myXML.tts[9].substr(-4);
				stock_down_cliptts =    myXML.tts[10].substr(0,myXML.tts[10].lastIndexOf('.')) + "l" + myXML.tts[10].substr(-4);
				doorbell_cliptts =      myXML.tts[11].substr(0,myXML.tts[11].lastIndexOf('.')) + "l" + myXML.tts[11].substr(-4);
				phone_cliptts = 		 myXML.tts[12].substr(0,myXML.tts[12].lastIndexOf('.')) + "l" + myXML.tts[12].substr(-4);
				video1_cliptts = 		 myXML.tts[13].substr(0,myXML.tts[13].lastIndexOf('.')) + "l" + myXML.tts[13].substr(-4);
				video2_cliptts = 		 myXML.tts[14].substr(0,myXML.tts[14].lastIndexOf('.')) + "l" + myXML.tts[14].substr(-4);
				video3_cliptts = 		 myXML.tts[15].substr(0,myXML.tts[15].lastIndexOf('.')) + "l" + myXML.tts[15].substr(-4);
				video4_cliptts = 		 myXML.tts[16].substr(0,myXML.tts[16].lastIndexOf('.')) + "l" + myXML.tts[16].substr(-4);
				proximity3_cliptts =   myXML.tts[17].substr(0,myXML.tts[17].lastIndexOf('.')) + "l" + myXML.tts[17].substr(-4);
				x10_on_cliptts = 		 myXML.tts[18].substr(0,myXML.tts[18].lastIndexOf('.')) + "l" + myXML.tts[18].substr(-4);
				x10_off_cliptts = 	 myXML.tts[19].substr(0,myXML.tts[19].lastIndexOf('.')) + "l" + myXML.tts[19].substr(-4);		
				drink1_cliptts = 		 myXML.tts[20].substr(0,myXML.tts[20].lastIndexOf('.')) + "l" + myXML.tts[20].substr(-4);
				drink2_cliptts =  	 myXML.tts[21].substr(0,myXML.tts[21].lastIndexOf('.')) + "l" + myXML.tts[21].substr(-4);
				drink3_cliptts = 		 myXML.tts[22].substr(0,myXML.tts[22].lastIndexOf('.')) + "l" + myXML.tts[22].substr(-4);
				drink4_cliptts = 	 	 myXML.tts[23].substr(0,myXML.tts[23].lastIndexOf('.')) + "l" + myXML.tts[23].substr(-4);
				quizloop_cliptts = 	 	 myXML.tts[24].substr(0,myXML.tts[24].lastIndexOf('.')) + "l" + myXML.tts[24].substr(-4);
				
				lipsync_clip = 	 	 myXML.lipsync_clip.substr(0,myXML.lipsync_clip.lastIndexOf('.')) + "l" + myXML.lipsync_clip.substr(-4);
	  			
				
		
		}
		 
		///********* Custom Audio ****************		
		
 		custom_audio = myXML.custom_audio;
  		custom_audio_clip = myXML.custom_audio_clip;
		custom_audio_lip_pattern = myXML.custom_audio_lip_pattern;
		
		proximity1_mp3 = 	 	myXML.mp3[0];
		proximity2_mp3 =   		myXML.mp3[1];
		proximity3_mp3 =   		myXML.mp3[2];
		weather_good_mp3 = 		myXML.mp3[3];
		weather_ok_mp3 =   		myXML.mp3[4];
		weather_rain_mp3 = 		myXML.mp3[5];
		no_internet_mp3 =  		myXML.mp3[6];
		stock_up_mp3 = 	 		myXML.mp3[7];
		stock_no_change_mp3 = 	myXML.mp3[8];
		stock_down_mp3 =  		myXML.mp3[9];
		doorbell_mp3 =    		myXML.mp3[10];
		x10_on_mp3 = 			myXML.mp3[11];	
		x10_off_mp3 = 			myXML.mp3[12];	
		drink1_mp3 =  			myXML.mp3[13];		
		drink2_mp3 =  			myXML.mp3[14];		
		drink3_mp3 =  			myXML.mp3[15];		
		drink4_mp3 =  			myXML.mp3[16];	
		blow_mp3 =  			myXML.mp3[17];	
		wait_mp3 =  			myXML.mp3[18];	
		///*************************************
	
		
	 // var delay_temp = (startup_delay * 1000) + 2000; //at least 10s delay from when the sensors kick in, can make longer through startup delay in config program
	 // var minuteTimer:Timer = new Timer(delay_temp, 1); //one time timer to set a delay before the analog sensors kick in
	 // minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, secondDelayTimer);
	 // minuteTimer.start();  
	  LEDTimer.addEventListener(TimerEvent.TIMER_COMPLETE, LEDoff); //how long to keep the LED on
	  LEDTimerOff.addEventListener(TimerEvent.TIMER_COMPLETE, LEDon); //add some delay when off and before turning back on
	  
	  ModeSelectTimer.addEventListener(TimerEvent.TIMER_COMPLETE, ModeSelectTimerEvent); //add some delay when off and before turning back on
	  
	  Touch1Timer.addEventListener(TimerEvent.TIMER_COMPLETE, Touch1TimerEvent); //add some delay when off and before turning back on
	  Touch2Timer.addEventListener(TimerEvent.TIMER_COMPLETE, Touch2TimerEvent); //add some delay when off and before turning back on
	  Touch3Timer.addEventListener(TimerEvent.TIMER_COMPLETE, Touch3TimerEvent); //add some delay when off and before turning back on
	
	  Touch1PressedTimer.addEventListener(TimerEvent.TIMER_COMPLETE, Touch1PressedTimerEvent);
	  Touch2PressedTimer.addEventListener(TimerEvent.TIMER_COMPLETE, Touch2PressedTimerEvent);
	  Touch3PressedTimer.addEventListener(TimerEvent.TIMER_COMPLETE, Touch3PressedTimerEvent);	 
	  
	  StockDisplayTextTimer.addEventListener(TimerEvent.TIMER_COMPLETE, StockDisplayTextTimerEvent);	
	  WeatherDisplayTextTimer.addEventListener(TimerEvent.TIMER_COMPLETE, WeatherDisplayTextTimerEvent);	
	  StockDisplayTextTimer5s.addEventListener(TimerEvent.TIMER_COMPLETE, StockDisplayTextTimerEvent5s);	
	  WeatherDisplayTextTimer5s.addEventListener(TimerEvent.TIMER_COMPLETE, WeatherDisplayTextTimerEvent5s);		  
	  	  
	  //************ x10 sleep events*********************************88
	  x10_sleep_initial.addEventListener(TimerEvent.TIMER_COMPLETE, x10_sleep_initial_event);	
	  x10_sleep35.addEventListener(TimerEvent.TIMER_COMPLETE, x10_sleep35_event);		  
	  x10_done1.addEventListener(TimerEvent.TIMER_COMPLETE, x10_done1_event);	
	  x10_done2.addEventListener(TimerEvent.TIMER_COMPLETE, x10_done2_event);	
	  x10_sleep1000.addEventListener(TimerEvent.TIMER_COMPLETE, x10_sleep1000_event);		
	  
	  Alcohol_CountdownTimer.addEventListener(TimerEvent.TIMER, Alcohol_CountdownEventNowBlow);
	  Alcohol_CountdownTimer2.addEventListener(TimerEvent.TIMER, Alcohol_CountdownEvent);
	  Alcohol_CountdownTimer2.addEventListener(TimerEvent.TIMER_COMPLETE, Alcohol_CountdownEventTimerComplete);
	  Alcohol_ResetTimer.addEventListener(TimerEvent.TIMER,  Alcohol_ResetTimerEvent); //goes off once a second and is used to check if the breathalyzer has reset
	  //Alcohol_ResetTimer.addEventListener(TimerEvent.TIMER_COMPLETE,  Alcohol_ResetTimerEvent);
	  TextClearTimer.addEventListener(TimerEvent.TIMER_COMPLETE,  TextClearTimerEvent);
	  WarningMessageClearTimer.addEventListener(TimerEvent.TIMER_COMPLETE,  WarningMessageClearTimerEvent);
	  PleaseWaitTextClearTimer.addEventListener(TimerEvent.TIMER_COMPLETE,  PleaseWaitTextClearTimerEvent);
	  BreathalyzerStatusTextClearTimer.addEventListener(TimerEvent.TIMER_COMPLETE,  BreathalyzerStatusTextClearTimerEvent);
	  debounceTimer.addEventListener(TimerEvent.TIMER_COMPLETE,  debounceTimerEvent);
	  debounceTimer2.addEventListener(TimerEvent.TIMER_COMPLETE,  debounceTimer2Event);
	  
	  TweetBirdTimer.addEventListener(TimerEvent.TIMER_COMPLETE,  TweetBirdTimerEvent);
	  TweetBirdClearTimer.addEventListener(TimerEvent.TIMER_COMPLETE,  TweetBirdClearTimerEvent);
	  
	  photobooth_Startbutton.addEventListener(MouseEvent.CLICK, StartPhotoboothMouse);
	  photobooth_Stopbutton.addEventListener(MouseEvent.CLICK, StopPhotoboothMouse);
	
	  //********* let's check for Internet connectivity************
				var loader:URLLoader = new URLLoader();
				configureListenersInternetCheck(loader);
				var requestInternetCheck:URLRequest = new URLRequest("http://www.google.com");
				try {
				  loader.load(requestInternetCheck);
				} catch (error:Error) {
					trace("Unable to load requested document.");
				}
	  //**************************************************************
	  
	  if (stand_alone != "on") {	  
	  		Alcohol_LEDTimer.addEventListener(TimerEvent.TIMER,  Alcohol_LEDTimerEvent);  //if on in config program, LEDs will show the alcohol sensor value state
	  }
	  
	  doorBellTimer.addEventListener(TimerEvent.TIMER_COMPLETE, doorBellTimerEvent);
	  
	  if (myXML.quiz_mode == "on") {
		  QuizTimer.addEventListener(TimerEvent.TIMER_COMPLETE, QuizTimerEvent);
	  }
	  
	  if (stand_alone != "on" && myXML.alcohol_no_switch == "on" && myXML.alcohol_sensor == "on") {
	  		AlcoholNoSwitchTimerDelay.addEventListener(TimerEvent.TIMER_COMPLETE, AlcoholNoSwitchTimerDelayEvent);
	  		AlcoholNoSwitchTimerDelay.start(); //start the timer	
	  }
	  
	   if (twitter_feature == "on") {			
			
			TwitterInit();
			
			//this was all the old twitter code that used the deprecated library tweetr
			///**** Now we need to authenticate
			//if (twitter_authenticated == "yes") {  //then we already have done the Oath so continue
				
				
			//var request:TwitterRequest;
			//var complete:Function;

			//if (_token && _token.oauthToken.length)
			//{
				//_twitter = new Twitter(myXML.twitter_consumerKey, myXML.twitter_consumerSecret, myXML.twitter_oauthToken, myXML.twitter_oauthTokenSecret);
				//request = _twitter.account_verifyCredentials();
				//complete = _verifyCompleteHandler;
			//} else
			//{
				//_twitter = new Twitter(myXML.twitter_consumerKey, myXML.twitter_consumerSecret);
				//request = _twitter.oauth_requestToken();
				//complete = _tokenCompleteHandler;
			//}

			//_setHandlersForRequest(request, complete);
				
				
				
				
				//tweetr = new Tweetr();         
			    //tweetr.serviceHost = "http://diymagicmirror.com/proxy"; 
				// !!!!! if the tweet function ever stops working, be sure and check first that the proxy server is still up and running, it won't work without that!!!!!
				//tweetr.serviceHost = myXML.twitter_serviceHost;
				//myXML.twitter_serviceHost;  
			   // oauth = new OAuth();
				
				//oauth.consumerKey = myXML.twitter_consumerKey;
				//oauth.consumerSecret = myXML.twitter_consumerSecret;
				//oauth.oauthToken = myXML.twitter_oauthToken;
				//oauth.oauthTokenSecret =  myXML.twitter_oauthTokenSecret;
				
				//oauth.consumerKey = "UqwagrMLQEwGsBfmxzxg";  
				//oauth.consumerSecret = "uvEa0gbwFoPlUTrhirhhK0OATpLG7mXqeDSZvZ0UtI";
				//oauth.oauthToken = "268849169-4OU1Y5L1VleUgVxtqkuhubCbAYSWdEPar8onLU0w";
				//oauth.oauthTokenSecret = "t8vSfkgOARvOhOlpKSGbZwpQxu2EGQQomjCm7Kr2k";		
				
				//tweetr.oAuth = oauth;				
				//tweetr.verifyCredentials();
				//trace ("went to oath routine");
				//trace (oauth.toString());
				//tweetr.updateStatus("test tweet from magic mirror 15");
								
				///tweetr.addEventListener(TweetEvent.COMPLETE, handleTweetsLoaded);
				//tweetr.addEventListener(TweetEvent.FAILED, handleTweetsFail);
				//tweet_button.addEventListener(MouseEvent.CLICK, Speak_Tweet_Event_MouseClick);
				
							
				
				//TwitterTimer = new Timer(twitter_frequency * 1000); //its entered in seconds in the admin screen so convert to ms
				//TwitterTimer.addEventListener(TimerEvent.TIMER, GetLatestTweet);				
				//TwitterTimer.start();
				
				//**** old Twitter code with Basic Auth
				//tweetr = new Tweetr();					
				//tweetr.useAuthHeaders = true;			
				//tweetr.username = twitter_username;
				//tweetr.password = twitter_password;	
				////**********************************
			}
			//else {
				//trace("twitter feature is on but oath has not been done");
				//AlertManager.createAlert(this, "The Twitter feature is turned on but you have not linked your Twitter account yet. Exit this program and run the Magic Mirror Configuration program to link your Twitter account and then re-run the Magic Mirror.");
				
			//}
	 // }
	  
	  
	 
	// addEventListener(Event.ENTER_FRAME, processSound);
	
	
	if (stand_alone != "on") {
	  
		  if (LED_mode == "fire") {
				addEventListener(Event.ENTER_FRAME, onEnterFrame); //this is for the Fire LEDs
		  }
	
		  if ((alcohol_sensor == "on") && (LED_mode != "fire") && (myXML.photobooth_leds != "on") && (myXML.switch4 != "on")) {  //don't enable this breathalyzer timer if the photobooth leds is on
			   Alcohol_LEDTimer.start();
			   //alcohol_circle.visible = true;
		  }
	  }
	 
	 if (stand_alone == "on") {
	 	StandAloneStartup(); 
		trace (stand_alone);
	 }
	 else {
		noArduinoFoundTimer.start();		
	 }
	 
	 
	 ////************** Webcam Face Recognition********
	 //Timer for rectangles not being found
		if (myXML.webcam_on == "on") {
	
			_noFaceTimer = new Timer( __noFaceTimeout );
			_noFaceTimer.addEventListener( TimerEvent.TIMER , _noFaceTimer_timer);
			
			//Array of reusable rectangles
			_rects = new Array( );
			
			//timer for how often to detect
			_detectionTimer = new Timer( __faceDetectInterval );
			_detectionTimer.addEventListener( TimerEvent.TIMER , _detectionTimer_timer);
			_detectionTimer.start();
			
			//initalize detector			
			_initDetector();
			
			//set up camera
			_setupCamera();
			
			//hook up detection complete
			_detector.addEventListener( ObjectDetectorEvent.DETECTION_COMPLETE , _detection_complete );
		 //*************************************************
		}
		
		//********** Photobooth Setup Code
			if (switch4 == "on" && myXML.picasa_insteadofphotobooth == "off") {  //this means photobooth is turned on in the config program
			
					IMAGE_FOLDER = myXML.photobooth_savefolder; 			
					CountdownTimerCounter = int(myXML.photobooth_countdown); 
								
					photobooth_videoBandwidth = myXML.photobooth_videoBandwidth;
					photobooth_videoQuality = myXML.photobooth_videoQuality;
					photobooth_videoWidth = myXML.photobooth_videoWidth;
					photobooth_videoHeight = myXML.photobooth_videoHeight;
					photobooth_fps = myXML.photobooth_fps;
					
					photoboothBackgroundLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,photoboothBackgroundLoaderEvent);
					photoboothBackgroundLoader.load(new URLRequest(myXML.photobooth_backdropimage));	
									
					photoboothBoxesLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,photoboothBoxesLoaderEvent);
					photoboothBoxesLoader.load(new URLRequest(myXML.photobooth_backgroundboxes));			
					
					CountdownLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,CountdownLoaderEvent);
					CountdownLoader.load(new URLRequest(myXML.photobooth_countdownimage));		
					
					if (myXML.photobooth_logo == "on") {
						photoboothLogoLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,photoboothLogoLoaderEvent);
						photoboothLogoLoader.load(new URLRequest(myXML.photobooth_logoPath));	
					}
					
					photoboothCountdownTimer = new Timer (1000,CountdownTimerCounter); //goes off every second for x times
					photoboothDelayAfterCameraSound = new Timer(int(myXML.photoboothDelayAfterCameraSound)*1000,1);
					photoboothPleaseWaitTimer1 = new Timer(int(myXML.photoboothPleaseWaitTimer1)*1000,1); //after the last pic has been taken
					photoboothPreGalleryTimer = new Timer(int(myXML.photoboothPreGalleryTimer)*1000,1);	//before the gallery plays, please wait is showing during this time
					shotDelayTimer = new Timer(int(myXML.photoboothShotDelay)*1000,1);	//this delay is after the smile sound clip plays, gives the user time to smile or say cheese
					photoboothFlashTimer = new Timer(int(myXML.photoboothFlashDuration),1);	
					photoboothGalleryTimer = new Timer(int(myXML.photoboothGalleryTimer)*1000,1);		
					photoboothProofDisplayTime = new Timer(int(myXML.photoboothProofDisplayTime)*1000,1);
					photoboothThanksBoxTimer = new Timer(int(myXML.photoboothThanksBoxTimer)*1000,1); //how long to show the thanks box after the photobooth has reset to beginning
					
					if (myXML.photobooth_facialRecognitionTrigger == "on") {
						photoboothFacialRecDelayTimer = new Timer(int(myXML.photobooth_facialRecognitionDelay)*1000,1); //if webcam facial rec is one, then this is how long to delay turning on facial rec after the photobooth has reset to give people time to get out before starting again
					}
					
					photoboothInitSounds(); //get the paths from the xml
					
					photoboothCountdownTimer.addEventListener(TimerEvent.TIMER, photoboothCountdownTimerEvent);  //goes off every second for 3 times
					photoboothCountdownTimer.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothCountdownTimerCompleteEvent); //when it's done, go to capturetimer1
					shotDelayTimer.addEventListener(TimerEvent.TIMER_COMPLETE, shotDelayTimerEvent);
					photoboothFlashTimer.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothFlashTimerEvent);
					photoboothDelayAfterCameraSound.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothTakePicEvent);
					photoboothPleaseWaitTimer1.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothPleaseWaitTimerEvent1); //last pic has been taken, showing please wait
					photoboothPreGalleryTimer.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothGalleryShowingEvent); //the delay before the pic gallery shows
					photoboothGalleryTimer.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothShowingProofEvent); 
					photoboothProofDisplayTime.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothResetEvent);
					photoboothThanksBoxTimer.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothThanksBoxTimerEvent);
					
					if (myXML.photobooth_facialRecognitionTrigger == "on") {
						photoboothFacialRecDelayTimer.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothFacialRecDelayTimerEvent);
					}
					
					stage.addEventListener(KeyboardEvent.KEY_DOWN, RunPhotobooth);
					
					addChild(photoboothWhiteRectangle);
					photoboothWhiteRectangle.x = int(myXML.photobooth_backgroundcustomimage_x);
					photoboothWhiteRectangle.y = int(myXML.photobooth_backgroundcustomimage_y);
					photoboothWhiteRectangle.visible = false;
					
					if (myXML.photobooth_backgroundcustomimage == "on") {  //load the custom background image
						photoboothCustomBackgroundLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,photoboothCustomBackgroundEvent);
						photoboothCustomBackgroundLoader.load(new URLRequest(myXML.photobooth_backgroundcustomimagepath));		
					}
					
					photoboothRoundRectangle.graphics.beginFill(0x1f1313, .5); //this is a message box rectange, text goes over it
					photoboothRoundRectangle.graphics.drawRoundRect(360, 302, 541, 88, 25, 25);
					photoboothRoundRectangle.graphics.endFill();
					addChildAt(photoboothRoundRectangle,3); 
					photoboothRoundRectangle.visible = false;
					
					photoboothFlashRectangle.graphics.beginFill(0xffffff, .9); //this is a message box rectange, text goes over it
					photoboothFlashRectangle.graphics.drawRect(Number(myXML.photobooth_webcam_x), Number(myXML.photobooth_webcam_y), Number(myXML.photobooth_webcam_width), Number(myXML.photobooth_webcam_height));
					photoboothFlashRectangle.graphics.endFill();
					addChildAt(photoboothFlashRectangle,5); 
					photoboothFlashRectangle.visible = false;
					
					photoboothMessageFormat.font = "Arial";
					photoboothMessageFormat.size = 30; 
					photoboothMessageFormat.color = 0xFFFFFF;	
					photoboothMessage.defaultTextFormat = photoboothMessageFormat;
					photoboothMessage.x = 585;    
					photoboothMessage.y = 325; 	
					photoboothMessage.autoSize = TextFieldAutoSize.CENTER;
					photoboothMessage.selectable = false;
					addChildAt(photoboothMessage,4);
					photoboothMessage.visible = false;	
					
					photoboothMessage.text = myXML.photobooth_startuptext;
					
						if (myXML.photobooth_facialRecognitionTrigger == "on") {
								photoboothnoFaceTimer = new Timer( photoboothnoFaceTimeout );
								photoboothnoFaceTimer.addEventListener( TimerEvent.TIMER , photoboothnoFaceTimer_timer);
								
								//Array of reusable rectangles
								photoboothrects = new Array( );
								
								//timer for how often to detect
								photoboothdetectionTimer = new Timer( photoboothfaceDetectInterval );
								photoboothdetectionTimer.addEventListener( TimerEvent.TIMER , photoboothdetectionTimer_timer);
								//photoboothdetectionTimer.start(); //dont' start the timer until the photobooth has started
								
								//initalize detector			
								photoboothinitDetector();
								
								//set up camera
								//_setupCamera();
								
								//hook up detection complete
								photoboothdetector.addEventListener( ObjectDetectorEvent.DETECTION_COMPLETE , photoboothdetection_complete );
							 //*************************************************
						}
						
						
						
					//}
					
					
			}			
			
			//end photobooth setup code*************************
		
		
		
		
	        
	} // ********end RunMirror initMediaPlayer function ***********
	     // wait for arduino to init and get data before calling the video select routines		
				

	
	private function BuildUI():void {
		LabelTextFormat.font = "Arial";
		LabelTextFormat.size = "12";
		LabelTextFormat.color = 0xFFFFFF;		
		
		//alcohol_circle.graphics.lineStyle();
		//alcohol_circle.graphics.beginFill(0xFF0000);
		//alcohol_circle.graphics.drawCircle(100, 100, 50);
		//alcohol_circle.graphics.endFill();
		//addChild(alcohol_circle);
		//alcohol_circle.visible = false;
		
		
		//version.defaultTextFormat = LabelTextFormat;
		//two.defaultTextFormat = LabelTextFormat;
		//three.defaultTextFormat = LabelTextFormat;
		
		addChild(vidButton2);
		vidButton2.x = 48;
		vidButton2.y = 227;
		vidButton2.width = 96;
		vidButton2.height = 22;
		vidButton2.label = "Proximity 1";
		
		addChild(x10_bright_button);
		x10_bright_button.x = 48;
		x10_bright_button.y = 256;
		x10_bright_button.width = 96;
		x10_bright_button.height = 22;
		x10_bright_button.label = "Proximity 2";
		
		addChild(x10_on_lights_button);
		x10_on_lights_button.x = 48;
		x10_on_lights_button.y = 284;
		x10_on_lights_button.width = 96;
		x10_on_lights_button.height = 22;
		x10_on_lights_button.label = "X10 Lights ON";
		
		addChild(x10_off_lights_button);
		x10_off_lights_button.x = 48;
		x10_off_lights_button.y = 313;
		x10_off_lights_button.width = 96;
		x10_off_lights_button.height = 22;
		x10_off_lights_button.label = "X10 Lights OFF";		
		
		addChild(x10_on_button);
		x10_on_button.x = 48;
		x10_on_button.y = 341;
		x10_on_button.width = 96;
		x10_on_button.height = 22;
		x10_on_button.label = "Breathalyzer";
		
		addChild(x10_off_button);
		x10_off_button.x = 48;
		x10_off_button.y = 370;
		x10_off_button.width = 96;
		x10_off_button.height = 22;
		x10_off_button.label = "X10 OFF";
		
		addChild(doorButton);
		doorButton.x = 48;
		doorButton.y = 398;
		doorButton.width = 96;
		doorButton.height = 22;
		doorButton.label = "Door";
		
		addChild(vidButton);
		vidButton.x = 48;
		vidButton.y = 426;
		vidButton.width = 96;
		vidButton.height = 22;
		vidButton.label = "Weather";
		
		addChild(stockButton);
		stockButton.x = 48;
		stockButton.y = 455;
		stockButton.width = 96;
		stockButton.height = 22;
		stockButton.label = "Stock";
		
		addChild(SlideStartButton);
		SlideStartButton.x = 48;
		SlideStartButton.y = 483;
		SlideStartButton.width = 96;
		SlideStartButton.height = 22;
		SlideStartButton.label = "Start Slide Show";
		
		addChild(SlideStopButton);
		SlideStopButton.x = 48;
		SlideStopButton.y = 511;
		SlideStopButton.width = 96;
		SlideStopButton.height = 22;
		SlideStopButton.label = "Stop Slide Show";
		
		addChild(tweet_button);
		tweet_button.x = 150;
		tweet_button.y = 511;
		tweet_button.width = 120;
		tweet_button.height = 22;
		tweet_button.label = "Play Last Tweet";
		
		addChild(photobooth_Startbutton);
		photobooth_Startbutton.x = 300;
		photobooth_Startbutton.y = 511;
		photobooth_Startbutton.width = 96;
		photobooth_Startbutton.height = 22;
		photobooth_Startbutton.label = "Start Photobooth";
		
		addChild(photobooth_Stopbutton);
		photobooth_Stopbutton.x = 400;
		photobooth_Stopbutton.y = 511;
		photobooth_Stopbutton.width = 96;
		photobooth_Stopbutton.height = 22;
		photobooth_Stopbutton.label = "Stop Photobooth";
		
		addChild(version);
		version.x = 52;
		version.y = 10;
		version.width = 82;
		version.height = 62;
		version.text = "SW Version";
		
		addChild(two);
		two.x = 145;
		two.y = 9;
		two.width = 148;
		two.height = 66;		
		two.text = "Switch 1 (Door) - Arduino Digital Pin 2";
		
		addChild(three);
		three.x = 314;
		three.y = 9;
		three.width = 162;
		three.height = 64;		
		three.text = "Switch 2 (Weather) - Arduino Digital Pin 3";
		
		addChild(four);
		four.x = 498;
		four.y = 9;
		four.width = 142;
		four.height = 64;		
		four.text = "Switch 3 (Stock) - Arduino Digital Pin 4";
		
		addChild(seven);
		seven.x = 664;
		seven.y = 9;
		seven.width = 138;
		seven.height = 62;		
		seven.text = "Switch 4 (Picasa) - Arduino Digital Pin 7";
		
		addChild(five);
		five.x = 820;
		five.y = 9;
		five.width = 138;
		five.height = 62;		
		five.text = "Switch 5 (Breathalyzer) - Arduino Digital Pin 5";
		
		addChild(six);
		six.x = 640;
		six.y = 90;
		six.width = 138;
		six.height = 62;		
		six.text = "Switch 6 (X10 ON/OFF) - Arduino Digital Pin 6";
				
		addChild(x10_label);
		x10_label.x = 53;
		x10_label.y = 82.5;
		x10_label.width = 142;
		x10_label.height = 64;		
		x10_label.text = "x10 command";
		
		addChild(idle);
		idle.x = 53;
		idle.y = 153;
		idle.width = 142;
		idle.height = 64;		
		idle.text = "Idle Video Status";
		
		addChild(demo);
		demo.x = 290;
		demo.y = 123;
		demo.width = 444;
		demo.height = 203;		
		demo.text = "THIS IS A FULLY FUNCTIONAL DEMO... You can purchase a registration code from http://diymagicmirror.com to clear this box";
		
		addChild(ArduinoFound);
		ArduinoFound.x = 798;
		ArduinoFound.y = 122;
		ArduinoFound.width = 178;
		ArduinoFound.height = 73;		
		ArduinoFound.text = "The Magic Mirror did not initialize. Ensure the Sensor Hub Port is set correctly in the configuration program and the serial proxy is running (serproxy.exe on Windows)";
		
		addChild(raw_distance);
		raw_distance.x = 798;
		raw_distance.y = 200;
		raw_distance.width = 178;
		raw_distance.height = 64;		
		raw_distance.text = "No Proximity Sensor Readings";
		
		addChild(SensorText);
		SensorText.x = 798;
		SensorText.y = 271;
		SensorText.width = 180;
		SensorText.height = 44;		
		SensorText.text = "No Proximity Match";
		
		addChild(Stock);
		Stock.x = 798;
		Stock.y = 324;
		Stock.width = 180;
		Stock.height = 44;		
		Stock.text = "Stock Status";
		
		addChild(WeatherText);
		WeatherText.x = 798;
		WeatherText.y = 376;
		WeatherText.width = 180;
		WeatherText.height = 84;		
		WeatherText.text = "Weather Status";
		
		addChild(Weather);
		Weather.x = 798;
		Weather.y = 471;
		Weather.width = 180;
		Weather.height = 180;		
		Weather.text = "Full Weather";
		
		addChild(modeSelect);
		modeSelect.x = 638;
		modeSelect.y = 543;
		modeSelect.width = 156;
		modeSelect.height = 44;		
		modeSelect.text = "Character Select Potentiometer";
		
		addChild(three_analog);
		three_analog.x = 490;
		three_analog.y = 543;
		three_analog.width = 137;
		three_analog.height = 44;		
		three_analog.text = "Touch Sensor 3 - X10 ON/OFF";
		
		addChild(two_analog);
		two_analog.x = 344;
		two_analog.y = 543;
		two_analog.width = 136;
		two_analog.height = 44;		
		two_analog.text = "Touch Sensor 2 - Stock";
		
		addChild(one_analog);
		one_analog.x = 199;
		one_analog.y = 543;
		one_analog.width = 138;
		one_analog.height = 44;		
		one_analog.text = "Touch Sensor 1 - Weather";
		
		addChild(zero_analog);
		zero_analog.x = 53;
		zero_analog.y = 543;
		zero_analog.width = 126;
		zero_analog.height = 44;		
		zero_analog.text = "Proximity Sensor";
		
		addChild(touch_counter_text);
		touch_counter_text.x = 53;
		touch_counter_text.y = 595;
		touch_counter_text.width = 126;
		touch_counter_text.height = 44;		
		touch_counter_text.text = "Touch Counter";
		
		addChild(alcohol_sensor_text);
		alcohol_sensor_text.x = 200;
		alcohol_sensor_text.y = 595;
		alcohol_sensor_text.width = 138;
		alcohol_sensor_text.height = 44;		
		alcohol_sensor_text.text = "Alcohol Sensor";
		
		addChild(tweet_text);
		tweet_text.x = 350;
		tweet_text.y = 595;
		tweet_text.width = 600;
		tweet_text.height = 44;		
		tweet_text.text = "Your Last Twitter Message";
	}
	
	//private function secondDelayTimer(e:TimerEvent):void {
	//	initial_values_done = 1; //loop			
	//}
	
	private function StandAloneStartup():void {
			Mouse.show(); //the mouse pointer normally does not show up in normal mode
			initial_values_no_arduino();
			
			if (stand_alone_weather == "on") {
				weather_image_sprite.visible = true;
			}
			else {
				weather_image_sprite.visible = false;
			}
			
			if (stand_alone_stock == "on") {
				stock_image_sprite.visible = true;
			}
			else {
				stock_image_sprite.visible = false;
			}
	}
	
	private function noArduinoFoundTimerEvent(e:TimerEvent):void {  //this will trigger once after the startup delay timer
		if (foundArduino != 1) {  //show the error box if the Arduno was not found
				StartUpText.visible = false;
				mirror_did_not_init_text.visible = true;
				mirror_did_not_init_text.text = "The Magic Mirror did not initialize. Please check the following: 1. The Sensor Hub is plugged into your USB port 2. The Sensor Hub port number is set correctly in the configuration program 3. The serial proxy is running (serproxy on Windows and ser2net on Mac & Linux) 4. If you assembled your own Sensor Hub, ensure you did the one time upload of Firmata to the Arduino. 5. Restart and choose 'Run Magic Mirror with Board Reset'";			
		}
	}
	
	private function thoughtsLoaded (event:Event):void {
		thoughts_image = Bitmap(thoughtsLoader.content);
		thoughts_bitmapdata = thoughts_image.bitmapData;
		addChild(thoughts_image);
		thoughts_image.visible = false;			
		thoughts_image.scaleX = thoughts_image_scale;
		thoughts_image.scaleY = thoughts_image_scale;
		thoughts_image.rotation = thoughts_image_rotate;		
		thoughts_image.x = thoughts_image_x;
		thoughts_image.y = thoughts_image_y;						
		trace ("doorcam width prior during thoughts image load" + doorcam.width);		
	}
	
	private function avatarLoaded (event:Event):void {
		avatar_image = Bitmap(avatarLoader.content);
		avatar_bitmapdata = avatar_image.bitmapData;
		addChild(avatar_image);
		avatar_image.visible = false;			
		avatar_image.scaleX = avatar_image_scale;
		avatar_image.scaleY = avatar_image_scale;
		avatar_image.rotation = avatar_image_rotate;		
		avatar_image.x = avatar_image_x;
		avatar_image.y = avatar_image_y;								
	}	
	
		
	private function WebcamMirrorLoaded (event:Event):void {
		WebcamMirror = Bitmap(WebcamMirrorLoader.content);
		WebcamMirror_bitmapdata = WebcamMirror.bitmapData;
		addChild(WebcamMirror);
		WebcamMirror.x = webcamvideo.x;
		WebcamMirror.y = webcamvideo.y;
	}	
	
	private function frameLoaded (event:Event):void {
		frame = Bitmap(frameLoader.content);
		frame_bitmapdata = frame.bitmapData;
		addChild(frame);
		frame.x = frame_x;
		frame.y = frame_y;
		frame.rotation = frame_rotation;
		frame.scaleX = frame_scale;	
		frame.scaleY = frame_scale;
		//frame.x = webcamvideo.x;
		//frame.y = webcamvideo.y;
	}	
	
	private function beer_image_Loaded (event:Event):void {  //one time load of the beer icon, hide it until we need it later
		beer_image = Bitmap(beer_image_Loader.content);
		beer_image_bitmapdata = beer_image.bitmapData;
		addChild(beer_image);
		beer_image.x = beer_image_x;
		beer_image.y = beer_image_y;
		beer_image.rotation = frame_rotation;
		beer_image.scaleX = beer_image_scale;	
		beer_image.scaleY = beer_image_scale;
		beer_image.visible = false;		
	}	
	
	
	//private function loadJPGs () {
		//if (PicasaLoaded == 1) {			
			//if (num_images ==1) {  //if only one image then keep it on that image
				//picA1url = imageArray[i];
				//picA1URLRequest = new URLRequest(picA1url);
				//picA1ImageLoader.load(picA1URLRequest);
				//picA1ImageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, picA1Loaded);
			//}
			//else {
			
				//switch (num_images - i)
				//{
					//case 0: //the means no images are left so reset
					//i = 0;
					//picAurl = imageArray[i];
					//picBurl = imageArray[i+1];
					//break;
					
					//case 1: //this means one image is left still to display so get the last one and then start over
					//picAurl = imageArray[i]; //get the last one and then start over
					//i = 0;
					//picBurl = imageArray[i];  //start back at 0		
					//break;
					
					//default:  //otherwise we still have left so just keep going
					//picAurl = imageArray[i];
					//picBurl = imageArray[i+1];
				//} //end case statement
				
			//picAURLRequest = new URLRequest(picAurl);
			//picAImageLoader.load(picAURLRequest);
			
			//picBURLRequest = new URLRequest(picBurl);
			//picBImageLoader.load(picBURLRequest);
			
			//picAImageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, picALoaded);
			//picBImageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, picBLoaded);
			
			//SlideShowStarted = 1;  
			
			//} //end else
		//}
		//else {
			//idle.text=("Picasa Web Album did not load, cannot start slide show");
		//}			
	//}
		
	 //function picALoaded(e:Event):void {
	   //picABitmapData = new BitmapData(picAImageLoader.width, picAImageLoader.height);
	
	//   picABitmapData.draw(picAImageLoader);
	 //  picA = new Bitmap;
	   //picA.bitmapData = picABitmapData;
	   
	   //picA.rotation = picture_rotation;
	   //picA.x = picture_x_position;		
	   //picA.y = picture_y_position;
	   //picA.scaleX = picture_scale;
	   //picA.scaleY = picture_scale;
	   //addChild(picA);
	   //picATimer = new Timer(slide_delay_seconds,1); //go off only once
	   //picATimer.addEventListener(TimerEvent.TIMER, loadpicB);
	   //picATimer.start();
	//} 
	
	 //function picA1Loaded(e:Event):void {  //only one so just load it and leave it
	   //picA1BitmapData = new BitmapData(picA1ImageLoader.width, picA1ImageLoader.height);
	 //   picA1BitmapData.draw(picA1ImageLoader);
	   //picA1 = new Bitmap;
	   //picA1.bitmapData = picA1BitmapData;
	   //addChild(picA1);	  
	//} 
	
	//public function picBLoaded(e:Event):void {
	  // picBBitmapData = new BitmapData(picBImageLoader.width, picBImageLoader.height);
	   //picBBitmapData.draw(picBImageLoader);
	   //picB = new Bitmap;
	   //picB.bitmapData = picBBitmapData;
	//}
	
	//public function loadpicB(e:TimerEvent):void {
	  // removeChild(picA); //take out pic A		
	   //picA.visible = false;	   
	   //picB.rotation = picture_rotation;
	   //picB.x = picture_x_position;		
	   //picB.y = picture_y_position;
	   //picB.scaleX = picture_scale;
	   //picB.scaleY = picture_scale;
	   //addChild(picB);
		//i++; //increment the counter by 2 and load the next two images
		//i++;
	   //picBTimer = new Timer(slide_delay_seconds,1); //go off only once
	   //picBTimer.addEventListener(TimerEvent.TIMER, picBDone);
	   //picBTimer.start();			   
	//}
	
	//public function picBDone(e:TimerEvent):void {
	//	loadJPGs(); //loop			
	//}
	
	//public function onGetAlbumsComplete(evt : PicasaDataEvent) : void   //google stopped supporting this api
	//{
	//	var item : Object;	
	//	for(var a : int = 0; a < evt.data.entries.length; a++)
	//	{
	//		item = evt.data.entries[a];
	//		imageArray.push(item.media.content.url); //add the URL of each image to the imageArray			
	//	}		
	//	PicasaLoaded = 1; //set this flag so the rest of the program knows it loaded correctly
	//}
	
	 function StartSlideShowButton(event:MouseEvent):void {  			
				StartSlideShow(); 				
		}
		
	 function StopSlideShowButton(event:MouseEvent):void {      
				StopSlideShow();
		}
	
	 function StartSlideShow():void {			
			if (PicasaLoaded == 1 && doorcamPlayingFlag == 0) {			
				if (SlideShowStarted == 0) {
					myVid.visible = false; //hide the video
					
					if (webcamfound == 1 && idle_videos == "off") {  //t
						webcamvideo.visible = false; //turn webcam back on now that's we've played
						frame.visible = false;
						_detectionTimer.stop();
					}					
					
					SlideShowRunning = 1; //set the flag so the analog and digital inputs do not go off					
					
					if (doorcam_on == "on") {
						myVid2.visible = false;
					}
					
					pic.visible = true;
					URLString = imageArray[i];
					pic.source = URLString		
					imageTimer = new Timer(slide_delay_seconds);
					imageTimer.addEventListener(TimerEvent.TIMER, switchImage);
					imageTimer.start();
					SlideShowStarted = 1;  //set this so this routine only runs once
				}
			}
			else {
				idle.text=("Picasa Web Album did not load, cannot start slide show");
			}
	}
	
	 function StopSlideShow():void {			
			if (doorcamPlayingFlag == 0) {
				SlideShowRunning = 0; //set the flag so the analog and digital inputs do not go off
				SlideShowStarted = 0;
				video_playing = 0;
				myVid.visible = true;
				
				if (webcamfound == 1 && idle_videos == "off") {  //t
						webcamvideo.visible = true; //turn webcam back on now that's we've played
						frame.visible = true;
						_detectionTimer.start();
				}
				
				if (doorcam_on == "on") {
						myVid2.visible = false;
				}
				
				pic.visible = false;
				imageTimer.stop();
				if (myXML.slideshow_restart_switch == "on") {
					i=0; //reset the slideshow
				}
				else {
					//keep the same i and continue the slideshow when the switch is flipped back again
				}
			}
	}

	function switchImage(e:TimerEvent):void {
					
			if(i < imageArray.length-1){ //check if its at the end and reset if so
				myVid.visible = false;
				i++;
				URLString = imageArray[i];
				pic.source = URLString
			} else{  					//end of the line
				myVid.visible = false;
				i = 0;
				URLString = imageArray[i];
				pic.source = URLString
			}										
	}
	
		 private function StartPhotoboothMouse(event:MouseEvent):void {
			 StartPhotobooth();
			 
		 }
		 
		  private function StopPhotoboothMouse(event:MouseEvent):void {
			 StopPhotobooth();
			 
		 }
		 
		 
		 private function StartPhotobooth():void { //this puts the magic mirror into photobooth mode but the photobooth is idle and hasn't started yet
			if (doorcamPlayingFlag == 0 && photoboothRunning == 0) { //don't start it again if it's already running, will be running if photoboothRunning = 1
				if (SlideShowStarted == 0) {
					
					photobooth_IntroSound.play(); //play the photobooth intro sound
					AlcoholResetCounter.visible = false;
										
					myVid.visible = false; //hide the video
					
					if (myXML.photobooth_facialRecognitionTrigger == "on") { //if this is on, then the photobooth can be triggered from the webcam facial recognition
						photoboothdetectionTimer.start();
					}					
					
					if (webcamfound == 1 && idle_videos == "off") {  
						webcamvideo.visible = false;
						frame.visible = false;
						_detectionTimer.stop();
					}		
					
					if (photoboothWebcamNotFound == 1) {
						photoboothRoundRectangle.visible = true; 
						photoboothMessage.text = "Webcam Not Detected";
						photoboothMessage.visible = true;						
					}
					
					if (alcohol_sensor == "on" && myXML.alcohol_display_value == "on") {		
						AlcoholReadingText.visible = false;
					}
					
					SlideShowRunning = 1; //set the flag so the analog and digital inputs do not go off					
					
					if (doorcam_on == "on") {
						myVid2.visible = false;
					}
					
					photoboothBackgroundImage.visible = true;
					photoboothLogoImage.visible = true;
					photoboothBoxesImage.visible = true;
					video.visible = true;
					photoboothRoundRectangle.visible = true;
					photoboothMessage.visible = true;
					
					photoboothIdle = 1; //this flag tells us the photobooth is idle but has not started to run yet
					
					if (myXML.photobooth_leds == "on") {
						a.writeDigitalPin(LED1_pin, Arduino.LOW); 
						a.writeDigitalPin(LED2_pin, Arduino.LOW); 
						a.writeDigitalPin(LED3_pin, Arduino.HIGH); //photobooth is ready LED
						a.writeDigitalPin(LED4_pin, Arduino.LOW); 			
					}
					
					//SlideShowStarted = 1;  //set this so this routine only runs once
				}
			}
			
	}
	
	 function StopPhotobooth():void {			
			if (doorcamPlayingFlag == 0 && photoboothRunning == 0) { //don't stop the photobooth if it is in progress
				photoboothIdle = 0;
				SlideShowRunning = 0; //keep these flags since the rest of the digital in puts have already been coded not to go off when the slideshow is running
				SlideShowStarted = 0;
				photoboothRunning = 0;
				video_playing = 0;
				myVid.visible = true;
				
				if (webcamfound == 1 && idle_videos == "off") {  //t
						webcamvideo.visible = true; //turn webcam back on now that's we've played
						frame.visible = true;
						_detectionTimer.start();
				}
				
				if (myXML.photobooth_facialRecognitionTrigger == "on") {
						photoboothdetectionTimer.stop();
					}		
				
				if (doorcam_on == "on") {
						myVid2.visible = false;
				}
				
				if (photoboothWebcamNotFound == 1) {
						photoboothRoundRectangle.visible = false; //let's start if any keyboard key pressed
						photoboothMessage.text = "Webcam Not Detected";
						photoboothMessage.visible = false;						
				}
				
				if (alcohol_sensor == "on" && myXML.alcohol_display_value == "on") {				
						AlcoholReadingText.visible = true;	
				}
				
				photoboothBackgroundImage.visible = false;
				
				photoboothBoxesImage.visible = false;
				video.visible = false;
				photoboothRoundRectangle.visible = false;
				photoboothMessage.visible = false;				
				photoboothWhiteRectangle.visible = false;
	
				if (myXML.photobooth_backgroundcustomimage == "on") {  //load the custom background image
					photoboothCustomBackground_image.visible = false;
				}
				
				if (myXML.photobooth_logo == "on") {  //load the custom background image
					photoboothLogoImage.visible = false;
				}
	
				photoboothRoundRectangle.visible = false;
				photoboothFlashRectangle.visible = false;
				photoboothMessage.visible = false;	
	
				photobooth_capture1.visible = false;	
				//photobooth_capture1Clone.visible = false;	
				photobooth_capture2.visible = false;	
				//photobooth_capture2Clone.visible = false;	
				photobooth_capture3.visible = false;	
				//photobooth_capture3Clone.visible = false;	
				photobooth_capture4.visible = false;	
				//photobooth_capture4Clone.visible = false;	
				
				if (myXML.photobooth_leds == "on") {
					a.writeDigitalPin(LED1_pin, Arduino.LOW); 
					a.writeDigitalPin(LED2_pin, Arduino.LOW); 
					a.writeDigitalPin(LED3_pin, Arduino.LOW); 
					a.writeDigitalPin(LED4_pin, Arduino.LOW); 		
				}
				
			}
	}
	
	
	// function onError(evt : ErrorEvent) : void {	
	//	trace("Error: " + evt.text);
	//}

	
	public function check_charChange():void  {  //cannot change to the same character
        	   
		   if (hardware_mode_select == "on") {  //set the mode from hardware, otherwise set from config file
			  if (tts_feature == "on") {
			  
					  if ((hardware_mode_select_value >= 0) && (hardware_mode_select_value < 200) && (mode_select != "princess")) {
								character_change_sound_princess.play();
								mode_select = "princess";
								switch_mode();
						}
						if ((hardware_mode_select_value > 200) && (hardware_mode_select_value < 400) && (mode_select != "pirate")) {
								character_change_sound_pirate.play();
								mode_select ="pirate";
								switch_mode();
						}
						if ((hardware_mode_select_value > 400) && (hardware_mode_select_value < 600) && (mode_select != "halloween")) {
								character_change_sound_halloween.play();
								mode_select ="halloween";
								switch_mode();
						}		
						if ((hardware_mode_select_value > 600) && (hardware_mode_select_value < 800) && (mode_select != "insult")) {
								character_change_sound_insult.play();
								mode_select ="insult";
								switch_mode();
						}	
						if ((hardware_mode_select_value > 800) && (mode_select != "tts_mode")) {
								character_change_sound_tts.play();
								mode_select ="tts_mode";
								switch_mode();
						}				
			  		}
				else {  //then there is no possibility for the mirror to be set for TTS mode
					if ((hardware_mode_select_value >= 0) && (hardware_mode_select_value < 250) && (mode_select != "princess")) {
								character_change_sound_princess.play();
								mode_select = "princess";
								switch_mode();
						}
						if ((hardware_mode_select_value > 250) && (hardware_mode_select_value < 500) && (mode_select != "pirate")) {
								character_change_sound_pirate.play();
								mode_select ="pirate";
								switch_mode();
						}
						if ((hardware_mode_select_value > 500) && (hardware_mode_select_value < 750) && (mode_select != "halloween")) {
								character_change_sound_halloween.play();
								mode_select ="halloween";
								switch_mode();
						}		
						if ((hardware_mode_select_value > 750) && (mode_select != "insult")) {
								character_change_sound_insult.play();
								mode_select ="insult";
								switch_mode();
						}	
					
				}
					
			} //end if hardwared select on
	}
	
	public function switch_mode():void {  
			
			switch (mode_select)  //sets the video playlists based on the mode
				{
				case "princess":
					idle_clip =   		idle_clipp;  
					idle_dup_clip =		idle_dup_clipp;  
					proximity1_clip = 	proximity1_clipp;
					proximity2_clip =   proximity2_clipp;
					touch1_clip =       touch1_clipp;
					weather_good_clip = weather_good_clipp;
					weather_ok_clip =   weather_ok_clipp;
					weather_rain_clip = weather_rain_clipp;
					no_internet_clip = 	no_internet_clipp;
					stock_up_clip = 	stock_up_clipp;
					stock_no_change_clip= stock_no_change_clipp;
					stock_down_clip =   stock_down_clipp;
					doorbell_clip =     doorbell_clipp;
					phone_clip = 		phone_clipp;
					video1_clip = 		video1_clipp;
					video2_clip = 		video2_clipp;
					video3_clip =		video3_clipp;
					video4_clip =		video4_clipp;
					proximity3_clip = 	proximity3_clipp;	
					x10_on_clip = 		x10_on_clipp;	
					x10_off_clip = 		x10_off_clipp;	
					drink1_clip =  		drink1_clipp;	 	
					drink2_clip =  		drink2_clipp;			
					drink3_clip =  		drink3_clipp;			
					drink4_clip =  		drink4_clipp;	
					quizloop_clip =  	quizloop_clipp;
					wait_sound = wait_sound_princess;
					blow_sound = blow_sound_princess;
					warning_sound = warning_sound_princess;			
					photobooth_IntroSoundPath = photobooth_IntroSoundPathp;
					photobooth_getReadySoundPath = 	photobooth_getReadySoundPathp;
					photobooth_pic2SoundPath = 	photobooth_pic2SoundPathp;
					photobooth_pic3SoundPath = photobooth_pic3SoundPathp;
					photobooth_pic4SoundPath = photobooth_pic4SoundPathp;
					photobooth_developingSoundPath = photobooth_developingSoundPathp;
					photobooth_thanksSoundPath = photobooth_thanksSoundPathp;
					break;
				case "halloween":
					idle_clip =   		idle_cliph;  
					idle_dup_clip =		idle_dup_cliph;  
					proximity1_clip = 	proximity1_cliph;
					proximity2_clip =   proximity2_cliph;
					touch1_clip =       touch1_cliph;
					weather_good_clip = weather_good_cliph;
					weather_ok_clip =   weather_ok_cliph;
					weather_rain_clip = weather_rain_cliph;
					no_internet_clip = 	no_internet_cliph;
					stock_up_clip = 	stock_up_cliph;
					stock_no_change_clip= stock_no_change_cliph;
					stock_down_clip =   stock_down_cliph;
					doorbell_clip =     doorbell_cliph;
					phone_clip = 		phone_cliph;
					video1_clip = 		video1_cliph;
					video2_clip = 		video2_cliph;
					video3_clip =		video3_cliph;
					video4_clip =		video4_cliph;
					proximity3_clip = 	proximity3_cliph;	
					x10_on_clip = 		x10_on_cliph;	
					x10_off_clip = 		x10_off_cliph;	
					drink1_clip =  		drink1_cliph;	 	
					drink2_clip =  		drink2_cliph;			
					drink3_clip =  		drink3_cliph;			
					drink4_clip =  		drink4_cliph;	
					quizloop_clip =  	quizloop_cliph;	
					wait_sound = wait_sound_halloween;
					blow_sound = blow_sound_halloween;
					warning_sound = warning_sound_halloween;	
					photobooth_IntroSoundPath = photobooth_IntroSoundPathh;
					photobooth_getReadySoundPath = 	photobooth_getReadySoundPathh;
					photobooth_pic2SoundPath = 	photobooth_pic2SoundPathh;
					photobooth_pic3SoundPath = photobooth_pic3SoundPathh;
					photobooth_pic4SoundPath = photobooth_pic4SoundPathh;
					photobooth_developingSoundPath = photobooth_developingSoundPathh;
					photobooth_thanksSoundPath = photobooth_thanksSoundPathh;
					break;
				case "pirate":
					idle_clip =   		idle_clippi;  
					idle_dup_clip =		idle_dup_clippi;  
					proximity1_clip = 	proximity1_clippi;
					proximity2_clip =   proximity2_clippi;
					touch1_clip =       touch1_clippi;
					weather_good_clip = weather_good_clippi;
					weather_ok_clip =   weather_ok_clippi;
					weather_rain_clip = weather_rain_clippi;
					no_internet_clip = 	no_internet_clippi;
					stock_up_clip = 	stock_up_clippi;
					stock_no_change_clip= stock_no_change_clippi;
					stock_down_clip =   stock_down_clippi;
					doorbell_clip =     doorbell_clippi;
					phone_clip = 		phone_clippi;
					video1_clip = 		video1_clippi;
					video2_clip = 		video2_clippi;
					video3_clip =		video3_clippi;
					video4_clip =		video4_clippi;
					proximity3_clip = 	proximity3_clippi;	
					x10_on_clip = 		x10_on_clippi;	
					x10_off_clip = 		x10_off_clippi;	
					drink1_clip =  		drink1_clippi;	 	
					drink2_clip =  		drink2_clippi;			
					drink3_clip =  		drink3_clippi;			
					drink4_clip =  		drink4_clippi;	
					quizloop_clip =  	quizloop_clippi;	
					wait_sound = wait_sound_pirate;
					blow_sound = blow_sound_pirate;
					warning_sound = warning_sound_pirate;	
					photobooth_IntroSoundPath = photobooth_IntroSoundPathpi;
					photobooth_getReadySoundPath = 	photobooth_getReadySoundPathpi;
					photobooth_pic2SoundPath = 	photobooth_pic2SoundPathpi;
					photobooth_pic3SoundPath = photobooth_pic3SoundPathpi;
					photobooth_pic4SoundPath = photobooth_pic4SoundPathpi;
					photobooth_developingSoundPath = photobooth_developingSoundPathpi;
					photobooth_thanksSoundPath = photobooth_thanksSoundPathpi;
					break;
				case "insult":
					idle_clip =   		idle_clipi;  
					idle_dup_clip =		idle_dup_clipi;  
					proximity1_clip = 	proximity1_clipi;
					proximity2_clip =   proximity2_clipi;
					touch1_clip =       touch1_clipi;
					weather_good_clip = weather_good_clipi;
					weather_ok_clip =   weather_ok_clipi;
					weather_rain_clip = weather_rain_clipi;
					no_internet_clip = 	no_internet_clipi;
					stock_up_clip = 	stock_up_clipi;
					stock_no_change_clip= stock_no_change_clipi;
					stock_down_clip =   stock_down_clipi;
					doorbell_clip =     doorbell_clipi;
					phone_clip = 		phone_clipi;
					video1_clip = 		video1_clipi;
					video2_clip = 		video2_clipi;
					video3_clip =		video3_clipi;
					video4_clip =		video4_clipi;	
					proximity3_clip = 	proximity3_clipi;	
					x10_on_clip = 		x10_on_clipi;	
					x10_off_clip = 		x10_off_clipi;		
					drink1_clip =  		drink1_clipi;	 	
					drink2_clip =  		drink2_clipi;			
					drink3_clip =  		drink3_clipi;			
					drink4_clip =  		drink4_clipi;		
					quizloop_clip =  	quizloop_clipi;		
					wait_sound = wait_sound_insult;
					blow_sound = blow_sound_insult;
					warning_sound = warning_sound_insult;	
					photobooth_IntroSoundPath = photobooth_IntroSoundPathi;
					photobooth_getReadySoundPath = 	photobooth_getReadySoundPathi;
					photobooth_pic2SoundPath = 	photobooth_pic2SoundPathi;
					photobooth_pic3SoundPath = photobooth_pic3SoundPathi;
					photobooth_pic4SoundPath = photobooth_pic4SoundPathi;
					photobooth_developingSoundPath = photobooth_developingSoundPathi;
					photobooth_thanksSoundPath = photobooth_thanksSoundPathi;
					break;
				case "tts_mode":
					idle_clip =   		idle_cliptts;  
					idle_dup_clip =		idle_dup_cliptts;  
					proximity1_clip = 	proximity1_cliptts;
					proximity2_clip =   proximity2_cliptts;
					touch1_clip =       touch1_cliptts;
					weather_good_clip = weather_good_cliptts;
					weather_ok_clip =   weather_ok_cliptts;
					weather_rain_clip = weather_rain_cliptts;
					no_internet_clip = 	no_internet_cliptts;
					stock_up_clip = 	stock_up_cliptts;
					stock_no_change_clip= stock_no_change_cliptts;
					stock_down_clip =   stock_down_cliptts;
					doorbell_clip =     doorbell_cliptts;
					phone_clip = 		phone_cliptts;
					video1_clip = 		video1_cliptts;
					video2_clip = 		video2_cliptts;
					video3_clip =		video3_cliptts;
					video4_clip =		video4_cliptts;	
					proximity3_clip = 	proximity3_cliptts;	
					x10_on_clip = 		x10_on_cliptts;	
					x10_off_clip = 		x10_off_cliptts;		
					drink1_clip =  		drink1_cliptts;	 	
					drink2_clip =  		drink2_cliptts;			
					drink3_clip =  		drink3_cliptts;			
					drink4_clip =  		drink4_cliptts;		
					quizloop_clip =  	quizloop_cliptts;		
					wait_sound = wait_sound_princess;
					blow_sound = blow_sound_princess;
					warning_sound = warning_sound_princess;	
					avatar_image.visible = false;					
					photobooth_IntroSoundPath = photobooth_IntroSoundPathp;
					photobooth_getReadySoundPath = 	photobooth_getReadySoundPathp;
					photobooth_pic2SoundPath = 	photobooth_pic2SoundPathp;
					photobooth_pic3SoundPath = photobooth_pic3SoundPathp;
					photobooth_pic4SoundPath = photobooth_pic4SoundPathp;
					photobooth_developingSoundPath = photobooth_developingSoundPathp;
					photobooth_thanksSoundPath = photobooth_thanksSoundPathp;
				}
				
			trace("photobooth intro sound path: " + photobooth_IntroSoundPath);
				
			initPhotoboothSounds(); //re-init the photobooth sounds
			
			trace ("idle clip" + idle_clip);
				
			if (doorcam_on == "on") {
				myVid2.source = doorbell_clip;
			}
			
			
			if (idle_videos == "off") {
				idle_clip = idle_black;
				idle_dup_clip =	idle_black;  
			}
			
			//*** now reset things that were in a state of playing back to idle mode
			proximity_counter = 0;  //reset the proximity counter
			proximity1_do_not_play_again = 0; 
			proximity_flag = 0;
			video_playing = 0; 
			sound_playing = 0;
			
			tts_channel.removeEventListener(Event.SOUND_COMPLETE,TTSSoundDone);			//remove this because we don't want to stop myVid after the sound is done
			tts_channel.stop(); //stop the sound
			
			custom_audio_channel.removeEventListener(Event.SOUND_COMPLETE,CustomSoundDone);			//remove this because we don't want to stop myVid after the sound is done
			custom_audio_channel.stop(); //stop the sound
			
			FirstProxVideoPlaying = 0;			
			proximity_counter2 = 0;
			AProxVideoPlaying = 0; 
			stock_display.visible = false; //turn off the stock display now that the video has finished playing
			weather_display2.visible = false; //turn off the stock display now that the video has finished playing
			weather_image.visible = false;
			AlcoholText.visible = false;
			AlcoholText.visible = false;
			AlcoholResults.visible = false;
			
			StockDisplayTextTimer.stop();
			//TextClearTimer.stop();
			WeatherDisplayTextTimer.stop();
			a.writeDigitalPin(AboveFireLed_pin, Arduino.LOW);
			
			if (myXML.lipsync_feature == "on") {
					LipsyncTimer.stop();
					lip1.visible = false;
					lip2.visible = false;
					lip3.visible = false;
					lip4.visible = false;
					lip5.visible = false;
					lip6.visible = false;
					lip7.visible = false;
					lip8.visible = false;
					lip9.visible = false;
					lip10.visible = false;
			}
			
			if (x10_commands == "on") {
				X10_ON(x10_address1);	
				//X10_ON(x10_address1);	
			}			
			
			//***************************************************************
		
			myVid.play(idle_clip); //start the idle clip and then wait for events to happen
		
       } //end switch mode function
		
		
		
		function onEnterFrame(event:Event):void {  //only go here if LED mode is flickering fire
				
				if(rising) {
					pwmValue+=step;
					if(pwmValue>=254) {
						rising=false;
						pwmValue=254;
					} 
				} else {
					pwmValue-=step;
					if(pwmValue<=0) {
						rising=true;
						pwmValue=0;
					}
				}
				
				if (Number(myXML.board_version) < 99 ) {  //if the board version is less than 4, then we have 4 LEDs as opposed to 3 LEDs with board version 4 and above
					a.writeAnalogPin(LED1_pin,(pwmValue+50));	
				}
				
				a.writeAnalogPin(LED2_pin,(pwmValue-50))
				a.writeAnalogPin(LED3_pin,(pwmValue+75))
				a.writeAnalogPin(LED4_pin,(pwmValue-10))
		}	
		
	
	
	private function say_custom_audio_breathalyzer(value:String):void
		
		{			 
				sound_playing = 1; //set the sound playing flag so something else doesn't play							
				custom_audio_sound = new Sound(); 
				var loader:URLLoader = new URLLoader();
				configureListenersCustomAudio(loader);
				
				var request = new URLRequest(value);
					 
				try {
					loader.load(request);
				} catch (error:Error) {
					trace("Unable to load custom audio");
				}
						
			 // custom_audio_channel.addEventListener(Event.ENTER_FRAME, processSound);  
				custom_audio_sound.load(request);
				custom_audio_channel = custom_audio_sound.play();							
				custom_audio_channel.addEventListener(Event.SOUND_COMPLETE,CustomSoundDoneBreathalyzer);			
				if (myXML.lipsync_feature == "on") {
					LipsyncTimer.addEventListener(TimerEvent.TIMER,  processSound);
					LipsyncTimer.start();
				}
		}
		
			private function say_custom_audio(value:String):void
		
		{			 
				sound_playing = 1; //set the sound playing flag so something else doesn't play							
				custom_audio_sound = new Sound(); 
				var loader:URLLoader = new URLLoader();
				configureListenersCustomAudio(loader);
				
				var request = new URLRequest(value);
					 
				try {
					loader.load(request);
				} catch (error:Error) {
					trace("Unable to load custom audio");
				}
						
			 // custom_audio_channel.addEventListener(Event.ENTER_FRAME, processSound);  
				custom_audio_sound.load(request);
				custom_audio_channel = custom_audio_sound.play();							
				custom_audio_channel.addEventListener(Event.SOUND_COMPLETE,CustomSoundDone);			
				if (myXML.lipsync_feature == "on") {
					LipsyncTimer.addEventListener(TimerEvent.TIMER,  processSound);
					LipsyncTimer.start();
				}
		}
		
		
		
		
	private function lip1Loaded(e:Event):void {
	   addChild(lip1);
	   lip1.visible = false;	 
	   lip1.rotation = myXML.lipsync_rotation;
	   lip1.scaleX = myXML.lipsync_scale;
	   lip1.scaleY = myXML.lipsync_scale;
	   lip1.x = myXML.lipsync_x;	
	   lip1.y = myXML.lipsync_y;
	} 

	private function lip2Loaded(e:Event):void {		
	   addChild(lip2);
	   lip2.visible = false;	 
	   lip2.rotation = myXML.lipsync_rotation;
	   lip2.scaleX = myXML.lipsync_scale;
	   lip2.scaleY = myXML.lipsync_scale;
	   lip2.x = myXML.lipsync_x;	
	   lip2.y = myXML.lipsync_y; 
	} 
	
	private function lip3Loaded(e:Event):void {		
	   addChild(lip3);
	   lip3.visible = false;	 
	   lip3.rotation = myXML.lipsync_rotation;
	   lip3.scaleX = myXML.lipsync_scale;
	   lip3.scaleY = myXML.lipsync_scale;
	   lip3.x = myXML.lipsync_x;	
	   lip3.y = myXML.lipsync_y;  
	} 
	
	private function lip4Loaded(e:Event):void {		
	   addChild(lip4);
	   lip4.visible = false;	 
	   lip4.rotation = myXML.lipsync_rotation;
	   lip4.scaleX = myXML.lipsync_scale;
	   lip4.scaleY = myXML.lipsync_scale;
	   lip4.x = myXML.lipsync_x;	
	   lip4.y = myXML.lipsync_y;  
	} 
	
	private function lip5Loaded(e:Event):void {		
	   addChild(lip5);
	   lip5.visible = false;	 
	   lip5.rotation = myXML.lipsync_rotation;
	   lip5.scaleX = myXML.lipsync_scale;
	   lip5.scaleY = myXML.lipsync_scale;
	   lip5.x = myXML.lipsync_x;	
	   lip5.y = myXML.lipsync_y; 	 
	} 
	
	private function lip6Loaded(e:Event):void {		
	   addChild(lip6);
	   lip6.visible = false;	 
	   lip6.rotation = myXML.lipsync_rotation;
	   lip6.scaleX = myXML.lipsync_scale;
	   lip6.scaleY = myXML.lipsync_scale;
	   lip6.x = myXML.lipsync_x;	
	   lip6.y = myXML.lipsync_y; 	 
	} 
	
	private function lip7Loaded(e:Event):void {		
	   addChild(lip7);
	   lip7.visible = false;	 
	   lip7.rotation = myXML.lipsync_rotation;
	   lip7.scaleX = myXML.lipsync_scale;
	   lip7.scaleY = myXML.lipsync_scale;
	   lip7.x = myXML.lipsync_x;	
	   lip7.y = myXML.lipsync_y;  
	} 
	
	private function lip8Loaded(e:Event):void {		
	   addChild(lip8);
	   lip8.visible = false;	 
	   lip8.rotation = myXML.lipsync_rotation;
	   lip8.scaleX = myXML.lipsync_scale;
	   lip8.scaleY = myXML.lipsync_scale;
	   lip8.x = myXML.lipsync_x;	
	   lip8.y = myXML.lipsync_y;  
	} 
	
	private function lip9Loaded(e:Event):void {		
	   addChild(lip9);
	   lip9.visible = false;	 
	   lip9.rotation = myXML.lipsync_rotation;
	   lip9.scaleX = myXML.lipsync_scale;
	   lip9.scaleY = myXML.lipsync_scale;
	   lip9.x = myXML.lipsync_x;	
	   lip9.y = myXML.lipsync_y; 	 
	} 
	
	private function lip10Loaded(e:Event):void {		
		addChild(lip10);
	   lip10.visible = false;	 
	   lip10.rotation = myXML.lipsync_rotation;
	   lip10.scaleX = myXML.lipsync_scale;
	   lip10.scaleY = myXML.lipsync_scale;
	   lip10.x = myXML.lipsync_x;	
	   lip10.y = myXML.lipsync_y; 	 
	} 
	
	private function TwitterBirdLoaded(e:Event):void {		
	   addChild(TwitterBird);
	   TwitterBird.visible = false;	 
	   TwitterBird.rotation = myXML.twitterbird_image_rotate;
	   TwitterBird.scaleX = myXML.twitterbird_image_scale;
	   TwitterBird.scaleY = myXML.twitterbird_image_scale;
	  //  TwitterBird.x = myXML.weather_text_x - 500;	
	  //  TwitterBird.y = myXML.alcohol_results_text_y; 	 
	   TwitterBird.x = myXML.twitterbird_image_x;
	   TwitterBird.y = myXML.twitterbird_image_y;
	
	} 
	
	private function processSound(e:TimerEvent):void {
			
			if (myVid.playing == true) {  //the lip was loading before the video hence this check first
			
				SoundMixer.computeSpectrum(ba,true);
				var i:int;
				var j:int;
				var tempValue : Number;
				volumeTotal = 0;
				
				for (i=0; i<128; i++) {
					tempValue = 0;
					for (j=0; j<4; j++) {
						tempValue += ba.readFloat();
					}
					tempValue = tempValue/4;		
					volumeTotal = volumeTotal + int(Math.round(tempValue*100));
				}
				
				//trace ("Volume Total: " + volumeTotal);
			
				//need to make sure myVid is playing first
				
				
				
				if (volumeTotal == 0) {
						lip1.visible = true;
						lip2.visible = false;
						lip3.visible = false;
						lip4.visible = false;
						lip5.visible = false;
						lip6.visible = false;
						lip7.visible = false;
						lip8.visible = false;
						lip9.visible = false;
						lip10.visible = false;
				}
				
				 if (volumeTotal > 0 && volumeTotal <50) {
						lip1.visible = false;
						lip2.visible = true;
						lip3.visible = false;
						lip4.visible = false;
						lip5.visible = false;
						lip6.visible = false;
						lip7.visible = false;
						lip8.visible = false;
						lip9.visible = false;
						lip10.visible = false;
				}
				
				 if (volumeTotal > 50 && volumeTotal < 100) {
						lip1.visible = false;
						lip2.visible = false;
						lip3.visible = true;
						lip4.visible = false;
						lip5.visible = false;
						lip6.visible = false;
						lip7.visible = false;
						lip8.visible = false;
						lip9.visible = false;
						lip10.visible = false;
				}
				
				 if (volumeTotal > 100 && volumeTotal < 150) {
						lip1.visible = false;
						lip2.visible = false;
						lip3.visible = false;
						lip4.visible = true;
						lip5.visible = false;
						lip6.visible = false;
						lip7.visible = false;
						lip8.visible = false;
						lip9.visible = false;
						lip10.visible = false;
				}
				
				if (volumeTotal > 150 && volumeTotal < 200) {
						lip1.visible = false;
						lip2.visible = false;
						lip3.visible = false;
						lip4.visible = false;
						lip5.visible = true;
						lip6.visible = false;
						lip7.visible = false;
						lip8.visible = false;
						lip9.visible = false;
						lip10.visible = false;
				}
				
				if (volumeTotal > 200 && volumeTotal < 250) {
						lip1.visible = false;
						lip2.visible = false;
						lip3.visible = false;
						lip4.visible = false;
						lip5.visible = false;
						lip6.visible = true;
						lip7.visible = false;
						lip8.visible = false;
						lip9.visible = false;
						lip10.visible = false;
				}
				
				if (volumeTotal > 250 && volumeTotal < 300) {
						lip1.visible = false;
						lip2.visible = false;
						lip3.visible = false;
						lip4.visible = false;
						lip5.visible = false;
						lip6.visible = false;
						lip7.visible = true;
						lip8.visible = false;
						lip9.visible = false;
						lip10.visible = false;
				}
				
				if (volumeTotal > 300 && volumeTotal < 350) {
						lip1.visible = false;
						lip2.visible = false;
						lip3.visible = false;
						lip4.visible = false;
						lip5.visible = false;
						lip6.visible = false;
						lip7.visible = false;
						lip8.visible = true;
						lip9.visible = false;
						lip10.visible = false;
				}
				
				if (volumeTotal > 350 && volumeTotal < 400) {
						lip1.visible = false;
						lip2.visible = false;
						lip3.visible = false;
						lip4.visible = false;
						lip5.visible = false;
						lip6.visible = false;
						lip7.visible = false;
						lip8.visible = false;
						lip9.visible = true;
						lip10.visible = false;
				}
				
					if (volumeTotal > 400 ) {
						lip1.visible = false;
						lip2.visible = false;
						lip3.visible = false;
						lip4.visible = false;
						lip5.visible = false;
						lip6.visible = false;
						lip7.visible = false;
						lip8.visible = false;
						lip9.visible = false;
						lip10.visible = true;
				}
			}
		}
	
	private function onProgressHandler(mProgress:ProgressEvent)  {
		
		var percent:Number = mProgress.bytesLoaded/mProgress.bytesTotal;
		trace(percent);
	}
	
	private function say(value:String):void
		
		{			 
				sound_playing = 1; //set the sound playing flag so something else doesn't play			
				
				if (tts_stream !=null) {
						tts_stream = new Sound(); 
						
						if (myXML.tts_engine == "voicerss") {
							  VoiceRSSTTSLoaderCall(value);
							  playMP3say();
						}
						else if (myXML.tts_engine == "yakitome") {  //because Yakitome has a delay and it's not instant, we can't just call the playmp3 right away, we have to wait until we get the mp3 and then we'll call it from the end of the Yakitome function
							  YakitomeTTSLoader(value,"say");
						}
						else {  									//we shouldn't ever go here
							VoiceRSSTTSLoaderCall(value);
							playMP3say();
						}
				}
				
				
					//*****  old google tts code , google killed the public tts api so we had to stop using it
						//var loader:URLLoader = new URLLoader();
						//configureListeners(loader);
						////var header:URLRequestHeader = new URLRequestHeader("Referer","http://translate.google.com/");		
						//var request:URLRequest = new URLRequest();
						//if (tts_sendheader != "off") {
						//	var header:URLRequestHeader = new URLRequestHeader(tts_headername,tts_headervalue);			
						//	request = new URLRequest(generateAudioURL(value));
						//	request.method = URLRequestMethod.GET;
						//	request.requestHeaders.push(header);
						//}
						//else {
						//	request = new URLRequest(generateAudioURL(value));
						//}
						// 
						//try {
						//	loader.load(request);
						//} catch (error:Error) {
						//	trace("Unable to load TTS");
						//	//ResetVideoFlags();
						//	//return;
						//}
								
					/*	tts_stream.load(TTSrequest);
						tts_channel = tts_stream.play();						
						tts_channel.addEventListener(Event.SOUND_COMPLETE,TTSSoundDone);			
						tts_channel.addEventListener (IOErrorEvent.IO_ERROR, TTSPlayError);
										
						if (myXML.lipsync_feature == "on") {
							LipsyncTimer.addEventListener(TimerEvent.TIMER,  processSound);
							LipsyncTimer.start();
						}
					}
					else {
						trace("say tts stream was null so we had to exit out early");
						trace("went to speak tweet error handler");
						switch_mode();
						ResetVideoFlags();
					}*/
					//} catch (error:Error) {
						//trace("error loading tts_stream");
						//ResetVideoFlags();
						//return;
					//}
				
				
				
		}
		
		private function playMP3say():void {

				tts_stream.load(TTSrequest);
				tts_channel = tts_stream.play();						
				tts_channel.addEventListener(Event.SOUND_COMPLETE,TTSSoundDone);			
				tts_channel.addEventListener (IOErrorEvent.IO_ERROR, TTSPlayError);
									
				if (myXML.lipsync_feature == "on") {
					LipsyncTimer.addEventListener(TimerEvent.TIMER,  processSound);
					LipsyncTimer.start();
				}
					
				else {
					trace("say tts stream was null so we had to exit out early");
					trace("went to speak tweet error handler");
					switch_mode();
					ResetVideoFlags();
				}
			
		}
		
		private function say_breathalyzer(value:String):void
		
		{			 
				sound_playing = 1; //set the sound playing flag so something else doesn't play			
							
				tts_stream = new Sound(); 
				
				if (myXML.tts_engine == "voicerss") {
					  VoiceRSSTTSLoaderCall(value);
					  playMP3say_breathalyzer();
				}
				else if (myXML.tts_engine == "yakitome") {
					  YakitomeTTSLoader(value,"say_breathalyzer");
				}
				else {
					 VoiceRSSTTSLoaderCall(value);
					 playMP3say_breathalyzer();
				}
		}
		
	private function playMP3say_breathalyzer():void {
	
			tts_stream.load(TTSrequest);
			tts_channel = tts_stream.play();		
			tts_channel.addEventListener(Event.SOUND_COMPLETE,CustomSoundDoneBreathalyzer);	
			
			if (myXML.lipsync_feature == "on") {
				LipsyncTimer.addEventListener(TimerEvent.TIMER,  processSound);
				LipsyncTimer.start();
			}
	}
		
		
	private function generateAudioURL(value:String):String
		
		{			
			//var generatedString:String = 'http://translate.google.com/translate_tts?q=' + value + '&tl=en';			
			//var generatedString:String = 'http://translate.google.co.uk/translate_tts?q=' + value + '&tl=' + tts_language;		
			var generatedString:String = tts_url + value + '&tl=' + tts_language;				
			return generatedString;
		}
		
	private function say_breath(value:String):void //we need a separate one for the brethalyzer prompts because those should not call the ResetVideoFlags that comes from when the other sounds are done playing
		
		{			 
			sound_playing = 1; 
			tts_stream_breath = new Sound(); 
			
			if (myXML.tts_engine == "voicerss") {
				  VoiceRSSTTSLoaderCall(value);
				  playMP3say_breath();
			}
			else if (myXML.tts_engine == "yakitome") {
				  YakitomeTTSLoader(value,"say_breath");
			}
			else {
				VoiceRSSTTSLoaderCall(value);
				playMP3say_breath();
			}		
		}
		
		private function playMP3say_breath():void {
			tts_stream_breath.load(TTSrequest);
			tts_stream_breath.play();			//this one doesn't need the soundchannel because nothing needs to happen after the breathalyzer prompts sounds play
		}
		
		private function say_breath_custom_audio(value:String):void //we need a separate one for the brethalyzer prompts because those should not call the ResetVideoFlags that comes from when the other sounds are done playing
		
		{			 
			
			sound_playing = 1; //set the sound playing flag so something else doesn't play			
							
			custom_audio_sound = new Sound(); 
			var loader:URLLoader = new URLLoader();
			configureListenersVoiceRSS(loader);
			
			var request = new URLRequest(value);
				 
			try {
				loader.load(request);
			} catch (error:Error) {
				trace("Unable to load custom audio");
			}
					
			custom_audio_sound.load(request);
			custom_audio_channel = custom_audio_sound.play();						
			
		}
		
		private function TwitterInit():void   {
		///**** Now we need to authenticate
			if (twitter_authenticated == "yes") {  //then we already have done the Oath so continue
				
				
			//var request:TwitterRequest;
			//var complete:Function;

			//if (_token && _token.oauthToken.length)
			//{
				_twitter = new Twitter(myXML.twitter_consumerKey, myXML.twitter_consumerSecret, myXML.twitter_oauthToken, myXML.twitter_oauthTokenSecret);
				request = _twitter.account_verifyCredentials();
				complete = _verifyCompleteHandler;
			//} else
			//{
				//_twitter = new Twitter(myXML.twitter_consumerKey, myXML.twitter_consumerSecret);
				//request = _twitter.oauth_requestToken();
				//complete = _tokenCompleteHandler;
			//}

			_setHandlersForRequest(request, complete);
			}
			else {
				trace("twitter feature is on but oath has not been done");
				AlertManager.createAlert(this, "The Twitter feature is turned on but you have not linked your Twitter account yet. Exit this program and run the Magic Mirror Configuration program to link your Twitter account and then re-run the Magic Mirror.");
				
			}
		}
		
		private function VoiceRSSTTSLoaderCall(value:String): void {
			
			
			TTSrequest = new URLRequest(myXML.ttsrss_url);
			TTSrequest.requestHeaders = headers;
			requestVars = new URLVariables();
			requestVars.key = myXML.ttsrss_apikey;
			requestVars.src = value;
			requestVars.hl = myXML.ttsrss_language;
			requestVars.c = "MP3";
			requestVars.f = myXML.ttsrss_mp3samplerate;
			
			TTSrequest.data = requestVars;
			TTSrequest.method = URLRequestMethod.GET;
			
			TTSloader = new URLLoader();
			TTSloader.dataFormat = 'binary';  //we're downloading a raw wav file
			
			configureListenersVoiceRSS(TTSloader);  //to do should add here in case TTS bombs out
							 
			try    {
				TTSloader.load(TTSrequest);
				trace("TTS URL Loaded");
			}
			catch (error:Error)    {
				trace("Unable to load TTS URL" + error);
			}
		}
		
		
		private function say_tweet1(value:String):void   {
		
							
				if (tts_stream_tweet1 !=null) {
					sound_playing = 1;
					
					if (myXML.tts_engine == "voicerss") {
						  VoiceRSSTTSLoaderCall(value);
						  playMP3say_tweet1();
					}
					else if (myXML.tts_engine == "yakitome") {
						  YakitomeTTSLoader(value,"say_tweet1");
					}
					else {
						 VoiceRSSTTSLoaderCall(value);
						 playMP3say_tweet1();
					}	
				}	
					
					/*tts_stream_tweet1 = new Sound(); 
				
					tts_stream_tweet1.load(TTSrequest);
					tts_channel_tweet1 = tts_stream_tweet1.play();	
					
					tts_channel_tweet1.addEventListener(Event.SOUND_COMPLETE,TTSSoundDoneTweet1);	
					tts_channel_tweet1.addEventListener (IOErrorEvent.IO_ERROR, TTSPlayError);
					
					if (myXML.lipsync_feature == "on") {
						LipsyncTimer.addEventListener(TimerEvent.TIMER,  processSound);
						LipsyncTimer.start();
					}
				}
				
				else {
					trace("tts stream tweet1 was null");
					switch_mode();
					ResetVideoFlags();
				}*/
	}
	
	private function playMP3say_tweet1():void {
		
					tts_stream_tweet1 = new Sound(); 
				
					tts_stream_tweet1.load(TTSrequest);
					tts_channel_tweet1 = tts_stream_tweet1.play();	
					
					tts_channel_tweet1.addEventListener(Event.SOUND_COMPLETE,TTSSoundDoneTweet1);	
					tts_channel_tweet1.addEventListener (IOErrorEvent.IO_ERROR, TTSPlayError);
					
					if (myXML.lipsync_feature == "on") {
						LipsyncTimer.addEventListener(TimerEvent.TIMER,  processSound);
						LipsyncTimer.start();
					}
				
					else {
						trace("tts stream tweet1 was null");
						switch_mode();
						ResetVideoFlags();
					}
	}
		
		
	private function say_tweet2(value:String):void   {
		
						
				if (tts_stream_tweet2 !=null) {

					tts_stream_tweet2 = new Sound(); //add the try catch
					
						if (myXML.tts_engine == "voicerss") {
							  VoiceRSSTTSLoaderCall(value);
							  playMP3say_tweet2();
						}
						else if (myXML.tts_engine == "yakitome") {
							  YakitomeTTSLoader(value,"say_tweet2");
						}
						else {
							 VoiceRSSTTSLoaderCall(value);
							 playMP3say_tweet2();
						}	
				}		
			
		}
		
	private function playMP3say_tweet2():void {
		
				tts_stream_tweet2.load(TTSrequest);
				
				tts_channel_tweet2 = tts_stream_tweet2.play();							
				tts_channel_tweet2.addEventListener(Event.SOUND_COMPLETE,TTSSoundDoneTweet2);
				tts_channel_tweet2.addEventListener (IOErrorEvent.IO_ERROR, TTSPlayError);
				
				if (myXML.lipsync_feature == "on") {
					LipsyncTimer.addEventListener(TimerEvent.TIMER,  processSound);
					LipsyncTimer.start();
				}
				else {
						trace("tts stream tweet2 was null");
						switch_mode();
						ResetVideoFlags();
				}
	}
		
	private function _setHandlersForRequest(request:TwitterRequest, completeHandler:Function):void
		{
			request.addEventListener(TwitterRequestEvent.COMPLETE, completeHandler);
			request.addEventListener(IOErrorEvent.IO_ERROR, _errorHandler);
			request.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _errorHandler);
			request.addEventListener(TwitterErrorEvent.CLIENT_ERROR, _errorHandler);
			request.addEventListener(TwitterErrorEvent.SERVER_ERROR, _errorHandler);
		}

		private function _verifyCompleteHandler(event:TwitterRequestEvent):void
		{
			dispatchEvent(new Event(Event.COMPLETE));
			trace("We've successfully oauth'd to Twitter!");
			//tweet("hello there 2");
			
			///tweetr.addEventListener(TweetEvent.COMPLETE, handleTweetsLoaded);
				//tweetr.addEventListener(TweetEvent.FAILED, handleTweetsFail);
			tweet_button.addEventListener(MouseEvent.CLICK, Speak_Tweet_Event_MouseClick);
				
							
				
			TwitterTimer = new Timer(twitter_frequency * 1000); //its entered in seconds in the admin screen so convert to ms
			//TwitterTimer.addEventListener(TimerEvent.TIMER, GetLatestTweet);			
			TwitterTimer.addEventListener(TimerEvent.TIMER, _getTweets);		
			TwitterTimer.start();

			// check every ten minutes
			//_mentionChecker = new Timer(10000, 0);
			//_mentionChecker.addEventListener(TimerEvent.TIMER, _checkMentionsHandler);
			//_mentionChecker.start();

			//_getTweets();
			//_searchTerm();
			
		}
		
		private function _getTweets(e:TimerEvent):void
		{
			
			//var request:TwitterRequest = _twitter.statuses_mentionsTimeline(20, _mentionedSinceID);
			//var request:TwitterRequest = _twitter.statuses_homeTimeline(5, _mentionedSinceID);
			//var request:TwitterRequest = _twitter.statuses_userTimeline(_mentionedSinceID);
			//var request:TwitterRequest = _twitter.search_tweets("speakmirror");
			
			
		  trace("Entered retrieve Tweets function called _getTweets");
		  
		  var request:TwitterRequest;
			
		  if (twitter_mode == "user") {  //get tweets from anyone you follow
			  if (twitter_my_tweets_only == "on") {   //or it means just get your personal tweets
					//tweetr.getUserTimeLine(); //this gets just the tweets from the user	
					request = _twitter.statuses_userTimeline();
			  }
			  else {
				    request = _twitter.statuses_homeTimeline(1);
			  }
		  }
		  
		  if (twitter_mode == "mentions") {				  
					//tweetr.getHomeTimeLine(); //this gets all tweets from the user's login 
					trace("We are in Twitter Mentions Mode");
					request = _twitter.statuses_mentionsTimeline(1);
		  }
		  
		  if (twitter_mode == "search") {
					request = _twitter.search_tweets(twitter_search_term,null,tts_language);
		  }
		  
			//now that we know which type of tweets to get, let's now get those tweets
			_setHandlersForRequest(request, _TweetsLoadedCompleteHandler);
			
		}
		
				
		private  function _TweetsLoadedCompleteHandler(event:TwitterRequestEvent):void
		{
			
			
			/*	From the twitter library developer			

			Thank you for using my library.

			Here, mentionsTimeline, homeTimeline, and userTimeline APIs return json data which is array of statuses,
			like: [{"created_at": ...}, {"created_at": ...}]

			but searchTweets API returns object data which includes array of statuses,
			like: {"statuses": [{"created_at": ...}, {"created_at": ...}], "search_metadata": ...}

			Then the decoded data type is 'Object', and returns null at 'as Array' casting.
			If you want to do the same work of mentionsTimeline, you must do as below:

				JSON.decode(request.response as String)["statuses"] as Array

			I hope things are going well for you :)

			Susisu
			*/
			
			_mentions = new Vector.<MentionModel>;

			var request:TwitterRequest = event.currentTarget as TwitterRequest;
			
			//var mentions:Array = JSON.parse(request.response as String) as Array;
			var mentions:Array;
			
			if (twitter_mode == "user" || twitter_mode == "mentions") {
			
				mentions = JSON.parse(request.response as String) as Array;  //TO DO . look into this, it was JSON.decode 
			}
			else {  //then we're in search twitter mode
				mentions=JSON.parse(request.response as String)["statuses"] as Array; //slightly different format we need for search tweets  //TO DO . look into this, it was JSON.decode
			}
			
			var mention:MentionModel;
			//var e:TwitterControllerEvent;

			for (var i:int = 0; i < mentions.length; i++) 
			{
				mention = new MentionModel(mentions[i]);
				_mentions.push(mention);

				//trace("I got mention from: " + mention.screenName);
				//trace("with the content: " + mention.text);
				
				if (i == 0) {
					full_tweet = mention.text;
					tweet_username = mention.screenName; 
				}

				//e = new TwitterControllerEvent(TwitterControllerEvent.GOT_MENTION);
				//e.data = mention;

				//dispatchEvent(e);
			}
			
			trace (full_tweet);
			if (_mentions.length < 1)
			{
				//trace("no mentions");
				//_mentionedSinceID = MentionModel(_mentions[0]).id;
				//_saveSettings();
			}
				
			if (twitter_mode == "user") {
				 if (twitter_my_tweets_only == "on") {
						//full_tweet =  tweet.text;  //since just the user's tweets, no need to announce who the tweet is from
						full_tweet = full_tweet;
				 }
				 else {
						//full_tweet =  tweet.user.screenName + " tweeted " + tweet.text; //also announce who the tweet is from	
						full_tweet =  tweet_username + " tweeted " + full_tweet; //also announce who the tweet is from	
				 }
			}
			
			if (twitter_mode == "mentions") {	
				full_tweet = full_tweet;
				trace("Mentions mode: " + full_tweet);
			}
			
			//else {
		   if (twitter_mode == "search") {
				if (twitter_do_not_speak_search_term == "on") {
					
					//full_tweet = tweet_search.text.replace(twitter_search_term,""); //replace the search term with blank	
					//placeholdedr until search fixed
					full_tweet = full_tweet.replace(twitter_search_term,""); //replace the search term with blank	
					
				}
				else {  //speak the full tweet with the search term
					//full_tweet = tweet_search.text;
					//placeholder until search fixed
					full_tweet = full_tweet;
				}
			}
						
			var index:int = full_tweet.indexOf("http://");
			trace ("total tweet words " + index);
			
			if (index != -1) {  //the tweet contained the http:// text, otherwise just leave along and use the full text					
				full_tweet = full_tweet.substr(0,index); //cut out the http:// part of the tweet
			}
			
			tweet_text.text = full_tweet;  //tweet_text is the screen label text field
			
			if (twitter_mode == "user") {								
				//current_tweet = tweet.text;
				//tweet_username = tweet.user.screenName;
				current_tweet = full_tweet;
				tweet_username = mention.screenName;
				
			}
			else {
				//current_tweet = tweet_search.text;
				//placeholder until search fixed
				current_tweet = full_tweet;
			}
			
			//now let's check if the tweet if over 100 chars, if not, then we don't need to do anything
			//if that is the case, call the normal say routine
			//if not the case, then need to call the special twitter say routines to handle over 100 chars
			
			//so check how many chars here  
			
			trace ("total characters is " + full_tweet.length);
			
			if (full_tweet.length > 100) {
				tweet_over_100 = 1;
				tweet_array = full_tweet.split(" ");
				trace (tweet_array.length);
				var tweet1_num_words:int = tweet_array.length/2;
				trace ("tweet1 num words: " + tweet1_num_words);
				var tweet2_num_words:int = (tweet_array.length - tweet1_num_words);
				trace ("tweet2 num words: " + tweet2_num_words);
				
				var tweet1_array:Array = new Array();
				var tweet2_array:Array = new Array();
				
				for (var i:int = 0; i < tweet1_num_words; i++) {
					tweet1_array.push(tweet_array[i]); //push just the first half into this new array
				}
				
				for (var x:int = tweet1_num_words; x < tweet_array.length; x++) {
					tweet2_array.push(tweet_array[x]); //push the second half into this new array
				}
				
				tweet1_text = tweet1_array.join(" ");
				tweet1_text = tweet1_text.substr(0,100); //make sure it's not over 100 chars
				trace ("first tweet text is: " + tweet1_text);
				
				tweet2_text = tweet2_array.join(" ");
				tweet2_text = tweet2_text.substr(0,100); //make sure it's not over 100 chars
				trace ("second tweet text is: " + tweet2_text);
				
			}
			else {
				tweet_over_100 = 0;
			}
			
			if (full_tweet.length != 0) {  //this would happen if http:// is the first part of the tweet
				Speak_Tweet_Event(); //now let's play it if nothing else is playing
			}
			
		}
		
		public function tweet(message:String):void
		{
			trace("Tweet: " + message);

			var request:TwitterRequest = _twitter.statuses_update(message);
			_setHandlersForRequest(request, _tweetCompleteHandler);
		}
		

		private function _tweetCompleteHandler(event:TwitterRequestEvent):void
		{
			trace("tweet send")
		}

		private function _errorHandler(event:Event):void //twitter event error handled
		{
			trace(event.type);
			trace("we had a twitter IO event error");

			if (event is TwitterErrorEvent)
			{
				trace(TwitterErrorEvent(event).statusCode.toString());
			}
			
			ResetVideoFlags();
			
		}
		
		public function YakitomeTTSLoader(value:String, functionToCall:String) {
			
			
			/*Here's home the Yakitome API works
			First we have to make a request and then the book id is returned
			Then we have to check if the MP3 is ready, we do this with a Timer and make calls until MP3 is ready
			Once the MP3 is ready, we get a URL returned to us with the MP3 file
			Then lastly we load this MP3 and now have it in Flash */
			
			//The possibles voices are:{"free": {"German": [["de", "Female", "Klara"], ["de", "Male", "Reiner"]], "Spanish": [["es", "Male", "Alberto"]], "French": [["ca", "Male", "Arnaud"], ["fr", "Female", "Juliette"], ["fr", "Male", "Alain"]], "English": [["gb", "Female", "Anjali"], ["gb", "Female", "Audrey"], ["us", "Female", "Crystal"], ["us", "Female", "Julia"], ["us", "Female", "Lauren"], ["us", "Female", "Randy"], ["us", "Male", "Dave"], ["us", "Male", "Mike"]]}
			 

			_functionToCall = functionToCall; //we need this later so had to make it global
			
			YakitomeURLRequest = new URLRequest(myXML.ttsyakitome_resturl);
			YakitomeURLRequest.requestHeaders = YakitomeURLHeader;
			
			YakitomeURLRequestVars = new URLVariables();
			YakitomeURLRequestVars.api_key = myXML.ttsyakitome_api_key;
			//YakitomeURLRequestVars.api_key = "4353452345";
			YakitomeURLRequestVars.text = value;
			YakitomeURLRequestVars.voice = myXML.ttsyakitome_voice;
			YakitomeURLRequestVars.speed = myXML.ttsyakitome_speed;
			
			YakitomeURLRequest.data = YakitomeURLRequestVars;
			// set the request's method to POST
			YakitomeURLRequest.method = URLRequestMethod.GET;
			 
			// build the loader..
			YakitomeURLLoader = new URLLoader();
			 
			// set the format to text (or whatever you want. URLRequest can be used with other objects too)
			YakitomeURLLoader.dataFormat = URLLoaderDataFormat.TEXT;
			 
			configureListenersYakitome(YakitomeURLLoader);
			 
			try    {
				YakitomeURLLoader.load(YakitomeURLRequest);
                trace("Loaded:" + YakitomeURLRequest);
            }
            catch (error:Error)    {
                trace("Unable to load URL" + error);
            }
		}
		
		private function configureListenersYakitome(dispatcher:IEventDispatcher):void {
				dispatcher.addEventListener(Event.COMPLETE, YakitomecompleteHandler);
				dispatcher.addEventListener(Event.OPEN, YakitomeopenHandler);
				dispatcher.addEventListener(ProgressEvent.PROGRESS, YakitomeprogressHandler);
				dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, YakitomesecurityErrorHandler);
				dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, YakitomehttpStatusHandler);
				dispatcher.addEventListener(IOErrorEvent.IO_ERROR, YakitomeioErrorHandler);
        }

        private function YakitomecompleteHandler(event:Event):void {
			removeEventListener(Event.COMPLETE, YakitomecompleteHandler);
			removeEventListener(Event.COMPLETE, YakitomeopenHandler);
			removeEventListener(Event.COMPLETE, YakitomeprogressHandler);
			removeEventListener(Event.COMPLETE, YakitomesecurityErrorHandler);
			removeEventListener(Event.COMPLETE, YakitomehttpStatusHandler);
			removeEventListener(Event.COMPLETE, YakitomeioErrorHandler);
			
			trace("compete Handler");
			
			YakitomeResponse = event.target.data as String;
			trace(YakitomeResponse);
			
			bookIDData = JSON.parse(YakitomeResponse);
			trace("The answer is " + bookIDData.eta+" ; "+ bookIDData.msg+" ; "+bookIDData.book_id);
			
			//https://www.yakitome.com/api/rest/status?api_key=qha4ndDY1amd3_BCGuD65HO&book_id=1806397
			//https://www.yakitome.com/api/rest/audio?api_key=qha4ndDY1amd3_BCGuD65HO&book_id=1806298&format=mp3
			
			if (bookIDData.msg == "INVALID API_KEY") {
				trace ("Yakitome API key is wrong");
				AlertManager.createAlert(this, "The Text to Speech Internet call failed. Either the credits for this demo account from our Internet Text to Speech provider, Yakitome, have been used up or it's an incorrect key." + "\n" + "Please go to http://www.yakitome.com/ and create an account for you (it's free as long as your usage is not high volume). Enter your API key in either the DIY Magic Mirror Advanced or Basic Config programs, add your API Key in the Voice RSS API Key Field, and then re-start this program.");
			}
			
			else {
				//we need to add a delay here
				TTSBookIDTimer = new Timer(500, 100);  //we'll call it 100 times every 1/2 second until it's done processing
				TTSBookIDTimer.addEventListener(TimerEvent.TIMER, TTSBookIDTimerDone);
				TTSBookIDTimer.start();
			}
			
		}
		
		private function TTSBookIDTimerDone(e:TimerEvent):void{
				 trace("Times Fired: " + e.currentTarget.currentCount);
				 trace("Time Delayed: " + e.currentTarget.delay);
			
				// set the headers on the URLRequest object
				YakitomeURLRequest = new URLRequest(myXML.ttsyakitome_audiourl);
				YakitomeURLRequest.requestHeaders = YakitomeURLHeader;
				YakitomeURLRequestVars = new URLVariables();
				YakitomeURLRequestVars.api_key = myXML.ttsyakitome_api_key;
				YakitomeURLRequestVars.book_id = bookIDData.book_id;
				YakitomeURLRequestVars.format = "mp3";
				
				YakitomeURLRequest.data = YakitomeURLRequestVars;
				trace(YakitomeURLRequest.data);
				YakitomeURLRequest.method = URLRequestMethod.GET;
				 
				// build the loader..
				YakitomeURLLoader = new URLLoader();
				YakitomeURLLoader.dataFormat = URLLoaderDataFormat.TEXT;
				 
				YakitomeconfigureListenersBookID(YakitomeURLLoader);
				 
				try    {
					YakitomeURLLoader.load(YakitomeURLRequest);
					trace("Loaded TTS MP3 Status:");
				}
				catch (error:Error)    {
					trace("Unable to load URL" + error);
				}
        }
		
		 private function YakitomeopenHandler(event:Event):void {
            trace("openHandler: " + event);
        }

        private function YakitomeprogressHandler(event:ProgressEvent):void {
            trace("Yakitome progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
        }

        private function YakitomesecurityErrorHandler(event:SecurityErrorEvent):void {
            trace("securityErrorHandler: " + event);
        }

        private function YakitomehttpStatusHandler(event:HTTPStatusEvent):void {
            trace("httpStatusHandler: " + event);
        }

        private function YakitomeioErrorHandler(event:IOErrorEvent):void {
            trace("ioErrorHandler: " + event);
        }	
		
		
		private function YakitomeconfigureListenersBookID(dispatcher:IEventDispatcher):void {
				dispatcher.addEventListener(Event.COMPLETE, YakitomecompleteHandlerBookID);
				dispatcher.addEventListener(Event.OPEN, YakitomeopenHandlerBookID);
				dispatcher.addEventListener(ProgressEvent.PROGRESS, YakitomeprogressHandlerBookID);
				dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, YakitomesecurityErrorHandlerBookID);
				dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, YakitomehttpStatusHandlerBookID);
				dispatcher.addEventListener(IOErrorEvent.IO_ERROR, YakitomeioErrorHandlerBookID);
        }
		
		private function YakitomehttpStatusHandlerBookID(event:Event):void {
			 trace("book id http status handler: " + event);
		}	
		
		private function YakitomeioErrorHandlerBookID(event:Event):void {
			 trace("book id io error handler");
		}	
		
		private function YakitomeopenHandlerBookID(event:Event):void {
            trace("book id openHandler: " + event);
        }

        private function YakitomeprogressHandlerBookID(event:ProgressEvent):void {
            trace("book idprogressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
        }

        private function YakitomesecurityErrorHandlerBookID(event:SecurityErrorEvent):void {
            trace("book id securityErrorHandler: " + event);
        }

        private function YakitomecompleteHandlerBookID(event:Event):void {
			
			YakitomeResponse = event.target.data as String;
			trace(YakitomeResponse);
			
			TTSmp3Status = JSON.parse(YakitomeResponse);
			trace("ttsmp3status " + TTSmp3Status.status + " " + TTSmp3Status.audios);
			
			if (TTSmp3Status.status == "TTS DONE") {
				
				TTSBookIDTimer.stop();
				
				//now let's play the mp3
				
				TTSrequest = new URLRequest(TTSmp3Status.audios);
				 
				// build the loader..
				YakitomeURLLoader = new URLLoader();
				YakitomeURLLoader.dataFormat = 'binary'; 
				 
				YakitomeconfigureListenersMP3Play(YakitomeURLLoader);
				 
				try    {
					// load the request..
					YakitomeURLLoader.load(TTSrequest);
					trace("Loaded TTS MP3 Status:");
				}
				catch (error:Error)    {
					trace("Unable to load URL" + error);
				}
				
				//now we have the MP3 so let's call the appropriate funciton to play it, each respective function will have it's own post handler
				
				switch(_functionToCall)
					{
					  case "say":
						playMP3say();
					  break;
					  case "say_breathalyzer":
						playMP3say_breathalyzer();
					  break;
					  case "say_breath":
						  playMP3say_breath();
					  break;
					  case "say_tweet1":
						  playMP3say_tweet1();
					  break;
					  case "say_tweet2":
						  playMP3say_tweet2();
					  break;
					  default:
						 trace("From Yakitome switch statement, could not find a matching TTS MP3 call to go to");
					}
				
			}
		}	
		
	
		private function YakitomeconfigureListenersMP3Play(dispatcher:IEventDispatcher):void {
				dispatcher.addEventListener(Event.COMPLETE, YakitomecompleteHandlerMP3Play);
				dispatcher.addEventListener(Event.OPEN, YakitomeopenHandlerMP3Play);
				dispatcher.addEventListener(ProgressEvent.PROGRESS, YakitomeprogressHandlerMP3Play);
				dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, YakitomesecurityErrorHandlerMP3Play);
				dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, YakitomehttpStatusHandlerMP3Play);
				dispatcher.addEventListener(IOErrorEvent.IO_ERROR, YakitomeioErrorHandlerMP3Play);
        }
		
		private function YakitomehttpStatusHandlerMP3Play(event:Event):void {
			 trace("mp3 play http status" + event);
		}	
		
		private function YakitomeioErrorHandlerMP3Play(event:Event):void {
			 trace("io error for mp3 play");
		}	
		
		private function YakitomeopenHandlerMP3Play(event:Event):void {
            trace("mp3 play book id openHandler: " + event);
        }

        private function YakitomeprogressHandlerMP3Play(event:ProgressEvent):void {
            trace("mp3 play progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
        }

        private function YakitomesecurityErrorHandlerMP3Play(event:SecurityErrorEvent):void {
            trace("book id securityErrorHandler: " + event);
        }

        private function YakitomecompleteHandlerMP3Play(event:Event):void {
			trace("mp3 played complete handler");
			removeEventListener(Event.COMPLETE, YakitomecompleteHandlerBookID);
			removeEventListener(Event.COMPLETE, YakitomeopenHandlerBookID);
			removeEventListener(Event.COMPLETE, YakitomeprogressHandlerBookID);
			removeEventListener(Event.COMPLETE, YakitomesecurityErrorHandlerBookID);
			removeEventListener(Event.COMPLETE, YakitomehttpStatusHandlerBookID);
			removeEventListener(Event.COMPLETE, YakitomeioErrorHandlerBookID);
			
			removeEventListener(Event.COMPLETE, YakitomecompleteHandlerMP3Play);
			removeEventListener(Event.COMPLETE, YakitomeopenHandlerMP3Play);
			removeEventListener(Event.COMPLETE, YakitomeprogressHandlerMP3Play);
			removeEventListener(Event.COMPLETE, YakitomesecurityErrorHandlerMP3Play);
			removeEventListener(Event.COMPLETE, YakitomehttpStatusHandlerMP3Play);
			removeEventListener(Event.COMPLETE, YakitomeioErrorHandlerMP3Play);
				
		}


		
	// private function GetLatestTweet(e:TimerEvent):void {
				       //twitter_mode is user or search
	  
		//  if (twitter_mode == "user") {
		  
				//  if (twitter_my_tweets_only == "on") {
					//	tweetr.getUserTimeLine(); //this gets just the tweets from the user						  
				  //}
				  //else {					  
					//	tweetr.getHomeTimeLine(); //this gets all tweets from the user's login 
				  //}
				  
				 // tweet("This test means sending tweets work");
				  
		  //}
		  
		 // else {
			  	
				//tweetr.search(twitter_search_term,tts_language);  
				  //public function search(searchString:String, lang:String = null, numTweets:Number = 15, page:Number = 1, since_id:Number = 0, geocode:String = null):void
		  //}
		  		  
	  //} 
       
   //  private function handleTweetsLoaded(event:TweetEvent):void
     //       {
               
       //         if (twitter_mode == "user") {				
					//var tweet:StatusData = event.responseArray[0] as StatusData;
				//}
				//else {  //then we're in search mode so use this instead
				//	var tweet_search:SearchResultData = event.responseArray[0] as SearchResultData;
				//}
                
                // load the users avatar image
               //avatar.load(tweet.user.profileImageUrl);				
				//tweet_text.text = "@"+tweet.user.screenName + tweet.text + " " + TweetUtil.returnTweetAge(tweet.createdAt);
				 
				
				//if (twitter_mode == "user") {
					// if (twitter_my_tweets_only == "on") {
							//full_tweet =  tweet.text;  //since just the user's tweets, no need to announce who the tweet is from
					// }
					 //else {
							//full_tweet =  tweet.user.screenName + " tweeted " + tweet.text; //also announce who the tweet is from						 
					 //}
		//		}
			//	else {
				//	if (twitter_do_not_speak_search_term == "on") {
						//full_tweet = tweet_search.text;
						//full_tweet = full_tweet.replace(twitter_search_term,""); //replace the search term with blank	
			//			full_tweet = tweet_search.text.replace(twitter_search_term,""); //replace the search term with blank	
				//	}
				//	else {  //speak the full tweet with the search term
					//	full_tweet = tweet_search.text;
				//	}
			//	}
						
		//		var index:int = full_tweet.indexOf("http://");
			//	trace ("total tweet words " + index);
				
		//		if (index != -1) {  //the tweet contained the http:// text, otherwise just leave along and use the full text					
				//	full_tweet = full_tweet.substr(0,index); //cut out the http:// part of the tweet
		//		}
				
		//		tweet_text.text = full_tweet;				
				
			//	if (twitter_mode == "user") {								
			//		current_tweet = tweet.text;
			//		tweet_username = tweet.user.screenName;
			//	}
			//	else {
				//	current_tweet = tweet_search.text;
			//	}
				
				//now let's check if the tweet if over 100 chars, if not, then we don't need to do anything
				//if that is the case, call the normal say routine
				//if not the case, then need to call the special twitter say routines to handle over 100 chars
				
				//so check how many chars here  
				
		//		trace ("total characters is " + full_tweet.length);
				
		//		if (full_tweet.length > 100) {
				//	tweet_over_100 = 1;
			//		tweet_array = full_tweet.split(" ");
			//		trace (tweet_array.length);
				//	var tweet1_num_words:int = tweet_array.length/2;
		//			trace ("tweet1 num words: " + tweet1_num_words);
				//	var tweet2_num_words:int = (tweet_array.length - tweet1_num_words);
			//		trace ("tweet2 num words: " + tweet2_num_words);
					
			//		var tweet1_array:Array = new Array();
			//		var tweet2_array:Array = new Array();
					
			//		for (var i:int = 0; i < tweet1_num_words; i++) {
				//		tweet1_array.push(tweet_array[i]); //push just the first half into this new array
			//		}
					
			//		for (var x:int = tweet1_num_words; x < tweet_array.length; x++) {
				//		tweet2_array.push(tweet_array[x]); //push the second half into this new array
		//			}
					
			//		tweet1_text = tweet1_array.join(" ");
				//	tweet1_text = tweet1_text.substr(0,100); //make sure it's not over 100 chars
			//		trace ("first tweet text is: " + tweet1_text);
					
				//	tweet2_text = tweet2_array.join(" ");
				//	tweet2_text = tweet2_text.substr(0,100); //make sure it's not over 100 chars
				//	trace ("second tweet text is: " + tweet2_text);
					
			//	}
			//	else {
				//	tweet_over_100 = 0;
			//	}
				
		//		if (full_tweet.length != 0) {  //this would happen if http:// is the first part of the tweet
				//	Speak_Tweet_Event(); //now let's play it if nothing else is playing
			//	}
				
           // }
			
              
        
            private function Speak_Tweet_Event_MouseClick(event:MouseEvent):void {
				if (sound_playing == 0 && video_playing == 0) {
					
						if (webcamfound == 1 && idle_videos == "off") {  //t
							webcamvideo.visible = false; //turn webcam back on now that's we've played
							_detectionTimer.stop();
						}
						
						//myVid.play(weather_good_cliptts);
						
						if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(weather_good_cliptts);
						}
						
						if (tweet_over_100 == 1) {					
							say_tweet1(tweet1_text);
						}
						else say(full_tweet);
					
				}
				
			}
			
			private function Speak_Tweet_Event():void {
				if (sound_playing == 0 && video_playing == 0) {
					if (last_tweet != current_tweet) { //this means we haven't played the last tweet yet so play it now
						
						if (webcamfound == 1 && idle_videos == "off") {  //t
							webcamvideo.visible = false; //turn webcam back on now that's we've played
							_detectionTimer.stop();
						}
						
						
						//myVid.play(weather_good_cliptts); //this was a bug, there was no tts piece to kick in if twitter and tts on
						
												
						if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(weather_good_cliptts);
						}
						
						if (tweet_over_100 == 1) {	//then we need to do tts due to the google api limitation of only 100 chars at a time				
							//say_tweet1(tweet1_text); //add try catch
							
							try {
								say_tweet1(tweet1_text); //add try catch
							} catch (error:Error) {
								trace("Unable speak tweet");
								ResetVideoFlags();
								return;
							}	
							
						}
						//else say(full_tweet);  //then the tweet is less than 100 chars, add try catch
						else
						try {
								say(full_tweet);
							} catch (error:Error) {
								trace("Unable speak tweet");
								ResetVideoFlags();
								return;
							}	
						
						
					}
					else {
						trace("no new tweets so not playing anything");
					}
					
					last_tweet = current_tweet;
				}
				
			}
			
			/*private function handleTweetsFail(event:TweetEvent):void
            {
                trace ("Twiiter Call Failed");
            }	*/
	
	
	private function generateAudioURL_breath(value:String):String
		
		{			
			//var generatedString:String = 'http://translate.google.com/translate_tts?q=' + value + '&tl=en';			
			//var generatedString_breath:String = 'http://translate.google.com/translate_tts?q=' + value + '&tl=' + tts_language;			
			var generatedString_breath:String = tts_url + value + '&tl=' + tts_language;		
			return generatedString_breath;
		}	
		
	  private function configureListenersVoiceRSS(dispatcher:IEventDispatcher):void {
             dispatcher.addEventListener(IOErrorEvent.IO_ERROR, VoiceRSSioErrorHandler);
			 dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, VoiceRSSsecurityErrorHandler);
			 dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, VoiceRSShttpStatusHandler);
			 //dispatcher.addEventListener(IOErrorEvent.IO_ERROR, VoiceRSSioErrorHandler);
		     dispatcher.addEventListener(ProgressEvent.PROGRESS, VoiceRSSprogressHandler);
		     dispatcher.addEventListener(Event.COMPLETE, VoiceRSScompleteHandler);
        }   
		
	  private function configureListenersCustomAudio(dispatcher:IEventDispatcher):void {
             dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandlerCustomAudio);
        }    
		
	  private function configureListenersInternetCheck(dispatcher:IEventDispatcher):void {
            dispatcher.addEventListener(Event.COMPLETE, completeHandlerInternetCheck);
            dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandlerInternetCheck);
        }

       private function completeHandlerInternetCheck(event:Event):void {
            var loader:URLLoader = URLLoader(event.target);
            //trace("completeHandler: " + loader.data);
			trace("have internet");
			internet = 1;
        }

       private function ioErrorHandlerInternetCheck(event:IOErrorEvent):void {
            trace("ioErrorHandler: " + event);
			trace("no internet");
			internet = 0;
			WarningMessageFormat.color = 0xFF0033;  //red
			WarningMessage.defaultTextFormat = WarningMessageFormat;  //need to apply this again since we changed the color			
			WarningMessage.visible = true;		
			WarningMessage.text = "No Internet connection was detected. Some Magic Mirror functions such as weather, stock, text to speech, Twitter... will not work without the Internet";			
			
			WarningMessageClearTimer.start(); //clears the warning text
        }

       private function VoiceRSSioErrorHandler(event:IOErrorEvent):void {
            trace("TTSioErrorHandler: " + event);
			//sometimes tts gives a hiccup but continues to work so let's not show this
			//mirror_did_not_init_text.text = "I could not access the Web based Text to Speech API, please check your Internet connection";
			//mirror_did_not_init_text.visible = true;
			//TextClearTimer.start();  //this timer will clear the text
			//also since we bombed out, reset everything
			trace("went to the tts mode io Error handler");
			switch_mode();
			ResetVideoFlags();
        }
		
		private function VoiceRSScompleteHandler(event:Event):void {  //this gets called after the TTS API call. If the total bytes returned is too small, then it means this call didn't go as planned
			  
			 if (TTSTotalBytes < 50) {
					trace("TTS failed, most likely the TTS engine API key is used up or wrong, check that");
				    AlertManager.createAlert(this, "The Text to Speech Internet call failed. Most likely this is because the credits for this demo account from our Internet Text to Speech provider, VoiceRSS, have been used up." + "\n" + "Please go to http://www.voicerss.org/ and create an account for you (it's free as long as your usage is not high volume). Enter your API key in either the DIY Magic Mirror Advanced or Basic Config programs, add your API Key in the Voice RSS API Key Field, and then re-start this program.");
				  	switch_mode();
					ResetVideoFlags();
			  }
		}
		
		private function VoiceRSSsecurityErrorHandler(event:SecurityErrorEvent):void {

            trace("securityErrorHandler: " + event);
			trace("went to the tts mode io Security Error handler");
        
		}

        private function VoiceRSShttpStatusHandler(event:HTTPStatusEvent):void {
            trace("httpStatusHandler: " + event);
			trace("went to the tts mode io http status handler");
		}
		
		 private function VoiceRSSprogressHandler(event:ProgressEvent):void {
            trace("VoiceRSS MP3 progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
			TTSTotalBytes = TTSTotalBytes + event.bytesTotal;
        }
		
		 private function ioErrorHandlerCustomAudio(event:IOErrorEvent):void {
          	mirror_did_not_init_text.text = "Could not load the Custom MP3s, please check the file names in the custom_audio directory are correct";
			mirror_did_not_init_text.visible = true;
			TextClearTimer.start();  //this timer will clear the text
			//also since we bombed out, reset everything
			switch_mode();
			ResetVideoFlags();
        }
		
		
	
	private function stock_no_arduino_event (event:MouseEvent):void {
		stock_image_sprite.visible = false;
		weather_image_sprite.visible = false;
		
		if (webcamfound == 1 && idle_videos == "off") {
			webcamvideo.visible = false; //turn webcam back on now that's we've played
			//frame.visible = false;
			_detectionTimer.stop();
		}
		
		stockUpdate();
	}
	
	private function weather_no_arduino_event (event:MouseEvent):void {
		stock_image_sprite.visible = false;
		weather_image_sprite.visible = false;
		
		if (webcamfound == 1 && idle_videos == "off") {
			webcamvideo.visible = false; //turn webcam back on now that's we've played
			//frame.visible = false;
			_detectionTimer.stop();
		}
		
		weatherUpdate();
	}
	
	private function weatherUpdate():void {
		if (webcamfound == 1 && idle_videos == "off") {
			webcamvideo.visible = false; 
			_detectionTimer.stop();
		}	
		
		if (weather_woeid == "" || null) {
			weather_woeid = "202488836";
		}
		
		//https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%3D%202488836&diagnostics=true  this is the original rest call
		
		if (weather_woeid != "") {  //a woeid was entered so use that
			
			//WeatherLoader.load(new URLRequest("http://weather.yahooapis.com/forecastrss?w=" + weather_woeid + "&u=" + weather_reading));
			WeatherLoader.load(new URLRequest("http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%3D%20" + weather_woeid + "&diagnostics=true"));
		}		
		//else {		//just a us zip code, no woeid
			//WeatherLoader.load(new URLRequest("http://weather.yahooapis.com/forecastrss?p=" + weather_zip + "&u=" + weather_reading));	
			//WeatherLoader.load(new URLRequest("http://weather.yahooapis.com/forecastrss?p=" + weather_zip + "&u=" + weather_reading));
			
		//}
	}
		
	private function WeatherXMLLoaded(evt:Event):void //triggered when file was loaded
		{
			var which_forecast:int=0;
			//which_forecast = 1;
			var Now:Date = new Date();
			var now_hour = Now.getHours();
						
			if (int(now_hour) > int(forecast_cutoff)) { //then do tomorrow's forecast
				which_forecast = 1;
			}
			else which_forecast = 0;			//didn't meet cut-off time so do today's forecast
			
			var weatherXML:XML = new XML(WeatherLoader.data);
			weatherXML.ignoreWhite = true;
			var yweather:Namespace = new Namespace("http://xml.weather.yahoo.com/ns/rss/1.0");
			var temp_high:String;
			var temp_low:String;
			var temp_day:String;
			var temp_date:String;
			var temp_text:String;
			
			for each (var item:XML in weatherXML..item) {
		
				var itemTitle:String = item.title.toString();
				//trace (itemTitle);
				var itemDescription:String = item.description.toString();				
				
				if (which_forecast == 1) {
					weather_code = item.yweather::forecast[1].@code.toString();
					temp_high = item.yweather::forecast[1].@high.toString();
					weather_high = item.yweather::forecast[1].@high;
					temp_low = item.yweather::forecast[1].@low.toString();
					temp_day = item.yweather::forecast[1].@day.toString();
					temp_date = item.yweather::forecast[1].@date.toString();
					temp_text= item.yweather::forecast[1].@text.toString();
				}
				else {
					weather_code = item.yweather::forecast[0].@code.toString();
					weather_high = item.yweather::forecast[0].@high;
					temp_high = item.yweather::forecast[0].@high.toString();
					temp_low = item.yweather::forecast[0].@low.toString();
					temp_day= item.yweather::forecast[0].@day.toString();
					temp_date = item.yweather::forecast[0].@date.toString();
					temp_text= item.yweather::forecast[0].@text.toString(); 					
				}
				
				var html_text:String = item.description.toString();
				trace ("weather code= " + weather_code);
				trace ("weather high= " + weather_high);
				
				WeatherText.text = ("For " + temp_date + "," + "  the forecast is " + temp_text + " with a high of " + temp_high + " and a low of " + temp_low + "." + "  Weather Code: " + weather_code);
				WeatherForecastText = (temp_text + "," + " High: " + temp_high + " Low: " + temp_low);
				WeatherForecastTextTTS = (temp_text + ", with a" + " High of " + temp_high + "and a Low of " + temp_low);
				Weather.textField.background = true;
				Weather.textField.backgroundColor = 0xFFFFDD;
				Weather.htmlText = html_text;
				//Weather.rotation = 180;
				//pictLdr.contentLoaderInfo.addEventListener(Event.COMPLETE,imgLoaded); //event for loading yahoo weather image
				if (display_weather_image == "on") {
					pictLdr.load(new URLRequest(weather_images_url + String(weather_code) + "d.png"));  //load the yahoo weather icon graphic
					}
				else {  //skip loading the image
					weather();
				}

			}
		}
		
		private function imgLoaded(event:Event):void
		{
			if (weatherImageDisplayedFlag == 0) {
				var theImage:DisplayObject = pictLdr.content; //have to do this due to some weird AS3 problem, documented here http://blog.morscad.com/code-snippets/argumenterror-error-2025-the-supplied-displayobject-must-be-a-child-of-the-caller/comment-page-1/#comment-3938
				pictLdr.unload();
				weather_image = theImage as Bitmap;			
				weather_image.visible = false;			
				addChild(weather_image);				
				weather_image.x = weather_image_x;   //200 default for landscape
				weather_image.y = weather_image_y;   //150 default for landscape
				weather_image.rotation = weather_image_rotation;  //0 default for landscape
				weather_image.scaleX = weather_image_scale;
				weather_image.scaleY = weather_image_scale;			
			}
			weatherImageDisplayedFlag = 1;
			weather(); //now call the weather function to play the weather video and show image, the error handler function will also call it in the event this image load fails
		}
			
				
		private function stock_image_no_arduino_event(event:Event):void
		{
            var loaderStock:Loader = Loader(event.target.loader);
           	stock_image_no_arduino = Bitmap(loaderStock.content);
			stock_image_sprite.addChild(stock_image_no_arduino);
			addChild(stock_image_sprite);
			stock_image_sprite.x = weather_image_x;   
			stock_image_sprite.y = weather_image_y;  						
			stock_image_sprite.addEventListener(MouseEvent.CLICK, stock_no_arduino_event);
		}
		
		
		private function weather_image_no_arduino_event(event:Event):void
		{
            var loader:Loader = Loader(event.target.loader);
            weather_image_no_arduino = Bitmap(loader.content);
			weather_image_sprite.addChild(weather_image_no_arduino);
			addChild(weather_image_sprite);          	
			weather_image_sprite.x = stock_text_x;   
			weather_image_sprite.y = stock_text_y;   
			weather_image_sprite.rotation = weather_image_rotation;  
			weather_image_sprite.scaleX = weather_image_scale;
			weather_image_sprite.scaleY = weather_image_scale;					
			weather_image_sprite.addEventListener(MouseEvent.CLICK, weather_no_arduino_event);		
			
		}
		
		private function weather():void {
		stockweatherplaying = 1;
		//myVid.visible = true;
				
		switch (weather_code)  //sets the video playlists based on the mode
					{
				case "0": //tornado							
					weather_rain();					
					break;
				case "1": //tropical storm					
					weather_rain();
					break;
				case "2": //hurricane					
					weather_rain();
					break;
				case "3": //severe thunderstorms					
					weather_rain();
					break;
				case "4": //thunderstorms					
					weather_rain();
					break;
				case "5": //mixed rain and snow
					weather_rain();
					break;
				case "6": //mised rain and sleet
					weather_rain();
					break;
				case "7": //mised snow and sleet
					weather_rain();
					break;
				case "8": //freezing drizzle
					weather_rain();
					break;
				case "9": //drizzle
					weather_rain();
					break;
				case "10": //freezing rain
					weather_rain();
					break;
				case "11": //showers
					weather_rain();
					break;	
				case "12": //showers
					weather_rain();
					break;	
				case "13": //snow flurries
					weather_rain();
					break;	
				case "14": //light snow showers
					weather_rain();
					break;	
				case "15": //blowing snow
					weather_rain();
					break;
				case "16": //snow
					weather_rain();
					break;
				case "17": //hail
					weather_rain();
					break;
				case "18": //sleet
					weather_rain();
					break;
				case "19": //dust
					weather_good();
					break;
				case "20": //foggy
					weather_good();
					break;
				case "21": //haze
					weather_good();
					break;
				case "22": //smoky
					weather_good();
					break;
				case "23": //blustery
					weather_good();
					break;
					break;
				case "24": //windy
					weather_good();
					break;
				case "25": //cold
					weather_good();
					break;
				case "26": //cloudy
					weather_good();
					break;
				case "27": //mostly cloudy (day)
					weather_good();
					break;
				case "28": //mostly cloudy (night)
					weather_good();
					break;
				case "29": //partly cloudy (night)
					weather_good();
					break;
				case "30": //partly cloudy (day)
					weather_good();
					break;
				case "31": //clear (night)
					weather_good();
					break;
				case "32": //sunny
					weather_good();
					break;
				case "33": //fair (night)
					weather_good();
					break;
				case "34": //fair (day)
					weather_good();
					break;
				case "35": //mixed rain and hail
					weather_rain();
					break;
				case "36": //hot
					weather_good();
					break;
				case "37": //isoldated thunderstorms
					weather_rain();
					break;
				case "38": //scattered thunderstorms
					weather_rain();
					break;
				case "39": //scattered thunderstorms
					weather_rain();
					break;
				case "40": //scattered showers
					weather_rain();
					break;
				case "41": //heavy snow
					weather_rain();
					break;	
				case "42": //scattered snow showers
					weather_rain();
					break;	
				case "43": //heavy snow
					weather_rain();
					break;	
				case "44": //partly cloudy
					weather_good();
					break;
				case "45": //thundershowers
					weather_rain();
					break;
				case "46": //snow showers
					weather_rain();
					break;
				case "47": //isoldated thundershowers
					weather_rain();
					break;	
				case "3200": //not available
					
					if (mode_select == "tts_mode") {							
						if (custom_audio == "on") {
							say_custom_audio(weather_ok_mp3);
						}
						else {
							say(weather_ok_tts + " " + String(WeatherForecastTextTTS));
						}						
						if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(weather_good_clip);
						}
					}	
					else {myVid.play(weather_good_clip);}			
					
					if (LED_mode != "fire" && stand_alone != "on") {
						a.writeDigitalPin(LED1_pin, Arduino.LOW); //turn it off to start
						a.writeDigitalPin(LED2_pin, Arduino.LOW); //turn it off to start
						a.writeDigitalPin(LED3_pin, Arduino.HIGH); //turn it off to start
						a.writeDigitalPin(LED4_pin, Arduino.LOW); //turn it off to start		
					}
					break;
				default:
					if (mode_select == "tts_mode") {
							say(no_internet_tts);
					}
					myVid.play(no_internet_clip);								
				}	//end case			
			
				WeatherDisplayTextTimer.start(); //start the timer to delay 1 second before displaying weather text 
			
	} //end weather function
	
	private function weather_good():void {
		if (weather_high > good_weather_threshold) {						
			if (mode_select == "tts_mode") {							
				if (custom_audio == "on") {
					say_custom_audio(weather_good_mp3);
				}
				else {
					say(weather_good_tts + " " + String(WeatherForecastTextTTS));
				}			
				if (lipsync_feature == "on") {
					myVid.play(lipsync_clip);
				}
				else {
					myVid.play(weather_good_clip);
				}
		}	
		else {myVid.play(weather_good_clip);}					
						
			if (LED_mode != "fire" && stand_alone != "on") {
			a.writeDigitalPin(LED1_pin, Arduino.LOW); //turn it off to start
			a.writeDigitalPin(LED2_pin, Arduino.HIGH); //turn it off to start
			a.writeDigitalPin(LED3_pin, Arduino.LOW); //turn it off to start
			a.writeDigitalPin(LED4_pin, Arduino.LOW); //turn it off to start		
			}
		}
		else {
			if (mode_select == "tts_mode") {							
				if (custom_audio == "on") {
					say_custom_audio(weather_ok_mp3);
				}
				else {
					say(weather_ok_tts + " " + String(WeatherForecastTextTTS));
				}			
				if (lipsync_feature == "on") {
					myVid.play(lipsync_clip);
				}
				else {
					myVid.play(weather_ok_clip);
				}
		}	
		else {myVid.play(weather_ok_clip);}					
			
			if (LED_mode != "fire" && stand_alone != "on") {
			a.writeDigitalPin(LED1_pin, Arduino.LOW); //turn it off to start
			a.writeDigitalPin(LED2_pin, Arduino.LOW); //turn it off to start
			a.writeDigitalPin(LED3_pin, Arduino.HIGH); //turn it off to start
			a.writeDigitalPin(LED4_pin, Arduino.LOW); //turn it off to start		
			}
		}
		
	}
	
	private function weather_rain():void {
		
		if (mode_select == "tts_mode") {
			if (custom_audio == "on") {
				say_custom_audio(weather_rain_mp3);
			}
			else {
				say(weather_rain_tts + " " + String(WeatherForecastTextTTS));
			}						
			if (lipsync_feature == "on") {
				myVid.play(lipsync_clip);
			}
			else {
				myVid.play(weather_rain_clip);
			}
		}	
		
		else {myVid.play(weather_rain_clip);}					
		
		if (LED_mode != "fire" && stand_alone != "on") {
			a.writeDigitalPin(LED1_pin, Arduino.LOW); //turn it off to start
			a.writeDigitalPin(LED2_pin, Arduino.LOW); //turn it off to start
			a.writeDigitalPin(LED3_pin, Arduino.LOW); //turn it off to start
			a.writeDigitalPin(LED4_pin, Arduino.HIGH); //turn it off to start		
		}
	}
	
	private function WeatherDisplayTextTimerEvent(e:TimerEvent):void { 	
			
			 if (display_weather_text == "on") {
				 weather_display2.visible = true;			
				 weather_display2.text = WeatherForecastText;					
			 }
			 if (display_weather_image == "on") { 
				 weather_image.visible = true;
			 }
			 
			 WeatherDisplayTextTimer.reset(); //reset the timer so it can play again			
			 WeatherDisplayTextTimer5s.start(); //start the 5 second timer
	}
	
	private function WeatherDisplayTextTimerEvent5s(e:TimerEvent):void { 	
			 weather_display2.visible = false;	//its been 5s so now turn off the text
			 removeChild(weather_image);
			 weatherImageDisplayedFlag = 0; //its been removed so clear the flag
			 //weather_image.visible = false;
			 WeatherDisplayTextTimer5s.reset(); //start the 5 second timer
	}		
	
	private function WeatherLoaderioErrorHandler(event:IOErrorEvent):void {
          trace("Weather Loader Error Trapped ioErrorHandler: " + event);
		  WeatherText.text = "Weather Internet call failed, check Internet connection or Yahoo Weather API unavailable";
		  
		  if (mode_select == "tts_mode") {							
						if (custom_audio == "on") {
							say_custom_audio(no_internet_mp3);
						}
						else {
							say(no_internet_tts);
						}						
					
						if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(no_internet_clip);					
						}		
					}	
					else {
						myVid.play(no_internet_clip);				
			}			
		  
	}
	
	private function pictLdrioErrorHandler(event:IOErrorEvent):void {
		  WeatherText.text = "Weather Internet call successful but could not load weather image";
          trace("Weather Image Loader Error Trapped ioErrorHandler: " + event);
		  weather();		  
	}
		
	private function stockUpdate():void { //stockLoaded function will fire once the event is done from the event listener above			
			
			if (webcamfound == 1 && idle_videos == "off") {
						webcamvideo.visible = false; 
						_detectionTimer.stop();
			}	
			
			//stockLoader.load(new URLRequest("http://download.finance.yahoo.com/d/quotes.csv?s=" + stock_string + "&f=c1&e=.csv"));  //this api has been discontinued by Yahoo , boo!
			
			stockLoader.load(new URLRequest("https://api.iextrading.com/1.0/stock/market/batch?symbols=" + stock_string + "&types=quote")); //this api is from https://iextrading.com/
		
	}
	
	private function stockLoadediextrading(evt:Event):void {
		 	
			stockPriceChange = 0; //reset this back to 0 as it will be called multiple times
			//trace (stockLoader.data);
			//var sstring = stockLoader.data;			
			
			var stockPrices:Object = JSON.parse(stockLoader.data);
			//trace(stockPrices.SBUX.quote.change);

			for(var key:String in stockPrices) { 
				trace("Name: " + key + " - Change: " + stockPrices[key].quote.change); 
				stockPriceChange = stockPriceChange + Number(stockPrices[key].quote.change);
	  		}
			
			stockPriceChange = NumberUtilities.round(stockPriceChange,.01)
			trace ("Stock Price Change Is: " + stockPriceChange);
			Stock.text = ("Stock Portfolio Price Change Is: " + stockPriceChange);
			stock(); //call the main function to play the videos
			
	}
	
	/*private function stockLoaded(evt:Event):void //triggered when file was loaded , OLD function from the Yahoo Stock API, now replaced with above
		{
			stockPriceChange = 0; //reset this back to 0 as it will be called multiple times
			var sstring = stockLoader.data;			
			//trace ("stock string before spliiting=" + sstring);
			var stockPriceArray:Array = sstring.split("\n");   //new line/return char is separating the values
			var j:int = 0;		
							
			for (j = 0; j < num_stocks; j++) {			
					
					stockPriceChange = stockPriceChange + Number(stockPriceArray[j]);
					//trace("number: " + j + " " + Number(stockPriceArray[j]));
			}				
			//stockPriceChange = Math.round((stockPriceChange / .01) *.01); //round stock sum or loss to two decimals
			stockPriceChange = NumberUtilities.round(stockPriceChange,.01)
			trace ("Stock Price Change Is: " + stockPriceChange);
			Stock.text = ("Stock Portfolio Price Change Is: " + stockPriceChange);
			stock(); //call the main function to play the videos
			
	} // end stockLoaded function*/
			
	private function stock():void {
		
		stockweatherplaying = 1;
		if (stockPriceChange > stock_good_threshold) {					
				if (mode_select == "tts_mode") {							
					if (custom_audio == "on") {
						say_custom_audio(stock_up_mp3);
					}
					else {
						
						say(stock_up_tts + " " + String(stockPriceChange));
						
					}
					
					if (lipsync_feature == "on") {
						myVid.play(lipsync_clip);
					}
					else {
						myVid.play(stock_up_clip);
					}				
				}	
				else {
						myVid.play(stock_up_clip);
				}
				
				Stock.text = ("Stock is Up");			
				StockTextFormat.color = 0x00CC33;  //green
				if (LED_mode != "fire" && stand_alone != "on") {
					a.writeDigitalPin(LED1_pin, Arduino.LOW); //turn it off to start
					a.writeDigitalPin(LED2_pin, Arduino.HIGH); //turn it off to start
					a.writeDigitalPin(LED3_pin, Arduino.LOW); //turn it off to start
					a.writeDigitalPin(LED4_pin, Arduino.LOW); //turn it off to start		
				}			
		}
		
		if (stockPriceChange < stock_bad_threshold) {
			
			if (mode_select == "tts_mode") {							
					if (custom_audio == "on") {
						say_custom_audio(stock_down_mp3);
					}
					else {
						
						say(stock_down_tts + " " + String(stockPriceChange));
					}		
					
				if (lipsync_feature == "on") {
					myVid.play(lipsync_clip);
				}
				else {
					myVid.play(stock_down_clip);			
				}			
			}	
			else {
				myVid.play(stock_down_clip);		
			}
			
			
			
			Stock.text = ("Stock is Down");
			StockTextFormat.color = 0xFF0033; //red
			//stock_display.backgroundColor = 0xFF0033; //white background			
			if (LED_mode != "fire" && stand_alone != "on") {
				a.writeDigitalPin(LED1_pin, Arduino.LOW); //turn it off to start
				a.writeDigitalPin(LED2_pin, Arduino.LOW); //turn it off to start
				a.writeDigitalPin(LED3_pin, Arduino.LOW); //turn it off to start
				a.writeDigitalPin(LED4_pin, Arduino.HIGH); //turn it off to start		
			}
		}
		if ((stockPriceChange < stock_good_threshold) && (stockPriceChange > stock_bad_threshold)) {
			
			if (mode_select == "tts_mode") {							
					if (custom_audio == "on") {
						say_custom_audio(stock_no_change_mp3);
					}
					else {
						say(stock_no_change_tts + " " + String(stockPriceChange));
					}		
					
					if (lipsync_feature == "on") {
						myVid.play(lipsync_clip);
					}
					else {
						myVid.play(stock_no_change_clip);					
					}		
			}	
			else {
				myVid.play(stock_no_change_clip);				
			}
			
			
							
			var myBool:Boolean ;
			myBool = (stockPriceChange < stock_good_threshold && stockPriceChange > stock_bad_threshold);
			trace (stock_good_threshold + " " + stock_bad_threshold);
			trace ("stock boolean " + myBool);
			Stock.text = ("Stock No Change");
			StockTextFormat.color = 0xF5F5F5; //white
			//stock_display.backgroundColor = 0xF5F5F5; //white background			
			if (LED_mode != "fire" && stand_alone != "on") {
				a.writeDigitalPin(LED1_pin, Arduino.LOW); //turn it off to start
				a.writeDigitalPin(LED2_pin, Arduino.LOW); //turn it off to start
				a.writeDigitalPin(LED3_pin, Arduino.HIGH); //turn it off to start
				a.writeDigitalPin(LED4_pin, Arduino.LOW); //turn it off to start		
			}
		}				
		if (display_stock_text == "on") {  //only display the stock text if set to on
			StockDisplayTextTimer.start(); //start the timer to delay 1 second before displaying stock text
		}
	}	
	
	private function StockDisplayTextTimerEvent(e:TimerEvent):void { 
	    stock_display.visible = true;
		stock_display.defaultTextFormat = StockTextFormat; //need to reapply this again since we changed the font colors above
		if (stockPriceChange > 0) {  //the number is postive
			stock_display.text = ("+" + String(stockPriceChange)); //displays the stock text; 
			StockDisplayTextTimer.reset(); //reset the timer so it can play again			
		}
		
		else {
			stock_display.text = String(stockPriceChange); //displays the stock text; 
			StockDisplayTextTimer.reset(); //reset the timer so it can play again
		}
		StockDisplayTextTimer5s.start();
	}
	
	private function StockDisplayTextTimerEvent5s(e:TimerEvent):void { 	
			 stock_display.visible = false;	//its been 5s so now turn off the text
			 StockDisplayTextTimer5s.reset(); //start the 5 second timer
	}		
			
			
    private function stockLoaderioErrorHandler(event:IOErrorEvent):void {
          trace("Stock Loader Error Trapped ioErrorHandler: " + event);
		   Stock.text = "Stock Internet call failed, check Internet connection or Yahoo Stock API unavailable";
		   
		     if (mode_select == "tts_mode") {							
						if (custom_audio == "on") {
							say_custom_audio(no_internet_mp3);
						}
						else {
							say(no_internet_tts);
						}						
					
						if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(no_internet_clip);					
						}		
					}	
					else {
						myVid.play(no_internet_clip);				
			}			
		  
	}
	
	private function Alcohol():void {
		
		if (webcamfound == 1 && idle_videos == "off") {
				webcamvideo.visible = false; 
				_detectionTimer.stop();
		}	
		
		myVid.visible = true;  //show the character 
		AlcoholText.visible = false; //Alcohol Text is the blow text and counter text, not the breathalyzer results text
		
			
			Alcohol_Reading = Number(a.getAnalogData(alcohol_sensor_pin)); //now get the alcohol reading after the user has blown
		
		// this was moved up ahead directly in the switch5 routine
		//alcohol_baseline_difference = alcohol_baseline - original_alcohol_baseline;  //alcohol_baseline is the baseline when the button was pressed, we need to make sure there is not a significant delta between what it should be as what it is now
		//alcohol_baseline_difference = Math.abs(alcohol_baseline_difference);
		//trace ("alcohol_baseline_different: " + alcohol_baseline_difference);
		//if (alcohol_baseline_difference > alcohol_baseline_difference_allowance) {
			//mirror_did_not_init_text.visible = true;
			//mirror_did_not_init_text.text = String("Warning: Either you blew into the Breathalyzer too soon (before pushing the button) or didn't wait long enough for the Breathalyzer to reset");
		//}
		
		
		if (Alcohol_Reading < (alcohol_baseline + alcohol_level1)) {  //alcohol_baseline we obtained when the user pressed switch5
			 
			if (mode_select == "tts_mode") {							
					if (custom_audio == "on") {
						say_custom_audio_breathalyzer(drink1_mp3);
					}
					else {
						say_breathalyzer(drink1_tts);
					}				
					
					if (lipsync_feature == "on") {
						myVid.play(lipsync_clip);
					}
					else {
						myVid.play(drink1_clip);					
					}		
			}	
			else {
				myVid.play(drink1_clip);				
			}			
			
			if (twitter_feature == "on" && twitter_authenticated == "yes" && twitter_breathalyzer == "on") {
				
				if (twitter_breathalyzer_value == "on") {
					//tweetr.updateStatus(myXML.twitter_drink1 + " :" + Alcohol_Reading);
					tweet(myXML.twitter_drink1 + " :" + Alcohol_Reading);
				}
				else {
					//tweetr.updateStatus(myXML.twitter_drink1);
					tweet(myXML.twitter_drink1)
				}
				
			}
			
			AlcoholResultsFormat.color = 0x00CC33;  //green
			AlcoholResults.defaultTextFormat = AlcoholResultsFormat;  //need to apply this again since we changed the color			
			AlcoholResults.visible = true;		
			AlcoholResults.text = "No Drinks";			
		}
		
		if ((Alcohol_Reading > (alcohol_baseline + alcohol_level1)) && (Alcohol_Reading < (alcohol_baseline + alcohol_level2))) {
			AlcoholResultsFormat.color = 0xFEFB02;  //yellow
			AlcoholResults.defaultTextFormat = AlcoholResultsFormat;  //need to apply this again since we changed the color			
			AlcoholResults.visible = true;		
			AlcoholResults.text = "A Few Drinks";
			
			if (mode_select == "tts_mode") {							
					if (custom_audio == "on") {
						say_custom_audio_breathalyzer(drink2_mp3);
					}
					else {
						say_breathalyzer(drink2_tts);
					}						
			
			if (lipsync_feature == "on") {
						myVid.play(lipsync_clip);
					}
					else {
						myVid.play(drink2_clip);					
					}		
			}	
			else {
				myVid.play(drink2_clip);				
			}				
			
			if (twitter_feature == "on" && twitter_authenticated == "yes" && twitter_breathalyzer == "on") {
				
				if (twitter_breathalyzer_value == "on") {
					tweet(myXML.twitter_drink2 + " :" + Alcohol_Reading);
				}
				else {
					tweet(myXML.twitter_drink2);
				}
			}
		}
		
		if (Alcohol_Reading > (alcohol_baseline + alcohol_level2) && Alcohol_Reading < (alcohol_baseline + alcohol_level3)) {
			AlcoholResultsFormat.color = 0xFD6C01;  //orange
			AlcoholResults.defaultTextFormat = AlcoholResultsFormat;  //need to apply this again since we cha
			AlcoholResults.visible = true;		
			AlcoholResults.text = "Buzzed";
			
			if (mode_select == "tts_mode") {							
					if (custom_audio == "on") {
						say_custom_audio_breathalyzer(drink3_mp3);
					}
					else {
						say_breathalyzer(drink3_tts);
					}						
			if (lipsync_feature == "on") {
						myVid.play(lipsync_clip);
					}
					else {
						myVid.play(drink3_clip);					
					}		
			}	
			else {
				myVid.play(drink3_clip);				
			}					
			
						
			if (twitter_feature == "on" && twitter_authenticated == "yes" && twitter_breathalyzer == "on") {
				
				if (twitter_breathalyzer_value == "on") {
					tweet(myXML.twitter_drink3 + " :" + Alcohol_Reading);
				}
				else {
					tweet(myXML.twitter_drink3);
				}
			}
		}
		
		if (Alcohol_Reading > (alcohol_baseline + alcohol_level3)) {			
			AlcoholResultsFormat.color = 0xFF0033;  //red
			AlcoholResults.defaultTextFormat = AlcoholResultsFormat;  //need to apply this again since we changed the color			
			AlcoholResults.visible = true;		
			AlcoholResults.text = "You're Drunk!";			
			
			if (mode_select == "tts_mode") {							
					if (custom_audio == "on") {
						say_custom_audio_breathalyzer(drink4_mp3);
					}
					else {
						say_breathalyzer(drink4_tts);
					}						
			
			if (lipsync_feature == "on") {
						myVid.play(lipsync_clip);
					}
					else {
						myVid.play(drink4_clip);					
					}		
			}	
			else {
				myVid.play(drink4_clip);				
			}						
			
			
			if (twitter_feature == "on" && twitter_authenticated == "yes" && twitter_breathalyzer == "on") {
				
				if (twitter_breathalyzer_value == "on") {
					tweet(myXML.twitter_drink4 + " :" + Alcohol_Reading);
				}
				else {
					tweet(myXML.twitter_drink4);
				}
			}
		}
		
		if (twitter_feature == "on" && twitter_authenticated == "yes" && twitter_breathalyzer == "on") {
			TweetBirdTimer.start(); //start the timer so in 2 seconds the twitter bird comes out along with a sound
		}
		
		//now start timer to reset alcohol sensor which is called from the onclipdone function
		 
		  TextClearTimer.start(); //clears the blow now text
	}	
	
	private function TweetBirdTimerEvent(e:TimerEvent):void { //comes up 3 seconds after the text appears, now turn off
			
			TwitterBird.visible = true;
			TweetSound.play();
	        TweetBirdTimer.reset();
			TweetBirdClearTimer.start(); //this will clear the bird in 1 second
	}
	
	
	private function TweetBirdClearTimerEvent(e:TimerEvent):void { //comes up 3 seconds after the text appears, now turn off
			
			TwitterBird.visible = false;
			TweetBirdClearTimer.reset();
	}
	
	private function StandAloneModeWarningMsg():void { //comes up 6 seconds after the text appears, now turn off
			
			WarningMessageFormat.color = 0xFF0033;  //red
			WarningMessage.defaultTextFormat = WarningMessageFormat;  //need to apply this again since we changed the color			
			WarningMessage.visible = true;		
			WarningMessage.text = "Note the Magic Mirror is in stand alone mode and will not find the Sensor Hub. You may turn off Stand Alone Mode from the Advanced Configuration Program";			
			
			WarningMessageClearTimer.start(); //clears the warning text
			
			if (stand_alone_weather != "on") {
				weather_image_sprite.visible = false;
			}
						
			if (stand_alone_stock != "on") {
				stock_image_sprite.visible = false;
			}
			
	}
	
	
	private function WarningMessageClearTimerEvent(e:TimerEvent):void { //comes up 6 seconds after the text appears, now turn off
			
			WarningMessage.visible = false;		
			WarningMessageClearTimer.reset();
	}
	
	private function TextClearTimerEvent(e:TimerEvent):void { //comes up 6 seconds after the text appears, now turn off
			
			AlcoholText.visible = false;
			mirror_did_not_init_text.visible = false;
			AlcoholResults.visible = false;		
			TextClearTimer.reset();			
	}
	
	private function PleaseWaitTextClearTimerEvent(e:TimerEvent):void { //comes up 3 seconds after the text appears, now turn off
			
			video_playing = 0;
			if (myXML.alcohol_no_switch == "on" && myXML.alcohol_sensor == "on") {
				BreathalyzerInProgress = 0;  //for the no alcohol switch breathalyzer option
				AlcoholNoSwitchTimer.reset(); //now that the breathalyzer is done either the switch one or the no switch, start the timer again
				AlcoholNoSwitchTimer.start(); //now that the breathalyzer is done either the switch one or the no switch, start the timer again
			}
			mirror_did_not_init_text.visible = false;
			PleaseWaitTextClearTimer.reset();
	}
	
	private function Alcohol_ResetTimerEvent(e:TimerEvent):void { //call everytime it goes off, goes off every second			
			AlcoholResetCounter.visible = true;
			Alcohol_Reset_Counter = Alcohol_Reset_Counter - 1;  //this counter starts at 1			
						
			
			alcohol_reading_now = Number(a.getAnalogData(alcohol_sensor_pin));
			
			
			if (alcohol_reading_now < (original_alcohol_baseline + alcohol_baseline_difference_allowance)) {
				
				AlcoholResetCounter.text = "Breathalyzer Status: Ready";	
				Alcohol_Reset_Counter = alcohol_reset_seconds; //reset it to the original
				Alcohol_ResetTimer.stop(); //reset the timer too //it's been reset so stop the second timer
			 	Alcohol_ResetTimer.reset(); //reset the timer too
				BreathalyzerStatusTextClearTimer.start(); //start this timer to clear the text in 5 seconds			
				BreathalyzerInProgress = 0;
				
				
				Alcohol_ReadingNoSwitchLast = Number(a.getAnalogData(alcohol_sensor_pin)); //switch last should be a low number since it has reset
				
				
				if (stand_alone != "on" && myXML.alcohol_no_switch == "on" && myXML.alcohol_sensor == "on") {
						AlcoholNoSwitchTimer.reset();
						AlcoholNoSwitchTimer.start(); //start this again, it may have been stopped if the no switch breathalyzer went off
				}
			}		
						
	}
	
	private function BreathalyzerStatusTextClearTimerEvent(e:TimerEvent):void { //comes up 6 seconds after the text appears, now turn off
			
			AlcoholResetCounter.visible = false;
			BreathalyzerStatusTextClearTimer.reset(); //reset it so it can run again next time
			AlcoholResults.visible = false;		
			
	}
	
	//private function Alcohol_ResetTimerEvent(e:TimerEvent):void { //call when the whole thing is done and the alcohol sensor is ready to go again
		    
			// Alcohol_Reset_Counter = alcohol_reset_seconds; //reset it to the original
			// Alcohol_ResetTimer.reset(); //reset the timer too
			// AlcoholResetCounter.visible = false;
	//}
		
	private function Alcohol_LEDTimerEvent(e:TimerEvent):void { //this goes off every half nsecond to show a visual indicator of the alcohol sensor
		
		//if (myVid.source != weather_good_clip || myVid.source != weather_ok_clip || myVid.source != weather_rain_clip || myVid.source != stock_up_clip || myVid.source != stock_no_change_clip || myVid.source != stock_down_clip) {
		if (stockweatherplaying == 0) {  //if stockweather is playing, then a stock or weather video is playing and the LEDs are controlled by that and then switches back to here when onClipdone is finished
		
			
			Alcohol_Sensor_Value = Number(a.getAnalogData(alcohol_sensor_pin)); //get the current value of the alcohol sensor and convert it to a number
			
			
			if (Alcohol_Sensor_Value < (original_alcohol_baseline + alcohol_baseline_difference_allowance)) {
				
					a.writeDigitalPin(LED1_pin, Arduino.HIGH); //turn it off to start  //ready or no drinks
					a.writeDigitalPin(LED2_pin, Arduino.LOW); //turn it off to start
					a.writeDigitalPin(LED3_pin, Arduino.LOW); //turn it off to start
					a.writeDigitalPin(LED4_pin, Arduino.LOW); //turn it off to start			
				
			}
			
			if ((Alcohol_Sensor_Value > (alcohol_baseline + alcohol_level1)) && (Alcohol_Sensor_Value < (alcohol_baseline + alcohol_level2))) {
				
					a.writeDigitalPin(LED1_pin, Arduino.LOW); //turn it off to start  //few drinks
					a.writeDigitalPin(LED2_pin, Arduino.HIGH); //turn it off to start
					a.writeDigitalPin(LED3_pin, Arduino.LOW); //turn it off to start
					a.writeDigitalPin(LED4_pin, Arduino.LOW); //turn it off to start			
				
			}
			
			if (Alcohol_Sensor_Value > (alcohol_baseline + alcohol_level2) && Alcohol_Sensor_Value < (alcohol_baseline + alcohol_level3)) {
						
					a.writeDigitalPin(LED1_pin, Arduino.LOW); //turn it off to start  //buzzed
					a.writeDigitalPin(LED2_pin, Arduino.LOW); //turn it off to start
					a.writeDigitalPin(LED3_pin, Arduino.HIGH); //turn it off to start
					a.writeDigitalPin(LED4_pin, Arduino.LOW); //turn it off to start			
				
			}
			
			if (Alcohol_Sensor_Value > (alcohol_baseline + alcohol_level3)) {	//drunk		
					
					a.writeDigitalPin(LED1_pin, Arduino.LOW); //turn it off to start
					a.writeDigitalPin(LED2_pin, Arduino.LOW); //turn it off to start
					a.writeDigitalPin(LED3_pin, Arduino.LOW); //turn it off to start
					a.writeDigitalPin(LED4_pin, Arduino.HIGH); //turn it off to start			
				
			}
				
			//alcohol_circle.graphics.beginFill(0xFF0000);
			//alcohol_circle.graphics.drawCircle(100, 100, a.getAnalogData(alcohol_sensor_pin));
			//alcohol_circle.graphics.endFill();			
		}
			
	}	
		
		
		
		private function x10off(event:MouseEvent):void {       //mouse click button
				
				if (doorcamPlayingFlag == 0 && sound_playing == 0) {
					
					if (mode_select == "tts_mode") {							
						if (custom_audio == "on") {
							say_custom_audio(x10_off_mp3);
						}
						else {
							say(x10_off_tts);
						}						
					
						if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(x10_off_clip);					
						}		
					}	
					else {
						myVid.play(x10_off_clip);				
					}			
					
					X10_OFF(x10_address2);
					//X10_OFF(x10_address2);		
					//X10_OFF(x10_address2);		
				}
		}
		
		private function x10on(event:MouseEvent):void {   //for testing the Breathalyzer when running in verbose mode , not x10 
				
				if (doorcamPlayingFlag == 0 && sound_playing == 0) {
				
					TextClearTimer.stop();
					
					alcohol_baseline = Number(a.getAnalogData(alcohol_sensor_pin)); 
					
					
					Alcohol_CountdownTimer.reset();
					Alcohol_CountdownTimer2.reset();
					mirror_did_not_init_text.visible = false;
					AlcoholText.text = "Please Wait...";
					
					//if (mode_select == "tts_mode") { //only play the sound if tts mode is on, otherwise just do the normal thing
						//say_breath(wait_tts);
					//}
					//else {
						//wait_sound.play();
					//}
					
					
					Alcohol_Counter = alcohol_countdown; //reset it		
					myVid.visible = false;
					AlcoholText.visible = true;
					
					Alcohol_CountdownTimer.start(); //start the timer which will go off 5 times
					//Alcohol_Countdown.addEventListener(TimerEvent.TIMER_COMPLETE, Alcohol_CountdownEvent);				
				}
		}		
		
		private function Alcohol_CountdownEventNowBlow(e:TimerEvent):void { 
		  			
				AlcoholText.text = String("Blow..." + Alcohol_Counter);
				
				if (mode_select == "tts_mode") { //only play this sound if tts mode is on, otherwise just do the normal thing
							sound_playing = 1;					
							if (custom_audio == "on") {
									say_breath_custom_audio(blow_mp3);
							}
							else {
									say_breath(blow_tts); 
							}		
				}
				else {
					blow_sound.play();
				}	
				
				Alcohol_CountdownTimer2.start();
		}
		
		private function Alcohol_CountdownEvent(e:TimerEvent):void { 
		    Alcohol_CountdownTimer.reset();
			
			Alcohol_Counter = Alcohol_Counter - 1;  //this counter starts at 1						
			AlcoholText.text = String("Blow..." + Alcohol_Counter);			
			
			if (Alcohol_Counter < alcohol_countdown - 1 && Alcohol_Counter != 0) {
				beep_sound.play();
			}
			
			//trace ("Alcohol Counter: " + Alcohol_Counter);			
		}
		
		private function Alcohol_CountdownEventTimerComplete(e:TimerEvent):void { //the countdown has completed event
			Alcohol_CountdownTimer2.reset(); //reset it for next time
			//now call the Alcohol Reading Function
			Alcohol();			
		}
		
		private function x10_on_lights_buttonEvent(event:MouseEvent):void {      
				//myVid.visible = true;
				if (doorcamPlayingFlag == 0 && sound_playing == 0) {
					weatherUpdate();
					X10_ON(x10_address1);
					//X10_OFF(x10_address1);		
					//X10_OFF(x10_address1);		
				}
		}
		
		private function x10_off_lights_buttonEvent(event:MouseEvent):void {        
				//myVid.visible = true;
				if (doorcamPlayingFlag == 0 && sound_playing == 0 ) {
					stockUpdate();			
					X10_OFF(x10_address1);
					//X10_ON(x10_address1);		
					//X10_ON(x10_address1);		
				}
		}
		
		
		
		private function x10bright(event:MouseEvent):void {        //proximity 2 clip play test
				//myVid.visible = true;
				if (doorcamPlayingFlag == 0 && sound_playing == 0) {
					
										
					if (mode_select == "tts_mode") {
						if (custom_audio == "on") {
							say_custom_audio(proximity2_mp3);
						}
						else {
							say(proximity2_tts);
						}
					
					if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(proximity2_clip);					
						}		
					}	
					else {
						myVid.play(proximity2_clip);				
					}			
					
									
					X10_BRIGHT(x10_house1);
					X10_BRIGHT(x10_house1);
					X10_BRIGHT(x10_house1);
					X10_BRIGHT(x10_house1);
					X10_BRIGHT(x10_house1);
					X10_BRIGHT(x10_house1);
					X10_BRIGHT(x10_house1);
					X10_BRIGHT(x10_house1);
					X10_BRIGHT(x10_house1);
					X10_BRIGHT(x10_house1);
				}
		}
		
		
		private function al(event:MouseEvent):void {        //weather clip play test, only  in verbose mode
			
			if (doorcamPlayingFlag == 0 && sound_playing == 0) {
				weatherUpdate();
			}
		}
		
		private function al2(event:MouseEvent):void {        //proximity 1 clip play test, only in verbose mode
			//myVid.visible = true;
			
			if (webcamfound == 1 && idle_videos == "off") {
						webcamvideo.visible = false; 
						_detectionTimer.stop();
			}	
			
			if (doorcamPlayingFlag == 0 && sound_playing == 0) {
				
				if (mode_select == "tts_mode") {						
					if (custom_audio == "on") {
							say_custom_audio(proximity1_mp3);
						}
					else {
						say(proximity1_tts);
					}		
				
				if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(proximity2_clip);					
						}		
					}	
				else {
					myVid.play(proximity2_clip);				
				}		
				
				X10_DIM(x10_house1);
				X10_DIM(x10_house1);
				X10_DIM(x10_house1);
				X10_DIM(x10_house1);
				X10_DIM(x10_house1);
				X10_DIM(x10_house1);
				X10_DIM(x10_house1);
				X10_DIM(x10_house1);
				X10_DIM(x10_house1);
				X10_DIM(x10_house1);
				X10_DIM(x10_house1);
				X10_DIM(x10_house1);
			}	
		}
		
		private function stock_button(event:MouseEvent):void {     //set a flag so when the user does again, stock goes away, better to set on timer
			//myVid.visible = true;
			if (doorcamPlayingFlag == 0 && sound_playing == 0) {
				stockUpdate();			
			}
		}
		
		private function door_button(event:MouseEvent):void {     //set a flag so when the user does again, stock goes away, better to set on timer
			if (x10_commands == "on") { //turn off the lights first if x10 control is on
				X10_OFF(x10_address1);
				//X10_OFF(x10_address1);
			}
			
			if (SlideShowRunning == 0 && sound_playing == 0) {
				
			 //sound_channel_sound = doorbell_sound.play();
			 //sound_channel_sound.addEventListener(Event.SOUND_COMPLETE, doorbell_sound_played);  // not using this but will need if need to detect sound event done event
			sound_playing = 1;
			doorbell_sound.play(); //play the doorbell sound and then wait a bit before starting the doorbell video
			doorBellTimer.start();
			
			// doorbell_sound.play(); //once this is down, the event listener will call the doorbell_sound_played function	
			
				//if (doorcam_on == "on") {   //show the doorcam while the doorbell video is playing if its on				
					//myVid.visible = false;
					//myVid2.visible = true;
					//myVid2.play(); 
					//doorcamPlayingFlag = 1;
					//doorcamTimer.start(); //need to add a delay here to the webcam and thoughts image pop up after the doorbell video is playing as opposed to before						
				//}
				//else {			
					//myVid.play(doorbell_clip); //just play the normal doorbell clip with no doorcam or thoughts graphic
				//}
			}
		}		
	
		
	private function doorBellTimerEvent(e:TimerEvent):void { //gets called after the doorbell sound plays
		   if (webcamfound == 1 && idle_videos == "off") {
						webcamvideo.visible = false; 
						_detectionTimer.stop();
			}	
		   
		   if (doorcam_on == "on") {   //show the doorcam while the doorbell video is playing if its on				
					myVid.visible = false;
					myVid2.visible = true;
					
					if (mode_select == "tts_mode") { //only play the sound if tts mode is on, otherwise just do the normal thing
						
						if (custom_audio == "on") {
							say_custom_audio(doorbell_mp3);
						}
						else {
							say(doorbell_tts);
						}							
						sound_playing = 1;
					}			
					
					myVid2.play(); //the source for myVid2 was set in the initial_values and switch_mode routines
					doorcamPlayingFlag = 1;
					doorcamTimer.start(); //need to add a delay here to the webcam and thoughts image pop up after the doorbell video is playing as opposed to before						
					//initial_switch1_value = switch1_value;  //now set them equal in prep for the next change	
					initial_switch1_value =  a.getDigitalData(switch1_pin);	
			}
			else {				
					
					if (mode_select == "tts_mode") { //only play the sound if tts mode is on, otherwise just do the normal thing
						if (custom_audio == "on") {
							say_custom_audio(doorbell_mp3);
						}
						else {
							say(doorbell_tts);
						}							
						sound_playing = 1;
					
					if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(doorbell_clip);					
						}		
					}	
					else {
						myVid.play(doorbell_clip);	 //just play the normal doorbell clip with no doorcam or thoughts graphic
					}			
					
					//initial_switch1_value = switch1_value;  //now set them equal in prep for the next change					
					initial_switch1_value =  a.getDigitalData(switch1_pin);	
				}		
				
			doorBellTimer.reset(); //reset the timer		
		   
		  // if (doorcam_on == "on") {   //show the doorcam while the doorbell video is playing if its on				
					//myVid.visible = false;
					//myVid2.visible = true;
					//myVid2.play(); 
					//doorcamPlayingFlag = 1;
					//doorcamTimer.start(); //need to add a delay here to the webcam and thoughts image pop up after the doorbell video is playing as opposed to before						
				//}
				//else {			
				//	myVid.play(doorbell_clip); //just play the normal doorbell clip with no doorcam or thoughts graphic
				//}
			//doorBellTimer.reset(); //reset the timer	
	}
	
	
	private function AlcoholNoSwitchTimerDelayEvent(e:TimerEvent):void {
			AlcoholNoSwitchTimer.addEventListener(TimerEvent.TIMER, AlcoholNoSwitchTimerEvent);
			AlcoholNoSwitchTimer.start(); //start the timer		
			beer_image_Loader.contentLoaderInfo.addEventListener(Event.COMPLETE,beer_image_Loaded);
			beer_image_Loader.load(new URLRequest("images/beer_icon.png"));		
			BeerImageFadeTimer.addEventListener(TimerEvent.TIMER, beer_image_FaderEvent);
			BeerImageFadeTimer.addEventListener(TimerEvent.TIMER_COMPLETE, BeerImageFadeDoneEvent);
	}
	
	
	private function AlcoholNoSwitchTimerEvent(e:TimerEvent):void { //gets called after the doorbell sound plays
		 trace ("video playing flag: " + video_playing);
		 trace ("breathinProgress flag: " + BreathalyzerInProgress);
		 if (BreathalyzerInProgress == 0 &&  SlideShowRunning == 0 && initial_values_done == 1 && doorcamPlayingFlag == 0 && idle_start_playing == 1 && video_playing == 0 && sound_playing == 0) { 
			
			Alcohol_ReadingNoSwitchCurrent = Number(a.getAnalogData(alcohol_sensor_pin));
			
			trace ("alchol current nonstop: " + Alcohol_ReadingNoSwitchCurrent);
			trace ("alchol last nonstop: " + Alcohol_ReadingNoSwitchLast);			
			alcohol_baseline_difference = Alcohol_ReadingNoSwitchLast - original_alcohol_baseline;  //alcohol_baseline is the baseline when the button was pressed, we need to make sure there is not a significant delta between what it should be as what it is now
			alcohol_baseline_difference = Math.abs(alcohol_baseline_difference);
			trace ("alchol baseline difference nonstop: " + alcohol_baseline_difference);
			
			if (alcohol_baseline_difference > alcohol_baseline_difference_allowance) { 
				alcohol_no_switch_ready_flag = 0;
			}
			else {
				alcohol_no_switch_ready_flag = 1;
			}
			
			//if (Alcohol_ReadingNoSwitchLast < original_alcohol_baseline + alcohol_baseline_difference_allowance) { //must be less than 200 to be ready
				//alcohol_no_switch_ready_flag = 1; //ready to go
			//}
			//else {
				//alcohol_no_switch_ready_flag = 0; //sensor not reset yet
			//}
			 
			//  trace ("started here");
			  
			  if (Alcohol_ReadingNoSwitchCurrent - Alcohol_ReadingNoSwitchLast > alcohol_no_switch_trigger_delta)  {  //then someone blew
					//AlcoholNoSwitchTimer.stop(); //stop this timer and don't call it again
					alcohol_baseline =  Alcohol_ReadingNoSwitchLast; 
					trace ("ROUTINE: alcohol baseline: " + alcohol_baseline);
					trace ("ROUTINE: alcohol current reading: " + Alcohol_ReadingNoSwitchCurrent);
					
																		
						if (alcohol_no_switch_ready_flag == 0) {  //this means either alcohol sensor has not reset or the user blew before pressing the button
							
							if (mode_select == "tts_mode") { 
								if (custom_audio == "on") {
									say_custom_audio(wait_mp3);
								}
								else {
									say_breath(wait_tts);
								}			
								sound_playing = 0;
							}	
							
							else {
								wait_sound.play();
								sound_playing = 0;
							}									
							
							mirror_did_not_init_text.visible = true;
							mirror_did_not_init_text.text = String("The Breathalyzer is not ready or you blew into the Breathalyzer too soon (before pushing the button");
							PleaseWaitTextClearTimer.start();
						}
						
						else {   //we are ok so let's continue and have the user blow into the Breathalyzer
							
							BreathalyzerInProgress = 1;
							//show the beer icon and wait for number of seconds * alcohol_countdown
							beer_image.visible = true;
							BeerImageFadeTimer.start();  //fades the beer icon for the duration of 1s * alcohol_countdown
														
						}			
				}
				
				 Alcohol_ReadingNoSwitchLast = Alcohol_ReadingNoSwitchCurrent;  //need to set an initial value for current
				 //AlcoholNoSwitchTimer.stop(); //stop this timer and don't call it again until it's re-started
		 }
    }
	
	private function beer_image_FaderEvent(e:TimerEvent):void {   //fades the beer icon per alcohol countdown duration
		beer_image_alpha = beer_image_alpha - (1 / alcohol_countdown);				
		beer_image.alpha = beer_image_alpha;
		trace ("alpha value of beer image: " + beer_image_alpha);				
    }
	
	private function BeerImageFadeDoneEvent(e:TimerEvent):void { //gets called after the beer icon has faded
		  
		  BeerImageFadeTimer.reset(); //reset it so we can use it again
		  beer_image_alpha = 1;  //reset this back to one
		  beer_image.visible = false;
		  Alcohol();  //now get the reading				  
	}
	
	private function doorcamTimerEvent(e:TimerEvent):void { 
		    // if we went here, then the doorcam is on
			doorcam.visible = true;  //show the doorcam
			thoughts_image.visible = true;  //show the thoughts image			
			trace ("doorcam width " + doorcam.width);
			doorcamTimer.reset();		  
	}
		
		
	
	
		///// ***************************************************
		
		//private function onClipDone(e:VideoEvent):void {   //loop to idle clip when nothing going on
		private function onClipDone(e:fl.video.VideoEvent):void {
			if (mode_select == "tts_mode" && sound_playing == 1) {  		//usually we would never get here because the audio will finish before the video and the audio will kill the clip
																			//if we're in TTS mode and the video file has finished playing before the audio has, then loop the video
					//if the sound is still playing, then don't go to resetVideo flags yet but loop instead
					myVid.seek(0);				
					idle.text=("Custom Audio mode: video finished before audio, looping...");
					//idle_end_seek_flag = 1;	
					//video_playing = 0; 				
			}		
			
			else {			
				
				if (myXML.quiz_mode == "on" && wrongAnswerFlag == 1 && QuizQuestionPlayed == 1) { //if the question has not played yet then don't go here, if the right answer was picked then go back to idle video and start over
					QuizModeonClipDone(); //play the quiz loop video
				}
				else {				
					ResetVideoFlags(); //would go here if the correct answer was picked, plays the normal idle video
				}
			}
		}  
		
		
		private function QuizModeonClipDone():void { //the user picked the wrong answer to loop the quizloop video as opposed to the normal idle videos
				
				if (myXML.lipsync_feature == "on") {
					LipsyncTimer.stop();
					lip1.visible = false;
					lip2.visible = false;
					lip3.visible = false;
					lip4.visible = false;
					lip5.visible = false;
					lip6.visible = false;
					lip7.visible = false;
					lip8.visible = false;
					lip9.visible = false;
					lip10.visible = false;
				}
								
				stock_display.visible = false; //turn off the stock display now that the video has finished playing
				weather_display2.visible = false; //turn off the stock display now that the video has finished playing
				weather_image.visible = false;
				//doorcam.visible = false;
				//thoughts_image.visible = false;
				myVid.visible = true;
				video_playing = 0; 
				
			
			if (myVid.source == quizloop_clip) {  //if quizloop clip reached the end which should never happen but just in case
				trace("played dup quizloop clip");
				myVid.seek(0);
				idle.text=("Played Duplicate Quizloop Clip");
				quizloop_end_seek_flag = 1;	
				video_playing = 0; 
			}
			else {
					myVid.play(quizloop_clip);
					trace("played idle quizloop clip");
					idle.text=("Played Quizloop Clip");
					video_playing = 0; 
			}		
			
						
			if (stand_alone == "on") {
				
				if (stand_alone_weather == "on") {
					weather_image_sprite.visible = true;
				}
				
				if (stand_alone_stock == "on") {
					stock_image_sprite.visible = true;
				}				
			}
			
			if (webcamfound == 1 && idle_videos == "off") {  //stealth mode
				webcamvideo.visible = true; //turn webcam back on now that's we've played
				frame.visible = true;
				_detectionTimer.start();				
				if (stand_alone_weather == "on") {weather_image_sprite.visible = true;}
				if (stand_alone_stock == "on") {stock_image_sprite.visible = true;}		
			}
			
			video_playing = 0; //reset this now that the video has stopped playing, now another analog video can play
			sound_playing = 0;
			stockweatherplaying = 0; //reset back to the breathalyzer LED if this is turned on 
			
		}
		
		private function QuizTimerEvent(e:TimerEvent):void { //gets called after the proximity1 video plays only during quiz mode
			wrongAnswerFlag = 0;
			QuizModeStopProxFlag = 0;
			QuizQuestionPlayed = 0; 
			QuizReadytoAnswerFlag = 0;
			proximity_counter = 0;
			//QuizTimer.stop(); //stop the timer	
			QuizTimer.reset(); //reset the timer
			ResetVideoFlags();
		}
		
		private function CustomSoundDone(event:Event):void {
			sound_playing = 0; //the sound has finished so stop the video and let something else play
									
			  if (doorcamPlayingFlag == 1) {   //if the doorcam was playing		
				 myVid2.stop(); //if doorcam was playing, don't stop myVid
			  }	
			  else {				
				myVid.stop(); // usually this will be the case
			  }
			trace ("went to the customsounddone routine");
			ResetVideoFlags();  //this will reset some stuff and then call myVid.idle
						
		}
		
		private function CustomSoundDoneBreathalyzer(event:Event):void {
			sound_playing = 0; //the sound has finished so stop the video and let something else play
									
			  if (doorcamPlayingFlag == 1) {   //if the doorcam was playing		
				 myVid2.stop(); //if doorcam was playing, don't stop myVid
			  }	
			  else {				
				myVid.stop(); // usually this will be the case
			  }
			trace ("went to the customsounddone routine");
			AlcoholResetCounter.visible = true;
			AlcoholResetCounter.text = "Breathalyzer Status: Resetting...";	
			Alcohol_ResetTimer.start(); //need to call a timer telling the user things need to reset
			ResetVideoFlags();  //this will reset some stuff and then call myVid.idle
		}
		
		private function TTSSoundDone(event:Event):void {
			sound_playing = 0; //the sound has finished so stop the video and let something else play
									
			  if (doorcamPlayingFlag == 1) {   //if the doorcam was playing		
				 myVid2.stop(); //if doorcam was playing, don't stop myVid
			  }	
			  else {				
				myVid.stop(); // usually this will be the case
			  }
			
			ResetVideoFlags();  //this will reset some stuff and then call myVid.idle
						
		}
		
		private function TTSSoundDoneTweet1(event:Event):void {
			//sound_playing = 0; //the sound has finished so stop the video and let something else play
			say_tweet2(tweet2_text);	//this case was over 100 chars so now we need to say the second one
			
			//since we need to play another sound stream, don't stop anything or reset flags
		}
		
		private function TTSSoundDoneTweet2(event:Event):void {
			sound_playing = 0; //the sound has finished so stop the video and let something else play
			
			if (doorcamPlayingFlag == 1) {   //if the doorcam was playing		
				 myVid2.stop(); //if doorcam was playing, don't stop myVid
			  }	
			  else {				
				myVid.stop(); // usually this will be the case
			  }
			
			ResetVideoFlags();  //this will reset some stuff and then call myVid.idle
			
		}
		
		private function TTSPlayError(event:Event):void { //had a problem speaking the tweet
			trace("went to speak tweet error handler");
			switch_mode();
			ResetVideoFlags();
		}
		
		private function ResetVideoFlags():void {
				
				if (myXML.lipsync_feature == "on") {
					LipsyncTimer.stop();
					lip1.visible = false;
					lip2.visible = false;
					lip3.visible = false;
					lip4.visible = false;
					lip5.visible = false;
					lip6.visible = false;
					lip7.visible = false;
					lip8.visible = false;
					lip9.visible = false;
					lip10.visible = false;
				}
				
				wrongAnswerFlag = 1; //for quiz mode, if we went here, then the right answer was already played so reset the quiz
				
				//if (stand_alone != "on" && myXML.alcohol_no_switch == "on" && myXML.alcohol_sensor == "on") {
						//AlcoholNoSwitchTimer.start(); //start this again, it may have been stopped if the no switch breathalyzer went off
				//}
				
				if (doorcam_on == "on") {
				
					if (myVid2.source == doorbell_clip) {
						myVid2.visible = false;
						doorcamPlayingFlag = 0; //reset this so other videos can play
						
						try {            
						  if (stage.contains(doorcam)) {
							doorcam.visible = false;
							thoughts_image.visible = false;
							myVid2.visible = false;
							}
						}
						catch (e:Error) {  
						}			
					}
				}
				
				stock_display.visible = false; //turn off the stock display now that the video has finished playing
				weather_display2.visible = false; //turn off the stock display now that the video has finished playing
				weather_image.visible = false;
				//doorcam.visible = false;
				//thoughts_image.visible = false;
				myVid.visible = true;
								
				//turns the lights back on
				if (stand_alone != "on" && x10_commands == "on" && myVid.source != x10_on_clip && myVid.source != x10_off_clip && myVid.source != proximity1_clip) { //don't send the x10 commands if the generic on/off was triggered
					X10_ON(x10_address1);	
					//X10_ON(x10_address1);	
					//X10_ON(x10_address1);	
				}
				
			if (prox2_before_prox1 == "on") { //this means prox 2 can play before prox 1
					
					if (myVid.source == proximity1_clip) {  //do this when the first proximity clip has finished playing
						proximity_counter = 0;  //reset the counter for the first clip
						proximity_counter2 = 0;  //reset the counter for the first clip
						AProxVideoPlaying = 0;
						video_playing = 0; 
						//just added this
						if (stand_alone != "on") {
							a.writeDigitalPin(AboveFireLed_pin, Arduino.LOW);
						}
						//proximity1_do_not_play_again = 1;			
					}
					
					if (myVid.source == proximity2_clip || myVid.source == proximity3_clip) {  // do this when the second proximity clip has finished playing
						proximity_counter = 0;  //reset the counter for the first clip
						proximity_counter2 = 0; //reset the proximity2 counter, video can now play again, maybe have some delay here?
						//proximity1_do_not_play_again = 0; //set the flag after the second proxity clip has played so the first one doesn't play again interrupting		
						AProxVideoPlaying = 0; 
						if (stand_alone != "on") {
							a.writeDigitalPin(AboveFireLed_pin, Arduino.LOW);
						}
						
						video_playing = 0; 
					}
					
					if (myVid.source != proximity1_clip && myVid.source != proximity2_clip && myVid.source != proximity3_clip) {  
						proximity_counter = 0;  
						proximity_counter2 = 0;
						AProxVideoPlaying = 0; 
						video_playing = 0; 
					}
					
			}
			else { //prox 2 and 3 can only play once prox1 has played
			
					if (myVid.source == proximity1_clip) {  //do this when the first proximity clip has finished playing
						proximity_flag = 1; //set the flag after the first proximity clip has played to allow the seoncd to play
						proximity_counter = 0;  //reset the counter for the first clip
						proximity1_do_not_play_again = 1;		
						if (stand_alone != "on") {
							a.writeDigitalPin(AboveFireLed_pin, Arduino.LOW);
						}
						
						video_playing = 0; 
					}
					
					if (myVid.source == proximity2_clip || myVid.source == proximity3_clip) {  // do this when the second proximity clip has finished playing
						proximity_counter = 0; //reset the proximity counter
						proximity1_do_not_play_again = 0; //set the flag after the second proxity clip has played so the first one doesn't play again interrupting		
						FirstProxVideoPlaying = 0; //flag for proximity led
						if (stand_alone != "on") {
							a.writeDigitalPin(AboveFireLed_pin, Arduino.LOW);
						}
						
						video_playing = 0; 
					}
					
					
					if (myVid.source != proximity1_clip && myVid.source != proximity2_clip && myVid.source != proximity3_clip) {  
						proximity_counter = 0;  //reset the proximity counter
						proximity1_do_not_play_again = 0; 
						proximity_flag = 0;				
						video_playing = 0; 
					}
			}		
			
			
			//if (myVid.source == drink1_clip || myVid.source == drink2_clip || myVid.source == drink3_clip || myVid.source == drink4_clip || BreathalyzerInProgress == 1) {  //or it was text to speech
			if (myVid.source == drink1_clip || myVid.source == drink2_clip || myVid.source == drink3_clip || myVid.source == drink4_clip || BreathalyzerInProgress == 1) {  //or it was text to speech
						AlcoholResetCounter.visible = true;
						AlcoholResetCounter.text = "Breathalyzer Status: Resetting...";	
						Alcohol_ResetTimer.start(); //need to call a timer telling the user things need to reset
			}
			
			if (myVid.source == x10_on_clip) {
				x10_on_off_flag = 1;
			}
			
			if (myVid.source == x10_off_clip) {
				x10_on_off_flag = 0;
			}		
			
			if (myVid.source == proximity2_clip) {
				prox_flag = 1;
			}
			
			if (myVid.source == proximity3_clip) {
				prox_flag = 0;
			}		
				
			
			if (myVid.source == idle_clip) {  //if idle clip reached the end which should never happen
				trace("played dup clip");
				myVid.seek(0);
				//myVid.pause();
				idle.text=("Played Duplicate Idle Clip");
				idle_end_seek_flag = 1;	
				video_playing = 0; 
			}
			else {
					myVid.play(idle_clip);
					trace("played idle clip");
					idle.text=("Played Idle Clip");
					video_playing = 0; 
			}		
			
						
			if (stand_alone == "on") {
				
				if (stand_alone_weather == "on") {
					weather_image_sprite.visible = true;
				}
				
				if (stand_alone_stock == "on") {
					stock_image_sprite.visible = true;
				}				
			}
			
			if (webcamfound == 1 && idle_videos == "off") {  //stealth mode
				webcamvideo.visible = true; //turn webcam back on now that's we've played
				frame.visible = true;
				_detectionTimer.start();				
				if (stand_alone_weather == "on") {weather_image_sprite.visible = true;}
				if (stand_alone_stock == "on") {stock_image_sprite.visible = true;}		
			}
			
			video_playing = 0; //reset this now that the video has stopped playing, now another analog video can play
			sound_playing = 0;
			stockweatherplaying = 0; //reset back to the breathalyzer LED if this is turned on 
			
			
		}
		
		private function NavigationCuePoints(eventObject:MetadataEvent):void {   //loop to idle clip when nothing going on
		   var cue_point = eventObject.info.name;
		   
		   if (cue_point == "idle_end") { 		      
			   myVid.seek(0); // go to beginning of idle loop
			   trace ("did a re-wind");
			   idle.text=("Did a Re-Wind");
		   }
					   
		//  if (cue_point == "x10_on") { //for the x10 on/off touch sensor
		      // X10_ON(x10_address2);
			  // trace ("x10 on event from x10 on video");
			  // idle.text=("x10 on event from x10 on video");
		//   }
			   
		//  if (cue_point == "x10_off") { 		      
			//   X10_OFF(x10_address2);
			 //  trace ("x10 off event from x10 off video");
			//   idle.text=("x10 off event from x10 off video");   		  
		//   }		
			
			
	     } //end function
		
		//private function onSeekedEvent(e:VideoEvent):void {   //when done seeking back to beginning, play the idle video
		private function onSeekedEvent(e:fl.video.VideoEvent):void { 	
				trace("reached seek event");
				idle.text=("Reached Seek Event");
				
				if (mode_select == "tts_mode" && sound_playing == 1) {  	
					trace("OnSeeked Event: Video Ended but customer audio still playing so Looping...");
					idle.text=("Custom Audio Still Playing, Looping...");			
					myVid.play();
				}
				
				else {
				
						if (myVid.source == idle_clip) { //only go here if on the idle clip, don't go here in custom audio playing mode on a long mp3
							
							if (idle_end_seek_flag == 1) {				
									myVid.play(idle_clip);				
								trace("reached seek event on idle end");
								idle.text=("Reached Seek Event on Idle End");		
								x10_label.text=("Reached Seek Event on Idle End");		
								idle_end_seek_flag = 0; //reset the flag
							}
							else   {							
									myVid.play(idle_clip);				
							}	
							
						}
						
						if (myVid.source == quizloop_clip) { //only go here if on the idle clip, don't go here in custom audio playing mode on a long mp3
							
							if (quizloop_end_seek_flag == 1) {				
								myVid.play(quizloop_clip);				
								trace("reached seek event on quizloop end");
								idle.text=("Reached Seek Event on quizloop End");		
								x10_label.text=("Reached Seek Event on quizloop End");		
								quizloop_end_seek_flag = 0; //reset the flag
							}
							else  {							
								myVid.play(quizloop_clip);				
							}	
							
						}
				}				
			}
		 
		
		//// ***********************************************
		//// now the arduino functions *********************
		// triggered when a serial socket connection has been established
		// turn back on
		private function onSocketConnect(e:Object):void {
		trace("Socket connected!");
		//*********** delay a full x secondd before the arduino firmware, this varies by computer so is configurable *****
    	//startTime = getTimer();
			//while (true) {
			//if (getTimer() - startTime >= find_arduino_delay) break;}   
	     //*************************************************************************
		//request the firmware version
		a.requestFirmwareVersion();
		//initArduino(); //remove was just troubleshooting
		
		}
		
		private function onReceiveFirmwareVersion(e:ArduinoEvent):void {
			// the firmware version is requested when the Arduino class has made a socket connection.
			// when we receive this event we know that the Arduino has been successfully connected.			
			trace("Firmware version: " + e.value);					
			
			var temp_board = myXML.board_version;
			if (e.value == 5.0 && temp_board != "5") {  //then it's an Arduino UNO and we need to make sure the board version is set to 5.0
				WarningMessageFormat.color = 0xFF0033;  //red
				WarningMessage.defaultTextFormat = WarningMessageFormat;  //need to apply this again since we changed the color			
				WarningMessage.visible = true;		
				WarningMessage.text = "You must change the Sensor Hub Version in the Advanced Configuration Program to 5.0";			
				WarningMessageClearTimer.start(); //clears the blow now text							
			}
			
			if (e.value == 2.0 && temp_board == "5") {  //then it's an Arduino UNO and we need to make sure the board version is set to 5.0
				WarningMessageFormat.color = 0xFF0033;  //red
				WarningMessage.defaultTextFormat = WarningMessageFormat;  //need to apply this again since we changed the color			
				WarningMessage.visible = true;		
				WarningMessage.text = "You must change the Sensor Hub Version in the Advanced Configuration Program to 4.0";			
				WarningMessageClearTimer.start(); //clears the blow now text							
			}
			
			// the port value of an event can be used to determine which board the event was dispatched from
			// this is one way of dealing with multiple boards, another is to add different listener methods
			trace("Port: " + e.port);		
			ArduinoFound.text = ("Magic Mirror Sensor Hub Found on Port: " + e.port);
			// do some stuff on the Arduino...
			initArduino(); //set the input and output pins and the arduino		
			
		}
		
		// triggered when a serial socket connection has been closed
	    private function onSocketClose(e:Object):void {
			trace("Socket closed!");
			}
			
		//***************************************************
		private function onReceiveAnalogData(e:ArduinoEvent):void {		  			
				
			//touch1_value =  a.getAnalogData(analog_input1_pin);
			//touch2_value = a.getAnalogData(analog_input2_pin);
			//touch3_value = a.getAnalogData(analog_input3_pin);
			
			if (a.getAnalogData(analog_input1_pin) < 100) {
				touch1_value = 0;
			}
			else { 
				touch1_value = 1;
			}
			
			if (a.getAnalogData(analog_input2_pin) < 100) {
				touch2_value = 0;
			}
			else { 
				touch2_value = 1;
			}
			
			if (a.getAnalogData(analog_input3_pin) < 100) {
				touch3_value = 0;
			}
			else { 
				touch3_value = 1;
			}
			
			
			
			if ((SlideShowRunning == 0) && (idle_start_playing == 1) && (initial_values_done ==1) && (video_playing ==0) && (doorcamPlayingFlag == 0) && (sound_playing ==0)) { 
			
				if ((analog_input1 == "on") && (video_playing == 0)) {  //input pin must be turned on and slideshow not running
					//if (a.getAnalogData(analog_input1_pin) == 0)  {  //change this back to 0 when the phidget sensor is hooked up
					one_analog.text = String("Touch1-Weather=" + a.getAnalogData(analog_input1_pin));
					if (initial_touch1_value != touch1_value) {	
						Touch1PressedTimer.start(); //start this timer to make sure its been pressed for 100ms								
						}  
				}
				
				if ((analog_input2 == "on") && (video_playing ==0)) {  //only if on to avoid ghost readings
					//if (a.getAnalogData(analog_input2_pin) == 0)  {
					two_analog.text = String("Touch2-Stock=" + a.getAnalogData(analog_input2_pin));
					if (initial_touch2_value != touch2_value) {	
						Touch2PressedTimer.start(); //start this timer to make sure its at 0 for a while
					}
				}
					
				if ((analog_input3 == "on") && (video_playing == 0)) { //wait for idle video before listening for inputs
					//if (a.getAnalogData(analog_input3_pin) == 0)  { //this is the third touch sensor, plays x10 on and off
					three_analog.text = String("Touch3-X10 ON/OFF=" + a.getAnalogData(analog_input3_pin));
					if (initial_touch3_value != touch3_value) {	
						Touch3PressedTimer.start(); 			
					} 
				}			
				
			}
			
			if ((proximity_sensor_on == "on") && (SlideShowRunning ==0) && (idle_start_playing == 1) && (sound_playing == 0) && (doorcamPlayingFlag == 0) && (QuizModeStopProxFlag == 0)) {  //only if set to on from config file
			
				 if (prox2_before_prox1 == "on") { //this means the proximity 2 & 3 videos can play before proximity 1 come closer video
						 raw_distance.text = String("Proximity Raw Distance= " + a.getAnalogData(proximity_sensor_pin));
						 proximity_readout.text = String(a.getAnalogData(proximity_sensor_pin));
						
						 if (AProxVideoPlaying == 0) { //only do something if a proximity video is NOT playing so don't count or play another prox video until done, other triggered videso can play however or change mode
						 
								if ((a.getAnalogData(proximity_sensor_pin) > proximity_sensor_trigger1_distance_lower) && (a.getAnalogData(proximity_sensor_pin) < proximity_sensor_trigger1_distance_upper)) { //make sure subject is standing in the right spot for a while
										proximity_counter++;
										if (LEDOffFlag == 1) {  //then the LED has been off for long enough so turn it on
											LEDOffFlag = 0; //the led is on so turn the flag on, cannot come back until after the LED has been turned off and delay reached
											a.writeDigitalPin(AboveFireLed_pin, Arduino.HIGH); //turn on the LED and then use the timer to turn it off
											LEDTimer.start(); //start this timer, goes off in 50ms
										}
										//now let's set a time which will then turn it off, essentially a blink
										if (verbose == "yes") {SensorText.text = String("Proximity 1 Match= " + proximity_counter)}; //show the counter in the text box 
								}	
								
								if ((a.getAnalogData(proximity_sensor_pin) > proximity_sensor_trigger2_distance_lower) && (a.getAnalogData(proximity_sensor_pin) < proximity_sensor_trigger2_distance_upper)) { //make sure subject is standing in the right spot for a while
										proximity_counter2++;
										if (LEDOffFlag == 1) {  //then the LED has been off for long enough so turn it on
											LEDOffFlag = 0; //the led is on so turn the flag on, cannot come back until after the LED has been turned off and delay reached
											a.writeDigitalPin(AboveFireLed_pin, Arduino.HIGH); //turn on the LED and then use the timer to turn it off
											LEDTimer.start(); //start this timer, goes off in 50ms
										}
										//now let's set a time which will then turn it off, essentially a blink
										if (verbose == "yes") {SensorText.text = String("Proximity 2 Match= " + proximity_counter2)}; //show the counter in the text box 
								}	
								
								if (proximity_counter == proximity_sensor_trigger1_time) {  //if the first trigger has been reached, may need to add if nothing else is playing flag also
										FirstProxVideoPlaying = 1;  //it gets reset to 0 on clip done routine
										
										AProxVideoPlaying = 1; //this gets reset back to 0 from the OnClipDone routine										
										if (myXML.quiz_mode == "on") { //if quiz mode is on, we'll want to tell the proximity videos to stop playing until the correct answer has been picked
											QuizModeStopProxFlag = 1;
										}
										
										a.writeDigitalPin(AboveFireLed_pin, Arduino.HIGH); //turn on the green led above the fire, do not turn off until coming closer
										if (x10_commands == "on") {
												X10_OFF(x10_address1);
												//X10_OFF(x10_address1);
										}								
																				
										if (mode_select == "tts_mode") { //only play the sound if tts mode is on, otherwise just do the normal thing
											if (custom_audio == "on") {
												say_custom_audio(proximity1_mp3);
											}
											else {
												say(proximity1_tts);
											}																
										
											if (lipsync_feature == "on") {
												myVid.play(lipsync_clip);
											}
											else {
												myVid.play(proximity1_clip);			
											}		
										}	
										else {
											myVid.play(proximity1_clip);			
										}												
										
										
										if (webcamfound == 1 && idle_videos == "off") {
											webcamvideo.visible = false; //turn webcam back on now that's we've played
											//frame.visible = false;
											_detectionTimer.stop();
										}
										
										
										
								}
								
								if (proximity_counter2 == proximity_sensor_trigger2_time) {
										a.writeDigitalPin(AboveFireLed_pin, Arduino.LOW); //they came closer so turn it off now
										
										AProxVideoPlaying = 1;
										if (myXML.quiz_mode == "on") { //if quiz mode is on, we'll want to tell the proximity videos to stop playing until the correct answer has been picked
											QuizModeStopProxFlag = 1;
										}
										
										if (x10_commands == "on") {
											X10_OFF(x10_address1);
										}
										
										if (proximity_flag3 == 0) {	//toggles between the two proximity clips
											
											if (mode_select == "tts_mode") { //only play the sound if tts mode is on, otherwise just do the normal thing
												if (custom_audio == "on") {
													say_custom_audio(proximity2_mp3);
												}
												else {
													say(proximity2_tts);
												}																
											
											if (lipsync_feature == "on") {
												myVid.play(lipsync_clip);
											}
											else {
												myVid.play(proximity2_clip);		
											}		
										}	
										else {
											myVid.play(proximity2_clip);	
										}									
											
											if (webcamfound == 1 && idle_videos == "off") {
												webcamvideo.visible = false; //turn webcam back on now that's we've played
												//frame.visible = false;
												_detectionTimer.stop();
											}
											
											proximity_flag3 = 1;						
										}
										else {
											
											if (mode_select == "tts_mode") { 
												if (custom_audio == "on") {
													say_custom_audio(proximity3_mp3);
												}
												else {
													say(proximity3_tts);
												}																
												if (lipsync_feature == "on") {
													myVid.play(lipsync_clip);
												}
												else {
													myVid.play(proximity3_clip);	
												}		
											}	
											else {
												myVid.play(proximity3_clip);
											}									
											
											if (webcamfound == 1 && idle_videos == "off") {
												webcamvideo.visible = false; 
												_detectionTimer.stop();
											}	
											
											
											proximity_flag3 = 0;
										}																						
										//proximity_flag = 0; //set this to zero right away so we don't repeat it, the first clip has to play first
								}
						 }
				 
			 } //end prox1 before prox 2 if
			 
			 else {				//proximity 2 and 3 videos can only play once the first proximity come closer video has played 
					raw_distance.text = String("Proximity Raw Distance= " + a.getAnalogData(proximity_sensor_pin));
					proximity_readout.text = String(a.getAnalogData(proximity_sensor_pin));
					
					if ((a.getAnalogData(proximity_sensor_pin) > proximity_sensor_trigger1_distance_lower) && (a.getAnalogData(proximity_sensor_pin) < proximity_sensor_trigger1_distance_upper )) { //make sure subject is standing in the right spot for a while
						proximity_counter++;
						if (LEDOffFlag == 1) {  //then the LED has been off for long enough so turn it on
							LEDOffFlag = 0; //the led is on so turn the flag on, cannot come back until after the LED has been turned off and delay reached
							a.writeDigitalPin(AboveFireLed_pin, Arduino.HIGH); //turn on the LED and then use the timer to turn it off
							LEDTimer.start(); //start this timer, goes off in 50ms
						}
						//now let's set a time which will then turn it off, essentially a blink
						//trace (proximity_counter);
							if (verbose == "yes") {SensorText.text = String("Proximity Match= " + proximity_counter)}; //show the counter in the text box 
					}
					
					if ((proximity_counter == proximity_sensor_trigger1_time) && (proximity1_do_not_play_again ==0)) {  //now play the first proximity clip to come closer
						//proximity_counter = 0;  //do this from the onclipclose function
						//proximity1_do_not_play_again = 1;  //do this from the onclipclose function
						// proxity_flag =1;      // refer to the onclipclose function that has just set the proxity flag = 1
						
						FirstProxVideoPlaying = 1;  //it gets reset to 0 on clip done routine						
						if (myXML.quiz_mode == "on") { //if quiz mode is on, we'll want to tell the proximity videos to stop playing until the correct answer has been picked
							QuizModeStopProxFlag = 1;
							QuizQuestionPlayed = 1;
							video_playing = 1; //so other the answers can't play until the question has finished playing 
							sound_playing = 1;
							myVid.play(proximity1_clip);
							QuizTimer.start(); //start the timer and reset things after the timer is up, this means in case a user starts the prox question but does not come back and do the answer
						}
						else {						
							a.writeDigitalPin(AboveFireLed_pin, Arduino.HIGH); //turn on the green led above the fire, do not turn off until coming closer
							if (x10_commands == "on") {
									X10_OFF(x10_address1);
								}
							//myVid.visible = true;
							
							if (mode_select == "tts_mode") { 
								if (custom_audio == "on") {
									say_custom_audio(proximity1_mp3);
								}
								else {
									say(proximity1_tts);
								}																
								if (lipsync_feature == "on") {
										myVid.play(lipsync_clip);
									}
									else {
										myVid.play(proximity1_clip);	
								}		
							}	
							else {
								myVid.play(proximity1_clip);
							}									
							
							if (webcamfound == 1 && idle_videos == "off") {
								webcamvideo.visible = false; 
								_detectionTimer.stop();
							}	
						}
					}
					
					if (proximity_flag == 1) {       // if close enough, then play the second proxity clip
						//myVid.visible = true;
						//if (a.getAnalogData(proximity_sensor_pin) < proximity_sensor_trigger2_distance) {
						if (a.getAnalogData(proximity_sensor_pin) < proximity_sensor_trigger2_distance_upper) {								
							a.writeDigitalPin(AboveFireLed_pin, Arduino.LOW); //they came closer so turn it off now
							if (x10_commands == "on") {
								X10_OFF(x10_address1);
							}
							
							if (proximity_flag3 == 0) {				
								
								if (mode_select == "tts_mode") { 
									if (custom_audio == "on") {
										say_custom_audio(proximity2_mp3);
									}
									else {
										say(proximity2_tts);
									}																
									if (lipsync_feature == "on") {
										myVid.play(lipsync_clip);
										}
										else {
											myVid.play(proximity2_clip);	
										}		
									}	
									else {
										myVid.play(proximity2_clip);
									}									
								
								if (webcamfound == 1 && idle_videos == "off") {
									webcamvideo.visible = false; 
									_detectionTimer.stop();
								}									
								
								proximity_flag3 = 1;						
							}
							else {
								if (mode_select == "tts_mode") { 
									if (custom_audio == "on") {
										say_custom_audio(proximity3_mp3);
									}
									else {
										say(proximity3_tts);
									}																
									if (lipsync_feature == "on") {
										myVid.play(lipsync_clip);
									}
									else {
										myVid.play(proximity3_clip);	
									}		
								}	
								else {
									myVid.play(proximity3_clip);
								}									
								
								if (webcamfound == 1 && idle_videos == "off") {
									webcamvideo.visible = false; 
									_detectionTimer.stop();
								}									
								
								proximity_flag3 = 0;
							}																						
							//proximity_counter = 0; //reset all the counters					//
							proximity_flag = 0; //set this to zero right away so we don't repeat it, the first clip has to play first
						}
					}
					
					
			 	} //end else for prox1 before prox 2
			} //end if for proximity routine
			
			if ((hardware_mode_select == "on") && (SlideShowRunning == 0) && (doorcamPlayingFlag == 0) && (photoboothRunning == 0)) { //can't change the character during a slideshow or photobooth running
					var num:int;
					modeSelect.text = String("Character Select Potentiometer=" + a.getAnalogData(hardware_mode_select_pin));  //pin 4
					hardware_mode_select_value = a.getAnalogData(hardware_mode_select_pin); //use this for hardware mode select
					num = (initial_hardware_mode_select_value - a.getAnalogData(hardware_mode_select_pin));
					
					var numAbsolute:int = Math.abs(num);
					
					if  (numAbsolute > 75) { // was 75, if the change is greater than 175, then check to see if need to change mode
							initial_hardware_mode_select_value  = a.getAnalogData(hardware_mode_select_pin); //reset the initial value
							if (verbose == "yes") {zero_analog.text = String(numAbsolute)};
							ModeSelectTimer.start(); //start the timer for 1/2 second
							//switch_mode();
					}
			 }
			 
			
			if (alcohol_sensor == "on") {					
				  
					alcohol_reading_now = a.getAnalogData(alcohol_sensor_pin);			
					alcohol_sensor_text.text = String("Alcohol Sensor=" + alcohol_reading_now);	
			}
			
			if (alcohol_sensor == "on" && myXML.alcohol_display_value == "on") {
				
				AlcoholReadingText.visible = true;
				AlcoholReadingText.defaultTextFormat = BreathTextFormat; //need to reapply th
				AlcoholReadingText.text = String(a.getAnalogData(alcohol_sensor_pin));						
			} 
			
			
							
		} //************************************ end onreceive analog function
				
		
		private function Touch1PressedTimerEvent(e:TimerEvent):void { //weather
			//if (a.getAnalogData(analog_input1_pin) == 0)  {  //now check if its still 0, it had to have been zero for 100ms
			if (initial_touch1_value != touch1_value) {    //now check if its still not equal, it had to have been zero for 100ms
				if (x10_commands == "on") {
					X10_OFF(x10_address1);					
				}
				if (verbose == "yes") {
					one_analog.text = "Touched";
					touch_counter_text.text = "Touch Counter: " + String(touch_counter);
					Touch1Timer.start()//start timer for three seconds and then reset the label
				}						
				touch_counter++; //this tracks how many touches have happened
				video_playing = 1; //set the video playing flag			
			
				if (myXML.analog1_video1 == "on") {  //then just play video2_clip as opposed to stock
					myVid.play(video1_clip);
				}		
				else {			
					weatherUpdate();	
				}
			}
		}
		
		private function Touch2PressedTimerEvent(e:TimerEvent):void { //stock
			//if (a.getAnalogData(analog_input2_pin) == 0)  {  //now check if its still 0, it had to have been zero for 100ms
			if (initial_touch2_value != touch2_value) {    //now check if its still not equal, it had to have been zero for 100ms
				if (x10_commands == "on") {
					X10_OFF(x10_address1);
				}
				if (verbose == "yes") {
					two_analog.text = "Touched";
					touch_counter_text.text = "Touch Counter: " + String(touch_counter);
					Touch2Timer.start()//start timer for three seconds and then reset the label
				}						
				touch_counter++;
				video_playing = 1; //set the video playing flag			
			
				if (myXML.analog2_video2 == "on") {  //then just play video2_clip as opposed to stock
					myVid.play(video2_clip);
				}		
				else {			
					stockUpdate();	
				}
			}
		}
		
		private function Touch3PressedTimerEvent(e:TimerEvent):void { //x10 on off
			if (webcamfound == 1 && idle_videos == "off") {
					webcamvideo.visible = false; //turn webcam back on now that's we've played
					_detectionTimer.stop();
			}
			
			//if (a.getAnalogData(analog_input3_pin) == 0)  {  //now check if its still 0, it had to have been zero for 100ms
			if (initial_touch3_value != touch3_value) {	       //now check if its still not equal, it had to have been zero for 100ms
				if (verbose == "yes") {
					three_analog.text = "Touched";
					touch_counter_text.text = "Touch Counter: " + String(touch_counter);
					Touch3Timer.start()//start timer for three seconds and then reset the label
				}						
			touch_counter++;
			video_playing = 1; 
			
			
			if (myXML.analog3_video3 == "on") {  //then just play video3_clip as opposed x10 or prox
					myVid.play(video3_clip);
					return; //get out of the function here
			}		
			
			if (myXML.analog3_prox == "on") {  //then just play the prox videos instead
				if (prox_flag == 0) {
					
					if (mode_select == "tts_mode") { 
						if (custom_audio == "on") {
							say_custom_audio(proximity2_mp3);
						}
						else {
							say(proximity2_tts);
						}	
						
						if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(proximity2_clip);
						}							
					}	//end tts mode if
					else { //not in tts mode
						myVid.play(proximity2_clip);
					}							
				} //end prox flag if
				
				else { 
					
					if (mode_select == "tts_mode") { 
						if (custom_audio == "on") {
							say_custom_audio(proximity3_mp3);
						}
						else {
							say(proximity3_tts);
						}			
						
						if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(proximity2_clip);
						}					
						
					}		//end tts mode if
					else {
						myVid.play(proximity3_clip);
					}
				}
			}			
			else {  //else normal way and play x10 stuff
			
				if (x10_on_off_flag == 0) { //play this one, set the flag which will play the alternative for next time and then back to this
					
					if (mode_select == "tts_mode") { 
						if (custom_audio == "on") {
							say_custom_audio(x10_on_mp3);
						}
						else {
							say(x10_on_tts);
						}
						if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(x10_on_clip);
						}					
					}	
					else {
						myVid.play(x10_on_clip); //call the x10 commands from the onclip function
					}
					X10_ON(x10_address2);				
					
					if (webcamfound == 1 && idle_videos == "off") {
						webcamvideo.visible = false; 
						_detectionTimer.stop();
					}	
					
					
					}
				else {
					
					if (mode_select == "tts_mode") { 
						if (custom_audio == "on") {
							say_custom_audio(x10_off_mp3);
						}
						else {
							say(x10_off_tts);
						}					
						if (lipsync_feature == "on") {
							myVid.play(lipsync_clip);
						}
						else {
							myVid.play(x10_off_clip);
						}					
					}	
					else {
						myVid.play(x10_off_clip);
					}
					
					X10_OFF(x10_address2);
					
					if (webcamfound == 1 && idle_videos == "off") {
						webcamvideo.visible = false; 
						_detectionTimer.stop();
					}	
					
					
					
				}				
			}
				
			//initial_touch3_value = touch3_value;	
			}
		}
		
		private function Touch1TimerEvent(e:TimerEvent):void { 
				one_analog.text = "Touch Sensor 1 - Weeather";
				Touch1Timer.reset(); //reset the timer
				initial_touch1_value = touch1_value;	
		}
		
		private function Touch2TimerEvent(e:TimerEvent):void { 
				two_analog.text = "Touch Sensor 2 - Stock";
				Touch2Timer.reset(); //reset the timer
				initial_touch2_value = touch2_value;	
		}
		
		private function Touch3TimerEvent(e:TimerEvent):void { 
				three_analog.text = "Touch Sensor 3 - X10 ON/OFF"; 
				Touch3Timer.reset(); //reset the timer
				initial_touch3_value = touch3_value;	
		}
		
		private function ModeSelectTimerEvent(e:TimerEvent):void { //hardware mode select timer function
				check_charChange(); //call the switch mode function to change modes
				ModeSelectTimer.reset(); //reset the timer
		}
		
		
		private function LEDoff(e:TimerEvent):void { //turns the LED off
			if (FirstProxVideoPlaying == 0) {  //don't allow turn off if the first proximity video is playing
				a.writeDigitalPin(AboveFireLed_pin, Arduino.LOW); //turn LED off				
				}
			LEDTimer.reset(); //reset the timer
			LEDTimerOff.start(); //start the other time to control how long the LED is off before turning back on	
			}
		
		private function LEDon(e:TimerEvent):void {  //how long to wait before the LED can be turned back on
			LEDOffFlag = 1; //the LED has been off for long enough so now set flag that its ok to turn the LED back on again
			LEDTimerOff.reset(); //reset the timer and then its called again when needed above
		}
		
		private function debounceTimer2Event(e:TimerEvent):void { //this is going to get called twice but it will only start debounceTimer2 once
			    trace ("went to debounce event 2");
				inDigitalFunction = 0;				
		}
		
		private function onReceiveDigitalData(e:ArduinoEvent):void {
				//trace("Digital pin " + e.pin + " on port: " + e.port +" = " + e.value);
				if (myXML.debounce == "on") {
					if (inDigitalFunction == 0) {
						trace ("received digital data");
						debounceTimer.start(); 
						debounceCounter++;
						trace ("debounceCounter1: " + debounceCounter);
					}
				}
				else {
					DigitalDataReceive();		
				}
		}
		
		//private function debounceTimerEvent(e:TimerEvent):void { //this is going to get called twice but it will only start debounceTimer2 once
		//	 	trace ("went to first debounce event");
		//		debounceTimer.reset(); 
		//		if ((debounceCounter == 1) || (debounceCounter == 2)) {
		//			debounceTimer2.start();					
		//		}
		//		trace ("debounceCounter2: " + debounceCounter);
		//}
					
		private function debounceTimerEvent(e:TimerEvent):void {
			DigitalDataReceive();			
		}
		
		private function DigitalDataReceive():void { //comes up 6 seconds after the text appears, now turn off
			
			inDigitalFunction = 1;
			debounceTimer2.start();
			//debounceTimer2.start(); //this reset inDigitalFunction to 0 after x seconds, it's for the button debounce
			trace ("debounceCounter in function: " + debounceCounter);
			//*************************************************************
			if (digital_switches == "on") {
						//if (debounceCounter == 1) { //this broke things so removed it
							trace ("button push");
								if (verbose == "yes") {				
									two.text = String("Switch 1 - Arduino Digital Pin 2=" + a.getDigitalData(switch1_pin));
									three.text = String("Switch 2 - Arduino Digital Pin 3=" + a.getDigitalData(switch2_pin));
									four.text = String("Switch 3 - Arduino Digital Pin 4=" + a.getDigitalData(switch3_pin));		
									seven.text = String("Switch 4 - Arduino Digital Pin 7=" + a.getDigitalData(switch4_pin));	
									five.text = String("Switch 5 - Arduino Digital Pin 5=" + a.getDigitalData(switch5_pin));	
									
									//one_analog.text = String("Touch1-Weather=" + a.getDigitalData(analog_input1_pin));
									//two_analog.text = String("Touch2-Stock=" + a.getDigitalData(analog_input2_pin));
									//three_analog.text = String("Touch3-X10 ON/OFF=" + a.getDigitalData(analog_input2_pin));
									//one_analog.text = String("Touch1-Weather=" + a.getDigitalData(19));
									//two_analog.text = String("Touch2-Stock=" + a.getDigitalData(16));
									//three_analog.text = String("Touch3-X10 ON/OFF=" + a.getDigitalData(17));
									
									if (Number(myXML.board_version) >= 99 ) {  //if the board version 4 or greater, then we have an additional switch6
										six.text = String("Switch 6 - Arduino Digital Pin 6=" + a.getDigitalData(switch6_pin));	
									}
								}
								///**************write the values of the switches to variables ********
								///************* the inital variables are stored in the one time routine*****
								
								switch1_value = a.getDigitalData(switch1_pin)
								switch2_value = a.getDigitalData(switch2_pin);
								switch3_value = a.getDigitalData(switch3_pin);
								switch4_value = a.getDigitalData(switch4_pin);
								switch5_value = a.getDigitalData(switch5_pin);
								
								//touch1_value = a.getDigitalData(19);
								//touch2_value = a.getDigitalData(16);
								//touch3_value = a.getDigitalData(17);
								
							if (Number(myXML.board_version) >= 99 ) {  //switch6 is not used currently
								switch6_value = a.getDigitalData(switch6_pin);
							}
							
					
							if (switch5 == "on") {  // ******** this is only for the photobooth if it's started but idle so the breath/switch5 can trigger it to start		
								if (switch4 == "on" && myXML.picasa_insteadofphotobooth == "off" && photoboothIdle == 1 && BreathalyzerInProgress == 0 ) { //only if photobooth is in the special idle mode
									if (a.getDigitalData(switch5_pin) == switch5_trigger) {	
										photoboothRunning = 1;
										RunPhotobooth2();	
										trace("went to switch4 one time place");
										//return; //break out of here
									}
								}
							}
							
							
							if (myXML.video_interrupts == "on") {
								if ((SlideShowRunning == 0)  && (doorcamPlayingFlag == 0) && (photoboothRunning == 0) && (photoboothIdle == 0)) {  //don't play error sound if slideshow or photobooth
										if ((initial_values_done == 1) && (doorcamPlayingFlag == 0) && (idle_start_playing == 1) && (initial_values_done == 1) && (idle_start_playing == 1)) {
											run_digital_switches(); //the function for switches 1,2,3, and 5
										}										
										else {									
											if (myXML.debounce == "on") { notready_sound.play();}								
										}
								} 
								
							}
							else {
								if ((SlideShowRunning == 0) && (doorcamPlayingFlag == 0) && (photoboothRunning == 0) && (photoboothIdle == 0)) {  //don't play error sound if slideshow or photobooth
										if ((initial_values_done == 1) && (doorcamPlayingFlag == 0) && (idle_start_playing == 1) && (initial_values_done == 1) && (idle_start_playing == 1) && (video_playing == 0) && (sound_playing == 0)) {
											run_digital_switches(); //then don't play until the current video playing is done
										}
										else {									 
											if (myXML.debounce == "on") { notready_sound.play();}	
										}		
								}
								
							}
							
							
							
								
							if (switch4 == "on") {  // ******** IMPORTANT end if for switch 5, 1, 2, and 3, do not put this after switch4 or picasa slideshow won't work					
								
								if (myXML.picasa_insteadofphotobooth == "on") {  //its ok if a video is playing for picasa
								
									if (a.getDigitalData(switch4_pin) == switch4_trigger)  { //the idol was picked up
																	
											StartSlideShow(); 	
									}
									else {
											StopSlideShow(); 	
									}
								}
								
								else {
									if ((video_playing == 0) && (sound_playing == 0) && (BreathalyzerInProgress == 0) && (a.getDigitalData(switch4_pin) == switch4_trigger))  { //photobooth time but a video cannot be playing
									//if (a.getDigitalData(switch4_pin) == switch4_trigger)  { //photobooth time but a video cannot be playing
											
											StartPhotobooth(); 	//only start if breathalyzer or something else not already started
											
											
									}
									else {
											if (photoboothRunning == 1 || photoboothIdle == 1) {
												StopPhotobooth(); 	//only go here if the photobooth is running
											}
									}						
									
								}
								
							}       
							
							if (debounceCounter >= 2) { 
								debounceCounter = 0;
							}
							
							//debounceTimer2.reset();
							debounceTimer.reset();
							
							//debounceTimer.reset();
					//   }	//end debounce if statement
					  // else {
						//   debounceCounter = 0; //reset this one
					//   }
						
				} // end if digital switches on		
				//inDigitalFunction = 0;
				// debounceTimer.addEventListener(TimerEvent.TIMER_COMPLETE,  debounceTimerEvent);
		}	// ************end digial inputs function	
		
		
		private function run_digital_switches():void {
						trace ("run digital switches");			
						if (switch5 == "on") { //breathalyzer switch
						//if ((switch5 == "on") && (video_playing == 0) && (sound_playing == 0)) { //breathalyzer switch
							
							//if (initial_switch5_value != switch5_value) { //then the flip was switched  
							//if (initial_switch5_value != a.getDigitalData(switch5_pin)) {
								if (a.getDigitalData(switch5_pin) == switch5_trigger) {	
									//video_playing = 1; //don't set these right away because we don't know if the quiz questions are actually going to play
									//sound_playing = 1;
										if (myXML.digital5_video3 == "on") {  //then just play video1_clip as opposed to weather			
											if (myXML.quiz_mode == "on") {
												if (QuizReadytoAnswerFlag == 1) { //ready to answer flag must be on	
													myVid.play(video3_clip);
													video_playing = 1; 
													sound_playing = 1;
													FirstProxVideoPlaying = 1; //set this here so the prox videos don't kick in, it will get reset in the onclipdone function	
													if (myXML.quiz_correctanswer == "5") { //then the correct quiz answer was picked
														wrongAnswerFlag = 0;
														QuizModeStopProxFlag = 0; //the rigth answer was picked so set this back so proxy videos can play again			
														QuizQuestionPlayed = 0; //for quiz mode, the correct question was played so set this flag back to 0 meaning that the answers cannot play again until the question has played
														QuizReadytoAnswerFlag = 0;
													}	
												}
											}
											
											else {
												myVid.play(video3_clip); //quick mode is not on so just play the custom video
												video_playing = 1; 
												sound_playing = 1;
											}
										} 								
										else {		
												video_playing = 1; 
												sound_playing = 1;
												BreathalyzerInProgress = 1;
												//video_playing = 1; 
												//sound_playing = 1; //set the sound to play even though TTS may not be enabled but that's ok as its get set back to 0 after onclipdone or a swtich mode change
												//add if statement for x10 or breathalyzer here
												
												TextClearTimer.stop();
												
												alcohol_baseline = Number(a.getAnalogData(alcohol_sensor_pin));  //establish the baseline which is the alcohol sensor reading when the button was pressed, we will then compare this value to the value after the user is down blowing
																		
																					
												Alcohol_CountdownTimer.reset();
												Alcohol_CountdownTimer2.reset();
												mirror_did_not_init_text.visible = false;
												
												//original_alcohol_baseline is the value that alcohol sensor should be at while its idle (no alcohol present)
												alcohol_baseline_difference = alcohol_baseline - original_alcohol_baseline;  //alcohol_baseline is the baseline when the button was pressed, we need to make sure there is not a significant delta between what it should be as what it is now
												alcohol_baseline_difference = Math.abs(alcohol_baseline_difference);
												
												if (alcohol_baseline_difference > alcohol_baseline_difference_allowance) {  //this means either alcohol sensor has not reset or the user blew before pressing the button
													
													if (mode_select == "tts_mode") { 
														if (custom_audio == "on") {
															say_custom_audio(wait_mp3);
														}
														else {
															say_breath(wait_tts);
														}			
														sound_playing = 0;
													}	
													
													else {
														wait_sound.play();
														sound_playing = 0;
													}									
													
													mirror_did_not_init_text.visible = true;
													mirror_did_not_init_text.text = String("The Breathalyzer is not ready or you blew into the Breathalyzer too soon (before pushing the button");
													PleaseWaitTextClearTimer.start();
												}
												
												else {   //we are ok so let's continue and have the user blow into the Breathalyzer
													//AlcoholText.text = "Please Wait...";  //not used anymore, just go straight to blow
													//wait_sound.play();
													myVid.visible = false;
		
													Alcohol_Counter = alcohol_countdown; //reset this counter									
													AlcoholText.visible = true;
													Alcohol_CountdownTimer.start(); //this timer is very short, only 50 ms, then goes to blow...								
												}		
										}
											
									initial_switch5_value = switch5_value; // now set it to equal	
									//initial_switch5_value = a.getDigitalData(switch5_pin); 
							}
					}
						
								
						
						if (switch1 == "on") { 
						//if ((switch1 == "on") && (video_playing == 0) && (sound_playing == 0)) { 
						
						//if (switch1 == "on") {
								//if (video_playing == 0 && sound_playing == 0) {	//only go here if another video is not already playing
									
									//if (initial_switch1_value != switch1_value) {
									//if (initial_switch1_value != a.getDigitalData(switch1_pin)) {	
									if (a.getDigitalData(switch1_pin) == switch1_trigger) {
										if (myXML.digital1_prox == "on") {  //then just play the prox videos instead
												if (myXML.quiz_mode == "on") { //if we are in quiz mode, then just repeat the question which is the first proximity video
														video_playing = 1; 
														sound_playing = 1;
														FirstProxVideoPlaying = 1; //set this here so the prox videos don't kick in, it will get reset in the onclipdone function	
														QuizModeStopProxFlag = 1;
														wrongAnswerFlag = 1;  //in this case we're just repeating the question so set the wrong question flag so it loops to the quizloop in onclipdone function
														QuizQuestionPlayed = 1; //the question has played so now the answers can play
														myVid.play(video4_clip);	
														QuizReadytoAnswerFlag = 1; //set this so the question videos can play
														QuizTimer.start(); //start the timer in the event it wasn't started from the prox videos
														
												}
												else {
														if (prox_flag == 0) {
															
															if (mode_select == "tts_mode") { 
																if (custom_audio == "on") {
																	say_custom_audio(proximity2_mp3);
																}
																else {
																	say(proximity2_tts);
																}																
																if (lipsync_feature == "on") {
																	myVid.play(lipsync_clip);
																	}
																else {
																	myVid.play(proximity2_clip);	
																}		
															}	
															else {
																myVid.play(proximity2_clip);
															}									
															
														}
														else { 
															
															if (mode_select == "tts_mode") { 
																if (custom_audio == "on") {
																	say_custom_audio(proximity3_mp3);
																}
																else {
																	say(proximity3_tts);
																}																
																if (lipsync_feature == "on") {
																myVid.play(lipsync_clip);
															}
																else {
																	myVid.play(proximity3_clip);	
																}		
															}	
															else {
																myVid.play(proximity3_clip);
															}									
														}
													}	
												}
											
											else { //prox videos not on so play the normal mode doorbell
												doorbell_sound.play(); 
												video_playing = 1; 
												sound_playing = 1;
												if (x10_commands == "on") { //turn off the lights first if x10 control is on
													X10_OFF(x10_address1);
													//X10_OFF(x10_address1);
												}
												doorBellTimer.start();
											}
										
										initial_switch1_value = switch1_value; //now set them equal in prep for the next change	
							}
								
						}
						
						
							if (switch2 == "on") { //weather
							//if ((switch2 == "on") && (video_playing == 0) && (sound_playing == 0)) { //weather
							
								//if (initial_switch2_value != switch2_value) { //pin 3			
								//if (initial_switch2_value != a.getDigitalData(switch2_pin)) { 	
								if (a.getDigitalData(switch2_pin) == switch2_trigger) {
									//video_playing = 1; 
									//sound_playing = 1;
									if (myXML.digital2_video1 == "on") {  //then just play video1_clip as opposed to weather	
										if (myXML.quiz_mode == "on") { //ready to answer flag must be on						
												if (QuizReadytoAnswerFlag == 1) {
														myVid.play(video1_clip); //quick mode is not on so just play the custom video
														video_playing = 1; 
														sound_playing = 1;
														FirstProxVideoPlaying = 1; //set this here so the prox videos don't kick in, it will get reset in the onclipdone function	
														if (myXML.quiz_correctanswer == "2") { //then the correct quiz answer was picked
															wrongAnswerFlag = 0;
															QuizModeStopProxFlag = 0; //the rigth answer was picked so set this back so proxy videos can play again	
															QuizQuestionPlayed = 0; //for quiz mode, the correct question was played so set this flag back to 0 meaning that the answers cannot play again until the question has played
															QuizReadytoAnswerFlag = 0;
														}	
												}
										
										}
										else {
											myVid.play(video1_clip); //quick mode is not on so just play the custom video
											video_playing = 1; 
											sound_playing = 1;
										}
									} 
									else {									
										if (x10_commands == "on") {X10_OFF(x10_address1)};								
										weatherUpdate();
										video_playing = 1; 
										sound_playing = 1;
									}
									initial_switch2_value = switch2_value;		
									//initial_switch2_value =  a.getDigitalData(switch2_pin);	
								}
							}
						
						if (switch3 == "on") { //stock
						//if ((switch3 == "on") && (video_playing == 0) && (sound_playing == 0)) { //stock
						
							//if (initial_switch3_value != switch3_value) {  //pin 4   
							//if (initial_switch3_value != a.getDigitalData(switch3_pin)) {
							if (a.getDigitalData(switch3_pin) == switch3_trigger) {
								//video_playing = 1; 
								//sound_playing = 1;								
								if (myXML.digital3_video2 == "on") {  //then just play video1_clip as opposed to weather											
									if (myXML.quiz_mode == "on") { //ready to answer flag must be on		
										if (QuizReadytoAnswerFlag == 1) {
												myVid.play(video2_clip);
												video_playing = 1; 
												sound_playing = 1;
												FirstProxVideoPlaying = 1; //set this here so the prox videos don't kick in, it will get reset in the onclipdone function	
												if (myXML.quiz_correctanswer == "3") { //then the correct quiz answer was picked
													wrongAnswerFlag = 0;
													QuizModeStopProxFlag = 0; //the rigth answer was picked so set this back so proxy videos can play again				
													QuizQuestionPlayed = 0; //for quiz mode, the correct question was played so set this flag back to 0 meaning that the answers cannot play again until the question has played
													QuizReadytoAnswerFlag = 0;
												}
										}
									}
									
									else {
										myVid.play(video2_clip);
										video_playing = 1; 
										sound_playing = 1;
									}
								}
								
								else {	//then don't play the custom video and do the normal function					
									if (x10_commands == "on") {X10_OFF(x10_address1)};								
									stockUpdate();
									video_playing = 1; 
									sound_playing = 1;
								}
								initial_switch3_value = switch3_value; // now set it to equal	
								//initial_switch3_value =  a.getDigitalData(switch3_pin);	
							}
						}
						
						
		
	}
	
	private function X10_ON(address:String):void  {
		 if (x10_in_progress == 0) { //don't send if there is already an x10 command in process
			 //x10_array = [1,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,0,1,1,0,1]; //A1 off command
			 var x10_on_address = address;
			 x10_last = address;
			 Get_X10_Array(x10_on_address); //pass the x10 on address to the x10 get array function
			 x10_array = X10_ON_ARRAY; //the x10 array function ran and now we can assign the array
			 x10_array.push (1,0,1,0,1,1,0,1); //add these to the end of the array, its the last x10 byte
			 x10_array.unshift(1,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0); //add these to the beginning of the array		 
			 X10(); //call the actual x10 function using the x10_array that was obtained from the get x10 array function call	
			 x10_label.text = String("Last X10 Command: " +  x10_last + " ON");
			 trace ("Last x10 Command: " + address + " ON");
			 trace ("X10 ON ARRAY: " + X10_ON_ARRAY);
			 trace ("x10_array: " + x10_array);
		 }
	} //end function
	
	private function X10_OFF(address:String):void	{ 
		 if (x10_in_progress == 0) {
			 var x10_off_address = address;
			 x10_last = address;
			 Get_X10_Array(x10_off_address); //pass the x10 on address to the x10 get array function
			 x10_array = X10_OFF_ARRAY; //the x10 array function ran and now we can assign the array
			 x10_array.push (1,0,1,0,1,1,0,1); //add these to the end of the array, its the last x10 byte
			 x10_array.unshift(1,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0); //add these to the beginning of the array
			 X10(); //call the actual x10 function using the x10_array that was obtained from the get x10 array function call	
			 x10_label.text = String("Last X10 Command: " + x10_last + " OFF");
			 trace ("Last x10 Command: " + address + " OFF");
			 trace ("X10 OFF ARRAY: " + X10_OFF_ARRAY);
			 trace ("x10_array: " + x10_array);
		 }
	} //end function

	private function X10_BRIGHT(address:String):void {
		 if (x10_in_progress == 0) {
			 var x10_bright_address = address;
			 x10_last = address;
			 Get_X10_Array_BrightDim(x10_bright_address); //pass the x10 on address to the x10 get array function
			 x10_array = X10_BRIGHT_ARRAY; //the x10 array function ran and now we can assign the array
			 x10_array.push (1,0,1,0,1,1,0,1); //add these to the end of the array, its the last x10 byte
			 x10_array.unshift(1,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0); //add these to the beginning of the array		 
			 X10(); //call the actual x10 function using the x10_array that was obtained from the get x10 array function call	
			 x10_label.text = String("Last X10 Command: " +  x10_last + " BRIGHT");
			 trace ("Last x10 Command: " + address + " ON");
			 trace ("X10 BRIGHT ARRAY: " + X10_BRIGHT_ARRAY);
			 trace ("x10_array: " + x10_array);
		 }
	} //end function
	
	private function X10_DIM(address:String):void {
		 if (x10_in_progress == 0) {
			 var x10_dim_address = address;
			 x10_last = address;
			 Get_X10_Array_BrightDim(x10_dim_address); //pass the x10 on address to the x10 get array function
			 x10_array = X10_DIM_ARRAY; //the x10 array function ran and now we can assign the array
			 x10_array.push (1,0,1,0,1,1,0,1); //add these to the end of the array, its the last x10 byte
			 x10_array.unshift(1,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0); //add these to the beginning of the array		 
			 trace ("X10 DIM ARRAY: " + X10_DIM_ARRAY);
			 X10(); //call the actual x10 function using the x10_array that was obtained from the get x10 array function call	
			 x10_label.text = String("Last X10 Command: " +  x10_last + " DIM");
		 }
	} //end function
	
	
	private function X10():void  {	
	  x10_in_progress = 1; //set this flag so nothing else happens until this function is done
	  x10_counter = 0; //make sure to set this to zero to start	  
	  a.writeDigitalPin(DTR_pin,Arduino.LOW);
	  a.writeDigitalPin(RTS_pin,Arduino.LOW);  
	  x10_sleep_initial.start(); //sleep for 1 ms and then set to high 	
	} //end function

	///*************** x10 timer functions
	private function x10_sleep_initial_event(e:TimerEvent):void { 
		//***** Put firecracker into standby mode *******
		a.writeDigitalPin(DTR_pin,Arduino.HIGH);
		a.writeDigitalPin(RTS_pin,Arduino.HIGH);
		x10_sleep_initial.reset(); //reset the timer
		x10_sleep35.start();
	}
		
	private function x10_sleep35_event(e:TimerEvent):void {  //delay 35ms before sending the packet
			x10_sleep35.reset();
			x10_main(); //call the x10 main function to start writing bits
	}
	
	private function x10_main():void  {
		if (x10_counter < 40) {
			if (x10_array[x10_counter]==1) {
					a.writeDigitalPin(DTR_pin, Arduino.LOW);       // 1 = RTS HIGH/DTR-LOW
					x10_counter++;
					x10_done1.start();
					
				}
			else {
					a.writeDigitalPin(RTS_pin, Arduino.LOW);
					x10_counter++;
					x10_done1.start();					
			}
		}			
		else {
			x10_sleep1000.start(); //done with the 40 bits so now wait a second			
		} 
	} //end x10 main function
	
	private function x10_done1_event(e:TimerEvent):void { 
			a.writeDigitalPin(DTR_pin,Arduino.HIGH);
			a.writeDigitalPin(RTS_pin,Arduino.HIGH);
			x10_done1.reset();
			x10_done2.start();
	}
	
	private function x10_done2_event(e:TimerEvent):void { 			
			x10_done2.reset();
			x10_main();
	}			
	
	private function x10_sleep1000_event(e:TimerEvent):void { 				
			x10_sleep1000.reset(); //could do another x-10 call here, send parameter of how many x10's to do
			for (var z:int = 0; z < (x10_resends - 1); z++) { //now call more x-10's again as was defined in the config file, since we already did one, minus 1 from this number
				 X10();
				 x10_label.text = String("X10 Command Number: " + z + " sent to address " +  x10_last);
			}
			x10_in_progress = 0; // now we're done with x10 so other ones can play again
	}			
	
	// *** add initArduino() function here //////
	private function initArduino():void {
			
			if (proximity_sensor_on == "on") {a.setAnalogPinReporting(proximity_sensor_pin, Arduino.ON);} //pin 0
			if (analog_input1 == "on") {a.setAnalogPinReporting(analog_input1_pin, Arduino.ON);} //analog pin 1/touch sensor 1
			if (analog_input2 == "on") {a.setAnalogPinReporting(analog_input2_pin, Arduino.ON);} //analog pin 2 / touch sensor 2
			if (analog_input3 == "on") {a.setAnalogPinReporting(analog_input3_pin, Arduino.ON);} //analog pin 3 / touch sensor 3
			if (hardware_mode_select == "on") {a.setAnalogPinReporting(hardware_mode_select_pin, Arduino.ON);} //pin 4	
			if (alcohol_sensor == "on") {a.setAnalogPinReporting(alcohol_sensor_pin, Arduino.ON);} //pin 1		
					
			a.setPinMode(RTS_pin,Arduino.OUTPUT); //set pin8 as output firecracker
			a.setPinMode(DTR_pin, Arduino.OUTPUT); // set pin 12 as output firecracker
			
			////************* digital switches **************
			if (digital_switches == "on") {  //this is on in the xml file by default but not something that can be changed in the configuration program
				a.enableDigitalPinReporting();
				if (switch1 == "on") {a.setPinMode(switch1_pin, Arduino.INPUT);}  // pin 2
				if (switch2 == "on") {a.setPinMode(switch2_pin, Arduino.INPUT);}  // pin 3
				if (switch3 == "on") {a.setPinMode(switch3_pin, Arduino.INPUT);}   // pin 4
				if (switch4 == "on") {a.setPinMode(switch4_pin, Arduino.INPUT);}  //pin 7			
				if (switch5 == "on") {a.setPinMode(switch5_pin, Arduino.INPUT);} //pin 5
				
				//if (analog_input1 == "on"){a.setPinMode(19, Arduino.INPUT);}//analog pin 1/touch sensor 1
				//if (analog_input2 == "on"){a.setPinMode(16, Arduino.INPUT);} //analog pin 2 / touch sensor 2
				//if (analog_input3 == "on"){a.setPinMode(17, Arduino.INPUT);} //analog pin 3 / touch sensor 3
				
				if (Number(myXML.board_version) >= 99 ) {  //not using right now, if the board version 4 or greater, then we have an additional switch6
					if (switch6 == "on") {a.setPinMode(switch6_pin, Arduino.INPUT);} //pin 6
				}
			}	
			
			if (LED_mode == "fire") {
			
				if (Number(myXML.board_version) < 99 ) {  //not using right now so set it to 99, if the board version is less than 4, then we have 4 LEDs as opposed to 3 LEDs with board version 4 and above
					a.setPinMode(LED1_pin, Arduino.PWM); //pin6			
				}
				
				a.setPinMode(LED2_pin, Arduino.PWM); //pin 9
				a.setPinMode(LED3_pin, Arduino.PWM); // pin 10
				a.setPinMode(LED4_pin, Arduino.PWM); // pin 11
			}
			else {
				a.setPinMode(LED1_pin, Arduino.OUTPUT);  //indicator mode for the LEDs
				a.writeDigitalPin(LED1_pin, Arduino.LOW); //turn it off to start
				
				///***** breath only red LED
				a.setPinMode(LED2_pin, Arduino.OUTPUT);  //breath only red LED  9
				a.writeDigitalPin(LED2_pin, Arduino.LOW); //turn it off to start
				///***************************************
				
				a.setPinMode(LED3_pin, Arduino.OUTPUT);  
				a.writeDigitalPin(LED3_pin, Arduino.LOW); //turn it off to start
				a.setPinMode(LED4_pin, Arduino.OUTPUT);  
				a.writeDigitalPin(LED4_pin, Arduino.LOW); //turn it off to start			
			}
			
			if (test_switch == "off") {  //for playhouse wiring setup only
				a.setPinMode(AboveFireLed_pin, Arduino.OUTPUT);  //pin 5
				a.writeDigitalPin(AboveFireLed_pin, Arduino.LOW); //turn it off to start
				a.setPinMode(Fiber_Led_pin, Arduino.OUTPUT);  //pin 13
				a.writeDigitalPin(Fiber_Led_pin, Arduino.HIGH); 
			}
			else {  //using pin 13 as the proximity LED
				a.setPinMode(AboveFireLed_pin, Arduino.OUTPUT);  //pin 13
				a.writeDigitalPin(AboveFireLed_pin, Arduino.LOW); //turn it off to start
				
			}
			////**********************************************			
			
			foundArduino = 1; //used for the error box that will come up if the Arduino was not found
			sensor_delayTimer.start(); //start this timer which will then call initial_values after 1 second
			//initial_values(); //used to call this directlyl but now its called from a timer due to timing issue from before
			
		} //end initarduino
		//  ******************************** //////
		
		//public function initial_values():void
		public function initial_values(e:TimerEvent):void
        {
          		  
		  StartUpText.visible = false;		
		 		   
		 if (digital_switches == "on") { //get the initial values of the digital sensors		 
			initial_switch1_value = switch1_value; //check if null
			initial_switch2_value = switch2_value;
			initial_switch3_value = switch3_value;		
			initial_switch4_value = switch4_value;
			initial_switch5_value = switch5_value;
			
			//if (analog_input1 == "on") {initial_touch1_value = touch1_value;} //analog pin 1/touch sensor 1
		 	//if (analog_input2 == "on") {initial_touch2_value = touch2_value;} //analog pin 2 / touch sensor 2
		 	//if (analog_input3 == "on") {initial_touch3_value = touch3_value;} //analog pin 3 / to
			
			
			if (Number(myXML.board_version) >= 99 ) {  //not using this right now
				initial_switch6_value = switch6_value;
			}
		 }
		 
		 if (analog_input1 == "on") {initial_touch1_value = touch1_value;} //analog pin 1/touch sensor 1
		 if (analog_input2 == "on") {initial_touch2_value = touch2_value;} //analog pin 2 / touch sensor 2
		 if (analog_input3 == "on") {initial_touch3_value = touch3_value;} //analog pin 3 / to
		 
		 if (hardware_mode_select == "on") {  //set the mode from hardware, otherwise set from config file
				initial_hardware_mode_select_value = hardware_mode_select_value; //get the baseline
					
			if (tts_feature == "on") {
			
				if ((hardware_mode_select_value >= 0) && (hardware_mode_select_value < 200)) {
						mode_select = "princess";}
				if ((hardware_mode_select_value > 200) && (hardware_mode_select_value < 400)) {
						mode_select ="pirate";}
				if ((hardware_mode_select_value > 400) && (hardware_mode_select_value < 600)) {
						mode_select ="halloween";}		
				if ((hardware_mode_select_value > 600) && (hardware_mode_select_value < 800)) {
						mode_select ="insult";}							
				if (hardware_mode_select_value > 800) {
						mode_select ="tts_mode";}			
			}
			
			else {  //then no change the mirror can go into TTS mode
				if ((hardware_mode_select_value >= 0) && (hardware_mode_select_value < 250)) {
						mode_select = "princess";}
				if ((hardware_mode_select_value > 250) && (hardware_mode_select_value < 500)) {
						mode_select ="pirate";}
				if ((hardware_mode_select_value > 500) && (hardware_mode_select_value < 750)) {
						mode_select ="halloween";}		
				if (hardware_mode_select_value > 750)  {
						mode_select ="insult";}									
			}			
		}
		
		else {
		   mode_select = mirror_mode;
		 
		}
		trace (mode_select);
		
		switch (mode_select)  //sets the video playlists based on the mode
			{
			case "princess":
				idle_clip =   		idle_clipp;  
				idle_dup_clip =		idle_dup_clipp;  
				proximity1_clip = 	proximity1_clipp;
				proximity2_clip =   proximity2_clipp;
				touch1_clip =       touch1_clipp;
				weather_good_clip = weather_good_clipp;
				weather_ok_clip =   weather_ok_clipp;
				weather_rain_clip = weather_rain_clipp;
				no_internet_clip = 	no_internet_clipp;
				stock_up_clip = 	stock_up_clipp;
				stock_no_change_clip= stock_no_change_clipp;
				stock_down_clip =   stock_down_clipp;
				doorbell_clip =     doorbell_clipp;
				phone_clip = 		phone_clipp;
				video1_clip = 		video1_clipp;
				video2_clip = 		video2_clipp;
				video3_clip =		video3_clipp;
				video4_clip =		video4_clipp;
				proximity3_clip = 	proximity3_clipp;	
				x10_on_clip = 		x10_on_clipp;	
				x10_off_clip = 		x10_off_clipp;	
				drink1_clip =  		drink1_clipp;	 	
	  			drink2_clip =  		drink2_clipp;			
	  			drink3_clip =  		drink3_clipp;			
	  			drink4_clip =  		drink4_clipp;			
				quizloop_clip =  	quizloop_clipp;			
				wait_sound = wait_sound_princess;
				blow_sound = blow_sound_princess;
				warning_sound = warning_sound_princess;					
				photobooth_IntroSoundPath = photobooth_IntroSoundPathp;
				photobooth_getReadySoundPath = 	photobooth_getReadySoundPathp;
				photobooth_pic2SoundPath = 	photobooth_pic2SoundPathp;
				photobooth_pic3SoundPath = photobooth_pic3SoundPathp;
				photobooth_pic4SoundPath = photobooth_pic4SoundPathp;
				photobooth_developingSoundPath = photobooth_developingSoundPathp;
				photobooth_thanksSoundPath = photobooth_thanksSoundPathp;
				break;
			case "halloween":
				idle_clip =   		idle_cliph;  
				idle_dup_clip =		idle_dup_cliph;  
				proximity1_clip = 	proximity1_cliph;
				proximity2_clip =   proximity2_cliph;
				touch1_clip =       touch1_cliph;
				weather_good_clip = weather_good_cliph;
				weather_ok_clip =   weather_ok_cliph;
				weather_rain_clip = weather_rain_cliph;
				no_internet_clip = 	no_internet_cliph;
				stock_up_clip = 	stock_up_cliph;
				stock_no_change_clip= stock_no_change_cliph;
				stock_down_clip =   stock_down_cliph;
				doorbell_clip =     doorbell_cliph;
				phone_clip = 		phone_cliph;
				video1_clip = 		video1_cliph;
				video2_clip = 		video2_cliph;
				video3_clip =		video3_cliph;
				video4_clip =		video4_cliph;
				proximity3_clip = 	proximity3_cliph;	
				x10_on_clip = 		x10_on_cliph;	
				x10_off_clip = 		x10_off_cliph;	
				drink1_clip =  		drink1_cliph;	 	
	  			drink2_clip =  		drink2_cliph;			
	  			drink3_clip =  		drink3_cliph;			
	  			drink4_clip =  		drink4_cliph;		
				quizloop_clip =  	quizloop_cliph;		
				wait_sound = wait_sound_halloween;
				blow_sound = blow_sound_halloween;
				warning_sound = warning_sound_halloween;	
				photobooth_IntroSoundPath = photobooth_IntroSoundPathh;
				photobooth_getReadySoundPath = 	photobooth_getReadySoundPathh;
				photobooth_pic2SoundPath = 	photobooth_pic2SoundPathh;
				photobooth_pic3SoundPath = photobooth_pic3SoundPathh;
				photobooth_pic4SoundPath = photobooth_pic4SoundPathh;
				photobooth_developingSoundPath = photobooth_developingSoundPathh;
				photobooth_thanksSoundPath = photobooth_thanksSoundPathh;
				break;
			case "pirate":
				idle_clip =   		idle_clippi;  
				idle_dup_clip =		idle_dup_clippi;  
				proximity1_clip = 	proximity1_clippi;
				proximity2_clip =   proximity2_clippi;
				touch1_clip =       touch1_clippi;
				weather_good_clip = weather_good_clippi;
				weather_ok_clip =   weather_ok_clippi;
				weather_rain_clip = weather_rain_clippi;
				no_internet_clip = 	no_internet_clippi;
				stock_up_clip = 	stock_up_clippi;
				stock_no_change_clip= stock_no_change_clippi;
				stock_down_clip =   stock_down_clippi;
				doorbell_clip =     doorbell_clippi;
				phone_clip = 		phone_clippi;
				video1_clip = 		video1_clippi;
				video2_clip = 		video2_clippi;
				video3_clip =		video3_clippi;
				video4_clip =		video4_clippi;
				proximity3_clip = 	proximity3_clippi;	
				x10_on_clip = 		x10_on_clippi;	
				x10_off_clip = 		x10_off_clippi;	
				drink1_clip =  		drink1_clippi;	 	
	  			drink2_clip =  		drink2_clippi;			
	  			drink3_clip =  		drink3_clippi;			
	  			drink4_clip =  		drink4_clippi;			
				quizloop_clip =  	quizloop_clippi;	
				wait_sound = wait_sound_pirate;
				blow_sound = blow_sound_pirate;
				warning_sound = warning_sound_pirate;	
				photobooth_IntroSoundPath = photobooth_IntroSoundPathpi;
				photobooth_getReadySoundPath = 	photobooth_getReadySoundPathpi;
				photobooth_pic2SoundPath = 	photobooth_pic2SoundPathpi;
				photobooth_pic3SoundPath = photobooth_pic3SoundPathpi;
				photobooth_pic4SoundPath = photobooth_pic4SoundPathpi;
				photobooth_developingSoundPath = photobooth_developingSoundPathpi;
				photobooth_thanksSoundPath = photobooth_thanksSoundPathpi;	
				break;
			case "insult":
				idle_clip =   		idle_clipi;  
				idle_dup_clip =		idle_dup_clipi;  
				proximity1_clip = 	proximity1_clipi;
				proximity2_clip =   proximity2_clipi;
				touch1_clip =       touch1_clipi;
				weather_good_clip = weather_good_clipi;
				weather_ok_clip =   weather_ok_clipi;
				weather_rain_clip = weather_rain_clipi;
				no_internet_clip = 	no_internet_clipi;
				stock_up_clip = 	stock_up_clipi;
				stock_no_change_clip= stock_no_change_clipi;
				stock_down_clip =   stock_down_clipi;
				doorbell_clip =     doorbell_clipi;
				phone_clip = 		phone_clipi;
				video1_clip = 		video1_clipi;
				video2_clip = 		video2_clipi;
				video3_clip =		video3_clipi;
				video4_clip =		video4_clipi;	
				proximity3_clip = 	proximity3_clipi;	
				x10_on_clip = 		x10_on_clipi;	
				x10_off_clip = 		x10_off_clipi;	
				drink1_clip =  		drink1_clipi;	 	
	  			drink2_clip =  		drink2_clipi;			
	  			drink3_clip =  		drink3_clipi;			
	  			drink4_clip =  		drink4_clipi;			
				quizloop_clip =  	quizloop_clipi;
				wait_sound = wait_sound_insult;
				blow_sound = blow_sound_insult;
				warning_sound = warning_sound_insult;				
				photobooth_IntroSoundPath = photobooth_IntroSoundPathi;
				photobooth_getReadySoundPath = 	photobooth_getReadySoundPathi;
				photobooth_pic2SoundPath = 	photobooth_pic2SoundPathi;
				photobooth_pic3SoundPath = photobooth_pic3SoundPathi;
				photobooth_pic4SoundPath = photobooth_pic4SoundPathi;
				photobooth_developingSoundPath = photobooth_developingSoundPathi;
				photobooth_thanksSoundPath = photobooth_thanksSoundPathi;
				break;
			case "tts_mode":
				idle_clip =   		idle_cliptts;  
				idle_dup_clip =		idle_dup_cliptts;  
				proximity1_clip = 	proximity1_cliptts;
				proximity2_clip =   proximity2_cliptts;
				touch1_clip =       touch1_cliptts;
				weather_good_clip = weather_good_cliptts;
				weather_ok_clip =   weather_ok_cliptts;
				weather_rain_clip = weather_rain_cliptts;
				no_internet_clip = 	no_internet_cliptts;
				stock_up_clip = 	stock_up_cliptts;
				stock_no_change_clip= stock_no_change_cliptts;
				stock_down_clip =   stock_down_cliptts;
				doorbell_clip =     doorbell_cliptts;
				phone_clip = 		phone_cliptts;
				video1_clip = 		video1_cliptts;
				video2_clip = 		video2_cliptts;
				video3_clip =		video3_cliptts;
				video4_clip =		video4_cliptts;	
				proximity3_clip = 	proximity3_cliptts;	
				x10_on_clip = 		x10_on_cliptts;	
				x10_off_clip = 		x10_off_cliptts;	
				drink1_clip =  		drink1_cliptts;	 	
				drink2_clip =  		drink2_cliptts;			
				drink3_clip =  		drink3_cliptts;			
				drink4_clip =  		drink4_cliptts;	
				quizloop_clip =  	quizloop_cliptts;	
				wait_sound = wait_sound_princess;
				blow_sound = blow_sound_princess;
				warning_sound = warning_sound_princess;	
				avatar_image.visible = false;								
				photobooth_IntroSoundPath = photobooth_IntroSoundPathp;
				photobooth_getReadySoundPath = 	photobooth_getReadySoundPathp;
				photobooth_pic2SoundPath = 	photobooth_pic2SoundPathp;
				photobooth_pic3SoundPath = photobooth_pic3SoundPathp;
				photobooth_pic4SoundPath = photobooth_pic4SoundPathp;
				photobooth_developingSoundPath = photobooth_developingSoundPathp;
				photobooth_thanksSoundPath = photobooth_thanksSoundPathp;
			}
		
		if (doorcam_on == "on") { 
			myVid2.source = doorbell_clip;
		}
		
		if (idle_videos == "off") {
			idle_clip = idle_black;
			idle_dup_clip =	idle_black;  
		}
		
		//reset the proximity flags as the were playing earlier
		proximity_counter = 0;  //reset the proximity counter
		proximity1_do_not_play_again = 0; 
		proximity_flag = 0;
		proximity_counter2 = 0;
		AProxVideoPlaying = 0; 
		//*************************************************
			
		myVid.play(idle_clip); //start the idle clip and then wait for events to happen
		idle_start_playing = 1;
		initial_values_done = 1;
		video_playing = 0;
		x10_on_off_flag = 0;
		
		initPhotoboothSounds();
		
       } //end initial values
	   
	   public function initial_values_no_arduino():void
       {
          		  
		  StartUpText.visible = false;
		  mode_select = mirror_mode;		
		  trace (mode_select);
		
		switch (mode_select)  //sets the video playlists based on the mode
			{
			case "princess":
				idle_clip =   		idle_clipp;  
				idle_dup_clip =		idle_dup_clipp;  
				proximity1_clip = 	proximity1_clipp;
				proximity2_clip =   proximity2_clipp;
				touch1_clip =       touch1_clipp;
				weather_good_clip = weather_good_clipp;
				weather_ok_clip =   weather_ok_clipp;
				weather_rain_clip = weather_rain_clipp;
				no_internet_clip = 	no_internet_clipp;
				stock_up_clip = 	stock_up_clipp;
				stock_no_change_clip= stock_no_change_clipp;
				stock_down_clip =   stock_down_clipp;
				doorbell_clip =     doorbell_clipp;
				phone_clip = 		phone_clipp;
				video1_clip = 		video1_clipp;
				video2_clip = 		video2_clipp;
				video3_clip =		video3_clipp;
				video4_clip =		video4_clipp;
				proximity3_clip = 	proximity3_clipp;	
				x10_on_clip = 		x10_on_clipp;	
				x10_off_clip = 		x10_off_clipp;	
				drink1_clip =  		drink1_clipp;	 	
	  			drink2_clip =  		drink2_clipp;			
	  			drink3_clip =  		drink3_clipp;			
	  			drink4_clip =  		drink4_clipp;	
				quizloop_clip = 	quizloop_clipp;			
				wait_sound = wait_sound_princess;
				blow_sound = blow_sound_princess;
				warning_sound = warning_sound_princess;	
				photobooth_IntroSoundPath = photobooth_IntroSoundPathp;
				photobooth_getReadySoundPath = 	photobooth_getReadySoundPathp;
				photobooth_pic2SoundPath = 	photobooth_pic2SoundPathp;
				photobooth_pic3SoundPath = photobooth_pic3SoundPathp;
				photobooth_pic4SoundPath = photobooth_pic4SoundPathp;
				photobooth_developingSoundPath = photobooth_developingSoundPathp;
				photobooth_thanksSoundPath = photobooth_thanksSoundPathp;
				break;
			case "halloween":
				idle_clip =   		idle_cliph;  
				idle_dup_clip =		idle_dup_cliph;  
				proximity1_clip = 	proximity1_cliph;
				proximity2_clip =   proximity2_cliph;
				touch1_clip =       touch1_cliph;
				weather_good_clip = weather_good_cliph;
				weather_ok_clip =   weather_ok_cliph;
				weather_rain_clip = weather_rain_cliph;
				no_internet_clip = 	no_internet_cliph;
				stock_up_clip = 	stock_up_cliph;
				stock_no_change_clip= stock_no_change_cliph;
				stock_down_clip =   stock_down_cliph;
				doorbell_clip =     doorbell_cliph;
				phone_clip = 		phone_cliph;
				video1_clip = 		video1_cliph;
				video2_clip = 		video2_cliph;
				video3_clip =		video3_cliph;
				video4_clip =		video4_cliph;
				proximity3_clip = 	proximity3_cliph;	
				x10_on_clip = 		x10_on_cliph;	
				x10_off_clip = 		x10_off_cliph;	
				drink1_clip =  		drink1_cliph;	 	
	  			drink2_clip =  		drink2_cliph;			
	  			drink3_clip =  		drink3_cliph;			
	  			drink4_clip =  		drink4_cliph;			
				quizloop_clip =  	quizloop_cliph;			
				wait_sound = wait_sound_halloween;
				blow_sound = blow_sound_halloween;
				warning_sound = warning_sound_halloween;	
				photobooth_IntroSoundPath = photobooth_IntroSoundPathh;
				photobooth_getReadySoundPath = 	photobooth_getReadySoundPathh;
				photobooth_pic2SoundPath = 	photobooth_pic2SoundPathh;
				photobooth_pic3SoundPath = photobooth_pic3SoundPathh;
				photobooth_pic4SoundPath = photobooth_pic4SoundPathh;
				photobooth_developingSoundPath = photobooth_developingSoundPathh;
				photobooth_thanksSoundPath = photobooth_thanksSoundPathh;
				break;
			case "pirate":
				idle_clip =   		idle_clippi;  
				idle_dup_clip =		idle_dup_clippi;  
				proximity1_clip = 	proximity1_clippi;
				proximity2_clip =   proximity2_clippi;
				touch1_clip =       touch1_clippi;
				weather_good_clip = weather_good_clippi;
				weather_ok_clip =   weather_ok_clippi;
				weather_rain_clip = weather_rain_clippi;
				no_internet_clip = 	no_internet_clippi;
				stock_up_clip = 	stock_up_clippi;
				stock_no_change_clip= stock_no_change_clippi;
				stock_down_clip =   stock_down_clippi;
				doorbell_clip =     doorbell_clippi;
				phone_clip = 		phone_clippi;
				video1_clip = 		video1_clippi;
				video2_clip = 		video2_clippi;
				video3_clip =		video3_clippi;
				video4_clip =		video4_clippi;
				proximity3_clip = 	proximity3_clippi;	
				x10_on_clip = 		x10_on_clippi;	
				x10_off_clip = 		x10_off_clippi;	
				drink1_clip =  		drink1_clippi;	 	
	  			drink2_clip =  		drink2_clippi;			
	  			drink3_clip =  		drink3_clippi;			
	  			drink4_clip =  		drink4_clippi;
				quizloop_clip =  	quizloop_clippi;	
				wait_sound = wait_sound_pirate;
				blow_sound = blow_sound_pirate;
				warning_sound = warning_sound_pirate;	
				photobooth_IntroSoundPath = photobooth_IntroSoundPathpi;
				photobooth_getReadySoundPath = 	photobooth_getReadySoundPathpi;
				photobooth_pic2SoundPath = 	photobooth_pic2SoundPathpi;
				photobooth_pic3SoundPath = photobooth_pic3SoundPathpi;
				photobooth_pic4SoundPath = photobooth_pic4SoundPathpi;
				photobooth_developingSoundPath = photobooth_developingSoundPathpi;
				photobooth_thanksSoundPath = photobooth_thanksSoundPathpi;	
				break;
			case "insult":
				idle_clip =   		idle_clipi;  
				idle_dup_clip =		idle_dup_clipi;  
				proximity1_clip = 	proximity1_clipi;
				proximity2_clip =   proximity2_clipi;
				touch1_clip =       touch1_clipi;
				weather_good_clip = weather_good_clipi;
				weather_ok_clip =   weather_ok_clipi;
				weather_rain_clip = weather_rain_clipi;
				no_internet_clip = 	no_internet_clipi;
				stock_up_clip = 	stock_up_clipi;
				stock_no_change_clip= stock_no_change_clipi;
				stock_down_clip =   stock_down_clipi;
				doorbell_clip =     doorbell_clipi;
				phone_clip = 		phone_clipi;
				video1_clip = 		video1_clipi;
				video2_clip = 		video2_clipi;
				video3_clip =		video3_clipi;
				video4_clip =		video4_clipi;	
				proximity3_clip = 	proximity3_clipi;	
				x10_on_clip = 		x10_on_clipi;	
				x10_off_clip = 		x10_off_clipi;	
				drink1_clip =  		drink1_clipi;	 	
	  			drink2_clip =  		drink2_clipi;			
	  			drink3_clip =  		drink3_clipi;			
	  			drink4_clip =  		drink4_clipi;	
				quizloop_clip = 	quizloop_clipi;	
				wait_sound = wait_sound_insult;
				blow_sound = blow_sound_insult;
				warning_sound = warning_sound_insult;
				photobooth_IntroSoundPath = photobooth_IntroSoundPathi;
				photobooth_getReadySoundPath = 	photobooth_getReadySoundPathi;
				photobooth_pic2SoundPath = 	photobooth_pic2SoundPathi;
				photobooth_pic3SoundPath = photobooth_pic3SoundPathi;
				photobooth_pic4SoundPath = photobooth_pic4SoundPathi;
				photobooth_developingSoundPath = photobooth_developingSoundPathi;
				photobooth_thanksSoundPath = photobooth_thanksSoundPathi;
				break;
			case "tts_mode":
				idle_clip =   		idle_cliptts;  
				idle_dup_clip =		idle_dup_cliptts;  
				proximity1_clip = 	proximity1_cliptts;
				proximity2_clip =   proximity2_cliptts;
				touch1_clip =       touch1_cliptts;
				weather_good_clip = weather_good_cliptts;
				weather_ok_clip =   weather_ok_cliptts;
				weather_rain_clip = weather_rain_cliptts;
				no_internet_clip = 	no_internet_cliptts;
				stock_up_clip = 	stock_up_cliptts;
				stock_no_change_clip= stock_no_change_cliptts;
				stock_down_clip =   stock_down_cliptts;
				doorbell_clip =     doorbell_cliptts;
				phone_clip = 		phone_cliptts;
				video1_clip = 		video1_cliptts;
				video2_clip = 		video2_cliptts;
				video3_clip =		video3_cliptts;
				video4_clip =		video4_cliptts;	
				proximity3_clip = 	proximity3_cliptts;	
				x10_on_clip = 		x10_on_cliptts;	
				x10_off_clip = 		x10_off_cliptts;	
				drink1_clip =  		drink1_cliptts;	 	
				drink2_clip =  		drink2_cliptts;			
				drink3_clip =  		drink3_cliptts;			
				drink4_clip =  		drink4_cliptts;	
				quizloop_clip = 	quizloop_cliptts;	
				wait_sound = wait_sound_princess;
				blow_sound = blow_sound_princess;
				warning_sound = warning_sound_princess;				
				photobooth_IntroSoundPath = photobooth_IntroSoundPathp;
				photobooth_getReadySoundPath = 	photobooth_getReadySoundPathp;
				photobooth_pic2SoundPath = 	photobooth_pic2SoundPathp;
				photobooth_pic3SoundPath = photobooth_pic3SoundPathp;
				photobooth_pic4SoundPath = photobooth_pic4SoundPathp;
				photobooth_developingSoundPath = photobooth_developingSoundPathp;
				photobooth_thanksSoundPath = photobooth_thanksSoundPathp;
			}
		
		if (doorcam_on == "on") { 
			myVid2.source = doorbell_clip;
		}
		
		if (idle_videos == "off") {
			idle_clip = idle_black;
			idle_dup_clip =	idle_black;  
		}
		
		//reset the proximity flags as the were playing earlier
		proximity_counter = 0;  //reset the proximity counter
		proximity1_do_not_play_again = 0; 
		proximity_flag = 0;
		proximity_counter2 = 0;
		AProxVideoPlaying = 0; 
		//*************************************************
			
		myVid.play(idle_clip); //start the idle clip and then wait for events to happen
		idle_start_playing = 1;
		initial_values_done = 1;
		video_playing = 0;
		x10_on_off_flag = 0;
		
		initPhotoboothSounds();
		
    } //end initial values for no arduino
		
	   
	private function initPhotoboothSounds(): void {
		
		//the character must have been initialized before going here		
			photobooth_IntroSound = new Sound(new URLRequest(photobooth_IntroSoundPath));
			photobooth_getReadySound = new Sound(new URLRequest(photobooth_getReadySoundPath));
			photobooth_pic2Sound = new Sound(new URLRequest(photobooth_pic2SoundPath));	
			photobooth_pic3Sound = new Sound(new URLRequest(photobooth_pic3SoundPath));	
			photobooth_pic4Sound = new Sound(new URLRequest(photobooth_pic4SoundPath));	
			photobooth_developingSound = new Sound(new URLRequest(photobooth_developingSoundPath));	
			photobooth_thanksSound = new Sound(new URLRequest(photobooth_thanksSoundPath));
			
			photobooth_beepSound = new Sound(new URLRequest(myXML.photobooth_beepSound));
			photobooth_cameraSound = new Sound(new URLRequest(myXML.photobooth_cameraSound));
			photobooth_developingfilmSound = new Sound(new URLRequest(myXML.photobooth_developingfilmSound));
	}
	
	private function _setupCamera() : void {
			
			var camera : Camera;
			
			var index:int = 0;
			for ( var i : int = 0 ; i < Camera.names.length ; i ++ ) {
                
				if ( Camera.names[ i ] == "USB Video Class Video" ) {
					index = i;
				}
			}
			
			camera  = Camera.getCamera( String( index ) );
			//camera.setMode(320, 240, 24);
			//camera.setMode(120, 150, 24);
			camera.setMode(webcam_width, webcam_height, webcam_fps); //120, 150, 24

            if (camera != null) {
				
				webcamvideo = new Video( camera.width , camera.height );
				webcamvideo.x = webcam_x;
				webcamvideo.y = webcam_y;
				webcamvideo.rotation = webcam_rotate;
				webcamvideo.scaleX = webcam_scale;
				webcamvideo.scaleY = webcam_scale;
				webcamvideo.attachCamera( camera );				
				addChild( webcamvideo );				
			    webcamfound = 1;  //set this flag so the rest of the program knows there is an active webcam
				
				//******** since we've found a webcam, load the webcam mattes
				//WebcamMirrorLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,WebcamMirrorLoaded);
				//WebcamMirrorLoader.load(new URLRequest("images/mirror.png"));		
				//if (frame == "on") {
					//frameLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,frameLoaded);
					//frameLoader.load(new URLRequest("images/frame.png"));		
				//}
		        //******************************************************** 	
				
			//webcamMask = new Shape();						
				//webcamMask.graphics.beginFill(0xFF0000);
				//webcamMask.graphics.drawEllipse(0,0,camera.width,camera.height);			
				//addChild(webcamMask);
				//webcamMask.x = webcamvideo.x;
				//webcamMask.y = webcamvideo.y;		
				//webcamvideo.mask = webcamMask;			//the ellipse mask
				
				
			} 
			
			else {
				trace( "A USB webcam was not detected" );
			}
			
		}

		/**
		 * Called when No faces are found after __noFaceTimeout time
		 */
		private function _noFaceTimer_timer (event : TimerEvent) : void {
			
			_noFaceTimer.stop();
			
			for (var i : int = 0; i < _rects.length; i++) {
				
					TweenLite.to( _rects[i] , .5, {
						alpha:0,
						x:_rects[i].x + webcamvideo.x, 
						y:_rects[i].y,
						ease:Cubic.easeOut	
					} );					

				}
		}

		/**
		 * Creates a rectangle
		 */
		private function _createRect() : Sprite{
			
			var rectContainer : Sprite = new Sprite();
			rectContainer.graphics.lineStyle( 2 , __rectColor , 1 );
			rectContainer.graphics.beginFill(0x000000,0);
			rectContainer.graphics.drawRect(0, webcamvideo.y, 100, 100);
			
			//rectContainer.x = webcamvideo.x;
			//rectContainer.y = webcamvideo.y;
			
			return rectContainer;			
		}
		
		/**
		 * Evalutates the webcam video for faces on a timer
		 */		
		private function _detectionTimer_timer (event : TimerEvent) : void {
			
			_bmpTarget = new Bitmap( new BitmapData( webcamvideo.width, webcamvideo.height, false ) );
			_bmpTarget.bitmapData.draw( webcamvideo );
			_detector.detect( _bmpTarget );
			
		}
		
		/**
		 * Fired when a detection is complete
		 */
		private function _detection_complete (event : ObjectDetectorEvent) : void {
			
			//no faces found
			if(event.rects.length == 0) return;
			
			//stop the no-face timer and start back up again
			_noFaceTimer.stop( );
			_noFaceTimer.start();
			
			if (idle_videos == "off" && webcamfound == 1) {  //stealth mode
				webcamvideo.visible = false; //hide while myVid plays and then show again onDone
				//frame.visible = false;
				_detectionTimer.stop();
			}
			
			WebcamProxVideos();
			
			//loop through faces found			
			for (var i : int = 0; i < event.rects.length ; i++) {
				
				//create rectangles if needed
				if(_rects[i] == null){
					_rects[i] = _createRect();
					//_rects[i].x = webcamvideo.x;
					//_rects[i].y = webcamvideo.y;
					
					addChild(_rects[i]);
				}
				
				//Animate to new size
				TweenLite.to( _rects[i] , .5, {
					alpha:1,
					x:event.rects[i].x*webcamvideo.scaleX + webcamvideo.x,
					y:event.rects[i].y*webcamvideo.scaleY ,
					width:event.rects[i].width* webcamvideo.scaleX,
					height:event.rects[i].height* webcamvideo.scaleY,
					ease:Cubic.easeOut	
				} );
				
			}
			
			//hide the rest of the rectangles
			if(event.rects.length < _rects.length){
				for (var j : int = event.rects.length; j < _rects.length; j++) {
					TweenLite.to( _rects[j] , .5, {
						alpha:0,
						x:_rects[j].x,
						y:_rects[j].y,
						ease:Cubic.easeOut	
					} );					
				}
			}
		}

		/**
		 * Initializes the detector
		 */
		private function _initDetector () : void {
			
			_detector = new ObjectDetector;
			_detector.options = getDetectorOptions( );
			_detector.loadHaarCascades( "face.zip" );
			
		}
		
		/**
		 * Gets dector options
		 */
		private function getDetectorOptions () : ObjectDetectorOptions {
			
			_options = new ObjectDetectorOptions;
			_options.min_size = 50;
			_options.startx = ObjectDetectorOptions.INVALID_POS;
			_options.starty = ObjectDetectorOptions.INVALID_POS;
			_options.endx = ObjectDetectorOptions.INVALID_POS;
			_options.endy = ObjectDetectorOptions.INVALID_POS;
			return _options;
			
		}
		
	//************** photobooth face detection
	private function photoboothnoFaceTimer_timer (event : TimerEvent) : void {
			
			photoboothnoFaceTimer.stop();
			
			for (var i : int = 0; i < photoboothrects.length; i++) {
				
					TweenLite.to( photoboothrects[i] , .5, {
						alpha:0,
						x:photoboothrects[i].x + video.x, 
						y:photoboothrects[i].y,
						ease:Cubic.easeOut	
					} );					

				}
		}

		/**
		 * Creates a rectangle
		 */
		private function photoboothcreateRect() : Sprite{
			
			var photoboothrectContainer : Sprite = new Sprite();
			photoboothrectContainer.graphics.lineStyle( 2 , photoboothrectColor , 1 );
			photoboothrectContainer.graphics.beginFill(0x000000,0);
			photoboothrectContainer.graphics.drawRect(0, video.y, 100, 100);
			
			return photoboothrectContainer;			
		}
		
		/**
		 * Evalutates the webcam video for faces on a timer
		 */		
		private function photoboothdetectionTimer_timer (event : TimerEvent) : void {
			
			photoboothbmpTarget = new Bitmap( new BitmapData( video.width, video.height, false ) );
			photoboothbmpTarget.bitmapData.draw( video );
			photoboothdetector.detect( photoboothbmpTarget );
			
		}
		
		/**
		 * Fired when a detection is complete
		 */
		private function photoboothdetection_complete (event : ObjectDetectorEvent) : void {
			
			//no faces found
			if(event.rects.length == 0) return;
			
			//stop the no-face timer and start back up again
			photoboothnoFaceTimer.stop( );
			photoboothnoFaceTimer.start();
			
			//if (idle_videos == "off" && webcamfound == 1) {  //stealth mode
				//webcamvideo.visible = false; //hide while myVid plays and then show again onDone
				//frame.visible = false;
				//photoboothdetectionTimer.stop();
			//}
			
							
			//WebcamProxVideos();
			
			//loop through faces found			
			for (var i : int = 0; i < event.rects.length ; i++) {
				
				//create rectangles if needed
				if(photoboothrects[i] == null){
					photoboothrects[i] = photoboothcreateRect();
					addChildAt(photoboothrects[i],7);
				}
				
				//Animate to new size
				TweenLite.to( photoboothrects[i] , .5, {
					alpha:1,
					x:event.rects[i].x*video.scaleX + video.x,
					y:event.rects[i].y*video.scaleY ,
					width:event.rects[i].width* video.scaleX,
					height:event.rects[i].height* video.scaleY,
					ease:Cubic.easeOut	
				} );
				
				RunPhotobooth2(); //we've detected a face so start the photobooth		
				
			}
			
			//hide the rest of the rectangles
			if(event.rects.length < photoboothrects.length){
				for (var j : int = event.rects.length; j < photoboothrects.length; j++) {
					TweenLite.to( photoboothrects[j] , .5, {
						alpha:0,
						x:photoboothrects[j].x,
						y:photoboothrects[j].y,
						ease:Cubic.easeOut	
					} );					
				}
			}
		}

		/**
		 * Initializes the detector
		 */
		private function photoboothinitDetector () : void {
			
			photoboothdetector = new ObjectDetector;
			photoboothdetector.options = photoboothgetDetectorOptions( );
			photoboothdetector.loadHaarCascades( "face.zip" );
			
		}
		
		/**
		 * Gets dector options
		 */
		private function photoboothgetDetectorOptions () : ObjectDetectorOptions {
			
			photoboothoptions = new ObjectDetectorOptions;
			photoboothoptions.min_size = 50;
			photoboothoptions.startx = ObjectDetectorOptions.INVALID_POS;
			photoboothoptions.starty = ObjectDetectorOptions.INVALID_POS;
			photoboothoptions.endx = ObjectDetectorOptions.INVALID_POS;
			photoboothoptions.endy = ObjectDetectorOptions.INVALID_POS;
			return photoboothoptions;
			
		}
	
	
	//*****************************************
	
	
	private function WebcamProxVideos():void {
			if ((AProxVideoPlaying ==0) && (SlideShowRunning ==0) && (idle_start_playing == 1) && (doorcamPlayingFlag == 0)) {  //only if set to on from config file
											
					AProxVideoPlaying = 1;  //this gets reset during the onclipdone routine
																	
					if (proximity_flag3 == 0) {	//toggles between the two proximity clips
						
						if (mode_select == "tts_mode") { 
							if (custom_audio == "on") {
								say_custom_audio(proximity2_mp3);
							}
							else {
								say(proximity2_tts);
							}																
						}									
						myVid.play(proximity2_clip);
						proximity_flag3 = 1;						
					}
					
					else {
						if (mode_select == "tts_mode") { 
							if (custom_audio == "on") {
								say_custom_audio(proximity3_mp3);
							}
							else {
								say(proximity3_tts);
							}																
						}									
						myVid.play(proximity3_clip);
						proximity_flag3 = 0;
					}	
										
			 }			
	}
	
	///************** Start Photobooth Functions ***********************
	private function photoboothUIinit():void {
	
	
	 photobooth_proof1a.visible = false;
	 photobooth_proof2a.visible = false;
	 photobooth_proof3a.visible = false;
	 photobooth_proof4a.visible = false;
	 
	 if (myXML.photobooth_backgroundcustomimage == "off") {	
	 	 photobooth_proof1b.visible = false;
		 photobooth_proof2b.visible = false;
		 photobooth_proof3b.visible = false;
		 photobooth_proof4b.visible = false;
	 }	 
	
	
	
}

	private function photoboothInitSounds():void {
		
		photobooth_IntroSoundPathp = myXML.photobooth_IntroSoundPathp;
		photobooth_getReadySoundPathp = myXML.photobooth_getReadySoundPathp;
		photobooth_pic2SoundPathp = myXML.photobooth_pic2SoundPathp;
		photobooth_pic3SoundPathp = myXML.photobooth_pic3SoundPathp;
		photobooth_pic4SoundPathp = myXML.photobooth_pic4SoundPathp;
		photobooth_developingSoundPathp = myXML.photobooth_developingSoundPathp;
		photobooth_thanksSoundPathp = myXML.photobooth_thanksSoundPathp;
	  
		photobooth_IntroSoundPathh = myXML.photobooth_IntroSoundPathh;
		photobooth_getReadySoundPathh = myXML.photobooth_getReadySoundPathh;
		photobooth_pic2SoundPathh = myXML.photobooth_pic2SoundPathh;
		photobooth_pic3SoundPathh = myXML.photobooth_pic3SoundPathh;
		photobooth_pic4SoundPathh = myXML.photobooth_pic4SoundPathh;
		photobooth_developingSoundPathh = myXML.photobooth_developingSoundPathh;
		photobooth_thanksSoundPathh = myXML.photobooth_thanksSoundPathh;
	 
		photobooth_IntroSoundPathpi = myXML.photobooth_IntroSoundPathpi;
		photobooth_getReadySoundPathpi = myXML.photobooth_getReadySoundPathpi;
		photobooth_pic2SoundPathpi = myXML.photobooth_pic2SoundPathpi;
		photobooth_pic3SoundPathpi = myXML.photobooth_pic3SoundPathpi;
		photobooth_pic4SoundPathpi = myXML.photobooth_pic4SoundPathpi;
		photobooth_developingSoundPathpi = myXML.photobooth_developingSoundPathpi;
		photobooth_thanksSoundPathpi = myXML.photobooth_thanksSoundPathpi;
	  
		photobooth_IntroSoundPathi = myXML.photobooth_IntroSoundPathi;
		photobooth_getReadySoundPathi = myXML.photobooth_getReadySoundPathi;
		photobooth_pic2SoundPathi = myXML.photobooth_pic2SoundPathi;
		photobooth_pic3SoundPathi = myXML.photobooth_pic3SoundPathi;
		photobooth_pic4SoundPathi = myXML.photobooth_pic4SoundPathi;
		photobooth_developingSoundPathi = myXML.photobooth_developingSoundPathi;
		photobooth_thanksSoundPathi = myXML.photobooth_thanksSoundPathi;
		
	}
	
	private function photoboothBackgroundLoaderEvent (event:Event):void {
		photoboothBackgroundImage = Bitmap(photoboothBackgroundLoader.content);
		photoboothBackgroundImage_bitmapdata = photoboothBackgroundImage.bitmapData;
		addChildAt(photoboothBackgroundImage,2);
		photoboothBackgroundImage.visible = false;
	}
	
	private function photoboothLogoLoaderEvent (event:Event):void {
		photoboothLogoImage = Bitmap(photoboothLogoLoader.content);
		photoboothLogoImage_bitmapdata = photoboothLogoImage.bitmapData;
		photoboothLogoImage.x = int(myXML.photobooth_logo_x);
		photoboothLogoImage.y = int(myXML.photobooth_logo_y);	
		addChildAt(photoboothLogoImage,5);
		photoboothLogoImage.visible = false;
	}
		
	private function photoboothCustomBackgroundEvent(e:Event):void {	 
			photoboothCustomBackground_image = Bitmap(photoboothCustomBackgroundLoader.content);
			photoboothCustomBackground_bitmapdata = photoboothCustomBackground_image.bitmapData;
			addChildAt(photoboothCustomBackground_image,5);
			photoboothCustomBackground_image.visible = false;	
			photoboothCustomBackground_image.x = int(myXML.photobooth_backgroundcustomimage_x);
			photoboothCustomBackground_image.y = int(myXML.photobooth_backgroundcustomimage_y);	
	} 
	
	private function photoboothBoxesLoaderEvent (event:Event):void {
		photoboothBoxesImage = Bitmap(photoboothBoxesLoader.content);
		photoboothBoxesImage_bitmapdata = photoboothBoxesImage.bitmapData;	
		addChildAt(photoboothBoxesImage,3);
		photoboothBoxesImage.visible = false;
		
		cam = Camera.getCamera();
	
		if (cam != null) {
					cam.setQuality(photobooth_videoBandwidth, photobooth_videoQuality);
					cam.setMode(photobooth_videoWidth,photobooth_videoHeight,photobooth_fps,true); // setMode(videoWidth, videoHeight, video fps, favor area)
					video = new Video((photobooth_videoWidth,photobooth_videoWidth), (photobooth_videoHeight,photobooth_videoHeight));
					video.attachCamera(cam);
					video.x = int(myXML.photobooth_webcam_x); //x and y location
					video.y = int(myXML.photobooth_webcam_y); //x and y location
					video.width = int(myXML.photobooth_webcam_width); //x and y location
					video.height = int(myXML.photobooth_webcam_height); //x and y location	
					addChildAt(video,4);
					video.visible = false;
					
					if (myXML.photobooth_fullres_save == "on") {
						photoboothBitmapData1 = new BitmapData((photobooth_videoWidth,photobooth_videoWidth), (photobooth_videoHeight,photobooth_videoHeight));
						photoboothBitmapData2 = new BitmapData((photobooth_videoWidth,photobooth_videoWidth), (photobooth_videoHeight,photobooth_videoHeight));
						photoboothBitmapData3 = new BitmapData((photobooth_videoWidth,photobooth_videoWidth), (photobooth_videoHeight,photobooth_videoHeight));
						photoboothBitmapData4 = new BitmapData((photobooth_videoWidth,photobooth_videoWidth), (photobooth_videoHeight,photobooth_videoHeight));
					}
					
					else {
						photoboothBitmapData1 = new BitmapData((video.width,video.width), (video.height,video.height));
						photoboothBitmapData2 = new BitmapData((video.width,video.width), (video.height,video.height));
						photoboothBitmapData3 = new BitmapData((video.width,video.width), (video.height,video.height));
						photoboothBitmapData4 = new BitmapData((video.width,video.width), (video.height,video.height));
					}
		}
		else {
					photoboothWebcamNotFound = 1;
					//photoboothRoundRectangle.visible = true; //let's start if any keyboard key pressed
					//photoboothMessage.text = "Webcam Not Detected";
					//photoboothMessage.visible = true;
		}
		
		//cam.setQuality(photobooth_videoBandwidth, photobooth_videoQuality);
		//cam.setMode(photobooth_videoWidth,photobooth_videoHeight,photobooth_fps,true); // setMode(videoWidth, videoHeight, video fps, favor area)
		
		//video.attachCamera(cam);
		//video.x = int(myXML.photobooth_webcam_x); //x and y location
		//video.y = int(myXML.photobooth_webcam_y); //x and y location
		//video.width = int(myXML.photobooth_webcam_width); //x and y location
		//video.height = int(myXML.photobooth_webcam_height); //x and y location	
		//addChildAt(video,2);
		
	}
	
	private function CountdownLoaderEvent (event:Event):void {
		CountdownImage = Bitmap(CountdownLoader.content);
		CountdownImage_bitmapdata = CountdownImage.bitmapData;	
		addChildAt(CountdownImage,3);		
		CountdownImage.x = 496;
		CountdownImage.y = 210;
		CountdownImage.visible = false;
		
		CountdownTextFormat.font = "Arial";
		CountdownTextFormat.size = 240; 
		CountdownTextFormat.color = 0xFFFFFF;	
		CountdownText.autoSize = TextFieldAutoSize.LEFT; 
		CountdownText.defaultTextFormat = CountdownTextFormat;
		//CountdownText.embedFonts = true;
		CountdownText.x = 608;    
		CountdownText.y = 290; 		
		CountdownText.height = 300;
		CountdownText.width = 500;
		CountdownText.selectable = false;
		//CountdownText.antiAliasType = AntiAliasType.ADVANCED;		
		addChildAt(CountdownText,4);
		CountdownText.text = String(CountdownTimerCounter);
		CountdownText.visible = false;	
	}
	
	private function RunPhotobooth(event:KeyboardEvent):void {   //this function runs the photobooth so longer it's idle
		if (photoboothRunning == 0 && photoboothIdle == 1) { //don't start it again if it's already running, can't have it run if we're in magic mirror mode
				if (myXML.photobooth_keyboardtrigger == "Space") {
					if (event.keyCode == Keyboard.SPACE )  {  //then let's only start if space bar pressed
						//photoboothIdle = 0; //it's no longer running
						//photoboothRoundRectangle.visible = false;
						//photoboothMessage.visible = false;
							
						//photobooth_getReadySound.play();			
						//CountdownImage.visible = true;
						//CountdownText.visible = true;	
						//CountdownText.text = String(CountdownTimerCounter);
						//photoboothCountdownTimer.start();
						//photoboothRunning = 1; //set this flag so we don't start it again and again
						//myVid.visible = false;
						RunPhotobooth2();
					}	
				}
				else {
					//photoboothIdle = 0; //it's no longer idle
					//photoboothRoundRectangle.visible = false; //let's start if any keyboard key pressed
					//photoboothMessage.visible = false;
						
					//photobooth_getReadySound.play();			
					//CountdownImage.visible = true;
					//CountdownText.visible = true;	
					//CountdownText.text = String(CountdownTimerCounter);
					//photoboothCountdownTimer.start();
					//photoboothRunning = 1; //set this flag so we don't start it again and again
					//myVid.visible = false;
					RunPhotobooth2();
				}
		}
	}
	
	private function RunPhotobooth2():void { //this function runs the photobooth so longer it's idle
		
		if (myXML.photobooth_facialRecognitionTrigger == "on") { //we've triggered so turn this off
				photoboothdetectionTimer.stop();
		}					
					
		
		if (myXML.photobooth_x10 == "on") { //turn on the lamp
	    	X10_ON(x10_address2);
			X10_ON(x10_address2);
			X10_ON(x10_address2);
		}
		
		photoboothIdle = 0; //it's no longer idle
		photoboothRoundRectangle.visible = false; //let's start if any keyboard key pressed
		photoboothMessage.visible = false;
			
		photobooth_getReadySound.play();			
		CountdownImage.visible = true;
		CountdownText.visible = true;	
		CountdownText.text = String(CountdownTimerCounter);
		photoboothCountdownTimer.start();
		photoboothRunning = 1; //set this flag so we don't start it again and again
		myVid.visible = false;
		
		if (myXML.photobooth_leds == "on") {
	    	a.writeDigitalPin(LED1_pin, Arduino.LOW); 
			a.writeDigitalPin(LED2_pin, Arduino.LOW); 
			a.writeDigitalPin(LED3_pin, Arduino.LOW); 
			a.writeDigitalPin(LED4_pin, Arduino.HIGH); 	//the photobooth in use LED		
		}
	}
	
	
	private function photoboothCountdownTimerEvent(e:TimerEvent):void { //this one happens every second, add a countdown graphic and increment
		
		CountdownTimerCounter--;
		CountdownText.text = String(CountdownTimerCounter);
		if (CountdownTimerCounter != 0) {
			photobooth_beepSound.play();
		}
	}
	
	private function photoboothCountdownTimerCompleteEvent(e:TimerEvent):void { //the photobooth countdown has completed so take the first picture and then start the getReady timer
		photoboothCountdownTimer.reset();
		CountdownImage.visible = false;
		CountdownText.visible = false;	
			
		cameraSoundPlayedChannel = photobooth_cameraSound.play(); //camera click sound
		photoboothBitmapData1.draw(video);	//draw the first pic
		
		photobooth_capturetemp1 = ImageResizer.bilinearIterative(photoboothBitmapData1, 130, 130, ResizeMath.METHOD_PAN_AND_SCAN); 
		photobooth_capture1 = new Bitmap(photobooth_capturetemp1,PixelSnapping.ALWAYS, true);	
		photobooth_capture1.x = 65;
		photobooth_capture1.y = 154;
		addChild(photobooth_capture1);
		
		cameraSoundPlayedChannel.addEventListener(Event.SOUND_COMPLETE,cameraSoundPlayedComplete);
		
	}
	
	private function cameraSoundPlayedComplete(event:Event):void { //camera sound has played, we need another delay before playing phrase
		photoboothFlashRectangle.visible = true; //looks like the flash went off
		photoboothFlashTimer.start();
		photoboothDelayAfterCameraSound.start(); //calls photoboothTakePicEvent
		
	}
	
	private function photoboothTakePicEvent(e:TimerEvent):void { //the first pics has been taken so now take the second pic
		photoboothPicCounter++; //this tracks which pic we are on
		trace (photoboothPicCounter);
		photoboothDelayAfterCameraSound.reset(); //reset it so it can play again
		//the camera sound has played so now we need to pick which say cheese phrase to play
		
		if (photoboothPicCounter == 1) {
			photoboothSayCheeseChannel = photobooth_pic2Sound.play(); //now play say cheese		
			photoboothSayCheeseChannel.addEventListener(Event.SOUND_COMPLETE,photoboothTakePic);
		}	
		
		if (photoboothPicCounter == 2) {
			photoboothSayCheeseChannel = photobooth_pic3Sound.play(); //now play smile
			photoboothSayCheeseChannel.addEventListener(Event.SOUND_COMPLETE,photoboothTakePic);
		}
		
		if (photoboothPicCounter == 3) {
			photoboothSayCheeseChannel = photobooth_pic4Sound.play(); //now play and another
			photoboothSayCheeseChannel.addEventListener(Event.SOUND_COMPLETE,photoboothTakePic);
		}		
	}
	
	private function photoboothTakePic(event:Event):void { //the say cheese phrase has played so now let's take pic and play the camera sound
		
		//but before need to add a delay here for the users to actually say cheese before the pic takes
		shotDelayTimer.start();
	}
	
	
	private function shotDelayTimerEvent(e:TimerEvent): void {
		
		shotDelayTimer.reset();
		
		if (photoboothPicCounter == 1) {
			cameraSoundPlayedChannel = photobooth_cameraSound.play(); //camera click sound		
			cameraSoundPlayedChannel.addEventListener(Event.SOUND_COMPLETE,cameraSoundPlayedComplete);
			photoboothBitmapData2.draw(video); 
			
			photobooth_capturetemp2 = ImageResizer.bilinearIterative(photoboothBitmapData2, 130, 130, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_capture2 = new Bitmap(photobooth_capturetemp2,PixelSnapping.ALWAYS, true);
			photobooth_capture2.x = 65;
			photobooth_capture2.y = 306;
			addChild(photobooth_capture2);
					
		}	
		
		if (photoboothPicCounter == 2) {
			cameraSoundPlayedChannel = photobooth_cameraSound.play(); //camera click sound		
			cameraSoundPlayedChannel.addEventListener(Event.SOUND_COMPLETE,cameraSoundPlayedComplete);
			photoboothBitmapData3.draw(video); 
			
			photobooth_capturetemp3 = ImageResizer.bilinearIterative(photoboothBitmapData3, 130, 130, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_capture3 = new Bitmap(photobooth_capturetemp3,PixelSnapping.ALWAYS, true);
			photobooth_capture3.x = 65;
			photobooth_capture3.y = 460;
			addChild(photobooth_capture3);		
		}
		
		if (photoboothPicCounter == 3) {
			photobooth_cameraSound.play(); //don't need the channel listener here because this is the last pic		
			cameraSoundPlayedChannel.addEventListener(Event.SOUND_COMPLETE,cameraSoundPlayedComplete);
			photoboothBitmapData4.draw(video); 
			
			photobooth_capturetemp4 = ImageResizer.bilinearIterative(photoboothBitmapData4, 130, 130, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_capture4 = new Bitmap(photobooth_capturetemp4,PixelSnapping.ALWAYS, true);
			photobooth_capture4.x = 65;
			photobooth_capture4.y = 613;
			addChild(photobooth_capture4);
			
			photoboothPleaseWaitTimer1.start(); //this was the last pic so now let's move on
			photoboothPicCounter = 0; //reset this one so we can do the photobooth again		
			//saveBitmapImage(photoboothBitmapData4,FORMAT_JPEG);
		}			
	}
	
	private function photoboothFlashTimerEvent(e:TimerEvent): void {
		photoboothFlashTimer.reset();
		photoboothFlashRectangle.visible = false;
	}
	 
	/// here is the flow on the next 4 timers
	//photoboothPleaseWaitTimer1.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothPleaseWaitTimerEvent1); //last pic has been taken, showing please wait
	//photoboothPreGalleryTimer.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothGalleryShowingEvent); //the delay before the pic gallery shows
	//photoboothGalleryTimer.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothShowingProofEvent); 
	//photoboothProofDisplayTime.addEventListener(TimerEvent.TIMER_COMPLETE, photoboothResetEvent);
	
	
	private function photoboothPleaseWaitTimerEvent1(e:TimerEvent):void { //last pic has been taken so now show developing pics screen
		//photobooth_developingfilmSound.play(); //took this out because it played at the same time as the camera shutter sound
		photoboothRoundRectangle.visible = true;
		photoboothMessage.visible = true;
		photoboothMessage.text = "Please Wait... Developing Photos";
		photoboothPreGalleryTimer.start();
		photoboothPleaseWaitTimer1.reset(); //so it can run again
		
		
	}
	
	private function photoboothGalleryShowingEvent(e:TimerEvent):void { 
		
			if (myXML.photobooth_x10 == "on") { //the last pic was taken so turn off the lamp
				X10_OFF(x10_address2);
				X10_OFF(x10_address2);
				X10_OFF(x10_address2);
			}			
			
			//show the gallery now
			video.visible = false;
			
			if (myXML.photobooth_logo == "on") {
				photoboothLogoImage.visible = false;
			}
			
			photobooth_developingSound.play();
			photoboothBackgroundImage.visible = false;
			photoboothBoxesImage.visible = false;	
			photoboothRoundRectangle.visible = false;
			photoboothMessage.visible = false;
			
			photobooth_capture1.visible = false;
			photobooth_capture2.visible = false;
			photobooth_capture3.visible = false;
			photobooth_capture4.visible = false;
			
			photobooth_gallery1 = new Bitmap(photoboothBitmapData1,PixelSnapping.ALWAYS, true);
			addChild(photobooth_gallery1);
			photobooth_gallery1.x = 0;
			photobooth_gallery1.y = 0;
			photobooth_gallery1.width = 510;
			photobooth_gallery1.height = 379;
			
			photobooth_gallery2 = new Bitmap(photoboothBitmapData2,PixelSnapping.ALWAYS, true);
			addChild(photobooth_gallery2);
			photobooth_gallery2.x = 522;
			photobooth_gallery2.y = 0;
			photobooth_gallery2.width = 502;
			photobooth_gallery2.height = 379;
			
			photobooth_gallery3 = new Bitmap(photoboothBitmapData3,PixelSnapping.ALWAYS, true);
			addChild(photobooth_gallery3);
			photobooth_gallery3.x = 0;
			photobooth_gallery3.y = 390;
			photobooth_gallery3.width = 510;
			photobooth_gallery3.height = 378;
			
			photobooth_gallery4 = new Bitmap(photoboothBitmapData4,PixelSnapping.ALWAYS, true);
			addChild(photobooth_gallery4);
			photobooth_gallery4.x = 522;
			photobooth_gallery4.y = 390;
			photobooth_gallery4.width = 502;
			photobooth_gallery4.height = 378;
			
			startEncode(photoboothBitmapData1);
			startEncode(photoboothBitmapData2);
			startEncode(photoboothBitmapData3);
			startEncode(photoboothBitmapData4);
				
			//Tweener.addTween(currentContainer, {alpha:1, time:FADE_TIME, onComplete:function() { slideTimer.start(); }});	
			//Tweener.addTween(photobooth_capture1, {alpha:1, time:FADE_TIME, onComplete:function() { slideTimer.start(); }});	
			photoboothPreGalleryTimer.reset();
			photoboothGalleryTimer.start();	
	}
	
	
	private function photoboothShowingProofEvent(e:TimerEvent):void { //last pic has been taken so now clear the screen and show the proof
		
		photoboothPreGalleryTimer.reset(); //so it can run again	
	
		photobooth_capture1.visible = false;
		photobooth_gallery1.visible = false;
		photobooth_capture2.visible = false;
		photobooth_gallery2.visible = false;
		photobooth_capture3.visible = false;
		photobooth_gallery3.visible = false;
		photobooth_capture4.visible = false;
		photobooth_gallery4.visible = false;
		
		
		if (myXML.photobooth_backgroundcustomimage == "on") {		
			photoboothCustomBackground_image.visible = true;
			
			photobooth_capturetemp1 = ImageResizer.bilinearIterative(photoboothBitmapData1, 137, 136, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_proof1a = new Bitmap(photobooth_capturetemp1,PixelSnapping.ALWAYS, true);		
			addChild(photobooth_proof1a);
			photobooth_proof1a.x = 337;
			photobooth_proof1a.y = 115;
							
			photobooth_capturetemp2 = ImageResizer.bilinearIterative(photoboothBitmapData2, 137, 136, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_proof2a = new Bitmap(photobooth_capturetemp2,PixelSnapping.ALWAYS, true);	
			addChild(photobooth_proof2a);
			photobooth_proof2a.x = 337;
			photobooth_proof2a.y = 258;
					
			photobooth_capturetemp3 = ImageResizer.bilinearIterative(photoboothBitmapData3, 137, 136, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_proof3a = new Bitmap(photobooth_capturetemp3,PixelSnapping.ALWAYS, true);	
			addChild(photobooth_proof3a);
			photobooth_proof3a.x = 337;
			photobooth_proof3a.y = 401;
					
			photobooth_capturetemp4 = ImageResizer.bilinearIterative(photoboothBitmapData4, 137, 136, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_proof4a = new Bitmap(photobooth_capturetemp4,PixelSnapping.ALWAYS, true);		
			addChild(photobooth_proof4a);
			photobooth_proof4a.x = 337;
			photobooth_proof4a.y = 544;
								
		}
		
		else { //no overlay image so print two strips side by side		
			photoboothWhiteRectangle.visible = true;
			
			photobooth_capturetemp1 = ImageResizer.bilinearIterative(photoboothBitmapData1, 140, 140, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_proof1a = new Bitmap(photobooth_capturetemp1,PixelSnapping.ALWAYS, true);		
			addChild(photobooth_proof1a);
			photobooth_proof1a.x = 352;
			photobooth_proof1a.y = 112;
			
			photobooth_capturetemp1 = ImageResizer.bilinearIterative(photoboothBitmapData1, 140, 140, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_proof1b = new Bitmap(photobooth_capturetemp1,PixelSnapping.ALWAYS, true);		
			addChild(photobooth_proof1b);
			photobooth_proof1b.x = 546;
			photobooth_proof1b.y = 112;
					
			photobooth_capturetemp2 = ImageResizer.bilinearIterative(photoboothBitmapData2, 140, 140, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_proof2a = new Bitmap(photobooth_capturetemp2,PixelSnapping.ALWAYS, true);	
			addChild(photobooth_proof2a);
			photobooth_proof2a.x = 352;
			photobooth_proof2a.y = 256;
			
			photobooth_capturetemp2 = ImageResizer.bilinearIterative(photoboothBitmapData2, 140, 140, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_proof2b = new Bitmap(photobooth_capturetemp2,PixelSnapping.ALWAYS, true);	
			addChild(photobooth_proof2b);
			photobooth_proof2b.x = 546;
			photobooth_proof2b.y = 256;
			
			photobooth_capturetemp3 = ImageResizer.bilinearIterative(photoboothBitmapData3, 140, 140, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_proof3a = new Bitmap(photobooth_capturetemp3,PixelSnapping.ALWAYS, true);	
			addChild(photobooth_proof3a);
			photobooth_proof3a.x = 352;
			photobooth_proof3a.y = 399;
			
			photobooth_capturetemp3 = ImageResizer.bilinearIterative(photoboothBitmapData3, 140, 140, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_proof3b = new Bitmap(photobooth_capturetemp3,PixelSnapping.ALWAYS, true);	
			addChild(photobooth_proof3b);
			photobooth_proof3b.x = 546;
			photobooth_proof3b.y = 399;
			
			photobooth_capturetemp4 = ImageResizer.bilinearIterative(photoboothBitmapData4, 140, 140, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_proof4a = new Bitmap(photobooth_capturetemp4,PixelSnapping.ALWAYS, true);		
			addChild(photobooth_proof4a);
			photobooth_proof4a.x = 352;
			photobooth_proof4a.y = 543;
			
			photobooth_capturetemp4 = ImageResizer.bilinearIterative(photoboothBitmapData4, 140, 140, ResizeMath.METHOD_PAN_AND_SCAN); 
			photobooth_proof4b = new Bitmap(photobooth_capturetemp4,PixelSnapping.ALWAYS, true);		
			addChild(photobooth_proof4b);
			photobooth_proof4b.x = 546;
			photobooth_proof4b.y = 543;
			
		}
		
		//let's print if it is turned on
		if (myXML.photobooth_printing == "on") {	
			photoboothPrint2();
		}
		
		photoboothProofDisplayTime.start();
		
		
		
	}
	
	private function photoboothResetEvent(e:TimerEvent):void { //we are done so reset things for the next photobooth run
		photoboothProofDisplayTime.reset();
		
		photoboothThanksBoxTimer.start();
		photoboothRoundRectangle.visible = true;
		photoboothMessage.visible = true;
		photoboothMessage.text = "Thanks... Come Again";
		video.visible = true;
		
		if (myXML.photobooth_logo == "on") {
			photoboothLogoImage.visible = true;
		}
		
		photobooth_thanksSound.play(); //thanks come again sound
		
		CountdownTimerCounter = int(myXML.photobooth_countdown); //reset the timer for the next run
		
		photoboothBackgroundImage.visible = true;
		photoboothBoxesImage.visible = true;	
		
		//photoboothRoundRectangle.visible = false;
		//photoboothMessage.visible = false;
		photoboothWhiteRectangle.visible = false;
		if (myXML.photobooth_backgroundcustomimage == "on") {
			photoboothCustomBackground_image.visible = false;
		}
		
		photoboothUIinit();
		photoboothRunning = 0; //set this flag back so the photobooth can run again
		photoboothIdle = 1; //it's not running anymore but it is idle
		
		if (myXML.photobooth_leds == "on") {
	    	a.writeDigitalPin(LED1_pin, Arduino.LOW); 
			a.writeDigitalPin(LED2_pin, Arduino.LOW); 
			a.writeDigitalPin(LED3_pin, Arduino.HIGH); //photobooth is ready LED
			a.writeDigitalPin(LED4_pin, Arduino.LOW); 			
		}
		
		if (myXML.photobooth_facialRecognitionTrigger == "on") {  //give the people time to leave before enabling the facial recognition trigger to start again
				photoboothFacialRecDelayTimer.start();
		}
		
	}
	
	private function photoboothFacialRecDelayTimerEvent(e:TimerEvent):void { //turn on the facial rec timer
				photoboothdetectionTimer.start();
				photoboothFacialRecDelayTimer.reset();
		
	}
	
	private function photoboothThanksBoxTimerEvent(e:TimerEvent):void { //clear the thanks box
		photoboothThanksBoxTimer.reset();
		//photoboothRoundRectangle.visible = false;
		//photoboothMessage.visible = false;
		
		photoboothRoundRectangle.visible = true;
		photoboothMessage.visible = true;
		photoboothMessage.text = myXML.photobooth_startuptext;
	}
	
	private function PrintStage(evt:MouseEvent) {
	  
	   photoboothPrint2();
	   
	}
	   
	private function startEncode(imageBitmapData:BitmapData):void
	{
	  var encoder:JPEGAsyncEncoder = new JPEGAsyncEncoder(80);
	  encoder.PixelsPerIteration = 128;
	  encoder.addEventListener(JPEGAsyncCompleteEvent.JPEGASYNC_COMPLETE, encodeDone);
	  encoder.addEventListener(ProgressEvent.PROGRESS, encodeProg);
	  encoder.encode(imageBitmapData);
	}
	
	private function encodeProg(event:ProgressEvent):void
	{
	  var percentage:String = ((event.bytesLoaded / event.bytesTotal)*100) + "%";
	  //trace(percentage);
	  //Display the percentage somewhere
	}
	
	private function encodeDone(event:JPEGAsyncCompleteEvent):void
	{
	  var imgByteArray:ByteArray = event.ImageData;
	  //Do something with the encoded image
	  
	 //extension to save the file
		var ext:String;
		ext = EXT_JPEG;
		//verify specified format and use the correct encoder to produce the bytearray
		//switch(format){
			//case FORMAT_JPEG:
				//ext = EXT_JPEG;
				//var jpgenc:JPEGEncoder = new JPEGEncoder(100);
				//imgByteArray = jpgenc.encode(bmpd);
				//break;
			//case FORMAT_PNG:
				//ext = EXT_PNG;
				//var pngenc:PNGEncoder = new PNGEncoder();
				//imgByteArray = pngenc.encode(bmpd);
				//break;
		//}
		
		//gets a reference to a new empty image file 
		var fl:File = getNewImageFile(ext);
		
		//Use a FileStream to save the bytearray as bytes to the new file
		var fs:FileStream = new FileStream();
		try{
			//open file in write mode
			fs.open(fl,FileMode.WRITE);
			//write bytes from the byte array
			fs.writeBytes(imgByteArray);
			//close the file
			fs.close();
		}catch(e:Error){
			trace(e.message);
		}
		
	
}
	
	private function saveImage(comp:DisplayObject,format:uint):void{
		//Bitmapdata from the component to take snapshot
		//var bmpd:BitmapData = new BitmapData(640,480);
		var bmpd:BitmapData = new BitmapData(comp.width,comp.height);
		bmpd.draw(comp);
		
		//Bytearray of the final image
		var imgByteArray:ByteArray;
		
		//extension to save the file
		var ext:String;
		
		//verify specified format and use the correct encoder to produce the bytearray
		switch(format){
			case FORMAT_JPEG:
				ext = EXT_JPEG;
				var jpgenc:JPEGEncoder = new JPEGEncoder(100);
				imgByteArray = jpgenc.encode(bmpd);
				break;
			case FORMAT_PNG:
				ext = EXT_PNG;
				var pngenc:PNGEncoder = new PNGEncoder();
				//imgByteArray = pngenc.encode(bmpd);
				break;
		}
		
		//gets a reference to a new empty image file 
		var fl:File = getNewImageFile(ext);
		
		//Use a FileStream to save the bytearray as bytes to the new file
		var fs:FileStream = new FileStream();
		try{
			//open file in write mode
			fs.open(fl,FileMode.WRITE);
			//write bytes from the byte array
			fs.writeBytes(imgByteArray);
			//close the file
			fs.close();
		}catch(e:Error){
			trace(e.message);
		}
	}
	
	private function saveBitmapImage(bmpd:BitmapData,format:uint):void{
		//Bitmapdata from the component to take snapshot
		//var bmpd:BitmapData = new BitmapData(640,480);
		//var bmpd:BitmapData = new BitmapData(comp.width,comp.height);
		//bmpd.draw(comp);
		
		//Bytearray of the final image
		var imgByteArray:ByteArray;
		
		//extension to save the file
		var ext:String;
		
		//verify specified format and use the correct encoder to produce the bytearray
		switch(format){
			case FORMAT_JPEG:
				ext = EXT_JPEG;
				var jpgenc:JPEGEncoder = new JPEGEncoder(100);
				imgByteArray = jpgenc.encode(bmpd);
				break;
			case FORMAT_PNG:
				ext = EXT_PNG;
				var pngenc:PNGEncoder = new PNGEncoder();
				//imgByteArray = pngenc.encode(bmpd);
				break;
		}
		
		//gets a reference to a new empty image file 
		var fl:File = getNewImageFile(ext);
		
		//Use a FileStream to save the bytearray as bytes to the new file
		var fs:FileStream = new FileStream();
		try{
			//open file in write mode
			fs.open(fl,FileMode.WRITE);
			//write bytes from the byte array
			fs.writeBytes(imgByteArray);
			//close the file
			fs.close();
		}catch(e:Error){
			trace(e.message);
		}
	}
	
	//Returns a unique new image file reference
	//with specified extension
	private function getNewImageFile(ext:String):File{
		//Create a new unique filename based on date/time
		var fileName:String = "photobooth"+getNowTimestamp()+ext;
	
		//Create a reference to a new file on app folder
		//We use resolvepath to get a file object that points to the correct 
		//image folder - [USER]/[Documents]/[YOUR_APP_NAME]/images/
		//it also creates any directory that does not exists in the path
		
		var fl:File = File.documentsDirectory.resolvePath(IMAGE_FOLDER+fileName);
		
		//verify that the file really does not exist
		if(fl.exists){
			//if exists , tries to get a new one using recursion
			return getNewImageFile(ext);
		}
		
		return fl;
	}	
	
	private function getNowTimestamp():String{
		var d:Date = new Date();
		var tstamp:String = d.getFullYear().toString()+d.getMonth()+d.getDate()+d.getHours()+d.getMinutes()+d.getSeconds()+d.getMilliseconds();
		return 	tstamp;			
	}
	
	private function photoboothPrint() {
		
	   PrintOptions.printAsBitmap = true;
	   trace("print called!");
	   if (printJob.start2()) {
	   //if (printJob.start2(uiOpt, false)) {	   
		   bitmapData.draw(stage);
		   printSprite.addChild(screenShot);
		
			//========== printjob bug fix - prevent blank pages: ==========
			printSprite.x = 2000; //keep it hidden to the side of the stage
			stage.addChild(printSprite); //add to stage - prevents blank pages
			//=============================================================
		
			trace("before printSprite width: " + printSprite.width + " printJob.pageWidth: " + printJob.pageWidth);
		
			//scale it to fill the page (portrait orientation):
		  
			//myScale = Math.min(printJob.pageWidth/printSprite.width, printJob.pageHeight/printSprite.height);
			//printSprite.scaleX = printSprite.scaleY = myScale;
			
			if (myXML.photobooth_papersize == "A6") {
					  printSprite.scaleX = Number(myXML.photobooth_scaling);
					  printSprite.scaleY = Number(myXML.photobooth_scaling);
					  trace ("the user has photo paper selected for printing and we've scaled the stage accordingly");
			}
		  
			trace("after printSprite width: " + printSprite.width + " printJob.pageWidth: " + printJob.pageWidth);
			printArea = new Rectangle(photoboothWhiteRectangle.x, photoboothWhiteRectangle.y, photoboothWhiteRectangle.width, photoboothWhiteRectangle.height);
			//printArea = (327,107, 384, 577);
			printJob.addPage(printSprite,printArea,PrintOptions);
			printJob.send();
		
			stage.removeChild(printSprite);
			printSprite = null;
	   }
	 }
	 
	private function photoboothPrint2() {
		
		   PrintOptions.printAsBitmap = true;
		   trace("print called!");
		
				   bitmapData.draw(stage);
				   printSprite.addChild(screenShot);
				
					//========== printjob bug fix - prevent blank pages: ==========
					printSprite.x = 2000; //keep it hidden to the side of the stage
					stage.addChild(printSprite); //add to stage - prevents blank pages
					//=============================================================
					  
				   if (myXML.photobooth_papersize == "Letter") {
						 printJob.selectPaperSize(PaperSize.LETTER);
					   }
				   else {
						printJob.selectPaperSize(PaperSize.A6); 
				   }
				  
				   if (myXML.photobooth_printorientation == "Landscape") {
						  printJob.orientation = PrintJobOrientation.LANDSCAPE; 
					   }
				   else {
						 printJob.orientation = PrintJobOrientation.PORTRAIT; 
				   }
				  
				  if (myXML.photobooth_papersize == "A6") {
					  printSprite.scaleX = Number(myXML.photobooth_scaling);
					  printSprite.scaleY = Number(myXML.photobooth_scaling);
					  trace ("the user has photo paper selected for printing and we've scaled the stage accordingly");
				  }
				   
				   printJob.copies = int(myXML.photobooth_print_copies); //number of copies to print 
				   printJob.jobName = "Photobooth Print"; 
					
				   PrintOptions.printAsBitmap = true;
				   printArea = new Rectangle(photoboothWhiteRectangle.x, photoboothWhiteRectangle.y, photoboothWhiteRectangle.width, photoboothWhiteRectangle.height);
					
					if (PrintJob.supportsPageSetupDialog) 
							{                 
								//printJob.showPageSetupDialog(); 				
							} 
							
							 if (myXML.photobooth_promptprint == "on") {  //show the printer dialog box before printing
									 if (printJob.start2(uiOpt, true)) 
							
											{ 
												 try 
												{ 
													printJob.addPage(printSprite, printArea,PrintOptions); 
												} 
												catch (error:Error) 
												{ 
													// Do nothing. 
												} 
												printJob.send(); 
											} 
											else 
											{ 
												printJob.terminate(); 
											}  
							 }
							 
							 else {
									  if (printJob.start2(uiOpt, false)) 
								
												{ 
													 try 
													{ 
														printJob.addPage(printSprite, printArea,PrintOptions); 
													} 
													catch (error:Error) 
													{ 
														// Do nothing. 
													} 
													printJob.send(); 
												} 
												else 
												{ 
													printJob.terminate(); 
												}  
								 
								 
							 }
				
					//stage.removeChild(printSprite); //had to remove this statement as it was causing a crash on the second time pritning around
					//printSprite = null;
				   
				 }
	
	
	///************** End Photobooth Functions *******************

	private function Get_X10_Array(x10_address:String):void  {
	    trace ("x10 address in get array function " + x10_address);
		switch (x10_address)  //sets the video playlists based on the mode
					{
					case "A1":
						 X10_ON_ARRAY = [0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0];						  
						break;
					case "A2":
						 X10_ON_ARRAY = [0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0];						
						 break;
					case "A3":
						 X10_ON_ARRAY = [0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,0,0,0,0,0,1,0,1,0,0,0];						 
						 break;
					case "A4":
						 X10_ON_ARRAY = [0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0];						
						 break;
					case "A5":
						 X10_ON_ARRAY = [0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0];						
						 break;
					case "A6":
						 X10_ON_ARRAY = [0,1,1,0,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0];						
						 break;
					case "A7":
						 X10_ON_ARRAY = [0,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,0,0,0,0,1,1,0,1,0,0,0];						
						 break;
					case "A8":
						 X10_ON_ARRAY = [0,1,1,0,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0];						
						 break;
					case "A9":
						 X10_ON_ARRAY = [0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,1,0,0,0,0,1,0,0,0,0,0];						
						 break;	 
					case "A10":
						 X10_ON_ARRAY = [0,1,1,0,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,1,0,0,0,0,1,1,0,0,0,0];        
						 break;	 
					case "A11":
						 X10_ON_ARRAY = [0,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,1,0,0,0,0,1,0,1,0,0,0];       
						 break;	 	
					case "A12":
						 X10_ON_ARRAY = [0,1,1,0,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,1,0,0,0,0,1,1,1,0,0,0];   
						 break;	 	
					case "A13":
						 X10_ON_ARRAY = [0,1,1,0,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,1,0,0,0,1,1,0,0,0,0,0];   
						 break;	 	
					case "A14":
						 X10_ON_ARRAY = [0,1,1,0,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [0,1,1,0,0,1,0,0,0,1,1,1,0,0,0,0];  
						 break;	 	
					case "A15":
						 X10_ON_ARRAY = [0,1,1,0,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [0,1,1,0,0,1,0,0,0,1,1,0,1,0,0,0];  
						 break;	 	
					case "A16":
						 X10_ON_ARRAY = [0,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,1,0,0,0,1,1,1,1,0,0,0];   
						 break;	 	
					case "B1":
						 X10_ON_ARRAY = [0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0]; 
						 break;	 
					case "B2":
						 X10_ON_ARRAY = [0,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0]; 
						 break;	 	
					case "B3":
						 X10_ON_ARRAY = [0,1,1,1,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [0,1,1,1,0,0,0,0,0,0,1,0,1,0,0,0]; 
						 break;	 	
					case "B4":
						 X10_ON_ARRAY = [0,1,1,1,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0];    
						 break;	 	
					case "B5":
						 X10_ON_ARRAY = [0,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0];   
						 break;	 	
					case "B6":
						 X10_ON_ARRAY = [0,1,1,1,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0];   
						 break;	 	
					case "B7":
						 X10_ON_ARRAY = [0,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [0,1,1,1,0,0,0,0,0,1,1,0,1,0,0,0]; 
						 break;	 	
					case "B8":
						 X10_ON_ARRAY = [0,1,1,1,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0];   
						 break;	 	
					case "B9":
						 X10_ON_ARRAY = [0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,1,1,1,0,1,0,0,0,0,1,0,0,0,0,0];  
						 break;	 	
					case "B10":
						 X10_ON_ARRAY = [0,1,1,1,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,1,0,1,0,0,0,0,1,1,0,0,0,0];   
						 break;	 		 
					case "B11":
						 X10_ON_ARRAY = [0,1,1,1,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [0,1,1,1,0,1,0,0,0,0,1,0,1,0,0,0];  
						 break;	 	
					case "B12":
						 X10_ON_ARRAY = [0,1,1,1,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,1,0,1,0,0,0,0,1,1,1,0,0,0];   
						 break;	 	
					case "B13":
						 X10_ON_ARRAY = [0,1,1,1,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,1,0,1,0,0,0,1,1,0,0,0,0,0];   
						 break;	 	
					case "B14":
						 X10_ON_ARRAY = [0,1,1,1,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [0,1,1,1,0,1,0,0,0,1,1,1,0,0,0,0];  
						 break;	 	
					case "B15":
						 X10_ON_ARRAY = [0,1,1,1,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [0,1,1,1,0,1,0,0,0,1,1,0,1,0,0,0]; 
						 break;	 	
					case "B16":
						 X10_ON_ARRAY = [0,1,1,1,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [0,1,1,1,0,1,0,0,0,1,1,1,1,0,0,0]; 
						 break;	 
					case "C1":
						 X10_ON_ARRAY = [0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =   [0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0]; 
						 break;	 
					case "C2":
						 X10_ON_ARRAY = [0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [0,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0];  
						 break;	 	
					case "C3":
						 X10_ON_ARRAY = [0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [0,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0];  
						 break;	 	
					case "C4":
						 X10_ON_ARRAY = [0,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [0,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0]; 
						 break;	 	
					case "C5":
						 X10_ON_ARRAY = [0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0];   
						 break;	 	
					case "C6":
						 X10_ON_ARRAY = [0,1,0,0,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0];   
						 break;	 	
					case "C7":
						 X10_ON_ARRAY = [0,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [0,1,0,0,0,0,0,0,0,1,1,0,1,0,0,0]; 
						 break;	 	
					case "C8":
						 X10_ON_ARRAY = [0,1,0,0,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0]; 
						 break;	 	
					case "C9":
						 X10_ON_ARRAY = [0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =    [0,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0];
						 break;	 	
					case "C10":
						 X10_ON_ARRAY = [0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,0]; 
						 X10_OFF_ARRAY =  [0,1,0,0,0,1,0,0,0,0,1,1,0,0,0,0];  
						 break;	 		 
					case "C11":
						 X10_ON_ARRAY = [0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [0,1,0,0,0,1,0,0,0,0,1,0,1,0,0,0];  
						 break;	 	
					case "C12":
						 X10_ON_ARRAY = [0,1,0,0,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [0,1,0,0,0,1,0,0,0,0,1,1,1,0,0,0];  
						 break;	 	
					case "C13":
						 X10_ON_ARRAY = [0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =   [0,1,0,0,0,1,0,0,0,1,1,0,0,0,0,0]; 
						 break;	 	
					case "C14":
						 X10_ON_ARRAY = [0,1,0,0,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =   [0,1,0,0,0,1,0,0,0,1,1,1,0,0,0,0]; 
						 break;	 	
					case "C15":
						 X10_ON_ARRAY = [0,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [0,1,0,0,0,1,0,0,0,1,1,0,1,0,0,0];  
						 break;	 	
					case "C16":
						 X10_ON_ARRAY = [0,1,0,0,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [0,1,0,0,0,1,0,0,0,1,1,1,1,0,0,0];  
						 break;	 
					case "D1":
						 X10_ON_ARRAY = [0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,1,0,1,0,0,0,0,0,0,1,0,0,0,0,0];  
						 break;	 
					case "D2":
						 X10_ON_ARRAY = [0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY =   [0,1,0,1,0,0,0,0,0,0,1,1,0,0,0,0]; 
						 break;	 	
					case "D3":
						 X10_ON_ARRAY = [0,1,0,1,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =    [0,1,0,1,0,0,0,0,0,0,1,0,1,0,0,0];
						 break;	 	
					case "D4":
						 X10_ON_ARRAY = [0,1,0,1,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [0,1,0,1,0,0,0,0,0,0,1,1,1,0,0,0]; 
						 break;	 	
					case "D5":
						 X10_ON_ARRAY = [0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =    [0,1,0,1,0,0,0,0,0,1,1,0,0,0,0,0];
						 break;	 	
					case "D6":
						 X10_ON_ARRAY = [0,1,0,1,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [0,1,0,1,0,0,0,0,0,1,1,1,0,0,0,0];  
						 break;	 	
					case "D7":
						 X10_ON_ARRAY = [0,1,0,1,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [0,1,0,1,0,0,0,0,0,1,1,0,1,0,0,0];  
						 break;	 	
					case "D8":
						 X10_ON_ARRAY = [0,1,0,1,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =    [0,1,0,1,0,0,0,0,0,1,1,1,1,0,0,0];
						 break;	 	
					case "D9":
						 X10_ON_ARRAY = [0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,1,0,1,0,1,0,0,0,0,1,0,0,0,0,0];  
						 break;	 	
					case "D10":
						 X10_ON_ARRAY = [0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,0,1,0,1,0,0,0,0,1,1,0,0,0,0];   
						 break;	 		 
					case "D11":
						 X10_ON_ARRAY = [0,1,0,1,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =    [0,1,0,1,0,1,0,0,0,0,1,0,1,0,0,0];
						 break;	 	
					case "D12":
						 X10_ON_ARRAY = [0,1,0,1,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [0,1,0,1,0,1,0,0,0,0,1,1,1,0,0,0];   
						 break;	 	
					case "D13":
						 X10_ON_ARRAY = [0,1,0,1,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,0,1,0,1,0,0,0,1,1,0,0,0,0,0];   
						 break;	 	
					case "D14":
						 X10_ON_ARRAY = [0,1,0,1,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,0,1,0,1,0,0,0,1,1,1,0,0,0,0];   
						 break;	 	
					case "D15":
						 X10_ON_ARRAY = [0,1,0,1,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [0,1,0,1,0,1,0,0,0,1,1,0,1,0,0,0];  
						 break;	 	
					case "D16":
						 X10_ON_ARRAY = [0,1,0,1,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [0,1,0,1,0,1,0,0,0,1,1,1,1,0,0,0];  
						 break;	 						
					case "E1":
						 X10_ON_ARRAY = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0];
						 break;	 
					case "E2":
						 X10_ON_ARRAY = [1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY =   [1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0]; 
						 break;	 	
					case "E3":
						 X10_ON_ARRAY = [1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0];   
						 break;	 	
					case "E4":
						 X10_ON_ARRAY = [1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0];  
						 break;	 	
					case "E5":
						 X10_ON_ARRAY = [1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0];  
						 break;	 	
					case "E6":
						 X10_ON_ARRAY = [1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =    [1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0];
						 break;	 	
					case "E7":
						 X10_ON_ARRAY = [1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0];
						 break;	 	
					case "E8":
						 X10_ON_ARRAY = [1,0,0,0,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [1,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0]; 
						 break;	 	
					case "E9":
						 X10_ON_ARRAY = [1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0];
						 break;	 	
					case "E10":
						 X10_ON_ARRAY = [1,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0];
						 break;	 		 
					case "E11":
						 X10_ON_ARRAY = [1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0];						
						 X10_OFF_ARRAY = [1,0,0,0,0,1,0,0,0,0,1,0,1,0,0,0];
   
						 break;	 	
					case "E12":
						 X10_ON_ARRAY = [1,0,0,0,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0]; 
						 break;	 	
					case "E13":
						 X10_ON_ARRAY = [1,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =    [1,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0];
						 break;	 	
					case "E14":
						 X10_ON_ARRAY = [1,0,0,0,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [1,0,0,0,0,1,0,0,0,1,1,1,0,0,0,0];  
						 break;	 	
					case "E15":
						 X10_ON_ARRAY = [1,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [1,0,0,0,0,1,0,0,0,1,1,0,1,0,0,0];   
						 break;	 	
					case "E16":
						 X10_ON_ARRAY = [1,0,0,0,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,0,0,0,1,0,0,0,1,1,1,1,0,0,0];
						 break;	 	
					case "F1":
						 X10_ON_ARRAY = [1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0];
						 break;	 
					case "F2":
						 X10_ON_ARRAY = [1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0];						
						 X10_OFF_ARRAY =  [1,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0];
  
						 break;	 	
					case "F3":
						 X10_ON_ARRAY = [1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =    [1,0,0,1,0,0,0,0,0,0,1,0,1,0,0,0];
						 break;	 	
					case "F4":
						 X10_ON_ARRAY = [1,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,0,1,0,0,0,0,0,0,1,1,1,0,0,0]; 
						 break;	 	
					case "F5":
						 X10_ON_ARRAY = [1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =   [1,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0]; 
						 break;	 	
					case "F6":
						 X10_ON_ARRAY = [1,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =   [1,0,0,1,0,0,0,0,0,1,1,1,0,0,0,0]; 
						 break;	 	
					case "F7":
						 X10_ON_ARRAY = [1,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =[1,0,0,1,0,0,0,0,0,1,1,0,1,0,0,0];   
						 break;	 	
					case "F8":
						 X10_ON_ARRAY = [1,0,0,1,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,0,1,0,0,0,0,0,1,1,1,1,0,0,0];
						 break;	 	
					case "F9":
						 X10_ON_ARRAY = [1,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,0,0,1,0,1,0,0,0,0,1,0,0,0,0,0];
						 break;	 	
					case "F10":
						 X10_ON_ARRAY = [1,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,0,0,1,0,1,0,0,0,0,1,1,0,0,0,0];
						 break;	 		 
					case "F11":
						 X10_ON_ARRAY = [1,0,0,1,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,0,1,0,1,0,0,0,0,1,0,1,0,0,0]; 
						 break;	 	
					case "F12":
						 X10_ON_ARRAY = [1,0,0,1,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,0,1,0,1,0,0,0,0,1,1,1,0,0,0]; 
						 break;	 	
					case "F13":
						 X10_ON_ARRAY = [1,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,0,0,1,0,1,0,0,0,1,1,0,0,0,0,0];  
						 break;	 	
					case "F14":
						 X10_ON_ARRAY = [1,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,0,0,1,0,1,0,0,0,1,1,1,0,0,0,0];   
						 break;	 	
					case "F15":
						 X10_ON_ARRAY = [1,0,0,1,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =    [1,0,0,1,0,1,0,0,0,1,1,0,1,0,0,0];
						 break;	 	
					case "F16":
						 X10_ON_ARRAY = [1,0,0,1,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,0,1,0,1,0,0,0,1,1,1,1,0,0,0];
						 break;	 
					case "G1":
						 X10_ON_ARRAY = [1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0]; 
						 break;	 
					case "G2":
						 X10_ON_ARRAY = [1,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY =   [1,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0]; 
						 break;	 	
					case "G3":
						 X10_ON_ARRAY = [1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =    [1,0,1,0,0,0,0,0,0,0,1,0,1,0,0,0];
						 break;	 	
					case "G4":
						 X10_ON_ARRAY = [1,0,1,0,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =    [1,0,1,0,0,0,0,0,0,0,1,1,1,0,0,0];
						 break;	 	
					case "G5":
						 X10_ON_ARRAY = [1,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =    [1,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0];
						 break;	 	
					case "G6":
						 X10_ON_ARRAY = [1,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =    [1,0,1,0,0,0,0,0,0,1,1,1,0,0,0,0];
						 break;	 	
					case "G7":
						 X10_ON_ARRAY = [1,0,1,0,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,1,0,0,0,0,0,0,1,1,0,1,0,0,0];

						 break;	 	
					case "G8":
						 X10_ON_ARRAY = [1,0,1,0,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,1,0,0,0,0,0,0,1,1,1,1,0,0,0];
						 break;	 	
					case "G9":
						 X10_ON_ARRAY = [1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0];
						 break;	 	
					case "G10":
						 X10_ON_ARRAY = [1,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,0,1,0,0,1,0,0,0,0,1,1,0,0,0,0];
						 break;	 		 
					case "G11":
						 X10_ON_ARRAY = [1,0,1,0,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =    [1,0,1,0,0,1,0,0,0,0,1,0,1,0,0,0];
						 break;	 	
					case "G12":
						 X10_ON_ARRAY = [1,0,1,0,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =    [1,0,1,0,0,1,0,0,0,0,1,1,1,0,0,0];
						 break;	 	
					case "G13":
						 X10_ON_ARRAY = [1,0,1,0,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =    [1,0,1,0,0,1,0,0,0,1,1,0,0,0,0,0];
						 break;	 	
					case "G14":
						 X10_ON_ARRAY = [1,0,1,0,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =   [1,0,1,0,0,1,0,0,0,1,1,1,0,0,0,0]; 
						 break;	 	
					case "G15":
						 X10_ON_ARRAY = [1,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,1,0,0,1,0,0,0,1,1,0,1,0,0,0]; 
						 break;	 	
					case "G16":
						 X10_ON_ARRAY = [1,0,1,0,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [1,0,1,0,0,1,0,0,0,1,1,1,1,0,0,0];  
						 break;	 	
					case "H1":
						 X10_ON_ARRAY = [1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0];
						 break;	 
					case "H2":
						 X10_ON_ARRAY = [1,0,1,1,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY =    [1,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0];
						 break;	 	
					case "H3":
						 X10_ON_ARRAY = [1,0,1,1,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [1,0,1,1,0,0,0,0,0,0,1,0,1,0,0,0];  
						 break;	 	
					case "H4":
						 X10_ON_ARRAY = [1,0,1,1,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [1,0,1,1,0,0,0,0,0,0,1,1,1,0,0,0];   
						 break;	 	
					case "H5":
						 X10_ON_ARRAY = [1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [1,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0];   
						 break;	 	
					case "H6":
						 X10_ON_ARRAY = [1,0,1,1,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [1,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0];  
						 break;	 	
					case "H7":
						 X10_ON_ARRAY = [1,0,1,1,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [1,0,1,1,0,0,0,0,0,1,1,0,1,0,0,0]; 
						 break;	 	
					case "H8":
						 X10_ON_ARRAY = [1,0,1,1,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [1,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0]; 
						 break;	 	
					case "H9":
						 X10_ON_ARRAY = [1,0,1,1,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,0,1,1,0,1,0,0,0,0,1,0,0,0,0,0];
						 break;	 	
					case "H10":
						 X10_ON_ARRAY = [1,0,1,1,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,0,1,1,0,1,0,0,0,0,1,1,0,0,0,0];
						 break;	 		 
					case "H11":
						 X10_ON_ARRAY = [1,0,1,1,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,1,1,0,1,0,0,0,0,1,0,1,0,0,0]; 
						 break;	 	
					case "H12":
						 X10_ON_ARRAY = [1,0,1,1,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =    [1,0,1,1,0,1,0,0,0,0,1,1,1,0,0,0];
						 break;	 	
					case "H13":
						 X10_ON_ARRAY = [1,0,1,1,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =   [1,0,1,1,0,1,0,0,0,1,1,0,0,0,0,0]; 
						 break;	 	
					case "H14":
						 X10_ON_ARRAY = [1,0,1,1,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [1,0,1,1,0,1,0,0,0,1,1,1,0,0,0,0];  
						 break;	 	
					case "H15":
						 X10_ON_ARRAY = [1,0,1,1,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [1,0,1,1,0,1,0,0,0,1,1,0,1,0,0,0];   
						 break;	 	
					case "H16":
						 X10_ON_ARRAY = [1,0,1,1,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [1,0,1,1,0,1,0,0,0,1,1,1,1,0,0,0];
						 break;	 
					case "I1":
						 X10_ON_ARRAY = [1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0];
						 break;	 
					case "I2":
						 X10_ON_ARRAY = [1,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0];   
						 break;	 	
					case "I3":
						 X10_ON_ARRAY = [1,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [1,1,1,0,0,0,0,0,0,0,1,0,1,0,0,0];  
						 break;	 	
					case "I4":
						 X10_ON_ARRAY = [1,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0];  
						 break;	 	
					case "I5":
						 X10_ON_ARRAY = [1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =    [1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0];
						 break;	 	
					case "I6":
						 X10_ON_ARRAY = [1,1,1,0,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =    [1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0];
						 break;	 	
					case "I7":
						 X10_ON_ARRAY = [1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,0,0,0,0,0,0,1,1,0,1,0,0,0];  
						 break;	 	
					case "I8":
						 X10_ON_ARRAY = [1,1,1,0,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0];
						 break;	 	
					case "I9":
						 X10_ON_ARRAY = [1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,1,1,0,0,1,0,0,0,0,1,0,0,0,0,0];
						 break;	 	
					case "I10":
						 X10_ON_ARRAY = [1,1,1,0,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,0,0,1,0,0,0,0,1,1,0,0,0,0];
						 break;	 		 
					case "I11":
						 X10_ON_ARRAY = [1,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,0,0,1,0,0,0,0,1,0,1,0,0,0];   
						 break;	 	
					case "I12":
						 X10_ON_ARRAY = [1,1,1,0,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [1,1,1,0,0,1,0,0,0,0,1,1,1,0,0,0];  
						 break;	 	
					case "I13":
						 X10_ON_ARRAY = [1,1,1,0,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,0,0,1,0,0,0,1,1,0,0,0,0,0];   
						 break;	 	
					case "I14":
						 X10_ON_ARRAY = [1,1,1,0,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,0,0,1,0,0,0,1,1,1,0,0,0,0];   
						 break;	 	
					case "I15":
						 X10_ON_ARRAY = [1,1,1,0,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [1,1,1,0,0,1,0,0,0,1,1,0,1,0,0,0]; 
						 break;	 	
					case "I16":
						 X10_ON_ARRAY = [1,1,1,0,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [1,1,1,0,0,1,0,0,0,1,1,1,1,0,0,0];
						 break;	 	
					case "J1":
						 X10_ON_ARRAY = [1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0]; 
						 break;	 
					case "J2":
						 X10_ON_ARRAY = [1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0];  
						 break;	 	
					case "J3":
						 X10_ON_ARRAY = [1,1,1,1,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =    [1,1,1,1,0,0,0,0,0,0,1,0,1,0,0,0];
						 break;	 	
					case "J4":
						 X10_ON_ARRAY = [1,1,1,1,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0];   
						 break;	 	
					case "J5":
						 X10_ON_ARRAY = [1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =    [1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0];
						 break;	 	
					case "J6":
						 X10_ON_ARRAY = [1,1,1,1,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0];    
						 break;	 	
					case "J7":
						 X10_ON_ARRAY = [1,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [1,1,1,1,0,0,0,0,0,1,1,0,1,0,0,0];
						 break;	 	
					case "J8":
						 X10_ON_ARRAY = [1,1,1,1,0,0,0,0,0,1,0,1,1,0,0,0]; 
						 X10_OFF_ARRAY =  [1,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0]; 
						 break;	 	
					case "J9":
						 X10_ON_ARRAY = [1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,1,0,1,0,0,0,0,1,0,0,0,0,0];
 
						 break;	 	
					case "J10":
						 X10_ON_ARRAY = [1,1,1,1,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,1,0,1,0,0,0,0,1,1,0,0,0,0];
						 break;	 		 
					case "J11":
						 X10_ON_ARRAY = [1,1,1,1,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,1,0,1,0,0,0,0,1,0,1,0,0,0];   
						 break;	 	
					case "J12":
						 X10_ON_ARRAY = [1,1,1,1,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [1,1,1,1,0,1,0,0,0,0,1,1,1,0,0,0]; 
						 break;	 	
					case "J13":
						 X10_ON_ARRAY = [1,1,1,1,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,1,1,1,0,1,0,0,0,1,1,0,0,0,0,0];  
						 break;	 	
					case "J14":
						 X10_ON_ARRAY = [1,1,1,1,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =   [1,1,1,1,0,1,0,0,0,1,1,1,0,0,0,0]; 
						 break;	 	
					case "J15":
						 X10_ON_ARRAY = [1,1,1,1,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [1,1,1,1,0,1,0,0,0,1,1,0,1,0,0,0];  
						 break;	 	
					case "J16":
						 X10_ON_ARRAY = [1,1,1,1,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [1,1,1,1,0,1,0,0,0,1,1,1,1,0,0,0];  
						 break;	 		 
					case "K1":
						 X10_ON_ARRAY = [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0];
						 break;	 
					case "K2":
						 X10_ON_ARRAY = [1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0];  
						 break;	 	
					case "K3":
						 X10_ON_ARRAY = [1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [1,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0]; 
						 break;	 	
					case "K4":
						 X10_ON_ARRAY = [1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0];   
						 break;	 	
					case "K5":
						 X10_ON_ARRAY = [1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0];  
						 break;	 	
					case "K6":
						 X10_ON_ARRAY = [1,1,0,0,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =    [1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0];
						 break;	 	
					case "K7":
						 X10_ON_ARRAY = [1,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [1,1,0,0,0,0,0,0,0,1,1,0,1,0,0,0];
						 break;	 	
					case "K8":
						 X10_ON_ARRAY = [1,1,0,0,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0]; 
						 break;	 	
					case "K9":
						 X10_ON_ARRAY = [1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0]; 
						 break;	 	
					case "K10":
						 X10_ON_ARRAY = [1,1,0,0,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,0,0,0,1,0,0,0,0,1,1,0,0,0,0];
						 break;	 		 
					case "K11":
						 X10_ON_ARRAY = [1,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,0,0,1,0,0,0,0,1,0,1,0,0,0];  
						 break;	 	
					case "K12":
						 X10_ON_ARRAY = [1,1,0,0,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,0,0,1,0,0,0,0,1,1,1,0,0,0];  
						 break;	 	
					case "K13":
						 X10_ON_ARRAY = [1,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,0,0,1,0,0,0,1,1,0,0,0,0,0];  
						 break;	 	
					case "K14":
						 X10_ON_ARRAY = [1,1,0,0,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =    [1,1,0,0,0,1,0,0,0,1,1,1,0,0,0,0];
						 break;	 	
					case "K15":
						 X10_ON_ARRAY = [1,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =    [1,1,0,0,0,1,0,0,0,1,1,0,1,0,0,0];
						 break;	 	
					case "K16":
						 X10_ON_ARRAY = [1,1,0,0,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [1,1,0,0,0,1,0,0,0,1,1,1,1,0,0,0];   
						 break;	 		 	 	 
					case "L1":
						 X10_ON_ARRAY = [1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,1,0,0,0,0,0,0,1,0,0,0,0,0];
						 break;	 
					case "L2":
						 X10_ON_ARRAY = [1,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,1,0,0,0,0,0,0,1,1,0,0,0,0];  
						 break;	 	
					case "L3":
						 X10_ON_ARRAY = [1,1,0,1,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =    [1,1,0,1,0,0,0,0,0,0,1,0,1,0,0,0];
						 break;	 	
					case "L4":
						 X10_ON_ARRAY = [1,1,0,1,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =    [1,1,0,1,0,0,0,0,0,0,1,1,1,0,0,0];
						 break;	 	
					case "L5":
						 X10_ON_ARRAY = [1,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =   [1,1,0,1,0,0,0,0,0,1,1,0,0,0,0,0]; 
						 break;	 	
					case "L6":
						 X10_ON_ARRAY = [1,1,0,1,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =    [1,1,0,1,0,0,0,0,0,1,1,1,0,0,0,0];
						 break;	 	
					case "L7":
						 X10_ON_ARRAY = [1,1,0,1,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [1,1,0,1,0,0,0,0,0,1,1,0,1,0,0,0];
						 break;	 	
					case "L8":
						 X10_ON_ARRAY = [1,1,0,1,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,1,0,0,0,0,0,1,1,1,1,0,0,0]; 
						 break;	 	
					case "L9":
						 X10_ON_ARRAY = [1,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,0,1,0,1,0,0,0,0,1,0,0,0,0,0]; 
						 break;	 	
					case "L10":
						 X10_ON_ARRAY = [1,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,0,1,0,1,0,0,0,0,1,1,0,0,0,0];
						 break;	 		 
					case "L11":
						 X10_ON_ARRAY = [1,1,0,1,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,1,0,1,0,0,0,0,1,0,1,0,0,0];  
						 break;	 	
					case "L12":
						 X10_ON_ARRAY = [1,1,0,1,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [1,1,0,1,0,1,0,0,0,0,1,1,1,0,0,0]; 
						 break;	 	
					case "L13":
						 X10_ON_ARRAY = [1,1,0,1,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,1,0,1,0,0,0,1,1,0,0,0,0,0];  
						 break;	 	
					case "L14":
						 X10_ON_ARRAY = [1,1,0,1,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [1,1,0,1,0,1,0,0,0,1,1,1,0,0,0,0];   
						 break;	 	
					case "L15":
						 X10_ON_ARRAY = [1,1,0,1,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,1,0,1,0,0,0,1,1,0,1,0,0,0];  
						 break;	 	
					case "L16":
						 X10_ON_ARRAY = [1,1,0,1,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [1,1,0,1,0,1,0,0,0,1,1,1,1,0,0,0]; 
						 break;	 
					case "M1":
						 X10_ON_ARRAY = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0];
						 break;	 
					case "M2":
						 X10_ON_ARRAY = [0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0];  
						 break;	 	
					case "M3":
						 X10_ON_ARRAY = [0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0];   
						 break;	 	
					case "M4":
						 X10_ON_ARRAY = [0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0];  
						 break;	 	
					case "M5":
						 X10_ON_ARRAY = [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0];   
						 break;	 	
					case "M6":
						 X10_ON_ARRAY = [0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0];   
						 break;	 	
					case "M7":
						 X10_ON_ARRAY = [0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [0,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0];  
						 break;	 	
					case "M8":
						 X10_ON_ARRAY = [0,0,0,0,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0]; 
						 break;	 	
					case "M9":
						 X10_ON_ARRAY = [0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0];
						 break;	 	
					case "M10":
						 X10_ON_ARRAY = [0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0];
						 break;	 		 
					case "M11":
						 X10_ON_ARRAY = [0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [0,0,0,0,0,1,0,0,0,0,1,0,1,0,0,0]; 
						 break;	 	
					case "M12":
						 X10_ON_ARRAY = [0,0,0,0,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [0,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0];  
						 break;	 	
					case "M13":
						 X10_ON_ARRAY = [0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =    [0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0];
						 break;	 	
					case "M14":
						 X10_ON_ARRAY = [0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =   [0,0,0,0,0,1,0,0,0,1,1,1,0,0,0,0]; 
						 break;	 	
					case "M15":
						 X10_ON_ARRAY = [0,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [0,0,0,0,0,1,0,0,0,1,1,0,1,0,0,0]; 
						 break;	 	
					case "M16":
						 X10_ON_ARRAY = [0,0,0,0,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [0,0,0,0,0,1,0,0,0,1,1,1,1,0,0,0];
						 break;	 	
					case "N1":
						 X10_ON_ARRAY = [0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0];
						 break;	 
					case "N2":
						 X10_ON_ARRAY = [0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0];  
						 break;	 	
					case "N3":
						 X10_ON_ARRAY = [0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [0,0,0,1,0,0,0,0,0,0,1,0,1,0,0,0]; 
						 break;	 	
					case "N4":
						 X10_ON_ARRAY = [0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [0,0,0,1,0,0,0,0,0,0,1,1,1,0,0,0]; 
						 break;	 	
					case "N5":
						 X10_ON_ARRAY = [0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0];  
						 break;	 	
					case "N6":
						 X10_ON_ARRAY = [0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =    [0,0,0,1,0,0,0,0,0,1,1,1,0,0,0,0];
						 break;	 	
					case "N7":
						 X10_ON_ARRAY = [0,0,0,1,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [0,0,0,1,0,0,0,0,0,1,1,0,1,0,0,0];  
						 break;	 	
					case "N8":
						 X10_ON_ARRAY = [0,0,0,1,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [0,0,0,1,0,0,0,0,0,1,1,1,1,0,0,0]; 
						 break;	 	
					case "N9":
						 X10_ON_ARRAY = [0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,0];
						 break;	 	
					case "N10":
						 X10_ON_ARRAY = [0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,0,0,1,0,1,0,0,0,0,1,1,0,0,0,0];
						 break;	 		 
					case "N11":
						 X10_ON_ARRAY = [0,0,0,1,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [0,0,0,1,0,1,0,0,0,0,1,0,1,0,0,0]; 
						 break;	 	
					case "N12":
						 X10_ON_ARRAY = [0,0,0,1,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [0,0,0,1,0,1,0,0,0,0,1,1,1,0,0,0];   
						 break;	 	
					case "N13":
						 X10_ON_ARRAY = [0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [0,0,0,1,0,1,0,0,0,1,1,0,0,0,0,0];   
						 break;	 	
					case "N14":
						 X10_ON_ARRAY = [0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,0,0,1,0,1,0,0,0,1,1,1,0,0,0,0];   
						 break;	 	
					case "N15":
						 X10_ON_ARRAY = [0,0,0,1,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [0,0,0,1,0,1,0,0,0,1,1,0,1,0,0,0];   
						 break;	 	
					case "N16":
						 X10_ON_ARRAY = [0,0,0,1,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [0,0,0,1,0,1,0,0,0,1,1,1,1,0,0,0];  
						 break;	 	
					case "O1":
						 X10_ON_ARRAY = [0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0];
						 break;	 
					case "O2":
						 X10_ON_ARRAY = [0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0];  
						 break;	 	
					case "O3":
						 X10_ON_ARRAY = [0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =    [0,0,1,0,0,0,0,0,0,0,1,0,1,0,0,0];
						 break;	 	
					case "O4":
						 X10_ON_ARRAY = [0,0,1,0,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =    [0,0,1,0,0,0,0,0,0,0,1,1,1,0,0,0];
						 break;	 	
					case "O5":
						 X10_ON_ARRAY = [0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY = [0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0];   
						 break;	 	
					case "O6":
						 X10_ON_ARRAY = [0,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =    [0,0,1,0,0,0,0,0,0,1,1,1,0,0,0,0];
						 break;	 	
					case "O7":
						 X10_ON_ARRAY = [0,0,1,0,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [0,0,1,0,0,0,0,0,0,1,1,0,1,0,0,0];
						 break;	 	
					case "O8":
						 X10_ON_ARRAY = [0,0,1,0,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY = [0,0,1,0,0,0,0,0,0,1,1,1,1,0,0,0];  
						 break;	 	
					case "O9":
						 X10_ON_ARRAY = [0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0];
						 break;	 	
					case "O10":
						 X10_ON_ARRAY = [0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,0,1,0,0,1,0,0,0,0,1,1,0,0,0,0];
						 break;	 		 
					case "O11":
						 X10_ON_ARRAY = [0,0,1,0,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [0,0,1,0,0,1,0,0,0,0,1,0,1,0,0,0]; 
						 break;	 	
					case "O12":
						 X10_ON_ARRAY = [0,0,1,0,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =    [0,0,1,0,0,1,0,0,0,0,1,1,1,0,0,0];
						 break;	 	
					case "O13":
						 X10_ON_ARRAY = [0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,1,0,0,1,0,0,0,1,1,0,0,0,0,0];  
						 break;	 	
					case "O14":
						 X10_ON_ARRAY = [0,0,1,0,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =    [0,0,1,0,0,1,0,0,0,1,1,1,0,0,0,0];
						 break;	 	
					case "O15":
						 X10_ON_ARRAY = [0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [0,0,1,0,0,1,0,0,0,1,1,0,1,0,0,0]; 
						 break;	 	
					case "O16":
						 X10_ON_ARRAY = [0,0,1,0,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [0,0,1,0,0,1,0,0,0,1,1,1,1,0,0,0];
						 break;		
					case "P1":
						 X10_ON_ARRAY = [0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0];
						 break;	 
					case "P2":
						 X10_ON_ARRAY = [0,0,1,1,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0];  
						 break;	 	
					case "P3":
						 X10_ON_ARRAY = [0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY =    [0,0,1,1,0,0,0,0,0,0,1,0,1,0,0,0];
						 break;	 	
					case "P4":
						 X10_ON_ARRAY = [0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,0];  
						 break;	 	
					case "P5":
						 X10_ON_ARRAY = [0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =   [0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0]; 
						 break;	 	
					case "P6":
						 X10_ON_ARRAY = [0,0,1,1,0,0,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0];  
						 break;	 	
					case "P7":
						 X10_ON_ARRAY = [0,0,1,1,0,0,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =  [0,0,1,1,0,0,0,0,0,1,1,0,1,0,0,0]; 
						 break;	 	
					case "P8":
						 X10_ON_ARRAY = [0,0,1,1,0,0,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =  [0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0]; 
						 break;	 	
					case "P9":
						 X10_ON_ARRAY = [0,0,1,1,0,1,0,0,0,0,0,0,0,0,0,0];
						 X10_OFF_ARRAY =  [0,0,1,1,0,1,0,0,0,0,1,0,0,0,0,0];
						 break;	 	
					case "P10":
						 X10_ON_ARRAY = [0,0,1,1,0,1,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,0,1,1,0,1,0,0,0,0,1,1,0,0,0,0];
						 break;	 		 
					case "P11":
						 X10_ON_ARRAY = [0,0,1,1,0,1,0,0,0,0,0,0,1,0,0,0];
						 X10_OFF_ARRAY = [0,0,1,1,0,1,0,0,0,0,1,0,1,0,0,0];   
						 break;	 	
					case "P12":
						 X10_ON_ARRAY = [0,0,1,1,0,1,0,0,0,0,0,1,1,0,0,0];
						 X10_OFF_ARRAY =    [0,0,1,1,0,1,0,0,0,0,1,1,1,0,0,0];
						 break;	 	
					case "P13":
						 X10_ON_ARRAY = [0,0,1,1,0,1,0,0,0,1,0,0,0,0,0,0];
						 X10_OFF_ARRAY =    [0,0,1,1,0,1,0,0,0,1,1,0,0,0,0,0];
						 break;	 	
					case "P14":
						 X10_ON_ARRAY = [0,0,1,1,0,1,0,0,0,1,0,1,0,0,0,0];
						 X10_OFF_ARRAY =    [0,0,1,1,0,1,0,0,0,1,1,1,0,0,0,0];
						 break;	 	
					case "P15":
						 X10_ON_ARRAY = [0,0,1,1,0,1,0,0,0,1,0,0,1,0,0,0];
						 X10_OFF_ARRAY =   [0,0,1,1,0,1,0,0,0,1,1,0,1,0,0,0]; 
						 break;	 	
					case "P16":
						 X10_ON_ARRAY = [0,0,1,1,0,1,0,0,0,1,0,1,1,0,0,0];
						 X10_OFF_ARRAY =   [0,0,1,1,0,1,0,0,0,1,1,1,1,0,0,0];
						 break;			 					 
					default:
						 X10_ON_ARRAY = [0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_OFF_ARRAY = [0,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0];				
					
					}
		}
	
	private function Get_X10_Array_BrightDim(x10_address:String):void  {
	    
		switch (x10_address)  //sets the video playlists based on the mode
					{
					case "A":
						 X10_BRIGHT_ARRAY = [0,1,1,0,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY =[0,1,1,0,0,0,0,0,1,0,0,1,1,0,0,0];   
						break;
					case "B":
						 X10_BRIGHT_ARRAY = [0,1,1,1,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [0,1,1,1,0,0,0,0,1,0,0,1,1,0,0,0]; 						   
						break;
					case "C":
						 X10_BRIGHT_ARRAY = [0,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [0,1,0,0,0,0,0,0,1,0,0,1,1,0,0,0];						   
						break;
					case "D":
						 X10_BRIGHT_ARRAY = [0,1,0,1,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [0,1,0,1,0,0,0,0,1,0,0,1,1,0,0,0]; 						   
						break;
					case "E":
						 X10_BRIGHT_ARRAY = [1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [1,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0]; 						   
						break;
					case "F":
						 X10_BRIGHT_ARRAY = [1,0,0,1,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [1,0,0,1,0,0,0,0,1,0,0,1,1,0,0,0];						   
						break;
					case "G":
						 X10_BRIGHT_ARRAY = [1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [1,0,1,0,0,0,0,0,1,0,0,1,1,0,0,0];						   
						break;
					case "H":
						 X10_BRIGHT_ARRAY = [1,0,1,1,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [1,0,1,1,0,0,0,0,1,0,0,1,1,0,0,0];						   
						break;
					case "I":
						 X10_BRIGHT_ARRAY = [1,1,1,0,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [1,1,1,0,0,0,0,0,1,0,0,1,1,0,0,0];						   
						break;
					case "J":
						 X10_BRIGHT_ARRAY = [1,1,1,1,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [1,1,1,1,0,0,0,0,1,0,0,1,1,0,0,0];						   
						break;
					case "K":
						 X10_BRIGHT_ARRAY = [1,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [1,1,0,0,0,0,0,0,1,0,0,1,1,0,0,0]; 						   
						break;
					case "L":
						 X10_BRIGHT_ARRAY = [1,1,0,1,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [1,1,0,1,0,0,0,0,1,0,0,1,1,0,0,0];						   
						break;
					case "M":
						 X10_BRIGHT_ARRAY = [0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0]; 						   
						break;	
					case "N":
						 X10_BRIGHT_ARRAY = [0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [0,0,0,1,0,0,0,0,1,0,0,1,1,0,0,0]; 						   
						break;	
					case "O":
						 X10_BRIGHT_ARRAY = [0,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0]; 
						 X10_DIM_ARRAY = [0,0,1,0,0,0,0,0,1,0,0,1,1,0,0,0]; 						   
						break;		
					case "P":
						 X10_BRIGHT_ARRAY = [0,0,1,1,0,0,0,0,1,0,0,0,1,0,0,0];
						 X10_DIM_ARRAY = [0,0,1,1,0,0,0,0,1,0,0,1,1,0,0,0];						   
						break;						
					default:
						 X10_BRIGHT_ARRAY = [0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0];
						 X10_DIM_ARRAY = [0,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0];					
					}
			}	
			
	}  // end class
}  // end package

