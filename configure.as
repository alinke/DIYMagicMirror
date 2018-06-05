package {
	import flash.display.MovieClip;
	import flash.net.*;  //fix this later
	import flash.events.*;
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import ascb.display.DraggableSprite;
	import ascb.util.NumberUtilities;
	import flash.geom.Point;
	import flash.filters.DropShadowFilter;
	import fl.controls.TextArea;
	import fl.controls.Button;
	import fl.controls.RadioButton;
	import fl.controls.RadioButtonGroup;
	import fl.controls.ComboBox;
	import fl.controls.CheckBox;
	import fl.controls.Slider;
	import fl.events.SliderEvent;
	import fl.controls.Label;
	//import net.eriksjodin.arduino.Arduino;
	//import net.eriksjodin.arduino.events.ArduinoEvent;
	import flash.display.Sprite;
	/*import sk.prasa.webapis.picasa.events.PicasaDataEvent;
	import sk.prasa.webapis.picasa.PicasaResponder;
	import sk.prasa.webapis.picasa.PicasaService;*/
	import flash.display.Loader;
	import fl.video.FLVPlayback;
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
	import flash.net.Socket   ;
	import flash.utils.ByteArray;
	import com.dynamicflash.util.Base64;
	import MJPEG; //ip camera class for MJPEG
	import flash.filesystem.*;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.events.InvokeEvent; 
	import flash.desktop.NativeApplication; 
	import flash.system.Capabilities;	
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.events.NetStatusEvent;
	import flash.events.HTTPStatusEvent;	
	//import flash.errors.IOError;
	//import flash.events.IOErrorEvent;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.events.HTTPStatusEvent;
	import flash.net.*;
	import com.yahoo.astra.fl.managers.AlertManager;
	import flash.media.Video;	
	import flash.media.Camera;	
	import flash.utils.Timer;		
	import flash.events.TimerEvent;	
	import flash.display.Graphics;	
	import flash.display.BitmapData;	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import com.swfjunkie.tweetr.Tweetr;
    import com.swfjunkie.tweetr.oauth.OAuth;
    import com.swfjunkie.tweetr.oauth.events.OAuthEvent;
	import flash.display.Sprite;
    import flash.geom.Rectangle;
    import flash.html.HTMLLoader;
	import flash.display.NativeMenu; 
    import flash.display.NativeMenuItem; 
    import flash.display.NativeWindow;
	
			
	public class configure extends MovieClip {
     
	  private var xmlLoader:URLLoader;		
	  private var WeatherLoader:URLLoader;
	  private var PicasaLoader:URLLoader;
	  private var stockLoader:URLLoader;
	  private var stockLoaderInitial:URLLoader;
	  private var num_stocks:int;
	  private var stockPriceChange:Number = 0;
	  private var mirror_mode:String;
	  private var mode_select:String;
	  private var hardware_mode_select:String;
	  private var initial_hardware_mode_select_value:int;
	  private var initial_door_value:int;
	  private var initial_side_window_value:int;
	  private var initial_front_window_value:int;
	  private var initial_idol_value:int;
	  private var hardware_mode_select_value:int;
	  private var initial_values_done:int=0;
	  private var idle_start_playing:int=0;
	  private var idle_end_seek_flag:int=0;
	 
	  private var door_value:int;
	  private var first_time:int=1;
	  private var weather_first_time:int=1;
	  private var side_window_value:int;
	  private var front_window_value:int;
	  private var idol_value:int;
	  private var doorcamFlag:int = 0;
	  
	  private var idle_videos;
	  private var video_resolution:String;
	  private var reg_code;	 
	  private var full_screen;	 
	  private var video_scaling_factor:Number;	 
	  private var new_video_scaling:Number;
	  private var new_picture_scaling:Number;
	  private var x_position:Number;
	  private var y_position:Number;
	  private var video_rotation:Number;
	  private var myVidx_original:Number;
	  private var myVidy_original:Number;
	  private var stock_text_x_original:Number;
	  private var stock_text_y_original:Number;
	  private var weather_text_x_original:Number;
	  private var weather_text_y_original:Number;
	  private var alcohol_results_text_x_original:Number;
	  private var alcohol_results_text_y_original:Number;
	  private var weather_image_x_original:Number;
	  private var weather_image_y_original:Number;
	  private var beer_image_x_original:Number;
	  private var beer_image_y_original:Number;
	  private var twitterbird_image_x_original:Number;
	  private var twitterbird_image_y_original:Number;
	  private var frame_x_original:Number;
	  private var frame_y_original:Number;
	  private var lip1_x_original:Number;
	  private var lip1_y_original:Number;
	  private var weather_text_rotation_original:Number;
      private var stock_text_rotation_original:Number;
	  private var weather_image_rotation_original:Number; 
	  private var beer_image_rotation_original:Number; 
	  private var twitterbird_image_rotation_original:Number; 
	  private var frame_rotation_original:Number; 
	  private var lip1_rotation_original:Number; 
	
	  private var webcamvideo : Video;	  
	  private var webcamfound:int = 0;
	  private var webcam_on;
	  private var webcamvideo_x:Number;
	  private var webcamvideo_y:Number;		
	  private var webcamvideo_rotation:Number;		
	  private var webcamvideo_scale:Number;
	//  private var webcam_x:Number;  //not used
	//  private var webcam_y:Number;
	 // private var webcam_rotate:Number;
	 // private var webcam_scale:Number;	
	  
	  private var webcam_width:Number;
	  private var webcam_height:Number;
	  private var webcam_fps:Number;
	  private var stand_alone:String;
	  private var stand_alone_weather:String;
	  private var stand_alone_stock:String;
	  
	  private var display_mode_preset:int;
	  
	  private var admin_flag:int = 0;
	  
	  private var proximity_sensor_on;
	  private var digital_switches;
	  private var switch1;
	  private var switch2;
	  private var switch3;
	  private var switch4;
	  private var switch5;
	  private var switch6;
	  private var LED_mode;
	  private var analog_sensors;
	  private var analog_input1;
	  private var analog_input2;
	  private var analog_input3;
	  private var proximity_sensor_trigger1_distance_lower;
	  private var proximity_sensor_trigger1_distance_upper;
	  private var proximity_sensor_trigger1_time;
	  private var proximity_sensor_trigger2_distance;	  
	  private var proximity_flag=0;
	  private var proximity_counter = 0;
	  private var proximity1_do_not_play_again = 0;
	  private var proximity_flag3 = 0;							
	  private var x10_on_off_flag = 0;
	  private var picasa_positioning_flag:int = 0;
	  private var atmega:String;
	  
	  private var stock_good_threshold:Number;
	  private var stock_bad_threshold:Number;
	  
	  private var pictLdr:Loader = new Loader();
	  private var Frame_Loader:Loader = new Loader();
	  private var Beer_Loader:Loader = new Loader();
	  private var TwitterBird_Loader:Loader = new Loader();
	  private var weather_zip:String;
	  private var weather_reading:String;
	  private var weather_display:String;
	  private var forecast_cutoff:String;
	  private var stock_string:String;
	  
	  private var myXML:XML = new XML();
	  private var myXMLold:XML = new XML();
	  private var file:File = new File(); 	
	  private var file2:File = new File(); 	
	  private var file3:File = new File(); 
	  private var PhotoSaveDir:File = new File(); 
	  private var photoboothOverlayImagePath:File = new File();
	  private var photoboothLogoPath:File = new File();
	  private var filestream:FileStream = new FileStream();
	  private var newXMLStr:String;
	  private var URLModeString:String;
	  private var URLHubGraphic:String;
	  private var flashPlayerVersion:String = Capabilities.version;
	  private var osArray:Array = flashPlayerVersion.split(' ');
	  private var osType:String = osArray[0]; //The operating system: WIN, MAC, LNX
	  private var versionArray:Array = osArray[1].split(',');//The player versions. 9,0,115,0
	  private var majorVersion:Number = parseInt(versionArray[0]);
	  private var majorRevision:Number = parseInt(versionArray[1]);
	  private var minorVersion:Number = parseInt(versionArray[2]);
	  private var minorRevision:Number = parseInt(versionArray[3]);	
	  private var myTimer:Timer = new Timer(3000, 1);
	  private var doorcamLoadTimer:Timer = new Timer(1000, 1);
	  private var doorcamTimer:Timer = new Timer(1000, 1);
		//private var index_selected:int;
	
	  private var startingLocation:Point;
	  private var Stockdyntext:Sprite = new Sprite();
	  private var AlcoholResultsdyntext:Sprite = new Sprite();
	  private var Weatherdyntext:Sprite = new Sprite();
	  private var WeatherdynImage:MovieClip = new MovieClip();
	  private var BeerdynImage:MovieClip = new MovieClip();
	  private var TwitterBirddynImage:MovieClip = new MovieClip();
	  private var FramedynImage:MovieClip = new MovieClip();
	  private var Lip1dynImage:MovieClip = new MovieClip();
	  
	  private var lipsync_clip:String;
	
	  private var verbose:String;	  
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
	  private var radio_first = 1;
	  
		
	//**************************************************
	
	private var index_selected:int;
	private var mode_selected:int;
	private var stock_counter:int=0; //the total number of stocks
	private var first_stock:int=0;	
	private var temp_stock_array:Array = new Array(); //used as a temp holder for the stocks
	
	private var com_port;
	private var weather_code;	
	private var weather_high:int;
	private var good_weather_threshold:int;
	private var x10_commands;   
	
	///**** arduino delays ********************
	private var startup_delay:int;   
	private var find_arduino_delay:int;   ///the delay from socket connected to requesting firmware
	//private var first_video_play_delay:int;  /// because the first init routine must not play until after firmware found
	///****************************************
		
	///******* Picture Frame Variables **********	
	private var google_id:String;
	private var picasa_album_id:String;
	private var slide_delay:int;
	private var slide_delay_seconds:int;
	private var imageArray:Array = new Array();	
	private var imageTimer:Timer;
	private var i:int = 0;
	private var URLString:String ;		
	private var SlideShowRunning:int = 0;
	private var SlideShowStarted:int = 0;
	private var PicasaLoaded:int = 0;
	private var picture_x_position:Number;
	private var picture_y_position:Number;
	private var picture_rotation:Number;
	private var picture_scale:Number;
	private var display_breathalyzer_text;
	private var display_stock_text;
	private var display_weather_text;
	private var display_weather_image;
	private var display_frame;
	private var display_webcamvideo;
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
	private var WeatherForecastText:String;
	
	//private var doorcamLoadTimer:Timer;
	
	private var x10_in_progress:int=0;
	private var x10_counter:int=0;
	//********** x-10 packet timers **********
	private var x10_sleep_initial:Timer = new Timer(1,1);
	private var x10_sleep35:Timer = new Timer(35,1);
	private var x10_done1:Timer = new Timer(1,1);	
	private var x10_done2:Timer = new Timer(1,1);	
	private var x10_sleep1000:Timer = new Timer(1000,1);		
	
	private var touch_counter:int=0;
	private var video_playing:int=0; //flag that tells me if a sensor video (not idle) is currently playing, onclip done resets it
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
	
	private var X10_ON_ARRAY:Array;
	private var X10_OFF_ARRAY:Array;	
	private var X10_BRIGHT_ARRAY:Array;
	private var X10_DIM_ARRAY:Array;	
	
	private var character_change_sound_princess:Sound;
	private var character_change_sound_pirate:Sound;
	private var character_change_sound_halloween:Sound;
	private var character_change_sound_insult:Sound;
	
	private var myFont:Font = new MyriadFont();	//used for stock text													
	private var StockTextFormat:TextFormat = new TextFormat(); //this is the formatter for the stock_display field
	private var WeatherTextFormat:TextFormat = new TextFormat(); //this is the formatter for the weather_display field
	private var ProximityTextFormat:TextFormat = new TextFormat(); //this is the formatter for the weather_display field
	private var LabelTextFormat:TextFormat = new TextFormat();
	private var AlertTextFormat:TextFormat = new TextFormat();
	private var InstructionsTextFormat:TextFormat = new TextFormat();
	private var VersionTextFormat:TextFormat = new TextFormat();
	private var stock_display:TextField = new TextField();
	private var version_text:TextField = new TextField();
	private var weather_display2:TextField = new TextField();
	private var proximity_readout:TextField = new TextField();
	
	private var tweetr:Tweetr;
    private var oauth:OAuth;
    private var htmlLoader:HTMLLoader;
	
	private var doorcam:MJPEG;
	private var doorcam_on;
	private var doorcam_host;
	private var doorcam_path;
	private var doorcam_path_selectable:String;
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
	private var doorcam_video_x:Number;
	private var doorcam_video_y:Number;
	private var doorcam_video_scale:Number;
	private var new_doorcam_video_scaling:Number;
	private var ipcamera_selected:int;
	private var thoughts_image_x:Number;
	private var thoughts_image_y:Number;
	private var thoughts_image_rotate:Number;
	private var thoughts_image_scale:Number;	
	
	private var thoughtsLoader:Loader = new Loader();
	private var thoughts_image:Bitmap;
	private var thoughts_bitmapdata:BitmapData;
	
	private var screen_mode:String;	
	private var weather_image:Bitmap = new Bitmap();
	private var beer_image:Bitmap = new Bitmap();
	private var twitterbird_image:Bitmap = new Bitmap();
	private var weather_image_movie_clip : MovieClip;
	private var weather_images_url:String;
	private var beer_image_movie_clip : MovieClip;
	private var beer_images_url:String;
	private var twitterbird_image_movie_clip : MovieClip;
	private var twitterbird_images_url:String;
	
	private var stock_text_x:Number;
	private var stock_text_y:Number;
	private var	stock_text_fontsize:Number;		
	private var	stock_text_rotation:Number;		
	private var alcohol_results_text_x:Number;
	private var alcohol_results_text_y:Number;
	private var	alcohol_results_text_fontsize:Number;		
	private var	alcohol_results_text_rotation:Number;		
	private var weather_text_x:Number;
	private var weather_text_y:Number;
	private var	weather_text_fontsize:Number;		
	private var	weather_text_rotation:Number;		
	private var weather_image_x:Number;
	private var weather_image_y:Number;
	private var weather_image_rotation:Number;	
	private var weather_image_scale:Number;
	private var beer_image_x:Number;
	private var beer_image_y:Number;
	private var beer_image_rotation:Number;	
	private var beer_image_scale:Number;
	
	private var twitterbird_image_x:Number;
	private var twitterbird_image_y:Number;
	private var twitterbird_image_rotation:Number;	
	private var twitterbird_image_scale:Number;
	
	private var frame:Bitmap = new Bitmap();
	private var frame_movie_clip : MovieClip;
	private var frames_url:String;
	
	private var frame_x:Number;
	private var frame_y:Number;
	private var frame_rotation:Number;	
	private var frame_scale:Number;
	
	///****** lipsync lip vars **********
	private var Lip1_Loader:Loader = new Loader();
	 
	//private var lip1:Loader = new Loader();
	private var lip1_url:String;
	private var lip1_request:URLRequest;
	private var lip1:Bitmap = new Bitmap();
	//private var frame_movie_clip : MovieClip;
		
	private var lip1_x:Number;
	private var lip1_y:Number;
	private var lip1_rotation:Number;	
	private var lip1_scale:Number;
	
	
	//*************************************
	
	private var selected_frame_index:int;
	//private var frame_path:String;
	private var frame_selected:String;
	
	private var radiotext:TextFormat = new TextFormat();
	private var editing_mode:String;
	private var square:Sprite = new Sprite();
	private var black_square:Sprite = new Sprite();
	private var ScreenOrientationFlag:int = 0;
	//private var responder:PicasaResponder = new PicasaResponder();
	
	private var frameLoader:Loader = new Loader();
	//private var frame:Bitmap;
	private var frame_bitmapdata:BitmapData;
	private var frame_image_x:Number;
	private var frame_image_y:Number;
	private var frame_image_rotate:Number;
	private var frame_image_scale:Number;
	
	private var myVid_bigger:Button = new Button();
	private var myVid_smaller:Button = new Button();
	private var move_upButton:Button = new Button();
	private var move_leftButton:Button = new Button();
	private var move_rightButton:Button = new Button();
	private var move_downButton:Button = new Button();
	private var SaveButton:Button = new Button();
	private var goBackMain:Button = new Button();
	private var BrowseAudioButton:Button = new Button();
	
	private var weathertext_check:CheckBox = new CheckBox();
	private var weathergraphic_check:CheckBox = new CheckBox();
	private var webcamgraphic_check:CheckBox = new CheckBox();
	private var webcamvideo_check:CheckBox = new CheckBox();
	private var stocktext_check:CheckBox = new CheckBox();
	private var AlcoholResults_check:CheckBox = new CheckBox();
	private var Tweet_Breathalyzer_Value_check:CheckBox = new CheckBox();
	private var Display_Breathalyzer_Value_check:CheckBox = new CheckBox();
	private var BreathalyzerNoSwitch_check:CheckBox = new CheckBox();
	
	private var instructions:TextField = new TextField();
	private var myVid:FLVPlayback = new FLVPlayback();
	private var myVid2:FLVPlayback = new FLVPlayback(); //for doorcam video
	private var pic:UILoader = new UILoader();
	
	private var doorcamedit_radio_character:RadioButton = new RadioButton;
	private var doorcamedit_radio_doorcam:RadioButton = new RadioButton;
	private var doorcamedit_radio_thoughts:RadioButton = new RadioButton;
	
	private var positioningedit_radio_character:RadioButton = new RadioButton;
	private var positioningedit_radio_stockText:RadioButton = new RadioButton;
	private var positioningedit_radio_weatherText:RadioButton = new RadioButton;
	private var positioningedit_radio_weatherImage:RadioButton = new RadioButton;
	private var positioningedit_radio_webcamImage:RadioButton = new RadioButton;
	private var positioningedit_radio_beerImage:RadioButton = new RadioButton;
	private var positioningedit_radio_lipsync:RadioButton = new RadioButton;
	private var positioningedit_radio_twitterbird:RadioButton = new RadioButton;
	private var positioningedit_radio_webcamvideo:RadioButton = new RadioButton;
	private var positioningedit_radio_AlcoholResults:RadioButton = new RadioButton;
	
	private var tts_feature_radio_on:RadioButton = new RadioButton; 
	private var tts_feature_radio_off:RadioButton = new RadioButton;
	
	private var tts_engine_voicerss:RadioButton = new RadioButton; 
	private var tts_engine_yakitome:RadioButton = new RadioButton;
	
	private var photobooth_printing_radio_on:RadioButton = new RadioButton; 
	private var photobooth_printing_radio_off:RadioButton = new RadioButton;
		
	
	private var tts_url:TextField = new TextField();
	private var TTS_languages_dropdown:ComboBox = new ComboBox(); //dropdown	
	private var proximity1_tts:TextField = new TextField();
	private var proximity2_tts:TextField = new TextField();
	private var proximity3_tts:TextField = new TextField();
	private var weather_good_tts:TextField = new TextField();
	private var weather_ok_tts:TextField = new TextField();
	private var weather_rain_tts:TextField = new TextField();
	private var no_internet_tts:TextField = new TextField();
	private var stock_up_tts:TextField = new TextField();
	private var stock_no_change_tts:TextField = new TextField();
	private var stock_down_tts:TextField = new TextField();
	private var doorbell_tts:TextField = new TextField();
	private var x10_on_tts:TextField = new TextField();
	private var x10_off_tts:TextField = new TextField();
	private var drink1_tts:TextField = new TextField();
	private var drink2_tts:TextField = new TextField();
	private var drink3_tts:TextField = new TextField();
	private var drink4_tts:TextField = new TextField();
	private var drink1_tweet:TextField = new TextField();
	private var drink2_tweet:TextField = new TextField();
	private var drink3_tweet:TextField = new TextField();
	private var drink4_tweet:TextField = new TextField();
	private var blow_tts:TextField = new TextField();
	private var wait_tts:TextField = new TextField();
	private var warning_tts:TextField = new TextField();
	private var TTSTextFormat:TextFormat = new TextFormat;	
	private var HomeTextFormat:TextFormat = new TextFormat;		
	
	private var photobooth_printing_check:CheckBox = new CheckBox();
	private var photobooth_promptprint_check:CheckBox = new CheckBox();
	private var photobooth_save_check:CheckBox = new CheckBox();
	private var photobooth_x10_check:CheckBox = new CheckBox();
	private var photobooth_leds_check:CheckBox = new CheckBox();
	private var photobooth_kinect_check:CheckBox = new CheckBox();
	private var photoboothProofPreview_check:CheckBox = new CheckBox();
	private var photoboothFacialRecognitionTrigger_check:CheckBox = new CheckBox();
		
	private var photobooth_PaperSize_dropdown:ComboBox = new ComboBox();
	
	private var photobooth_PrintCopies_label:Label = new Label();
	private var photobooth_PrintCopiesValue_label:Label = new Label();	
	private var photobooth_SaveFolder_label:Label = new Label();
	private var photobooth_SaveFolderPath_label:Label = new Label();
	
	private var photobooth_x10HouseCode_label:Label = new Label();
	private var photobooth_x10UnitCode_label:Label = new Label();	
	
	private var photobooth_WebcamResolution_label:Label = new Label();
	private var photobooth_WebcamResolution_dropdown:ComboBox = new ComboBox(); //webcam resolution dropdown
		
	private var photobooth_WebcamFPS_label:Label = new Label();
	private var photobooth_CountDownFrom_label:Label = new Label();
	private var photobooth_ShotDelay_label:Label = new Label();
	private var photobooth_PhotoPreviewDuration_label:Label = new Label();	
	private var photobooth_ProofPreviewDuration_label:Label = new Label();
	
	private var photobooth_WebcamFPSValue_label:Label = new Label();
	private var photobooth_CountDownFromValue_label:Label = new Label();
	private var photobooth_ShotDelayValue_label:Label = new Label();
	private var photobooth_PhotoPreviewDurationValue_label:Label = new Label();	
	private var photobooth_ProofPreviewDurationValue_label:Label = new Label();
	
	private var photobooth_PrintingInfo_label:Label = new Label();
	private var photobooth_BackgroundImage_label:Label = new Label();	
	private var photobooth_BackgroundImagePath_label:Label = new Label();	
	private var photobooth_BackgroundImage_check:CheckBox = new CheckBox();
	private var photobooth_StartupText_label:Label = new Label();	
	private var photobooth_PaperSize_label:Label = new Label();	
	private var photobooth_StartupText_textarea:TextField = new TextField();	
	
	private var photobooth_LogoImage_label:Label = new Label();	
	private var photobooth_LogoImagePath_label:Label = new Label();	
	private var photobooth_LogoImage_check:CheckBox = new CheckBox(); 
	
	private var photobooth_PrintCopies_slider:Slider = new Slider();
	private var photobooth_WebcamFPS_slider:Slider = new Slider();
	private var photobooth_CountDownFrom_slider:Slider = new Slider();
	private var photobooth_ShotDelay_slider:Slider = new Slider();
	private var photobooth_PhotoPreviewDuration_slider:Slider = new Slider();
	private var photobooth_ProofPreviewDuration_slider:Slider = new Slider();
	
	/*
	 photobooth_printing_check
	 photobooth_promptprint_check
	 photobooth_save_check
	 photobooth_x10_check
	 photobooth_leds_check
	 photobooth_kinect_check
	 photoboothProofPreview_check
	 photobooth_PaperSize
	 photobooth_PrintCopies_label
	 photobooth_PrintCopiesValue_label	
	 photobooth_SaveFolder_label
	 photobooth_SaveFolderPath_label
	 photobooth_x10HouseCode_label
	 photobooth_x10UnitCode_label	
	 photobooth_WebcamResolution_label
	 photobooth_WebcamResolution_dropdown
	 photobooth_WebcamFPS_label
	 photobooth_CountDownFrom_label
	 photobooth_ShotDelay_label
	 photobooth_PhotoPreviewDuration_label	
	 photobooth_ProofPreviewDuration_label
	 photobooth_WebcamFPSValue_label
	 photobooth_CountDownFromValue_label
	 photobooth_ShotDelayValue_label
	 photobooth_PhotoPreviewDurationValue_label	
	 photobooth_ProofPreviewDurationValue_label
	 photobooth_PrintCopies_slider
	 photobooth_WebcamFPS_slider
	 photobooth_CountDownFrom_slider
	 photobooth_ShotDelay_slider
	 photobooth_PhotoPreviewDuration_slider
	 photobooth_ProofPreviewDuration_slider
	*/
	
	//private var photobooth_videoQuality:TextField = new TextField();
	private var photobooth_videoQuality:Slider = new Slider();
	private var photobooth_videoQuality_sliderlabel:Label = new Label();
	
	private var photobooth_videoWidth:TextField = new TextField();
	private var photobooth_videoHeight:TextField = new TextField();
	private var photobooth_fps:TextField = new TextField();
	private var photobooth_countdown:TextField = new TextField();
	private var photobooth_print_copies:TextField = new TextField();
	private var photoboothShotDelay:TextField = new TextField();	
	private var photoboothGalleryTimer:TextField = new TextField();
	private var photoboothProofDisplayTime:TextField = new TextField();
		
	private var photobooth_videoQuality_label:TextField = new TextField();
	private var photobooth_videoWidth_label:TextField = new TextField();
	private var photobooth_videoHeight_label:TextField = new TextField();
	private var photobooth_fps_label:TextField = new TextField();
	private var photobooth_countdown_label:TextField = new TextField();
	private var photobooth_print_copies_label:TextField = new TextField();
	private var photoboothShotDelay_label:TextField = new TextField();	
	private var photoboothGalleryTimer_label:TextField = new TextField();
	private var photoboothProofDisplayTime_label:TextField = new TextField();
	
	
	private var tts_feature_label:TextField = new TextField();  //radio button
	private var tts_url_label:TextField = new TextField();
	private var tts_language_label:TextField = new TextField();  
	private var tts_engine_label:TextField = new TextField();
	private var custom_audio_path_label:TextField = new TextField();  //drop down
	private var proximity1_tts_label:TextField = new TextField();
	private var proximity2_tts_label:TextField = new TextField();
	private var proximity3_tts_label:TextField = new TextField();
	private var weather_good_tts_label:TextField = new TextField();
	private var weather_ok_tts_label:TextField = new TextField();
	private var weather_rain_tts_label:TextField = new TextField();
	private var no_internet_tts_label:TextField = new TextField();
	private var stock_up_tts_label:TextField = new TextField();
	private var stock_no_change_tts_label:TextField = new TextField();
	private var stock_down_tts_label:TextField = new TextField();
	private var doorbell_tts_label:TextField = new TextField();
	private var x10_on_tts_label:TextField = new TextField();
	private var x10_off_tts_label:TextField = new TextField();
	private var drink1_tts_label:TextField = new TextField();
	private var drink2_tts_label:TextField = new TextField();
	private var drink3_tts_label:TextField = new TextField();
	private var drink4_tts_label:TextField = new TextField();
	private var tts_instructions:TextField = new TextField;
	private var blow_tts_label:TextField = new TextField();
	private var wait_tts_label:TextField = new TextField();
	private var warning_tts_label:TextField = new TextField();
	private var drink1_tweet_label:TextField = new TextField();
	private var drink2_tweet_label:TextField = new TextField();
	private var drink3_tweet_label:TextField = new TextField();
	private var drink4_tweet_label:TextField = new TextField();
	
	private var tts_api_key:TextField = new TextField();
	private var tts_api_key_label:TextField = new TextField();
	
	private var tts_api_keyYakitome:TextField = new TextField();
	private var tts_api_key_labelYakitome:TextField = new TextField();
	
	private var TTSTextLabelFormat:TextFormat = new TextFormat;
	private var photoboothTextLabelFormat:TextFormat = new TextFormat;
		
	private var BlueTextLabelFormat:TextFormat = new TextFormat;

	private var TTS_Screen_Label:TextField = new TextField();
	private var TTS_Screen_LabelFormat:TextFormat = new TextFormat;		
	private var photobooth_Screen_Label:TextField = new TextField();
	private var photobooth_Screen_LabelFormat:TextFormat = new TextFormat;		
	
	private var alcohol_baseline_text:TextField = new TextField();
	private var alcohol_level1_text:TextField = new TextField();
	private var alcohol_level2_text:TextField = new TextField();
	private var alcohol_level3_text:TextField = new TextField();
	private var alcohol_baseline_difference_allowance_text:TextField = new TextField();
	private var alcohol_countdown_text:TextField = new TextField();
	private var AlcoholTextFormat:TextFormat = new TextFormat;	
	private var AlcoholResultsFormat:TextFormat = new TextFormat(); //this is the formatter for the startup text field
	private var AlcoholResults:TextField = new TextField;
	private var positioning_instructions:TextField = new TextField;
	
	private var alcohol_baseline_label:TextField = new TextField();
	private var alcohol_level1_label:TextField = new TextField();
	private var alcohol_level2_label:TextField = new TextField();
	private var alcohol_level3_label:TextField = new TextField();
	private var alcohol_baseline_difference_allowance_label:TextField = new TextField();
	private var alcohol_countdown_label:TextField = new TextField();
	private var AlcoholTextLabelFormat:TextFormat = new TextFormat;
	private var alcohol_help_button:Button = new Button();
	
	private var Breathalyzer_Label:TextField = new TextField();
	private var Breathalyzer_LabelFormat:TextFormat = new TextFormat;	
	
	private var Breathalyzer_WarningLabel:TextField = new TextField();
	private var Breathalyzer_WarningLabelFormat:TextFormat = new TextFormat;	
	
	private var mode_rbg:RadioButtonGroup = new RadioButtonGroup("mode_rbg");
	private var fullscreen_rbg:RadioButtonGroup = new RadioButtonGroup("fullscreen_rbg");    
	private var doorcamedit_rbg:RadioButtonGroup = new RadioButtonGroup("doorcamedit_rbg");
	private var positioningedit_rbg:RadioButtonGroup = new RadioButtonGroup("positioningedit_rbg");
	private var screenMode_rbg:RadioButtonGroup = new RadioButtonGroup("screenMode_rbg");
	private var prox2beforeprox1_rbg:RadioButtonGroup = new RadioButtonGroup("prox2beforeprox1_rbg");
	private var video_resolution_rbg:RadioButtonGroup = new RadioButtonGroup("video_resolution_rbg");	
	private var LEDmode_rbg:RadioButtonGroup = new RadioButtonGroup("LEDmode_rbg");
	private var twitter_rbg:RadioButtonGroup = new RadioButtonGroup("twitter_rbg");
	private var twitter_mode_rbg:RadioButtonGroup = new RadioButtonGroup("twitter_mode_rbg");
	private var AlcoholResults_readout_rbg:RadioButtonGroup = new RadioButtonGroup("AlcoholResults_readout_rbg");	
	private var TTS_rbg:RadioButtonGroup = new RadioButtonGroup("TTS_rbg");
	private var TTS_rbg_engine:RadioButtonGroup = new RadioButtonGroup("TTS_rbg_engine");
	private var photobooth_printing_rbg:RadioButtonGroup = new RadioButtonGroup("photobooth_printing_rbg");
	private var frame_rbg:RadioButtonGroup = new RadioButtonGroup("frame_rbg");
	private var webcamvideo_rbg:RadioButtonGroup = new RadioButtonGroup("webcamvideo_rbg");
	
	private var lipsync_checkbox:CheckBox = new CheckBox();
	
	private var homepath:String;
	private var custom_audio_path:String;   
	private var internet:int=0;
	
	private var fileMenu:NativeMenuItem; 
		
	///******************************************	
	//var service : PicasaService = new PicasaService();	
	
		//// ***************************************////
	public function configure():void {
			
			// *********************************************************
			// Load the XML config file			
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, onInvoke);  //event that the program was launched, load the mirror.xml
			//service.imgmax = "1600";	// 1600 largest size possible to use from Picasa
			//service.thumbsize = "64c";  // not used			
			
			//stage.align = StageAlign.TOP_LEFT;
			//stage.scaleMode = StageScaleMode.NO_SCALE;
			//var window:NativeWindow = stage.nativeWindow;
			//window.maximize();  
			
			if (NativeWindow.supportsMenu){ 
                stage.nativeWindow.menu = new NativeMenu(); 
                stage.nativeWindow.menu.addEventListener(Event.SELECT, selectCommandMenu); 
                fileMenu = stage.nativeWindow.menu.addItem(new NativeMenuItem("Configure Additional Items")); 
                fileMenu.submenu = createFileMenu();  
            } 
             
            if (NativeApplication.supportsMenu){ 
                NativeApplication.nativeApplication.menu.addEventListener(Event.SELECT, selectCommandMenu); 
                fileMenu = NativeApplication.nativeApplication.menu.addItem(new NativeMenuItem("Configure Additional Items")); 
                fileMenu.submenu = createFileMenu();             
            } 
									
	}   // end mirror function *************************************
			
		  private function createFileMenu():NativeMenu { 
            var fileMenu:NativeMenu = new NativeMenu(); 
            fileMenu.addEventListener(Event.SELECT, selectCommandMenu); 
			
			
			//goBackMainScreen);
             
            var viewmodeCommand:NativeMenuItem = fileMenu.addItem(new NativeMenuItem("Adjust Character Size and Positioning")); 
            viewmodeCommand.addEventListener(Event.SELECT, PositioningScreenButtonEvent); 
           /* var PicasaCommand:NativeMenuItem = fileMenu.addItem(new NativeMenuItem("Picasa Slide Show Size and Positioning")); 
            PicasaCommand.addEventListener(Event.SELECT, PositioningScreenPicasaButtonEvent);    */
			var photoboothCommand:NativeMenuItem = fileMenu.addItem(new NativeMenuItem("Photobooth")); 
            photoboothCommand.addEventListener(Event.SELECT, photoboothButtonEvent); 
			var breathalyzerCommand:NativeMenuItem = fileMenu.addItem(new NativeMenuItem("Breathalyzer Calibration and Settings")); 
            breathalyzerCommand.addEventListener(Event.SELECT, BreathalyzerButtonEvent); 
			//var customaudioCommand:NativeMenuItem = fileMenu.addItem(new NativeMenuItem("Custom Audio and Text to Speech Mode")); 
			var customaudioCommand:NativeMenuItem = fileMenu.addItem(new NativeMenuItem("Text to Speech & Custom Audio Mode")); 
            customaudioCommand.addEventListener(Event.SELECT, TTSButtonEvent); 
			var doorcamCommand:NativeMenuItem = fileMenu.addItem(new NativeMenuItem("Doorcam (IP Camera Required)")); 
            doorcamCommand.addEventListener(Event.SELECT, PositioningScreenDoorcamButtonEvent); 
            return fileMenu; 
        } 
		
		 private function selectCommand(event:Event):void { 
            trace("Selected command: " + event.target.label); 
        } 
 
        private function selectCommandMenu(event:Event):void { 
            if (event.currentTarget.parent != null) { 
                var menuItem:NativeMenuItem = 
                        findItemForMenu(NativeMenu(event.currentTarget)); 
                if (menuItem != null) { 
                    trace("Select event for \"" +  
                            event.target.label +  
                            "\" command handled by menu: " +  
                            menuItem.label); 
                } 
            } else { 
                trace("Select event for \"" +  
                        event.target.label +  
                        "\" command handled by root menu."); 
            } 
        } 
		
		private function findItemForMenu(menu:NativeMenu):NativeMenuItem { 
            for each (var item:NativeMenuItem in menu.parent.items) { 
                if (item != null) { 
                    if (item.submenu == menu) { 
                        return item; 
                    } 
                } 
            } 
            return null; 
        } 



		 
		 
		 private function onInvoke(invokeEvent:InvokeEvent):void   {  
		  
		  if (invokeEvent.currentDirectory != null) 
            {          	
				trace("path before change " + invokeEvent.currentDirectory.nativePath);	
				
				PhotoSaveDir = File.documentsDirectory; //this is used later for the photobooth path
				PhotoSaveDir = PhotoSaveDir.resolvePath("diymagicmirror-settings/Photobooth/Photos");
								
				switch (osType) {
					case "MAC":					
						file = File.documentsDirectory; //the user dir, my documnets/%username in windows or /users/%username on mac
						file = file.resolvePath("diymagicmirror-settings/mirrorconfig.xml"); //now see if the config file is there						
						if (file.exists == false) {  //if not, then create it for the first time in the user directory
							CreateConfig(); //call the routine to create the XML file for the first time							
						}					
						file2 = File.desktopDirectory;						
						file2 = file2.resolvePath("../../../Applications/DIY Magic Mirror/mirror.app/Contents/Resources/");		
						homepath =String(file2.nativePath) + "/";
						break;					
					case "WIN":													
						file = File.documentsDirectory; //the user dir, my documnets/%username in windows or /users/%username on mac
						file = file.resolvePath("diymagicmirror-settings/mirrorconfig.xml"); //now see if the config file is there						
						if (file.exists == false) {  //if not, then create it for the first time in the user directory
							CreateConfig(); //call the routine to create the XML file for the first time							
						}		
						
						file3 = file3 = File.desktopDirectory;	
						file3 = file3.resolvePath("../../../Program Files/DIY Magic Mirror/mirror/mirror.exe");							
						
						file2 = File.desktopDirectory;	
						file2 = file2.resolvePath("../../../Program Files/DIY Magic Mirror/mirror/");							
						
						if (file3.exists == false) {  //if still false, then must be 64-bit
							file2 = File.desktopDirectory;						
							file2 = file2.resolvePath("../../../Program Files (x86)/DIY Magic Mirror/mirror/");							
						}
						
						homepath = String(file2.nativePath) + "/";
						break;						
					case "LNX":
						file = File.documentsDirectory; //the user dir, my documnets/%username in windows or /users/%username on mac
						file = file.resolvePath("diymagicmirror-settings/mirrorconfig.xml"); //now see if the config file is there						
						if (file.exists == false) {  //if not, then create it for the first time in the user directory
							CreateConfig(); //call the routine to create the XML file for the first time							
						}			
						file2 =  File.desktopDirectory;
						file2 = file2.resolvePath("../../../opt/DIY Magic Mirror/mirror/share");						
						homepath =String(file2.nativePath) + "/";
						break;
						
					default:
						output.text = "Unable to detect OS";
						trace ("Unable to detect OS");		
						file = File.documentsDirectory; //the user dir, my documnets/%username in windows or /users/%username on mac
						file = file.resolvePath("diymagicmirror-settings/mirrorconfig.xml"); //now see if the config file is there						
						if (file.exists == false) {  //if not, then create it for the first time in the user directory
							CreateConfig(); //call the routine to create the XML file for the first time							
						}		
						
						file3 = file3 = File.desktopDirectory;	
						file3 = file3.resolvePath("../../../Program Files/DIY Magic Mirror/mirror/mirror.exe");							
						
						file2 = File.desktopDirectory;	
						file2 = file2.resolvePath("../../../Program Files/DIY Magic Mirror/mirror/");							
						
						if (file3.exists == false) {  //if still false, then must be 64-bit
							file2 = File.desktopDirectory;						
							file2 = file2.resolvePath("../../../Program Files (x86)/DIY Magic Mirror/mirror/");							
						}
						
						homepath = String(file2.nativePath) + "/";
						break;						
				}  //end switch
										
				//********* let's check for Internet connectivity************
				var loader:URLLoader = new URLLoader();
				configureListeners(loader);
				var request:URLRequest = new URLRequest("http://www.google.com");
				try {
				  loader.load(request);
				} catch (error:Error) {
					trace("Unable to load requested document.");
				}
				//**************************************************************
				
				RunMirror();  //now that we have the path to mirror.xml, continue
            }  
			
            else  
            { 
                //file = file.resolvePath("../../../Program Files/DIY Magic Mirror/mirror.xml");
				trace("mirrorconfig.xml missing from DIY Magic Mirror directory"); 
            } 
        }	
		
		
		 private function configureListeners(dispatcher:IEventDispatcher):void {
            dispatcher.addEventListener(Event.COMPLETE, completeHandler);
            dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        }

        private function completeHandler(event:Event):void {
            var loader:URLLoader = URLLoader(event.target);
            trace("completeHandler: " + loader.data);
			trace("have internet");
			internet = 1;
        }

        private function ioErrorHandler(event:IOErrorEvent):void {
            trace("ioErrorHandler: " + event);
			trace("no internet");
			internet = 0;
        }

		
		//public function RunMirror(event:Event):void { //triggered after config file loaded
		public function RunMirror():void { //triggered after config file loaded
			
		trace ("internet value: " + internet);	
		trace(file.exists); // true	
			if (file.exists == false) {
			output.text = "mirrorconfig.xml is missing";
			}	
			
		AlertTextFormat.color = 0x000000; //black
		AlertTextFormat.font = myFont.fontName;
		AlertTextFormat.size = 30;  //70 default		
		AlertManager.overlayAlpha = .8;
		AlertManager.maxWidth = 800;
		AlertManager.hasDropShadow = true;
		AlertManager.setMessageBoxStyle("textFormat", AlertTextFormat);
		
		filestream.open(file, FileMode.READ);  //open the file and close it
		myXML = XML(filestream.readUTFBytes(filestream.bytesAvailable));
		filestream.close();
		
		//now let's check and make sure the config file corresponds to the version this code is expecting and if not, let's create a new one
		//use this later when a new config XML needs to be created on the fly
		
		if (Number(myXML.version) < 7.10) {  //this means user's config file was old and needs to be updated but we'll also save the user's settings so they don't have to re-type
			AlertManager.createAlert(this, "Your configuration file was an older version and has been updated, your current settings have been maintained");
			//before blowing the file away, let's read it into another XML so we have a record of the old settings
			filestream.open(file, FileMode.READ);
			myXMLold = XML(filestream.readUTFBytes(filestream.bytesAvailable));
			filestream.close();
						
			CreateConfig(); //create the the new myXML file and then over-write it with the old settings
			
			filestream.open(file, FileMode.READ);  //read the myXML file
			myXML = XML(filestream.readUTFBytes(filestream.bytesAvailable));
			filestream.close();
			
			//switch6 and alcohol sensor settings were added in v4
			
			//now take the old values from myXMLold and over-write them into the new myXML
			if (myXMLold.mirror_mode != undefined) { myXML.mirror_mode = myXMLold.mirror_mode; }
			if (myXMLold.verbose != undefined) { myXML.verbose = myXMLold.verbose; }
			if (myXMLold.screen_mode != undefined) { myXML.screen_mode = myXMLold.screen_mode; }
			if (myXMLold.idle_videos != undefined) { myXML.idle_videos = myXMLold.idle_videos; }
			if (myXMLold.video_resolution != undefined) { myXML.video_resolution = myXMLold.video_resolution; }
			if (myXMLold.digital_switches != undefined) { myXML.digital_switches = myXMLold.digital_switches; }
			if (myXMLold.switch1 != undefined) { myXML.switch1 = myXMLold.switch1; }
			if (myXMLold.switch2 != undefined) { myXML.switch2 = myXMLold.switch2; }
			if (myXMLold.switch3 != undefined) { myXML.switch3 = myXMLold.switch3; }
			if (myXMLold.switch4 != undefined) { myXML.switch4 = myXMLold.switch4; }
			if (myXMLold.switch5 != undefined) { myXML.switch5 = myXMLold.switch5; }
			if (myXMLold.switch6 != undefined) { myXML.switch6 = myXMLold.switch6; }
			
			if (myXMLold.debounce != undefined) { myXML.debounce = myXMLold.debounce; }
			if (myXMLold.debounce1 != undefined) { myXML.debounce1 = myXMLold.debounce1; }
			if (myXMLold.debounce2 != undefined) { myXML.debounce2 = myXMLold.debounce2; }
			
			if (myXMLold.switch1_trigger != undefined) { myXML.switch1_trigger = myXMLold.switch1_trigger; }
			if (myXMLold.switch2_trigger != undefined) { myXML.switch2_trigger = myXMLold.switch2_trigger; }
			if (myXMLold.switch3_trigger != undefined) { myXML.switch3_trigger = myXMLold.switch3_trigger; }
			if (myXMLold.switch4_trigger != undefined) { myXML.switch4_trigger = myXMLold.switch4_trigger; }
			if (myXMLold.switch5_trigger != undefined) { myXML.switch5_trigger = myXMLold.switch5_trigger; }
			if (myXMLold.switch6_trigger != undefined) { myXML.switch6_trigger = myXMLold.switch6_trigger; }
			
			if (myXMLold.digital2_video1 != undefined) { myXML.digital2_video1 = myXMLold.digital2_video1; }
			if (myXMLold.digital3_video2 != undefined) { myXML.digital3_video2 = myXMLold.digital3_video2; }
			if (myXMLold.digital5_video3 != undefined) { myXML.digital5_video3 = myXMLold.digital5_video3; }
			if (myXMLold.quiz_mode != undefined) { myXML.quiz_mode = myXMLold.quiz_mode; }
			if (myXMLold.quiz_correctanswer != undefined) { myXML.quiz_correctanswer = myXMLold.quiz_correctanswer; }
			if (myXMLold.quiz_timer != undefined) { myXML.quiz_timer = myXMLold.quiz_timer; }
			if (myXMLold.video_interrupts != undefined) { myXML.video_interrupts = myXMLold.video_interrupts; }
			
				
			if (myXMLold.x10_commands != undefined) { myXML.x10_commands = myXMLold.x10_commands; }
			if (myXMLold.x10_house1 != undefined) { myXML.x10_house1 = myXMLold.x10_house1; }
			if (myXMLold.x10_house2 != undefined) { myXML.x10_house2 = myXMLold.x10_house2; }
			if (myXMLold.x10_house3 != undefined) { myXML.x10_house3 = myXMLold.x10_house3; }
			if (myXMLold.x10_house4 != undefined) { myXML.x10_house4 = myXMLold.x10_house4; }
			if (myXMLold.x10_unit1 != undefined) { myXML.x10_unit1 = myXMLold.x10_unit1; }
			if (myXMLold.x10_unit2 != undefined) { myXML.x10_unit2 = myXMLold.x10_unit2; }
			if (myXMLold.x10_unit3 != undefined) { myXML.x10_unit3 = myXMLold.x10_unit3; }
			if (myXMLold.x10_unit4 != undefined) { myXML.x10_unit4 = myXMLold.x10_unit4; }
			
			if (myXMLold.x10_wait != undefined) { myXML.x10_wait = myXMLold.x10_wait; }
			if (myXMLold.x10_resends != undefined) { myXML.x10_resends = myXMLold.x10_resends; }
			if (myXMLold.proximity_sensor_on != undefined) { myXML.proximity_sensor_on = myXMLold.proximity_sensor_on; }
			if (myXMLold.analog_input1 != undefined) { myXML.analog_input1 = myXMLold.analog_input1; }
			if (myXMLold.analog_input2 != undefined) { myXML.analog_input2 = myXMLold.analog_input2; }
			if (myXMLold.analog_input3 != undefined) { myXML.analog_input3 = myXMLold.analog_input3; }
			
			if (myXMLold.analog1_video1 != undefined) { myXML.analog1_video1 = myXMLold.analog1_video1; }
			if (myXMLold.analog2_video2 != undefined) { myXML.analog2_video2 = myXMLold.analog2_video2; }
			if (myXMLold.analog3_video3 != undefined) { myXML.analog3_video3 = myXMLold.analog3_video3; }
						
			if (myXMLold.analog3_prox != undefined) { myXML.analog3_prox = myXMLold.analog3_prox; }
			if (myXMLold.digital1_prox != undefined) { myXML.digital1_prox = myXMLold.digital1_prox; }
			if (myXMLold.hardware_mode_select != undefined) { myXML.hardware_mode_select = myXMLold.hardware_mode_select; }
			
			if (myXMLold.proximity_sensor_trigger1_distance_lower != undefined) { myXML.proximity_sensor_trigger1_distance_lower = myXMLold.proximity_sensor_trigger1_distance_lower; }
			if (myXMLold.proximity_sensor_trigger1_distance_upper != undefined) { myXML.proximity_sensor_trigger1_distance_upper = myXMLold.proximity_sensor_trigger1_distance_upper; }
			if (myXMLold.proximity_sensor_trigger1_time != undefined) 			{ myXML.proximity_sensor_trigger1_time = myXMLold.proximity_sensor_trigger1_time; }
			if (myXMLold.proximity_sensor_trigger2_distance_lower != undefined) { myXML.proximity_sensor_trigger2_distance_lower = myXMLold.proximity_sensor_trigger2_distance_lower; }
			if (myXMLold.proximity_sensor_trigger2_distance_upper != undefined) { myXML.proximity_sensor_trigger2_distance_upper = myXMLold.proximity_sensor_trigger2_distance_upper; }
			if (myXMLold.proximity_sensor_trigger2_time != undefined) 			{ myXML.proximity_sensor_trigger2_time = myXMLold.proximity_sensor_trigger2_time; }
			if (myXMLold.proximity_sensor_trigger2_distance != undefined		) { myXML.proximity_sensor_trigger2_distance = myXMLold.proximity_sensor_trigger2_distance; }
			
			if (myXMLold.prox2_before_prox1 != undefined) { myXML.prox2_before_prox1 = myXMLold.prox2_before_prox1; }
			if (myXMLold.stock_good_threshold != undefined) { myXML.stock_good_threshold = myXMLold.stock_good_threshold; }
			if (myXMLold.stock_bad_threshold != undefined) { myXML.stock_bad_threshold = myXMLold.stock_bad_threshold; }
			
			if (myXMLold.no_resize != undefined) { myXML.no_resize = myXMLold.no_resize; }
			
			if (myXMLold.video_scaling_factor != undefined) { myXML.video_scaling_factor = myXMLold.video_scaling_factor; }
			if (myXMLold.x_position != undefined) { myXML.x_position = myXMLold.x_position; }
			if (myXMLold.y_position != undefined) { myXML.y_position = myXMLold.y_position; }
			if (myXMLold.video_rotation != undefined) { myXML.video_rotation = myXMLold.video_rotation; }
						
			if (myXMLold.com_port != undefined) { myXML.com_port = myXMLold.com_port; }
			if (myXMLold.startup_delay != undefined) { myXML.startup_delay = myXMLold.startup_delay; }
			if (myXMLold.reg_code != undefined) { myXML.reg_code = myXMLold.reg_code; }
			if (myXMLold.weather_zip != undefined) { myXML.weather_zip = myXMLold.weather_zip; }
			if (myXMLold.weather_woeid != undefined) { myXML.weather_woeid = myXMLold.weather_woeid; }
			if (myXMLold.weather_reading != undefined) { myXML.weather_reading = myXMLold.weather_reading; }
			if (myXMLold.weather_display != undefined) { myXML.weather_display = myXMLold.weather_display; }
			if (myXMLold.forecast_cutoff != undefined) { myXML.forecast_cutoff = myXMLold.forecast_cutoff; }
			
			if (myXMLold.good_weather_threshold != undefined) { myXML.good_weather_threshold = myXMLold.good_weather_threshold; }
			if (myXMLold.display_breathalyzer_text != undefined) { myXML.display_breathalyzer_text = myXMLold.display_breathalyzer_text; }
			if (myXMLold.display_stock_text != undefined) { myXML.display_stock_text = myXMLold.display_stock_text; }
			if (myXMLold.display_weather_text != undefined) { myXML.display_weather_text = myXMLold.display_weather_text; }
			if (myXMLold.display_weather_image != undefined) { myXML.display_weather_image = myXMLold.display_weather_image; }
			if (myXMLold.weather_images_url != undefined) { myXML.weather_images_url = myXMLold.weather_images_url; }
			
			if (myXMLold.alcohol_results_text_x != undefined) { myXML.alcohol_results_text_x = myXMLold.alcohol_results_text_x; }
			if (myXMLold.alcohol_results_text_y != undefined) { myXML.alcohol_results_text_y = myXMLold.alcohol_results_text_y; }			
			if (myXMLold.alcohol_results_text_fontsize != undefined) { myXML.alcohol_results_text_fontsize = myXMLold.alcohol_results_text_fontsize; }
			if (myXMLold.alcohol_results_text_rotation != undefined) { myXML.alcohol_results_text_rotation = myXMLold.alcohol_results_text_rotation; }
			
			if (myXMLold.stock_text_x != undefined) { myXML.stock_text_x = myXMLold.stock_text_x; }
			if (myXMLold.stock_text_y != undefined) { myXML.stock_text_y = myXMLold.stock_text_y; }			
			if (myXMLold.stock_text_fontsize != undefined) { myXML.stock_text_fontsize = myXMLold.stock_text_fontsize; }
			if (myXMLold.stock_text_rotation != undefined) { myXML.stock_text_rotation = myXMLold.stock_text_rotation; }
			
			if (myXMLold.weather_text_x != undefined) { myXML.weather_text_x = myXMLold.weather_text_x; }
			if (myXMLold.weather_text_y != undefined) { myXML.weather_text_y = myXMLold.weather_text_y; }
			if (myXMLold.weather_text_fontsize != undefined) { myXML.weather_text_fontsize = myXMLold.weather_text_fontsize; }
			if (myXMLold.weather_text_rotation != undefined) { myXML.weather_text_rotation = myXMLold.weather_text_rotation; }
			if (myXMLold.weather_image_x != undefined) { myXML.weather_image_x = myXMLold.weather_image_x; }
			
			if (myXMLold.weather_image_y != undefined) { myXML.weather_image_y = myXMLold.weather_image_y; }
			if (myXMLold.weather_image_rotation != undefined) { myXML.weather_image_rotation = myXMLold.weather_image_rotation; }
			if (myXMLold.weather_image_scale != undefined) { myXML.weather_image_scale = myXMLold.weather_image_scale; }
			if (myXMLold.doorcam_on != undefined) { myXML.doorcam_on = myXMLold.doorcam_on; }
			if (myXMLold.doorcam_host != undefined) { myXML.doorcam_host = myXMLold.doorcam_host; }
			if (myXMLold.doorcam_path != undefined) { myXML.doorcam_path = myXMLold.doorcam_path; }
			if (myXMLold.doorcam_make != undefined) { myXML.doorcam_make = myXMLold.doorcam_make; }
			
			if (myXMLold.doorcam_port != undefined) { myXML.doorcam_port = myXMLold.doorcam_port; }
			if (myXMLold.doorcam_x != undefined) { myXML.doorcam_x = myXMLold.doorcam_x; }
			if (myXMLold.doorcam_y != undefined) { myXML.doorcam_y = myXMLold.doorcam_y; }
			if (myXMLold.doorcam_rotate != undefined) { myXML.doorcam_rotate = myXMLold.doorcam_rotate; }
			if (myXMLold.doorcam_scale != undefined) { myXML.doorcam_scale = myXMLold.doorcam_scale; }
			if (myXMLold.doorcam_username != undefined) { myXML.doorcam_username = myXMLold.doorcam_username; }
			if (myXMLold.doorcam_password != undefined) { myXML.doorcam_password = myXMLold.doorcam_password; }
			
			if (myXMLold.doorcam_width != undefined) { myXML.doorcam_width = myXMLold.doorcam_width; }
			if (myXMLold.doorcam_height != undefined) { myXML.doorcam_height = myXMLold.doorcam_height; }
			if (myXMLold.doorcam_timer != undefined) { myXML.doorcam_timer = myXMLold.doorcam_timer; }
			if (myXMLold.doorcam_video_x != undefined) { myXML.doorcam_video_x = myXMLold.doorcam_video_x; }
			if (myXMLold.doorcam_video_y != undefined) { myXML.doorcam_video_y = myXMLold.doorcam_video_y; }
			if (myXMLold.doorcam_video_scale != undefined) { myXML.doorcam_video_scale = myXMLold.doorcam_video_scale; }
			
			if (myXMLold.webcam_on != undefined) { myXML.webcam_on = myXMLold.webcam_on; }
			if (myXMLold.webcam_width != undefined) { myXML.webcam_width = myXMLold.webcam_width; }
			if (myXMLold.webcam_height != undefined) { myXML.webcam_height = myXMLold.webcam_height; }
			if (myXMLold.webcam_fps != undefined) { myXML.webcam_fps = myXMLold.webcam_fps; }
			if (myXMLold.faceDetectInterval != undefined) { myXML.faceDetectInterval = myXMLold.faceDetectInterval; }
			if (myXMLold.noFaceTimeout != undefined) { myXML.noFaceTimeout = myXMLold.noFaceTimeout; }
			if (myXMLold.faceDetectrectColor != undefined) { myXML.faceDetectrectColor = myXMLold.faceDetectrectColor; }
			if (myXMLold.webcam_x != undefined) { myXML.webcam_x = myXMLold.webcam_x; }
			if (myXMLold.webcam_y != undefined) { myXML.webcam_y = myXMLold.webcam_y; }
			if (myXMLold.webcam_rotation != undefined) { myXML.webcam_rotation = myXMLold.webcam_rotation; }
			if (myXMLold.webcam_scale != undefined) { myXML.webcam_scale = myXMLold.webcam_scale; }
			if (myXMLold.webcamStealth != undefined) { myXML.webcamStealth = myXMLold.webcamStealth; }
			if (myXMLold.frame != undefined) { myXML.frame = myXMLold.frame; }
			if (myXMLold.frame_x != undefined) { myXML.frame_x = myXMLold.frame_x; }
			if (myXMLold.frame_y != undefined) { myXML.frame_y = myXMLold.frame_y; }
			if (myXMLold.frame_rotation != undefined) { myXML.frame_rotation = myXMLold.frame_rotation; }
			if (myXMLold.frame_scale != undefined) { myXML.frame_scale = myXMLold.frame_scale; }
			if (myXMLold.frame_selected != undefined) { myXML.frame_selected = myXMLold.frame_selected; }
			if (myXMLold.frame_selected_index != undefined) { myXML.frame_selected_index = myXMLold.frame_selected_index; }
			if (myXMLold.stand_alone != undefined) { myXML.stand_alone = myXMLold.stand_alone; }
			if (myXMLold.stand_alone_weather != undefined) { myXML.stand_alone_weather = myXMLold.stand_alone_weather; }
			if (myXMLold.stand_alone_stock != undefined) { myXML.stand_alone_stock = myXMLold.stand_alone_stock; }
			if (myXMLold.doorcam_video_y != undefined) { myXML.doorcam_video_y = myXMLold.doorcam_video_y; }
			if (myXMLold.doorcam_video_scale != undefined) { myXML.doorcam_video_scale = myXMLold.doorcam_video_scale; }
			if (myXMLold.doorcam_video_y != undefined) { myXML.doorcam_video_y = myXMLold.doorcam_video_y; }
			if (myXMLold.doorcam_video_scale != undefined) { myXML.doorcam_video_scale = myXMLold.doorcam_video_scale; }
			
			if (myXMLold.thoughts_image_x != undefined) { myXML.thoughts_image_x = myXMLold.thoughts_image_x; }			
			if (myXMLold.thoughts_image_y != undefined) { myXML.thoughts_image_y = myXMLold.thoughts_image_y; }
			if (myXMLold.thoughts_image_rotate != undefined) { myXML.thoughts_image_rotate = myXMLold.thoughts_image_rotate; }
			if (myXMLold.thoughts_image_scale != undefined) { myXML.thoughts_image_scale = myXMLold.thoughts_image_scale; }
			
			if (myXMLold.picasa_insteadofphotobooth != undefined) { myXML.picasa_insteadofphotobooth = myXMLold.picasa_insteadofphotobooth; }			
			if (myXMLold.photobooth_printing != undefined) { myXML.photobooth_printing = myXMLold.photobooth_printing; }
			if (myXMLold.photobooth_promptprint != undefined) { myXML.photobooth_promptprint = myXMLold.photobooth_promptprint; }
			if (myXMLold.photobooth_papersize != undefined) { myXML.photobooth_papersize = myXMLold.photobooth_papersize; }			
			if (myXMLold.photobooth_printorientation != undefined) { myXML.photobooth_printorientation = myXMLold.photobooth_printorientation; }			
			if (myXMLold.photobooth_scaling != undefined) { myXML.photobooth_scaling = myXMLold.photobooth_scaling; }
			if (myXMLold.photobooth_logo != undefined) { myXML.photobooth_logo = myXMLold.photobooth_logo; }
			if (myXMLold.photobooth_logoPath != undefined) { myXML.photobooth_logoPath = myXMLold.photobooth_logoPath; }			
			if (myXMLold.photobooth_logo_x != undefined) { myXML.photobooth_logo_x = myXMLold.photobooth_logo_x; }			
			if (myXMLold.photobooth_logo_y != undefined) { myXML.photobooth_logo_y = myXMLold.photobooth_logo_y; }
			if (myXMLold.photobooth_keyboardtrigger != undefined) { myXML.photobooth_keyboardtrigger = myXMLold.photobooth_keyboardtrigger; }
			if (myXMLold.photobooth_backgroundimage != undefined) { myXML.photobooth_backgroundimage = myXMLold.photobooth_backgroundimage; }			
			if (myXMLold.photobooth_backdropimage != undefined) { myXML.photobooth_backdropimage = myXMLold.photobooth_backdropimage; }			
			if (myXMLold.photobooth_backgroundboxes != undefined) { myXML.photobooth_backgroundboxes = myXMLold.photobooth_backgroundboxes; }
			if (myXMLold.photobooth_countdownimage != undefined) { myXML.photobooth_countdownimage = myXMLold.photobooth_countdownimage; }
			if (myXMLold.photobooth_backgroundcustomimage != undefined) { myXML.photobooth_backgroundcustomimage = myXMLold.photobooth_backgroundcustomimage; }			
  			if (myXMLold.photobooth_backgroundcustomimagepath != undefined) { myXML.photobooth_backgroundcustomimagepath = myXMLold.photobooth_backgroundcustomimagepath; }			
			if (myXMLold.photobooth_backgroundcustomimage_x != undefined) { myXML.photobooth_backgroundcustomimage_x = myXMLold.photobooth_backgroundcustomimage_x; }
			if (myXMLold.photobooth_backgroundcustomimage_y != undefined) { myXML.photobooth_backgroundcustomimage_y = myXMLold.photobooth_backgroundcustomimage_y; }
			if (myXMLold.photobooth_startuptext != undefined) { myXML.photobooth_startuptext = myXMLold.photobooth_startuptext; }			
  			if (myXMLold.photobooth_save != undefined) { myXML.photobooth_save = myXMLold.photobooth_save; }	
			if (myXMLold.photobooth_fullres_save != undefined) { myXML.photobooth_fullres_save = myXMLold.photobooth_fullres_save; }	
			if (myXMLold.photobooth_savefolder != undefined) { myXML.photobooth_savefolder = myXMLold.photobooth_savefolder; }
			if (myXMLold.photobooth_x10 != undefined) { myXML.photobooth_x10 = myXMLold.photobooth_x10; }
			if (myXMLold.photobooth_leds != undefined) { myXML.photobooth_leds = myXMLold.photobooth_leds; }			
			if (myXMLold.photobooth_kinect != undefined) { myXML.photobooth_kinect = myXMLold.photobooth_kinect; }			
			if (myXMLold.photobooth_hidemouse != undefined) { myXML.photobooth_hidemouse = myXMLold.photobooth_hidemouse; }
			if (myXMLold.photobooth_videoBandwidth != undefined) { myXML.photobooth_videoBandwidth = myXMLold.photobooth_videoBandwidth; }
			if (myXMLold.photobooth_videoQuality != undefined) { myXML.photobooth_videoQuality = myXMLold.photobooth_videoQuality; }  
  			if (myXMLold.photobooth_videoWidth != undefined) { myXML.photobooth_videoWidth = myXMLold.photobooth_videoWidth; }			
			if (myXMLold.photobooth_videoHeight != undefined) { myXML.photobooth_videoHeight = myXMLold.photobooth_videoHeight; }
			if (myXMLold.photobooth_webcam_x != undefined) { myXML.photobooth_webcam_x = myXMLold.photobooth_webcam_x; }
			if (myXMLold.photobooth_webcam_y != undefined) { myXML.photobooth_webcam_y = myXMLold.photobooth_webcam_y; }			
			if (myXMLold.photobooth_webcam_width != undefined) { myXML.photobooth_webcam_width = myXMLold.photobooth_webcam_width; }			
			if (myXMLold.photobooth_webcam_height != undefined) { myXML.photobooth_webcam_height = myXMLold.photobooth_webcam_height; }
			if (myXMLold.photobooth_fps != undefined) { myXML.photobooth_fps = myXMLold.photobooth_fps; }
			if (myXMLold.photobooth_countdown != undefined) { myXML.photobooth_countdown = myXMLold.photobooth_countdown; }			
			if (myXMLold.photobooth_print_copies != undefined) { myXML.photobooth_print_copies = myXMLold.photobooth_print_copies; }			
			if (myXMLold.photoboothShotDelay != undefined) { myXML.photoboothShotDelay = myXMLold.photoboothShotDelay; }
			if (myXMLold.photoboothFlashDuration != undefined) { myXML.photoboothFlashDuration = myXMLold.photoboothFlashDuration; }
			if (myXMLold.photoboothDelayAfterCameraSound != undefined) { myXML.photoboothDelayAfterCameraSound = myXMLold.photoboothDelayAfterCameraSound; }			
			if (myXMLold.photoboothPleaseWaitTimer1 != undefined) { myXML.photoboothPleaseWaitTimer1 = myXMLold.photoboothPleaseWaitTimer1; }			
			if (myXMLold.photoboothPreGalleryTimer != undefined) { myXML.photoboothPreGalleryTimer = myXMLold.photoboothPreGalleryTimer; }
			if (myXMLold.photoboothGalleryTimer != undefined) { myXML.photoboothGalleryTimer = myXMLold.photoboothGalleryTimer; }
			if (myXMLold.photoboothProofPreview != undefined) { myXML.photoboothProofPreview = myXMLold.photoboothProofPreview; }			
			if (myXMLold.photoboothProofDisplayTime != undefined) { myXML.photoboothProofDisplayTime = myXMLold.photoboothProofDisplayTime; }			
			if (myXMLold.photoboothThanksBoxTimer != undefined) { myXML.photoboothThanksBoxTimer = myXMLold.photoboothThanksBoxTimer; }
			if (myXMLold.photobooth_beepSound != undefined) { myXML.photobooth_beepSound = myXMLold.photobooth_beepSound; }
			if (myXMLold.photobooth_cameraSound != undefined) { myXML.photobooth_cameraSound = myXMLold.photobooth_cameraSound; }			
			if (myXMLold.photobooth_developingfilmSound != undefined) { myXML.photobooth_developingfilmSound = myXMLold.photobooth_developingfilmSound; }			
			if (myXMLold.photobooth_IntroSoundPathp != undefined) { myXML.photobooth_IntroSoundPathp = myXMLold.photobooth_IntroSoundPathp; }
			if (myXMLold.photobooth_getReadySoundPathp != undefined) { myXML.photobooth_getReadySoundPathp = myXMLold.photobooth_getReadySoundPathp; }
			if (myXMLold.photobooth_pic2SoundPathp != undefined) { myXML.photobooth_pic2SoundPathp = myXMLold.photobooth_pic2SoundPathp; }			
			if (myXMLold.photobooth_pic3SoundPathp != undefined) { myXML.photobooth_pic3SoundPathp = myXMLold.photobooth_pic3SoundPathp; }			
			if (myXMLold.photobooth_pic4SoundPathp != undefined) { myXML.photobooth_pic4SoundPathp = myXMLold.photobooth_pic4SoundPathp; }
			if (myXMLold.photobooth_developingSoundPathp != undefined) { myXML.photobooth_developingSoundPathp = myXMLold.photobooth_developingSoundPathp; }
			if (myXMLold.photobooth_thanksSoundPathp != undefined) { myXML.photobooth_thanksSoundPathp = myXMLold.photobooth_thanksSoundPathp; }			
			if (myXMLold.photobooth_IntroSoundPathh != undefined) { myXML.photobooth_IntroSoundPathh = myXMLold.photobooth_IntroSoundPathh; }			
			if (myXMLold.photobooth_getReadySoundPathh != undefined) { myXML.photobooth_getReadySoundPathh = myXMLold.photobooth_getReadySoundPathh; }
			if (myXMLold.photobooth_pic2SoundPathh != undefined) { myXML.photobooth_pic2SoundPathh = myXMLold.photobooth_pic2SoundPathh; }
			if (myXMLold.photobooth_pic3SoundPathh != undefined) { myXML.photobooth_pic3SoundPathh = myXMLold.photobooth_pic3SoundPathh; }			
			if (myXMLold.photobooth_pic4SoundPathh != undefined) { myXML.photobooth_pic4SoundPathh = myXMLold.photobooth_pic4SoundPathh; }			
			if (myXMLold.photobooth_developingSoundPathh != undefined) { myXML.photobooth_developingSoundPathh = myXMLold.photobooth_developingSoundPathh; }
			if (myXMLold.photobooth_thanksSoundPathh != undefined) { myXML.photobooth_thanksSoundPathh = myXMLold.photobooth_thanksSoundPathh; }
			if (myXMLold.photobooth_IntroSoundPathpi != undefined) { myXML.photobooth_IntroSoundPathpi = myXMLold.photobooth_IntroSoundPathpi; }			
			if (myXMLold.photobooth_getReadySoundPathpi != undefined) { myXML.photobooth_getReadySoundPathpi = myXMLold.photobooth_getReadySoundPathpi; }			
			if (myXMLold.photobooth_pic2SoundPathpi != undefined) { myXML.photobooth_pic2SoundPathpi = myXMLold.photobooth_pic2SoundPathpi; }
			if (myXMLold.photobooth_pic3SoundPathpi != undefined) { myXML.photobooth_pic3SoundPathpi = myXMLold.photobooth_pic3SoundPathpi; }
			if (myXMLold.photobooth_pic4SoundPathpi != undefined) { myXML.photobooth_pic4SoundPathpi = myXMLold.photobooth_pic4SoundPathpi; }  
			if (myXMLold.photobooth_developingSoundPathpi != undefined) { myXML.photobooth_developingSoundPathpi = myXMLold.photobooth_developingSoundPathpi; }			
			if (myXMLold.photobooth_thanksSoundPathpi != undefined) { myXML.photobooth_thanksSoundPathpi = myXMLold.photobooth_thanksSoundPathpi; }
			if (myXMLold.photobooth_IntroSoundPathi != undefined) { myXML.photobooth_IntroSoundPathi = myXMLold.photobooth_IntroSoundPathi; }
			if (myXMLold.photobooth_getReadySoundPathi != undefined) { myXML.photobooth_getReadySoundPathi = myXMLold.photobooth_getReadySoundPathi; }  
			if (myXMLold.photobooth_pic2SoundPathi != undefined) { myXML.photobooth_pic2SoundPathi = myXMLold.photobooth_pic2SoundPathi; }			
			if (myXMLold.photobooth_pic3SoundPathi != undefined) { myXML.photobooth_pic3SoundPathi = myXMLold.photobooth_pic3SoundPathi; }
			if (myXMLold.photobooth_pic4SoundPathi != undefined) { myXML.photobooth_pic4SoundPathi = myXMLold.photobooth_pic4SoundPathi; }
			if (myXMLold.photobooth_developingSoundPathi != undefined) { myXML.photobooth_developingSoundPathi = myXMLold.photobooth_developingSoundPathi; }
			if (myXMLold.photobooth_thanksSoundPathi != undefined) { myXML.photobooth_thanksSoundPathi = myXMLold.photobooth_thanksSoundPathi; }
			if (myXMLold.photobooth_facialRecognitionTrigger != undefined) { myXML.photobooth_facialRecognitionTrigger = myXMLold.photobooth_facialRecognitionTrigger; }
			if (myXMLold.photobooth_facialRecognitionDelay != undefined) { myXML.photobooth_facialRecognitionDelay = myXMLold.photobooth_facialRecognitionDelay; }
		
			if (myXMLold.custom_audio != undefined) { myXML.custom_audio = myXMLold.custom_audio; }
			
			if (myXMLold.lipsync_feature != undefined) { myXML.lipsync_feature = myXMLold.lipsync_feature; }
			if (myXMLold.lipsync_interval != undefined) { myXML.lipsync_interval = myXMLold.lipsync_interval; }
			if (myXMLold.lipsync_x != undefined) { myXML.lipsync_x = myXMLold.lipsync_x; }
			if (myXMLold.lipsync_y != undefined) { myXML.lipsync_y = myXMLold.lipsync_y; }
			if (myXMLold.lipsync_rotation != undefined) { myXML.lipsync_rotation = myXMLold.lipsync_rotation; }
			if (myXMLold.lipsync_clip != undefined) { myXML.lipsync_clip = myXMLold.lipsync_clip; }
			if (myXMLold.lipsync_scale != undefined) { myXML.lipsync_scale = myXMLold.lipsync_scale; }
			
			
			if (myXMLold.twitter_feature != undefined) { myXML.twitter_feature = myXMLold.twitter_feature; }
			if (myXMLold.twitter_mode != undefined) { myXML.twitter_mode = myXMLold.twitter_mode; }
			
			if (myXMLold.twitter_username != undefined) { myXML.twitter_username = myXMLold.twitter_username; }
			if (myXMLold.twitter_serviceHost != undefined) { myXML.twitter_serviceHost = myXMLold.twitter_serviceHost; }
			
			if (myXMLold.twitter_oauthToken != undefined) { myXML.twitter_oauthToken = myXMLold.twitter_oauthToken; }
			if (myXMLold.twitter_oauthTokenSecret != undefined) { myXML.twitter_oauthTokenSecret = myXMLold.twitter_oauthTokenSecret; }
			if (myXMLold.twitter_authenticated != undefined) { myXML.twitter_authenticated = myXMLold.twitter_authenticated; }
			if (myXMLold.twitter_drink1 != undefined) { myXML.twitter_drink1 = myXMLold.twitter_drink1; }
			if (myXMLold.twitter_drink2 != undefined) { myXML.twitter_drink2 = myXMLold.twitter_drink2; }
			if (myXMLold.twitter_drink3 != undefined) { myXML.twitter_drink3 = myXMLold.twitter_drink3; }
			if (myXMLold.twitter_drink4 != undefined) { myXML.twitter_drink4 = myXMLold.twitter_drink4; }
			if (myXMLold.twitter_frequency != undefined) { myXML.twitter_frequency = myXMLold.twitter_frequency; }
			if (myXMLold.twitter_my_tweets_only != undefined) { myXML.twitter_my_tweets_only = myXMLold.twitter_my_tweets_only; }
			if (myXMLold.twitter_search_term != undefined) { myXML.twitter_search_term = myXMLold.twitter_search_term; }
			if (myXMLold.twitter_do_not_speak_search_term != undefined) { myXML.twitter_do_not_speak_search_term = myXMLold.twitter_do_not_speak_search_term; }
			if (myXMLold.twitter_breathalyzer != undefined) { myXML.twitter_breathalyzer = myXMLold.twitter_breathalyzer; }
			if (myXMLold.twitter_breathalyzer_value != undefined) { myXML.twitter_breathalyzer_value = myXMLold.twitter_breathalyzer_value; }
			if (myXMLold.tts_feature != undefined) { myXML.tts_feature = myXMLold.tts_feature; }
			if (myXMLold.tts_avatar != undefined) { myXML.tts_avatar = myXMLold.tts_avatar; }
			if (myXMLold.tts_language != undefined) { myXML.tts_language = myXMLold.tts_language; }
			if (myXMLold.proximity1_tts != undefined) { myXML.proximity1_tts = myXMLold.proximity1_tts; }
			if (myXMLold.proximity2_tts != undefined) { myXML.proximity2_tts = myXMLold.proximity2_tts; }
			if (myXMLold.proximity3_tts != undefined) { myXML.proximity3_tts = myXMLold.proximity3_tts; }
			if (myXMLold.weather_good_tts != undefined) { myXML.weather_good_tts = myXMLold.weather_good_tts; }
			if (myXMLold.weather_ok_tts != undefined) { myXML.weather_ok_tts = myXMLold.weather_ok_tts; }
			if (myXMLold.weather_rain_tts != undefined) { myXML.weather_rain_tts = myXMLold.weather_rain_tts; }
			if (myXMLold.no_internet_tts != undefined) { myXML.no_internet_tts = myXMLold.no_internet_tts; }
			if (myXMLold.stock_up_tts != undefined) { myXML.stock_up_tts = myXMLold.stock_up_tts; }
			if (myXMLold.stock_no_change_tts != undefined) { myXML.stock_no_change_tts = myXMLold.stock_no_change_tts; }
			if (myXMLold.stock_down_tts != undefined) { myXML.stock_down_tts = myXMLold.stock_down_tts; }
			if (myXMLold.doorbell_tts != undefined) { myXML.doorbell_tts = myXMLold.doorbell_tts; }
			if (myXMLold.x10_on_tts != undefined) { myXML.x10_on_tts = myXMLold.x10_on_tts; }
			if (myXMLold.x10_off_tts != undefined) { myXML.x10_off_tts = myXMLold.x10_off_tts; }
			if (myXMLold.drink1_tts != undefined) { myXML.drink1_tts = myXMLold.drink1_tts; }
			if (myXMLold.drink2_tts != undefined) { myXML.drink2_tts = myXMLold.drink2_tts; }
			if (myXMLold.drink3_tts != undefined) { myXML.drink3_tts = myXMLold.drink3_tts; }
			if (myXMLold.drink4_tts != undefined) { myXML.drink4_tts = myXMLold.drink4_tts; }
			if (myXMLold.blow_tts != undefined) { myXML.blow_tts = myXMLold.blow_tts; }
			if (myXMLold.wait_tts != undefined) { myXML.wait_tts = myXMLold.wait_tts; }
			if (myXMLold.warning_tts != undefined) { myXML.warning_tts = myXMLold.warning_tts; }
			
			if (myXMLold.google_id != undefined) { myXML.google_id = myXMLold.google_id; }
			if (myXMLold.picasa_album_id != undefined) { myXML.picasa_album_id = myXMLold.picasa_album_id; }
			if (myXMLold.picasa_album_name != undefined) { myXML.picasa_album_name = myXMLold.picasa_album_name; }
			if (myXMLold.picasa_album_url != undefined) { myXML.picasa_album_url = myXMLold.picasa_album_url; }
			
			if (myXMLold.slide_delay != undefined) { myXML.slide_delay = myXMLold.slide_delay; }
			if (myXMLold.slideshow_restart_switch != undefined) { myXML.slideshow_restart_switch = myXMLold.slideshow_restart_switch; }
			if (myXMLold.picture_x_position != undefined) { myXML.picture_x_position = myXMLold.picture_x_position; }
			if (myXMLold.picture_y_position != undefined) { myXML.picture_y_position = myXMLold.picture_y_position; }
			if (myXMLold.picture_rotation != undefined) { myXML.picture_rotation = myXMLold.picture_rotation; }
			if (myXMLold.picture_scale != undefined) { myXML.picture_scale = myXMLold.picture_scale; }
			if (myXMLold.doorbell_delay != undefined) { myXML.doorbell_delay = myXMLold.doorbell_delay; }
			
			if (myXMLold.board_version != undefined) { myXML.board_version = myXMLold.board_version; }
			if (myXMLold.atmega != undefined) { myXML.atmega = myXMLold.atmega; }
			if (myXMLold.branding != undefined) { myXML.branding = myXMLold.branding; }			
			if (myXMLold.stocks != undefined) { myXML.stocks = myXMLold.stocks; }
			
			if (myXMLold.alcohol_sensor != undefined) { myXML.alcohol_sensor = myXMLold.alcohol_sensor; }
			if (myXMLold.alcohol_no_switch != undefined) { myXML.alcohol_no_switch = myXMLold.alcohol_no_switch; }
			if (myXMLold.alcohol_no_switch_interval != undefined) { myXML.alcohol_no_switch_interval = myXMLold.alcohol_no_switch_interval; }
			if (myXMLold.alcohol_no_switch_trigger_delta != undefined) { myXML.alcohol_no_switch_trigger_delta = myXMLold.alcohol_no_switch_trigger_delta; }
			
			if (myXMLold.alcohol_baseline != undefined) { myXML.alcohol_baseline = myXMLold.alcohol_baseline; }
			if (myXMLold.alcohol_baseline_difference_allowance != undefined) { myXML.alcohol_baseline_difference_allowance = myXMLold.alcohol_baseline_difference_allowance; }			
			if (myXMLold.alcohol_level1 != undefined) { myXML.alcohol_level1 = myXMLold.alcohol_level1; }
			if (myXMLold.alcohol_level2 != undefined) { myXML.alcohol_level2 = myXMLold.alcohol_level2; }
			if (myXMLold.alcohol_level3 != undefined) { myXML.alcohol_level3 = myXMLold.alcohol_level3; }
			if (myXMLold.alcohol_countdown != undefined) { myXML.alcohol_countdown = myXMLold.alcohol_countdown; }			
			if (myXMLold.alcohol_text_duration != undefined) { myXML.alcohol_text_duration = myXMLold.alcohol_text_duration; }
			if (myXMLold.alcohol_display_value != undefined) { myXML.alcohol_display_value = myXMLold.alcohol_display_value; }
			
			if (myXMLold.beer_image_x != undefined) { myXML.beer_image_x = myXMLold.beer_image_x; }
			if (myXMLold.beer_image_y != undefined) { myXML.beer_image_y = myXMLold.beer_image_y; }
			if (myXMLold.beer_image_rotation != undefined) { myXML.beer_image_rotation = myXMLold.beer_image_rotation; }
			if (myXMLold.beer_image_scale != undefined) { myXML.beer_image_scale = myXMLold.beer_image_scale; }			
			if (myXMLold.beer_images_url != undefined) { myXML.beer_images_url = myXMLold.beer_images_url; }
			
			if (myXMLold.twitterbird_image_x != undefined) { myXML.twitterbird_image_x = myXMLold.twitterbird_image_x; }
			if (myXMLold.twitterbird_image_y != undefined) { myXML.twitterbird_image_y = myXMLold.twitterbird_image_y; }
			if (myXMLold.twitterbird_image_rotation != undefined) { myXML.twitterbird_image_rotation = myXMLold.twitterbird_image_rotation; }
			if (myXMLold.twitterbird_image_scale != undefined) { myXML.twitterbird_image_scale = myXMLold.twitterbird_image_scale; }			
			if (myXMLold.twitterbird_images_url != undefined) { myXML.twitterbird_images_url = myXMLold.twitterbird_images_url; }
						
			if (myXMLold.LED_mode != undefined) { myXML.LED_mode = myXMLold.LED_mode; }
			
			if (myXMLold.avatar_image_x != undefined) { myXML.avatar_image_x = myXMLold.avatar_image_x; }
			if (myXMLold.avatar_image_y != undefined) { myXML.avatar_image_y = myXMLold.avatar_image_y; }			
			if (myXMLold.avatar_image_rotate != undefined) { myXML.avatar_image_rotate = myXMLold.avatar_image_rotate; }
			if (myXMLold.avatar_image_scale != undefined) { myXML.avatar_image_scale = myXMLold.avatar_image_scale; }				
			
			if (myXMLold.twitter_feature != undefined) { myXML.twitter_feature = myXMLold.twitter_feature; }			
			if (myXMLold.twitter_mode != undefined) { myXML.twitter_mode = myXMLold.twitter_mode; }	
			if (myXMLold.twitter_username != undefined) { myXML.twitter_username = myXMLold.twitter_username; }			
			if (myXMLold.twitter_password != undefined) { myXML.twitter_password = myXMLold.twitter_password; }			
			if (myXMLold.twitter_frequency != undefined) { myXML.twitter_frequency = myXMLold.twitter_frequency; }	
			if (myXMLold.twitter_my_tweets_only != undefined) { myXML.twitter_my_tweets_only = myXMLold.twitter_my_tweets_only; }	
			if (myXMLold.twitter_search_term != undefined) { myXML.twitter_search_term = myXMLold.twitter_search_term; }
			if (myXMLold.twitter_do_not_speak_search_term != undefined) { myXML.twitter_do_not_speak_search_term = myXMLold.twitter_do_not_speak_search_term; }
			
			if (myXMLold.tts_feature != undefined) { myXML.tts_feature = myXMLold.tts_feature; }
			if (myXMLold.tts_avatar != undefined) { myXML.tts_avatar = myXMLold.tts_avatar; }
			if (myXMLold.tts_charlimit != undefined) { myXML.tts_charlimit = myXMLold.tts_charlimit; }			
			if (myXMLold.tts_url != undefined) { myXML.tts_url = myXMLold.tts_url; }
			if (myXMLold.tts_language != undefined) { myXML.tts_language = myXMLold.tts_language; }
			if (myXMLold.tts_sendheader != undefined) { myXML.tts_sendheader = myXMLold.tts_sendheader; }
			if (myXMLold.tts_headername != undefined) { myXML.tts_headername = myXMLold.tts_headername; }			
			if (myXMLold.tts_headervalue != undefined) { myXML.tts_headervalue = myXMLold.tts_headervalue; }
			
			if (myXMLold.ttsrss_url != undefined) { myXML.ttsrss_url = myXMLold.ttsrss_url; }
			if (myXMLold.ttsrss_apikey != undefined) { myXML.ttsrss_apikey = myXMLold.ttsrss_apikey; }
			if (myXMLold.ttsrss_language != undefined) { myXML.ttsrss_language = myXMLold.ttsrss_language; }			
			if (myXMLold.ttsrss_mp3samplerate != undefined) { myXML.ttsrss_mp3samplerate = myXMLold.ttsrss_mp3samplerate; }
			
			if (myXMLold.tts_engine != undefined) { myXML.tts_engine = myXMLold.tts_engine; }
			if (myXMLold.ttsyakitome_resturl != undefined) { myXML.ttsyakitome_resturl = myXMLold.ttsyakitome_resturl; }
			if (myXMLold.ttsyakitome_audiourl != undefined) { myXML.ttsyakitome_audiourl = myXMLold.ttsyakitome_audiourl; }			
			if (myXMLold.ttsyakitome_api_key != undefined) { myXML.ttsyakitome_api_key = myXMLold.ttsyakitome_api_key; }
			if (myXMLold.ttsyakitome_voice != undefined) { myXML.ttsyakitome_voice = myXMLold.ttsyakitome_voice; }
			if (myXMLold.ttsyakitome_speed != undefined) { myXML.ttsyakitome_speed = myXMLold.ttsyakitome_speed; }
			
			if (myXMLold.proximity1_tts != undefined) { myXML.proximity1_tts = myXMLold.proximity1_tts; }			
			if (myXMLold.proximity2_tts != undefined) { myXML.proximity2_tts = myXMLold.proximity2_tts; }
			if (myXMLold.proximity3_tts != undefined) { myXML.proximity3_tts = myXMLold.proximity3_tts; }			
			if (myXMLold.weather_good_tts != undefined) { myXML.weather_good_tts = myXMLold.weather_good_tts; }
			if (myXMLold.weather_ok_tts != undefined) { myXML.weather_ok_tts = myXMLold.weather_ok_tts; }			
			if (myXMLold.weather_rain_tts != undefined) { myXML.weather_rain_tts = myXMLold.weather_rain_tts; }
			if (myXMLold.no_internet_tts != undefined) { myXML.no_internet_tts = myXMLold.no_internet_tts; }			
			if (myXMLold.stock_up_tts != undefined) { myXML.stock_up_tts = myXMLold.stock_up_tts; }
			if (myXMLold.stock_no_change_tts != undefined) { myXML.stock_no_change_tts = myXMLold.stock_no_change_tts; }
			if (myXMLold.stock_down_tts != undefined) { myXML.stock_down_tts = myXMLold.stock_down_tts; }
			if (myXMLold.doorbell_tts != undefined) { myXML.doorbell_tts = myXMLold.doorbell_tts; }			
			if (myXMLold.x10_on_tts != undefined) { myXML.x10_on_tts = myXMLold.x10_on_tts; }
			if (myXMLold.x10_off_tts != undefined) { myXML.x10_off_tts = myXMLold.x10_off_tts; }
			if (myXMLold.drink1_tts != undefined) { myXML.drink1_tts = myXMLold.drink1_tts; }
			if (myXMLold.drink2_tts != undefined) { myXML.drink2_tts = myXMLold.drink2_tts; }			
			if (myXMLold.drink3_tts != undefined) { myXML.drink3_tts = myXMLold.drink3_tts; }
			if (myXMLold.drink4_tts != undefined) { myXML.drink4_tts = myXMLold.drink4_tts; }
			if (myXMLold.blow_tts != undefined) { myXML.blow_tts = myXMLold.blow_tts; }
			if (myXMLold.wait_tts != undefined) { myXML.wait_tts = myXMLold.wait_tts; }
			if (myXMLold.warning_tts != undefined) { myXML.warning_tts = myXMLold.warning_tts; }
			
			//had to add this because the Twitter keys were changed as of version 6.2 and need to over-write existing keys			
			myXML.twitter_consumerKey = "UqwagrMLQEwGsBfmxzxg";
			myXML.twitter_consumerSecret = "uvEa0gbwFoPlUTrhirhhK0OATpLG7mXqeDSZvZ0UtI";
			myXML.faceDetectInterval = "3000";
			//now save myXML
			
			 var newXMLStr2:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + myXML.toXMLString();
			 try {
					  filestream.open(file, FileMode.WRITE);
					  filestream.writeUTFBytes(newXMLStr2);                  	
				} catch (error:IOError) {
					  output.text = "IMPORTANT!!! Settings were not saved, re-start this program and Run as Administrator";			
					  AlertManager.createAlert(this, "IMPORTANT!!! Settings were not saved, please re-start this program and Run as Administrator and then you will be able to Save");
					  admin_flag = 1;
				}
			filestream.close(); 			
		
						
		}
			
			var registered:int = 0;
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
			//var responder : PicasaResponder = service.photos.list(google_id, picasa_album_id);
			//responder = service.photos.list(google_id, picasa_album_id);
			//responder.addEventListener(PicasaDataEvent.DATA, onGetAlbumsComplete);			
			//**************************************			
			video_resolution = myXML.video_resolution;
			com_port = myXML.com_port;						
			idle_videos = myXML.idle_videos;
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
						
			digital_switches = myXML.digital_switches;
			switch1 = myXML.switch1;
			switch2 = myXML.switch2;
			switch3 = myXML.switch3;
			switch4 = myXML.switch4;
			switch5 = myXML.switch5;
			switch6 = myXML.switch6;
			LED_mode = myXML.LED_mode;
			analog_input1 = myXML.analog_input1;
			analog_input2 = myXML.analog_input2;
			analog_input3 = myXML.analog_input3;
			
			proximity_sensor_on = myXML.proximity_sensor_on;
	  		proximity_sensor_trigger1_distance_lower = myXML.proximity_sensor_trigger1_distance_lower;
	  		proximity_sensor_trigger1_distance_upper = myXML.proximity_sensor_trigger1_distance_upper;
	  		proximity_sensor_trigger1_time = myXML.proximity_sensor_trigger1_time;
	  		proximity_sensor_trigger2_distance = myXML.proximity_sensor_trigger2_distance;
			
			stock_good_threshold = Number(myXML.stock_good_threshold);
			stock_bad_threshold = Number(myXML.stock_bad_threshold);
			weather_display = myXML.wather_display;
			forecast_cutoff = myXML.forecast_cutoff;
			x10_commands = myXML.x10_commands;
			screen_mode = myXML.screen_mode;
			display_breathalyzer_text = myXML.display_breathalyzer_text;
			display_stock_text = myXML.display_stock_text;
			display_weather_text = myXML.display_weather_text;
			display_weather_image = myXML.display_weather_image;
			display_frame = myXML.frame;
			display_webcamvideo = myXML.webcam_on;
			weather_images_url = myXML.weather_images_url;
			beer_images_url = myXML.beer_images_url;
			twitterbird_images_url = myXML.twitterbird_images_url;
			
			
			stock_text_x = myXML.stock_text_x;
			stock_text_y = myXML.stock_text_y;
			stock_text_fontsize = myXML.stock_text_fontsize;		
			stock_text_rotation = myXML.stock_text_rotation;
			
			alcohol_results_text_x = myXML.alcohol_results_text_x;
			alcohol_results_text_y = myXML.alcohol_results_text_y;
			alcohol_results_text_fontsize = myXML.alcohol_results_text_fontsize;		
			alcohol_results_text_rotation = myXML.alcohol_results_text_rotation;	
			
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
			
			twitterbird_image_x = myXML.twitterbird_image_x;
			twitterbird_image_y = myXML.twitterbird_image_y;
			twitterbird_image_rotation = myXML.twitterbird_image_rotation;					
			twitterbird_image_scale = myXML.twitterbird_image_scale;
			
			frame_x = myXML.frame_x;
			frame_y = myXML.frame_y;
			frame_rotation = myXML.frame_rotation;					
			frame_scale = myXML.frame_scale;
			frame_selected = myXML.frame_selected;
			
			lip1_x = myXML.lipsync_x;
			lip1_y = myXML.lipsync_y;
			lip1_rotation = myXML.lipsync_rotation;					
			lip1_scale = myXML.lipsync_scale;
			
			webcamvideo_x = myXML.webcam_x;
			webcamvideo_y = myXML.webcam_y;	
			webcamvideo_rotation = myXML.webcam_rotation;	
			webcamvideo_scale = myXML.webcam_scale;
			
			doorcam_on = myXML.doorcam_on;		
			doorcam_host = myXML.doorcam_host;		
			doorcam_path = myXML.doorcam_path;		
			doorcam_port = myXML.doorcam_port;					
			doorcam_x = myXML.doorcam_x;		 //the doorcam ip cam video, not the doorcam character
			doorcam_y = myXML.doorcam_y;		 
			doorcam_rotate = myXML.doorcam_rotate;		
			doorcam_scale = myXML.doorcam_scale;		
			doorcam_username = 	myXML.doorcam_username;
			doorcam_password = myXML.doorcam_password;
	 		doorcam_width = myXML.doorcam_width;
			doorcam_height= myXML.doorcam_height;
			doorcam_timer = myXML.doorcam_timer;
			doorcam_video_x = myXML.doorcam_video_x;  //the doorcam character (reduced in size)
			doorcam_video_y= myXML.doorcam_video_y;
			doorcam_video_scale = myXML.doorcam_video_scale;			
			thoughts_image_x = myXML.thoughts_image_x;
			thoughts_image_y = myXML.thoughts_image_y;
			thoughts_image_rotate = myXML.thoughts_image_rotate;
			thoughts_image_scale = myXML.thoughts_image_scale;			
			
			webcam_on = myXML.webcam_on;
			webcam_width = myXML.webcam_width;
			webcam_height = myXML.webcam_height;
			webcam_fps = myXML.webcam_fps;
			
			picasa_id_input.text = myXML.google_id;	
			google_id =  myXML.google_id;
			album_url.text = myXML.picasa_album_url;
			album_id.text = myXML.picasa_album_id;	
			album_name.text = myXML.picasa_album_name;
			
			// if (myXML.webcam_on == "on") {	
				//_setupCamera();		
			//  }
			
			//if (internet == 1) {			
			//	if (picasa_id_input.text != "") {
			//		var album_responder : PicasaResponder = service.albums.list(google_id);
			//		album_responder.addEventListener(PicasaDataEvent.DATA, RefreshAlbums);
			//		album_responder.addEventListener(ErrorEvent.ERROR, AlbumLoadError);
			//		album_responder.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHTTPStatus);	
			//	}
			//	
			//	if (album_url.text != "") { //if the URL is not blank, then show album thumbnail
			//		URLString = album_url.text;
			//		AlbumThumb.source = URLString;
			//	}
			//
			//	AlbumRefreshButton.addEventListener(MouseEvent.CLICK, RefreshAlbumsButtonClicked);
			//
			//pic.visible = false;
			
			weather_zip = myXML.weather_zip; //sets zip code for the weather
			weather_reading = myXML.weather_reading;		
			good_weather_threshold = myXML.good_weather_threshold;			
					
			////*** this we only have to do once since the stocks cannot be dynamically changed after the program has started
			var stockArray:Array = new Array();
			var i:int = 0;
			for each (var item:XML in myXML.stocks.symbol)
					{
						stockArray.push(myXML.stocks.symbol[i]);
						i++;
					}
			num_stocks = stockArray.length;
			stock_string = stockArray.join("+");
			trace (stock_string);						
			////*****************************************************************
			stockLoader = new URLLoader();
			stockLoader.addEventListener(Event.COMPLETE, stockLoaded);	  
				
			WeatherLoader = new URLLoader();		
			WeatherLoader.addEventListener(Event.COMPLETE, WeatherXMLLoaded);								
			pictLdr.contentLoaderInfo.addEventListener(Event.COMPLETE,imgLoaded);
			Frame_Loader.contentLoaderInfo.addEventListener(Event.COMPLETE,FrameImageLoaded);
			Beer_Loader.contentLoaderInfo.addEventListener(Event.COMPLETE,BeerImageLoaded);
			TwitterBird_Loader.contentLoaderInfo.addEventListener(Event.COMPLETE,TwitterBirdImageLoaded);
			Lip1_Loader.contentLoaderInfo.addEventListener(Event.COMPLETE,Lip1ImageLoaded);
			
			//io/network event handlers in case a problem loading URL *****
			stockLoader.addEventListener(IOErrorEvent.IO_ERROR, stockLoaderioErrorHandler);			
			WeatherLoader.addEventListener(IOErrorEvent.IO_ERROR, WeatherLoaderioErrorHandler);
			pictLdr.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, pictLdrioErrorHandler);		
			Frame_Loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, Frame_LoaderioErrorHandler);		
			Beer_Loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, Beer_LoaderioErrorHandler);	
			TwitterBird_Loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, TwitterBird_LoaderioErrorHandler);	
			Lip1_Loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, Lip1_LoaderioErrorHandler);		
			//*************************************************************
			myVid_bigger.addEventListener(MouseEvent.CLICK,myVid_bigger_event);
			myVid_smaller.addEventListener(MouseEvent.CLICK,myVid_smaller_event);
			
			////if (internet == 1) {
			//	AlbumRefreshButton.addEventListener(MouseEvent.CLICK, RefreshAlbumsButtonClicked);
			//	combo.addEventListener(Event.CHANGE, AlbumChanged);
			////}
			
		analog1_radio_on.addEventListener(Event.CHANGE, Analog1Changed);
		analog2_radio_on.addEventListener(Event.CHANGE, Analog2Changed);
		analog3_radio_on.addEventListener(Event.CHANGE, Analog3Changed);
		switch1_radio_on.addEventListener(Event.CHANGE, Digital1Changed);		
		switch2_radio_on.addEventListener(Event.CHANGE, Digital2Changed);
		switch3_radio_on.addEventListener(Event.CHANGE, Digital3Changed);
		switch4_radio_on.addEventListener(Event.CHANGE, Digital4Changed);
		switch5_radio_on.addEventListener(Event.CHANGE, Digital5Changed);
		
		quiz_mode_check.addEventListener(Event.CHANGE, QuizModeCheckChanged);	
		no_resize_check.addEventListener(Event.CHANGE, NoResizeCheckChanged);	
		photoboothProofPreview_check.addEventListener(Event.CHANGE, photoboothProofPreview_checkChanged);	
		photobooth_printing_check.addEventListener(Event.CHANGE, photobooth_printing_checkChanged);			
		
		mirror_mode_input.addEventListener(Event.CHANGE, CharacterChanged);	
		
		twitter_mode_rbg.addEventListener(Event.CHANGE, TwitterModeChanged);
		
		//positioningedit_radio_lipsync.addEventListener(Event.CHANGE, TwitterModeChanged);
		
		myVid.addEventListener(MetadataEvent.CUE_POINT , NavigationCuePoints);
		myVid.addEventListener(Event.COMPLETE, onClipDone);  // call the idle loop when a clip has finished playing
		myVid.addEventListener(fl.video.VideoEvent.SEEKED, onSeekedEvent); // Listen for seeked event			
		myVid2.addEventListener(Event.COMPLETE, onClipDone);
		    
	  var delay_temp = (startup_delay * 1000) + 2000; //at least 10s delay from when the sensors kick in, can make longer through startup delay in config program
	  var minuteTimer:Timer = new Timer(delay_temp, 1); //one time timer to set a delay before the analog sensors kick in
	  minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, secondDelayTimer);
	  minuteTimer.start();  
		  
	  updates_button.addEventListener(MouseEvent.CLICK,updates);
	  alcohol_help_button.addEventListener(MouseEvent.CLICK,alcohol_help_buttonEvent);
	  twitterAuthButton.addEventListener(MouseEvent.CLICK,twitterOauthEvent);
	  
	  //let the user know if the twitter authentication has already happened
	  if (myXML.twitter_authenticated == "yes") {
		  twitterAuthButton.label = "Change Twitter Account";
		  twitter_username_input.text = myXML.twitter_username;
	  }
	  else {
		  twitterAuthButton.label = "Link Twitter Account";
		  twitter_username_input.text = "";
	  }
	  
	  StockDisplayTextTimer.addEventListener(TimerEvent.TIMER_COMPLETE, StockDisplayTextTimerEvent);	
	  WeatherDisplayTextTimer.addEventListener(TimerEvent.TIMER_COMPLETE, WeatherDisplayTextTimerEvent);	
	  StockDisplayTextTimer5s.addEventListener(TimerEvent.TIMER_COMPLETE, StockDisplayTextTimerEvent5s);	
	  WeatherDisplayTextTimer5s.addEventListener(TimerEvent.TIMER_COMPLETE, WeatherDisplayTextTimerEvent5s);	
	//  doorcamLoadTimer.addEventListener(TimerEvent.TIMER_COMPLETE, doorcamLoaded);	
		  
	  SaveButton.addEventListener(MouseEvent.CLICK, saveValue);
	  myTimer.addEventListener(TimerEvent.TIMER, ClearOutputText);
	  
	  Stockdyntext.addEventListener(MouseEvent.MOUSE_DOWN, pickupStockText);
	  Stockdyntext.addEventListener(MouseEvent.MOUSE_UP, placeStockText);
	  
	  AlcoholResultsdyntext.addEventListener(MouseEvent.MOUSE_DOWN, pickupAlcoholResultsText);
	  AlcoholResultsdyntext.addEventListener(MouseEvent.MOUSE_UP, placeAlcoholResultsText);
		  
	//myVid.addEventListener( MouseEvent.MOUSE_DOWN, pickup ); //for drag and drop
	//myVid.addEventListener( MouseEvent.MOUSE_UP, place );
	  
	  WeatherdynImage.addEventListener(MouseEvent.MOUSE_DOWN, pickupWeatherImage);
	  WeatherdynImage.addEventListener(MouseEvent.MOUSE_UP, placeWeatherImage);
	  
	  BeerdynImage.addEventListener(MouseEvent.MOUSE_DOWN, pickupBeerImage);
	  BeerdynImage.addEventListener(MouseEvent.MOUSE_UP, placeBeerImage);
	  
	  TwitterBirddynImage.addEventListener(MouseEvent.MOUSE_DOWN, pickupTwitterBirdImage);
	  TwitterBirddynImage.addEventListener(MouseEvent.MOUSE_UP, placeTwitterBirdImage);
	  
	  FramedynImage.addEventListener(MouseEvent.MOUSE_DOWN, pickupWebcamImage);
	  FramedynImage.addEventListener(MouseEvent.MOUSE_UP, placeWebcamImage);
	   
	  Lip1dynImage.addEventListener(MouseEvent.MOUSE_DOWN, pickupLip1Image);
	  Lip1dynImage.addEventListener(MouseEvent.MOUSE_UP, placeLip1Image);
	   
	  Weatherdyntext.addEventListener(MouseEvent.MOUSE_DOWN, pickupWeatherText);
	  Weatherdyntext.addEventListener(MouseEvent.MOUSE_UP, placeWeatherText);
	  
	  move_leftButton.addEventListener(MouseEvent.CLICK, move_leftButtonEvent);
	  move_rightButton.addEventListener(MouseEvent.CLICK, move_rightButtonEvent);
	  move_upButton.addEventListener(MouseEvent.CLICK, move_upButtonEvent);
	  move_downButton.addEventListener(MouseEvent.CLICK, move_downButtonEvent);
	  
	  PositioningScreenButton.addEventListener(MouseEvent.CLICK, PositioningScreenButtonEvent);
	  PositioningScreenPicasaButton.addEventListener(MouseEvent.CLICK, PositioningScreenPicasaButtonEvent);
	  PositioningScreenDoorcamButton.addEventListener(MouseEvent.CLICK, PositioningScreenDoorcamButtonEvent);
	  goBackMain.addEventListener(MouseEvent.CLICK, goBackMainScreen);
	  BrowseAudioButton.addEventListener(MouseEvent.CLICK, browse_custom_audio_event);
	  BreathalyzerButton.addEventListener(MouseEvent.CLICK, BreathalyzerButtonEvent);
	  TTSButton.addEventListener(MouseEvent.CLICK, TTSButtonEvent);
	  photoboothButton.addEventListener(MouseEvent.CLICK, photoboothButtonEvent);
	  
	  
	  doorcamTimer = new Timer(doorcam_timer,1);
	  doorcamTimer.addEventListener(TimerEvent.TIMER_COMPLETE, doorcamTimerEvent);				
	  thoughtsLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,thoughtsLoaded);
	  var imagePath = homepath + "images/thoughts.png";
		 
	  thoughtsLoader.load(new URLRequest("file:///"+imagePath));	 
	  Frame_Loader.load(new URLRequest("file:///" + homepath + frame_selected));  //load it for the first time, it may be loaded again if the user changes from the dropdown box
	  Beer_Loader.load(new URLRequest("file:///" + homepath + "images/beer_icon.png"));  //load it for the
	  TwitterBird_Loader.load(new URLRequest("file:///" + homepath + "images/twitter_bird.png"));  //load it for the
	
	  Lip1_Loader.load(new URLRequest("file:///" + homepath + "images/lip1.png"));  //load it for the first time, it may be loaded again if the user changes from the dropdown box
	  
	  //lip1_url = homepath + "images/lip1.png";
	 // lip1_request =new URLRequest(lip1_url);			  
	 // lip1.load(lip1_request);		
	//  lip1.contentLoaderInfo.addEventListener(Event.COMPLETE, lip1Loaded);
	  
	  mode_select = mirror_mode;			
	  
	  stockUpdate();
	  weatherUpdate();
	  BuildMainUI();
	  initial_values();
	  BuildPositionUI();
	  BuildUI();
	
	  weather_display2.visible = false;
	  stock_display.visible = false;
	  weather_image.visible = false;
	  beer_image.visible = false;
	  twitterbird_image.visible = false;
	  frame.visible = false;
	  black_square.visible = false;
	  editing_mode = "main";
	  ipcamera_dropdown.addEventListener(Event.CHANGE, ipcamera_change_event);
	  doorcamedit_rbg.addEventListener(Event.CHANGE, doorcamedit_rbg_event);
	  //webcamvideo_rbg.addEventListener(Event.CHANGE, webcamvideoChanged);	
	  
	  webcamStealthCheck.addEventListener(Event.CHANGE, webcamStealthCheckChanged);	
	  display_mode_input.addEventListener(Event.CHANGE, DisplayModeChanged);	//this needs to be after buildUI because we don't want to overwrite any user customizable settings, only overwrite once someone clicks
	  frame_input.addEventListener(Event.CHANGE, FrameChanged);	//this needs to be after buildUI because we don't want to overwrite any user customizable settings, only overwrite once someone clicks
	  positioningedit_rbg.addEventListener(Event.CHANGE, PositioningRadioChanged);
	  
	  TTS_rbg_engine.addEventListener(Event.CHANGE, TTSEngineChanged);
	  
	  
	  } // ********end RunMirror initMediaPlayer function ***********
	     // wait for arduino to init and get data before calling the video select routines		
				
	private function BuildMainUI():void { //one time initial
				
		radiotext.color = 0xFFFFFF;
		radiotext.font = "Arial";
		radiotext.size = 12;	
		
		LabelTextFormat.font = "Arial";
		LabelTextFormat.size = "12";
		LabelTextFormat.color = 0xFFFFFF;			
	
		VersionTextFormat.font = "Arial";
		VersionTextFormat.size = "14";
		VersionTextFormat.color = 0x000000;	
		
		///**********Alcohol text ************************
		AlcoholTextFormat.font = myFont.fontName;
		AlcoholTextFormat.size = 45; 
		//AlcoholTextFormat.color = 0x000000; //black		
		AlcoholTextFormat.color = 0x3333ff; //blue
		
		AlcoholTextLabelFormat.font = myFont.fontName;
		AlcoholTextLabelFormat.size = 30;	
		AlcoholTextLabelFormat.color = 0xFFFFFF; //white	
		
		Breathalyzer_LabelFormat.font = myFont.fontName;
		Breathalyzer_LabelFormat.size = 40;	
		Breathalyzer_LabelFormat.color = 0xFFFFFF; //white	
		
		Breathalyzer_WarningLabelFormat.font = myFont.fontName;
		Breathalyzer_WarningLabelFormat.size = 15;	
		Breathalyzer_WarningLabelFormat.color =  0xFF0033; //white	
		
		TTSTextFormat.font = myFont.fontName;
		TTSTextFormat.size = 14;	
		TTSTextFormat.color = 0x000000; 
		
		HomeTextFormat.font = "Arial";
		HomeTextFormat.size = 11;	
		HomeTextFormat.color = 0x000000; //black	
		
		TTSTextLabelFormat.font = myFont.fontName;
		TTSTextLabelFormat.size = 14;	
		TTSTextLabelFormat.color = 0xFFFFFF; //white	
		
		photoboothTextLabelFormat.font = myFont.fontName;
		photoboothTextLabelFormat.size = 14;	
		photoboothTextLabelFormat.color = 0xFFFFFF; //white	
				
		BlueTextLabelFormat.font = myFont.fontName;
		BlueTextLabelFormat.size = 14;	
		BlueTextLabelFormat.color = 0x0000FF; //blue	
		
		TTS_Screen_LabelFormat.font = myFont.fontName;
		TTS_Screen_LabelFormat.size = 20;	
		TTS_Screen_LabelFormat.color =  0xFFFFFF; //white	
		
		photobooth_Screen_LabelFormat.font = myFont.fontName;
		photobooth_Screen_LabelFormat.size = 36;	
		photobooth_Screen_LabelFormat.color =  0xFFFFFF; //white	
		
		Breathalyzer_Label.embedFonts = true;
		Breathalyzer_Label.antiAliasType = AntiAliasType.ADVANCED;
		Breathalyzer_Label.defaultTextFormat = Breathalyzer_LabelFormat;
		Breathalyzer_Label.x = 50;
		Breathalyzer_Label.y = 20;
		Breathalyzer_Label.width = 600;
		Breathalyzer_Label.height = 60;
		Breathalyzer_Label.text = "BREATHALYZER CALIBRATION";			
		addChild(Breathalyzer_Label);	
		Breathalyzer_Label.visible = false;
		
		Breathalyzer_WarningLabel.embedFonts = true;
		Breathalyzer_WarningLabel.antiAliasType = AntiAliasType.ADVANCED;
		Breathalyzer_WarningLabel.defaultTextFormat = Breathalyzer_WarningLabelFormat;
		Breathalyzer_WarningLabel.x = 50;
		Breathalyzer_WarningLabel.y = 90;
		Breathalyzer_WarningLabel.width = 1000;
		Breathalyzer_WarningLabel.height = 60;
		Breathalyzer_WarningLabel.text = "THE MAGIC MIRROR BREATHALYZER IS NOT A PROFESSIONAL BREATHALYZER AND SHOULD BE USED FOR NOVELTY PURPOSES ONLY";			
		addChild(Breathalyzer_WarningLabel);	
		Breathalyzer_WarningLabel.visible = false;
		
		alcohol_baseline_text.embedFonts = true;
		alcohol_baseline_text.selectable = true;	
		alcohol_baseline_text.type = TextFieldType.INPUT;
		alcohol_baseline_text.background = true;
		alcohol_baseline_text.backgroundColor = 0xFFFFFF; //white
		alcohol_baseline_text.restrict = "0-9";		
		alcohol_baseline_text.antiAliasType = AntiAliasType.ADVANCED;
		alcohol_baseline_text.defaultTextFormat = AlcoholTextFormat;
		alcohol_baseline_text.x = 600;
		alcohol_baseline_text.y = 130;
		alcohol_baseline_text.width = 104;
		alcohol_baseline_text.height = 60;
		alcohol_baseline_text.text = myXML.alcohol_baseline;			
		addChild(alcohol_baseline_text);	
		alcohol_baseline_text.visible = false;
		
		alcohol_baseline_difference_allowance_text.embedFonts = true;
		alcohol_baseline_difference_allowance_text.selectable = true;		
		alcohol_baseline_difference_allowance_text.type = TextFieldType.INPUT;
		alcohol_baseline_difference_allowance_text.background = true;
		alcohol_baseline_difference_allowance_text.backgroundColor = 0xFFFFFF; //white
		alcohol_baseline_difference_allowance_text.restrict = "0-9";		
		alcohol_baseline_difference_allowance_text.antiAliasType = AntiAliasType.ADVANCED;	
		alcohol_baseline_difference_allowance_text.defaultTextFormat = AlcoholTextFormat;
		alcohol_baseline_difference_allowance_text.x = 600;
		alcohol_baseline_difference_allowance_text.y = 200;
		alcohol_baseline_difference_allowance_text.width = 104;
		alcohol_baseline_difference_allowance_text.height = 60;
		alcohol_baseline_difference_allowance_text.text = myXML.alcohol_baseline_difference_allowance;
		addChild(alcohol_baseline_difference_allowance_text);		
		alcohol_baseline_difference_allowance_text.visible = false;
		
		alcohol_level1_text.embedFonts = true;
		alcohol_level1_text.selectable = true;	
		alcohol_level1_text.type = TextFieldType.INPUT;
		alcohol_level1_text.background = true;
		alcohol_level1_text.backgroundColor = 0xFFFFFF; //white
		alcohol_level1_text.restrict = "0-9";		
		alcohol_level1_text.antiAliasType = AntiAliasType.ADVANCED;	
		alcohol_level1_text.defaultTextFormat = AlcoholTextFormat;
		alcohol_level1_text.x = 600;
		alcohol_level1_text.y = 270;
		alcohol_level1_text.width = 104;
		alcohol_level1_text.height = 60;
		alcohol_level1_text.text = myXML.alcohol_level1;
		addChild(alcohol_level1_text);		
		alcohol_level1_text.visible = false;
		
		alcohol_level2_text.embedFonts = true;
		alcohol_level2_text.selectable = true;
		alcohol_level2_text.type = TextFieldType.INPUT;
		alcohol_level2_text.background = true;
		alcohol_level2_text.backgroundColor = 0xFFFFFF; //white
		alcohol_level2_text.restrict = "0-9";		
		alcohol_level2_text.antiAliasType = AntiAliasType.ADVANCED;	
		alcohol_level2_text.defaultTextFormat = AlcoholTextFormat;
		alcohol_level2_text.x = 600;
		alcohol_level2_text.y = 340;
		alcohol_level2_text.width = 104;
		alcohol_level2_text.height = 60;
		alcohol_level2_text.text = myXML.alcohol_level2;
		addChild(alcohol_level2_text);		
		alcohol_level2_text.visible = false;
		
		alcohol_level3_text.embedFonts = true;
		alcohol_level3_text.selectable = true;	
		alcohol_level3_text.type = TextFieldType.INPUT;
		alcohol_level3_text.background = true;
		alcohol_level3_text.backgroundColor = 0xFFFFFF; //white
		alcohol_level3_text.restrict = "0-9";		
		alcohol_level3_text.antiAliasType = AntiAliasType.ADVANCED;	
		alcohol_level3_text.defaultTextFormat = AlcoholTextFormat;
		alcohol_level3_text.x = 600;
		alcohol_level3_text.y = 410;
		alcohol_level3_text.width = 104;
		alcohol_level3_text.height = 60;
		alcohol_level3_text.text = myXML.alcohol_level3;
		addChild(alcohol_level3_text);		
		alcohol_level3_text.visible = false;
		
		alcohol_countdown_text.embedFonts = true;
		alcohol_countdown_text.selectable = true;	
		alcohol_countdown_text.type = TextFieldType.INPUT;
		alcohol_countdown_text.background = true;
		alcohol_countdown_text.backgroundColor = 0xFFFFFF; //white
		alcohol_countdown_text.restrict = "0-9";		
		alcohol_countdown_text.antiAliasType = AntiAliasType.ADVANCED;	
		alcohol_countdown_text.defaultTextFormat = AlcoholTextFormat;
		alcohol_countdown_text.x = 600;
		alcohol_countdown_text.y = 480;
		alcohol_countdown_text.width = 104;
		alcohol_countdown_text.height = 60;
		alcohol_countdown_text.text = myXML.alcohol_countdown;
		addChild(alcohol_countdown_text);		
		alcohol_countdown_text.visible = false;
		
		alcohol_baseline_label.embedFonts = true;
		alcohol_baseline_label.antiAliasType = AntiAliasType.ADVANCED;
		alcohol_baseline_label.defaultTextFormat = AlcoholTextLabelFormat;
		alcohol_baseline_label.x = 50;
		alcohol_baseline_label.y = 130;
		alcohol_baseline_label.width = 500;
		alcohol_baseline_label.height = 60;
		alcohol_baseline_label.text = "Baseline Idle Value";			
		addChild(alcohol_baseline_label);	
		alcohol_baseline_label.visible = false;
		
		alcohol_baseline_difference_allowance_label.embedFonts = true;
		alcohol_baseline_difference_allowance_label.antiAliasType = AntiAliasType.ADVANCED;	
		alcohol_baseline_difference_allowance_label.defaultTextFormat = AlcoholTextLabelFormat;
		alcohol_baseline_difference_allowance_label.x = 50;
		alcohol_baseline_difference_allowance_label.y = 200;
		alcohol_baseline_difference_allowance_label.width = 500;
		alcohol_baseline_difference_allowance_label.height = 60;
		alcohol_baseline_difference_allowance_label.text = " Difference Allowance";
		addChild(alcohol_baseline_difference_allowance_label);		
		alcohol_baseline_difference_allowance_label.visible = false;
		
		alcohol_level1_label.embedFonts = true;
		alcohol_level1_label.antiAliasType = AntiAliasType.ADVANCED;	
		alcohol_level1_label.defaultTextFormat = AlcoholTextLabelFormat;
		alcohol_level1_label.x = 50;
		alcohol_level1_label.y = 270;
		alcohol_level1_label.width = 500;
		alcohol_level1_label.height = 60;
		alcohol_level1_label.text = "Few Drinks Offset";
		addChild(alcohol_level1_label);		
		alcohol_level1_label.visible = false;
		
		alcohol_level2_label.embedFonts = true;
		alcohol_level2_label.antiAliasType = AntiAliasType.ADVANCED;	
		alcohol_level2_label.defaultTextFormat = AlcoholTextLabelFormat;
		alcohol_level2_label.x = 50;
		alcohol_level2_label.y = 340;
		alcohol_level2_label.width = 500;
		alcohol_level2_label.height = 60;
		alcohol_level2_label.text = "Buzzed Offset";
		addChild(alcohol_level2_label);		
		alcohol_level2_label.visible = false;
		
		alcohol_level3_label.embedFonts = true;
		alcohol_level3_label.antiAliasType = AntiAliasType.ADVANCED;	
		alcohol_level3_label.defaultTextFormat = AlcoholTextLabelFormat;
		alcohol_level3_label.x = 50;
		alcohol_level3_label.y = 410;
		alcohol_level3_label.width = 500;
		alcohol_level3_label.height = 60;
		alcohol_level3_label.text = "Flat Out Drunk Offset";
		addChild(alcohol_level3_label);		
		alcohol_level3_label.visible = false;
		
		alcohol_countdown_label.embedFonts = true;
		alcohol_countdown_label.antiAliasType = AntiAliasType.ADVANCED;	
		alcohol_countdown_label.defaultTextFormat = AlcoholTextLabelFormat;
		alcohol_countdown_label.x = 50;
		alcohol_countdown_label.y = 480;
		alcohol_countdown_label.width = 500;
		alcohol_countdown_label.height = 60;
		alcohol_countdown_label.text = "Countdown (Seconds)";
		addChild(alcohol_countdown_label);		
		alcohol_countdown_label.visible = false;
		
		drink1_tweet_label.embedFonts = true;
		drink1_tweet_label.antiAliasType = AntiAliasType.ADVANCED;
		drink1_tweet_label.defaultTextFormat = TTSTextLabelFormat;
		drink1_tweet_label.x = 50;
		drink1_tweet_label.y = 560;
		drink1_tweet_label.width = 200;
		drink1_tweet_label.height = 18;
		drink1_tweet_label.text = "Tweet to send for No Drinks";			
		addChild(drink1_tweet_label);	
		drink1_tweet_label.visible = false;
		
		drink1_tweet.embedFonts = true;
		drink1_tweet.selectable = true;	
		drink1_tweet.type = TextFieldType.INPUT;
		drink1_tweet.background = true;
		drink1_tweet.backgroundColor = 0xFFFFFF; //white
		drink1_tweet.maxChars = 140;		
		drink1_tweet.antiAliasType = AntiAliasType.ADVANCED;	
		drink1_tweet.defaultTextFormat = TTSTextFormat;
		drink1_tweet.x = 300;
		drink1_tweet.y = 560;
		drink1_tweet.width = 700;
		drink1_tweet.height = 18;
		drink1_tweet.text = myXML.twitter_drink1;
		addChild(drink1_tweet);		
		drink1_tweet.visible = false;
		
		drink2_tweet_label.embedFonts = true;
		drink2_tweet_label.antiAliasType = AntiAliasType.ADVANCED;
		drink2_tweet_label.defaultTextFormat = TTSTextLabelFormat;
		drink2_tweet_label.x = 50;
		drink2_tweet_label.y = 580;
		drink2_tweet_label.width = 200;
		drink2_tweet_label.height = 18;
		drink2_tweet_label.text = "Tweet to send for a Few Drinks";			
		addChild(drink2_tweet_label);	
		drink2_tweet_label.visible = false;
		
		drink2_tweet.embedFonts = true;
		drink2_tweet.selectable = true;	
		drink2_tweet.type = TextFieldType.INPUT;
		drink2_tweet.background = true;
		drink2_tweet.backgroundColor = 0xFFFFFF; //white
		drink2_tweet.maxChars = 140;		
		drink2_tweet.antiAliasType = AntiAliasType.ADVANCED;	
		drink2_tweet.defaultTextFormat = TTSTextFormat;
		drink2_tweet.x = 300;
		drink2_tweet.y = 580;
		drink2_tweet.width = 700;
		drink2_tweet.height = 18;
		drink2_tweet.text = myXML.twitter_drink2;
		addChild(drink2_tweet);		
		drink2_tweet.visible = false;
		
		drink3_tweet_label.embedFonts = true;
		drink3_tweet_label.antiAliasType = AntiAliasType.ADVANCED;
		drink3_tweet_label.defaultTextFormat = TTSTextLabelFormat;
		drink3_tweet_label.x = 50;
		drink3_tweet_label.y = 600;
		drink3_tweet_label.width = 200;
		drink3_tweet_label.height = 18;
		drink3_tweet_label.text = "Tweet to send for Buzzed";			
		addChild(drink3_tweet_label);	
		drink3_tweet_label.visible = false;
		
		drink3_tweet.embedFonts = true;
		drink3_tweet.selectable = true;	
		drink3_tweet.type = TextFieldType.INPUT;
		drink3_tweet.background = true;
		drink3_tweet.backgroundColor = 0xFFFFFF; //white
		drink3_tweet.maxChars = 140;		
		drink3_tweet.antiAliasType = AntiAliasType.ADVANCED;	
		drink3_tweet.defaultTextFormat = TTSTextFormat;
		drink3_tweet.x = 300;
		drink3_tweet.y = 600;
		drink3_tweet.width = 700;
		drink3_tweet.height = 18;
		drink3_tweet.text = myXML.twitter_drink3;
		addChild(drink3_tweet);		
		drink3_tweet.visible = false;
		
		drink4_tweet_label.embedFonts = true;
		drink4_tweet_label.antiAliasType = AntiAliasType.ADVANCED;
		drink4_tweet_label.defaultTextFormat = TTSTextLabelFormat;
		drink4_tweet_label.x = 50;
		drink4_tweet_label.y = 620;
		drink4_tweet_label.width = 200;
		drink4_tweet_label.height = 18;
		drink4_tweet_label.text = "Tweet to send for Drunk";			
		addChild(drink4_tweet_label);	
		drink4_tweet_label.visible = false;
		
		drink4_tweet.embedFonts = true;
		drink4_tweet.selectable = true;	
		drink4_tweet.type = TextFieldType.INPUT;
		drink4_tweet.background = true;
		drink4_tweet.backgroundColor = 0xFFFFFF; //white
		drink4_tweet.maxChars = 140;		
		drink4_tweet.antiAliasType = AntiAliasType.ADVANCED;	
		drink4_tweet.defaultTextFormat = TTSTextFormat;
		drink4_tweet.x = 300;
		drink4_tweet.y = 620;
		drink4_tweet.width = 700;
		drink4_tweet.height = 18;
		drink4_tweet.text = myXML.twitter_drink4;
		addChild(drink4_tweet);		
		drink4_tweet.visible = false;
		
		Tweet_Breathalyzer_Value_check.x = 50;
		Tweet_Breathalyzer_Value_check.y = 640;
		Tweet_Breathalyzer_Value_check.width = 100;
		Tweet_Breathalyzer_Value_check.height = 22;		
		Tweet_Breathalyzer_Value_check.textField.autoSize = TextFieldAutoSize.LEFT;
		Tweet_Breathalyzer_Value_check.setStyle("textFormat", radiotext);
		Tweet_Breathalyzer_Value_check.label = "Append Alcohol Level Reading to Tweet"; 
		addChild(Tweet_Breathalyzer_Value_check);
		Tweet_Breathalyzer_Value_check.visible = false;		 
		
		Display_Breathalyzer_Value_check.x = 850.6;
		Display_Breathalyzer_Value_check.y = 140;
		Display_Breathalyzer_Value_check.width = 180;
		Display_Breathalyzer_Value_check.height = 22;		
		Display_Breathalyzer_Value_check.textField.autoSize = TextFieldAutoSize.LEFT;
		Display_Breathalyzer_Value_check.setStyle("textFormat", HomeTextFormat);
		Display_Breathalyzer_Value_check.label = "Display Alcohol Reading"; 
		addChild(Display_Breathalyzer_Value_check); 
		
		BreathalyzerNoSwitch_check.x = 50;
		BreathalyzerNoSwitch_check.y = 660;
		BreathalyzerNoSwitch_check.width = 100;
		BreathalyzerNoSwitch_check.height = 22;		
		BreathalyzerNoSwitch_check.textField.autoSize = TextFieldAutoSize.LEFT;
		BreathalyzerNoSwitch_check.setStyle("textFormat", radiotext);
		BreathalyzerNoSwitch_check.label = "Breathalyzer can go off also without Switch 5 trigger"; 
		addChild(BreathalyzerNoSwitch_check);
		BreathalyzerNoSwitch_check.visible = false;		
		
		alcohol_help_button.x = 670;
		alcohol_help_button.y = 10;
		alcohol_help_button.width = 200;
		alcohol_help_button.height = 60;
		alcohol_help_button.label = "Breathalyzer Calibration Help";
		addChild(alcohol_help_button);
		alcohol_help_button.visible = false;
 
		TTS_Screen_Label.embedFonts = true;
		TTS_Screen_Label.antiAliasType = AntiAliasType.ADVANCED;
		TTS_Screen_Label.defaultTextFormat = TTS_Screen_LabelFormat;
		TTS_Screen_Label.x = 10;
		TTS_Screen_Label.y = 10;
		TTS_Screen_Label.width = 600;
		TTS_Screen_Label.height = 22;
		TTS_Screen_Label.text = "Custom Audio (MP3) & Text to Speech Settings";	
		TTS_Screen_Label.text = "Custom Audio (MP3)";	
		//TTS_Screen_Label.text = "Text to Speech Settings";			
		addChild(TTS_Screen_Label);	
		TTS_Screen_Label.visible = false;
		
		photobooth_Screen_Label.embedFonts = true;
		photobooth_Screen_Label.antiAliasType = AntiAliasType.ADVANCED;
		photobooth_Screen_Label.defaultTextFormat = photobooth_Screen_LabelFormat;
		photobooth_Screen_Label.x = 77.50;
		photobooth_Screen_Label.y = 55;
		photobooth_Screen_Label.width = 500;
		photobooth_Screen_Label.height = 40;
		photobooth_Screen_Label.text = "Photobooth Settings";	
		addChild(photobooth_Screen_Label);	
		photobooth_Screen_Label.visible = false;		
		
		tts_feature_label.embedFonts = true;
		tts_feature_label.antiAliasType = AntiAliasType.ADVANCED;
		tts_feature_label.defaultTextFormat = TTSTextLabelFormat;
		tts_feature_label.x = 10;
		tts_feature_label.y = 40;
		tts_feature_label.width = 200;
		tts_feature_label.height = 18;
		tts_feature_label.text = "Text to Speech (TTS)"; //this title no longer used	
		addChild(tts_feature_label);	
		tts_feature_label.visible = false;
		
		tts_url_label.embedFonts = true;
		tts_url_label.antiAliasType = AntiAliasType.ADVANCED;
		tts_url_label.defaultTextFormat = TTSTextLabelFormat;
		tts_url_label.x = 10;
		tts_url_label.y = 70;
		tts_url_label.width = 200;
		tts_url_label.height = 18;
		tts_url_label.text = "TTS Web Service URL";			
		addChild(tts_url_label);	
		tts_url_label.visible = false;
		
		tts_url.embedFonts = true;
		tts_url.selectable = true;	
		tts_url.type = TextFieldType.INPUT;
		tts_url.background = true;
		tts_url.backgroundColor = 0xFFFFFF; //white
		tts_url.antiAliasType = AntiAliasType.ADVANCED;
		tts_url.defaultTextFormat = TTSTextFormat;
		tts_url.x = 200;
		tts_url.y = 70;
		tts_url.width = 600;
		tts_url.height = 18;
		tts_url.text = myXML.tts_url;			
		addChild(tts_url);	
		tts_url.visible = false;
		
		tts_engine_label.embedFonts = true;
		tts_engine_label.antiAliasType = AntiAliasType.ADVANCED;
		tts_engine_label.defaultTextFormat = TTSTextLabelFormat;
		tts_engine_label.x = 10;
		tts_engine_label.y = 60;
		tts_engine_label.width = 100;
		tts_engine_label.height = 18;
		tts_engine_label.text = "TTS Engine";			
		addChild(tts_engine_label);	
		tts_engine_label.visible = false;
		
		tts_language_label.embedFonts = true;
		tts_language_label.antiAliasType = AntiAliasType.ADVANCED;
		tts_language_label.defaultTextFormat = TTSTextLabelFormat;
		tts_language_label.x = 10;
		tts_language_label.y = 80;
		tts_language_label.width = 200;
		tts_language_label.height = 18;
		tts_language_label.text = "TTS Language";			
		addChild(tts_language_label);	
		tts_language_label.visible = false;
		
		TTS_languages_dropdown.dropdownWidth = 210; 
		TTS_languages_dropdown.width = 200;  
		TTS_languages_dropdown.x = 200;  
		TTS_languages_dropdown.y = 80;  		
		//TTS_languages_dropdown.prompt = "Select Language"; 
		//TTS_languages_dropdown.addEventListener(Event.CHANGE, changeHandler); 
		addChild(TTS_languages_dropdown); 
		TTS_languages_dropdown.visible = false;
		
		tts_api_key_label.embedFonts = true;   //to do 
		tts_api_key_label.antiAliasType = AntiAliasType.ADVANCED;
		tts_api_key_label.defaultTextFormat = TTSTextLabelFormat;
		tts_api_key_label.x = 10;
		tts_api_key_label.y = 125;
		tts_api_key_label.width = 200;
		tts_api_key_label.height = 18;
		tts_api_key_label.text = "Voice RSS API Key";			
		addChild(tts_api_key_label);	
		tts_api_key_label.visible = false;
		
		tts_api_key.embedFonts = true;
		tts_api_key.selectable = true;	
		tts_api_key.type = TextFieldType.INPUT;
		tts_api_key.background = true;
		tts_api_key.backgroundColor = 0xFFFFFF; //white
		tts_api_key.maxChars = 100;		
		tts_api_key.antiAliasType = AntiAliasType.ADVANCED;
		tts_api_key.defaultTextFormat = TTSTextFormat;
		tts_api_key.x = 200;
		tts_api_key.y = 125;
		tts_api_key.width = 250;
		tts_api_key.height = 18;
		tts_api_key.text = myXML.ttsrss_apikey;			
		addChild(tts_api_key);	
		tts_api_key.visible = false;
		
		tts_api_key_labelYakitome.embedFonts = true;   //to do 
		tts_api_key_labelYakitome.antiAliasType = AntiAliasType.ADVANCED;
		tts_api_key_labelYakitome.defaultTextFormat = TTSTextLabelFormat;
		tts_api_key_labelYakitome.x = 480;
		tts_api_key_labelYakitome.y = 125;
		tts_api_key_labelYakitome.width = 170;
		tts_api_key_labelYakitome.height = 18;
		tts_api_key_labelYakitome.text = "Yakitome API Key";			
		addChild(tts_api_key_labelYakitome);	
		tts_api_key_labelYakitome.visible = false;
		
		tts_api_keyYakitome.embedFonts = true;
		tts_api_keyYakitome.selectable = true;	
		tts_api_keyYakitome.type = TextFieldType.INPUT;
		tts_api_keyYakitome.background = true;
		tts_api_keyYakitome.backgroundColor = 0xFFFFFF; //white
		tts_api_keyYakitome.maxChars = 100;		
		tts_api_keyYakitome.antiAliasType = AntiAliasType.ADVANCED;
		tts_api_keyYakitome.defaultTextFormat = TTSTextFormat;
		tts_api_keyYakitome.x = 620;
		tts_api_keyYakitome.y = 125;
		tts_api_keyYakitome.width = 240;
		tts_api_keyYakitome.height = 18;
		tts_api_keyYakitome.text = myXML.ttsyakitome_api_key;			
		addChild(tts_api_keyYakitome);	
		tts_api_keyYakitome.visible = false;
		
		proximity1_tts_label.embedFonts = true;
		proximity1_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		proximity1_tts_label.defaultTextFormat = TTSTextLabelFormat;
		proximity1_tts_label.x = 10;
		proximity1_tts_label.y = 150;
		proximity1_tts_label.width = 200;
		proximity1_tts_label.height = 18;
		proximity1_tts_label.text = "Proximity 1 Response";			
		addChild(proximity1_tts_label);	
		proximity1_tts_label.visible = false;
		
		proximity1_tts.embedFonts = true;
		proximity1_tts.selectable = true;	
		proximity1_tts.type = TextFieldType.INPUT;
		proximity1_tts.background = true;
		proximity1_tts.backgroundColor = 0xFFFFFF; //white
		proximity1_tts.maxChars = 100;		
		proximity1_tts.antiAliasType = AntiAliasType.ADVANCED;
		proximity1_tts.defaultTextFormat = TTSTextFormat;
		proximity1_tts.x = 200;
		proximity1_tts.y = 150;
		proximity1_tts.width = 800;
		proximity1_tts.height = 18;
		proximity1_tts.text = myXML.proximity1_tts;			
		addChild(proximity1_tts);	
		proximity1_tts.visible = false;
		
		proximity2_tts_label.embedFonts = true;
		proximity2_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		proximity2_tts_label.defaultTextFormat = TTSTextLabelFormat;
		proximity2_tts_label.x = 10;
		proximity2_tts_label.y = 170;
		proximity2_tts_label.width = 200;
		proximity2_tts_label.height = 18;
		proximity2_tts_label.text = "Proximity 2 Response";			
		addChild(proximity2_tts_label);	
		proximity2_tts_label.visible = false;
		
		proximity2_tts.embedFonts = true;
		proximity2_tts.selectable = true;	
		proximity2_tts.type = TextFieldType.INPUT;
		proximity2_tts.background = true;
		proximity2_tts.backgroundColor = 0xFFFFFF; //white
		proximity2_tts.maxChars = 100;		
		proximity2_tts.antiAliasType = AntiAliasType.ADVANCED;	
		proximity2_tts.defaultTextFormat = TTSTextFormat;
		proximity2_tts.x = 200;
		proximity2_tts.y = 170;
		proximity2_tts.width = 800;
		proximity2_tts.height = 18;
		proximity2_tts.text = myXML.proximity2_tts;
		addChild(proximity2_tts);		
		proximity2_tts.visible = false;
		
		proximity3_tts_label.embedFonts = true;
		proximity3_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		proximity3_tts_label.defaultTextFormat = TTSTextLabelFormat;
		proximity3_tts_label.x = 10;
		proximity3_tts_label.y = 190;
		proximity3_tts_label.width = 200;
		proximity3_tts_label.height = 18;
		proximity3_tts_label.text = "Proximity 3 Response";			
		addChild(proximity3_tts_label);	
		proximity3_tts_label.visible = false;
		
		proximity3_tts.embedFonts = true;
		proximity3_tts.selectable = true;	
		proximity3_tts.type = TextFieldType.INPUT;
		proximity3_tts.background = true;
		proximity3_tts.backgroundColor = 0xFFFFFF; //white
		proximity3_tts.maxChars = 100;		
		proximity3_tts.antiAliasType = AntiAliasType.ADVANCED;	
		proximity3_tts.defaultTextFormat = TTSTextFormat;
		proximity3_tts.x = 200;
		proximity3_tts.y = 190;
		proximity3_tts.width = 800;
		proximity3_tts.height = 18;
		proximity3_tts.text = myXML.proximity3_tts;
		addChild(proximity3_tts);		
		proximity3_tts.visible = false;
		
		weather_good_tts_label.embedFonts = true;
		weather_good_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		weather_good_tts_label.defaultTextFormat = TTSTextLabelFormat;
		weather_good_tts_label.x = 10;
		weather_good_tts_label.y = 210;
		weather_good_tts_label.width = 200;
		weather_good_tts_label.height = 18;
		weather_good_tts_label.text = "Weather Good Day";			
		addChild(weather_good_tts_label);	
		weather_good_tts_label.visible = false;
		
		weather_good_tts.embedFonts = true;
		weather_good_tts.selectable = true;	
		weather_good_tts.type = TextFieldType.INPUT;
		weather_good_tts.background = true;
		weather_good_tts.backgroundColor = 0xFFFFFF; //white
		weather_good_tts.maxChars = 60;		
		weather_good_tts.antiAliasType = AntiAliasType.ADVANCED;	
		weather_good_tts.defaultTextFormat = TTSTextFormat;
		weather_good_tts.x = 200;
		weather_good_tts.y = 210;
		weather_good_tts.width = 800;
		weather_good_tts.height = 18;
		weather_good_tts.text = myXML.weather_good_tts;
		addChild(weather_good_tts);		
		weather_good_tts.visible = false;
		
		weather_ok_tts_label.embedFonts = true;
		weather_ok_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		weather_ok_tts_label.defaultTextFormat = TTSTextLabelFormat;
		weather_ok_tts_label.x = 10;
		weather_ok_tts_label.y = 230;
		weather_ok_tts_label.width = 200;
		weather_ok_tts_label.height = 18;
		weather_ok_tts_label.text = "Weather OK Day";			
		addChild(weather_ok_tts_label);	
		weather_ok_tts_label.visible = false;
		
		weather_ok_tts.embedFonts = true;
		weather_ok_tts.selectable = true;	
		weather_ok_tts.type = TextFieldType.INPUT;
		weather_ok_tts.background = true;
		weather_ok_tts.backgroundColor = 0xFFFFFF; //white
		weather_ok_tts.maxChars = 60;		
		weather_ok_tts.antiAliasType = AntiAliasType.ADVANCED;	
		weather_ok_tts.defaultTextFormat = TTSTextFormat;
		weather_ok_tts.x = 200;
		weather_ok_tts.y = 230;
		weather_ok_tts.width = 800;
		weather_ok_tts.height = 18;
		weather_ok_tts.text = myXML.weather_ok_tts;
		addChild(weather_ok_tts);		
		weather_ok_tts.visible = false;
		
		weather_rain_tts_label.embedFonts = true;
		weather_rain_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		weather_rain_tts_label.defaultTextFormat = TTSTextLabelFormat;
		weather_rain_tts_label.x = 10;
		weather_rain_tts_label.y = 250;
		weather_rain_tts_label.width = 200;
		weather_rain_tts_label.height = 18;
		weather_rain_tts_label.text = "Weather Raindy Day";			
		addChild(weather_rain_tts_label);	
		weather_rain_tts_label.visible = false;
		
		weather_rain_tts.embedFonts = true;
		weather_rain_tts.selectable = true;	
		weather_rain_tts.type = TextFieldType.INPUT;
		weather_rain_tts.background = true;
		weather_rain_tts.backgroundColor = 0xFFFFFF; //white
		weather_rain_tts.maxChars = 60;		
		weather_rain_tts.antiAliasType = AntiAliasType.ADVANCED;	
		weather_rain_tts.defaultTextFormat = TTSTextFormat;
		weather_rain_tts.x = 200;
		weather_rain_tts.y = 250;
		weather_rain_tts.width = 800;
		weather_rain_tts.height = 18;
		weather_rain_tts.text = myXML.weather_rain_tts;
		addChild(weather_rain_tts);		
		weather_rain_tts.visible = false;
		
		no_internet_tts_label.embedFonts = true;
		no_internet_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		no_internet_tts_label.defaultTextFormat = TTSTextLabelFormat;
		no_internet_tts_label.x = 10;
		no_internet_tts_label.y = 270;
		no_internet_tts_label.width = 200;
		no_internet_tts_label.height = 18;
		no_internet_tts_label.text = "No Internet";			
		addChild(no_internet_tts_label);	
		no_internet_tts_label.visible = false;
		
		no_internet_tts.embedFonts = true;
		no_internet_tts.selectable = true;	
		no_internet_tts.type = TextFieldType.INPUT;
		no_internet_tts.background = true;
		no_internet_tts.backgroundColor = 0xFFFFFF; //white
		no_internet_tts.maxChars = 100;		
		no_internet_tts.antiAliasType = AntiAliasType.ADVANCED;	
		no_internet_tts.defaultTextFormat = TTSTextFormat;
		no_internet_tts.x = 200;
		no_internet_tts.y = 270;
		no_internet_tts.width = 800;
		no_internet_tts.height = 18;
		no_internet_tts.text = myXML.no_internet_tts;
		addChild(no_internet_tts);		
		no_internet_tts.visible = false;
		
		stock_up_tts_label.embedFonts = true;
		stock_up_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		stock_up_tts_label.defaultTextFormat = TTSTextLabelFormat;
		stock_up_tts_label.x = 10;
		stock_up_tts_label.y = 290;
		stock_up_tts_label.width = 200;
		stock_up_tts_label.height = 18;
		stock_up_tts_label.text = "Stocks Up";			
		addChild(stock_up_tts_label);	
		stock_up_tts_label.visible = false;
		
		stock_up_tts.embedFonts = true;
		stock_up_tts.selectable = true;	
		stock_up_tts.type = TextFieldType.INPUT;
		stock_up_tts.background = true;
		stock_up_tts.backgroundColor = 0xFFFFFF; //white
		stock_up_tts.maxChars = 90;		
		stock_up_tts.antiAliasType = AntiAliasType.ADVANCED;	
		stock_up_tts.defaultTextFormat = TTSTextFormat;
		stock_up_tts.x = 200;
		stock_up_tts.y = 290;
		stock_up_tts.width = 800;
		stock_up_tts.height = 18;
		stock_up_tts.text = myXML.stock_up_tts;
		addChild(stock_up_tts);		
		stock_up_tts.visible = false;
		
		stock_no_change_tts_label.embedFonts = true;
		stock_no_change_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		stock_no_change_tts_label.defaultTextFormat = TTSTextLabelFormat;
		stock_no_change_tts_label.x = 10;
		stock_no_change_tts_label.y = 310;
		stock_no_change_tts_label.width = 200;
		stock_no_change_tts_label.height = 18;
		stock_no_change_tts_label.text = "Stocks Little Change";			
		addChild(stock_no_change_tts_label);	
		stock_no_change_tts_label.visible = false;
		
		stock_no_change_tts.embedFonts = true;
		stock_no_change_tts.selectable = true;	
		stock_no_change_tts.type = TextFieldType.INPUT;
		stock_no_change_tts.background = true;
		stock_no_change_tts.backgroundColor = 0xFFFFFF; //white
		stock_no_change_tts.maxChars = 90;		
		stock_no_change_tts.antiAliasType = AntiAliasType.ADVANCED;	
		stock_no_change_tts.defaultTextFormat = TTSTextFormat;
		stock_no_change_tts.x = 200;
		stock_no_change_tts.y = 310;
		stock_no_change_tts.width = 800;
		stock_no_change_tts.height = 18;
		stock_no_change_tts.text = myXML.stock_no_change_tts;
		addChild(stock_no_change_tts);		
		stock_no_change_tts.visible = false;
		
		stock_down_tts_label.embedFonts = true;
		stock_down_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		stock_down_tts_label.defaultTextFormat = TTSTextLabelFormat;
		stock_down_tts_label.x = 10;
		stock_down_tts_label.y = 330;
		stock_down_tts_label.width = 200;
		stock_down_tts_label.height = 18;
		stock_down_tts_label.text = "Stocks Down";			
		addChild(stock_down_tts_label);	
		stock_down_tts_label.visible = false;
		
		stock_down_tts.embedFonts = true;
		stock_down_tts.selectable = true;	
		stock_down_tts.type = TextFieldType.INPUT;
		stock_down_tts.background = true;
		stock_down_tts.backgroundColor = 0xFFFFFF; //white
		stock_down_tts.maxChars = 90;		
		stock_down_tts.antiAliasType = AntiAliasType.ADVANCED;	
		stock_down_tts.defaultTextFormat = TTSTextFormat;
		stock_down_tts.x = 200;
		stock_down_tts.y = 330;
		stock_down_tts.width = 800;
		stock_down_tts.height = 18;
		stock_down_tts.text = myXML.stock_down_tts;
		addChild(stock_down_tts);		
		stock_down_tts.visible = false;
		
		doorbell_tts_label.embedFonts = true;
		doorbell_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		doorbell_tts_label.defaultTextFormat = TTSTextLabelFormat;
		doorbell_tts_label.x = 10;
		doorbell_tts_label.y = 350;
		doorbell_tts_label.width = 200;
		doorbell_tts_label.height = 18;
		doorbell_tts_label.text = "Doorbell";			
		addChild(doorbell_tts_label);	
		doorbell_tts_label.visible = false;
		
		doorbell_tts.embedFonts = true;
		doorbell_tts.selectable = true;	
		doorbell_tts.type = TextFieldType.INPUT;
		doorbell_tts.background = true;
		doorbell_tts.backgroundColor = 0xFFFFFF; //white
		doorbell_tts.maxChars = 100;		
		doorbell_tts.antiAliasType = AntiAliasType.ADVANCED;	
		doorbell_tts.defaultTextFormat = TTSTextFormat;
		doorbell_tts.x = 200;
		doorbell_tts.y = 350;
		doorbell_tts.width = 800;
		doorbell_tts.height = 18;
		doorbell_tts.text = myXML.doorbell_tts;
		addChild(doorbell_tts);		
		doorbell_tts.visible = false;
		
		x10_on_tts_label.embedFonts = true;
		x10_on_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		x10_on_tts_label.defaultTextFormat = TTSTextLabelFormat;
		x10_on_tts_label.x = 10;
		x10_on_tts_label.y = 370;
		x10_on_tts_label.width = 200;
		x10_on_tts_label.height = 18;
		x10_on_tts_label.text = "X-10 ON Command";			
		addChild(x10_on_tts_label);	
		x10_on_tts_label.visible = false;
		
		x10_on_tts.embedFonts = true;
		x10_on_tts.selectable = true;	
		x10_on_tts.type = TextFieldType.INPUT;
		x10_on_tts.background = true;
		x10_on_tts.backgroundColor = 0xFFFFFF; //white
		x10_on_tts.maxChars = 100;		
		x10_on_tts.antiAliasType = AntiAliasType.ADVANCED;	
		x10_on_tts.defaultTextFormat = TTSTextFormat;
		x10_on_tts.x = 200;
		x10_on_tts.y = 370;
		x10_on_tts.width = 800;
		x10_on_tts.height = 18;
		x10_on_tts.text = myXML.x10_on_tts;
		addChild(x10_on_tts);		
		x10_on_tts.visible = false;
		
		x10_off_tts_label.embedFonts = true;
		x10_off_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		x10_off_tts_label.defaultTextFormat = TTSTextLabelFormat;
		x10_off_tts_label.x = 10;
		x10_off_tts_label.y = 390;
		x10_off_tts_label.width = 200;
		x10_off_tts_label.height = 18;
		x10_off_tts_label.text = "X-10 OFF Command";			
		addChild(x10_off_tts_label);	
		x10_off_tts_label.visible = false;
		
		x10_off_tts.embedFonts = true;
		x10_off_tts.selectable = true;	
		x10_off_tts.type = TextFieldType.INPUT;
		x10_off_tts.background = true;
		x10_off_tts.backgroundColor = 0xFFFFFF; //white
		x10_off_tts.maxChars = 100;		
		x10_off_tts.antiAliasType = AntiAliasType.ADVANCED;	
		x10_off_tts.defaultTextFormat = TTSTextFormat;
		x10_off_tts.x = 200;
		x10_off_tts.y = 390;
		x10_off_tts.width = 800;
		x10_off_tts.height = 18;
		x10_off_tts.text = myXML.x10_off_tts;
		addChild(x10_off_tts);		
		x10_off_tts.visible = false;
		
		drink1_tts_label.embedFonts = true;
		drink1_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		drink1_tts_label.defaultTextFormat = TTSTextLabelFormat;
		drink1_tts_label.x = 10;
		drink1_tts_label.y = 410;
		drink1_tts_label.width = 200;
		drink1_tts_label.height = 18;
		drink1_tts_label.text = "Breathalyzer No Drinks";			
		addChild(drink1_tts_label);	
		drink1_tts_label.visible = false;
		
		drink1_tts.embedFonts = true;
		drink1_tts.selectable = true;	
		drink1_tts.type = TextFieldType.INPUT;
		drink1_tts.background = true;
		drink1_tts.backgroundColor = 0xFFFFFF; //white
		drink1_tts.maxChars = 100;		
		drink1_tts.antiAliasType = AntiAliasType.ADVANCED;	
		drink1_tts.defaultTextFormat = TTSTextFormat;
		drink1_tts.x = 200;
		drink1_tts.y = 410;
		drink1_tts.width = 800;
		drink1_tts.height = 18;
		drink1_tts.text = myXML.drink1_tts;
		addChild(drink1_tts);		
		drink1_tts.visible = false;
		
		drink2_tts_label.embedFonts = true;
		drink2_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		drink2_tts_label.defaultTextFormat = TTSTextLabelFormat;
		drink2_tts_label.x = 10;
		drink2_tts_label.y = 430;
		drink2_tts_label.width = 200;
		drink2_tts_label.height = 18;
		drink2_tts_label.text = "Breathalyzer A Few Drinks";			
		addChild(drink2_tts_label);	
		drink2_tts_label.visible = false;
		
		drink2_tts.embedFonts = true;
		drink2_tts.selectable = true;	
		drink2_tts.type = TextFieldType.INPUT;
		drink2_tts.background = true;
		drink2_tts.backgroundColor = 0xFFFFFF; //white
		drink2_tts.maxChars = 100;		
		drink2_tts.antiAliasType = AntiAliasType.ADVANCED;	
		drink2_tts.defaultTextFormat = TTSTextFormat;
		drink2_tts.x = 200;
		drink2_tts.y = 430;
		drink2_tts.width = 800;
		drink2_tts.height = 18;
		drink2_tts.text = myXML.drink2_tts;
		addChild(drink2_tts);		
		drink2_tts.visible = false;
		
		drink3_tts_label.embedFonts = true;
		drink3_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		drink3_tts_label.defaultTextFormat = TTSTextLabelFormat;
		drink3_tts_label.x = 10;
		drink3_tts_label.y = 450;
		drink3_tts_label.width = 200;
		drink3_tts_label.height = 18;
		drink3_tts_label.text = "Breathalyzer Buzzed";			
		addChild(drink3_tts_label);	
		drink3_tts_label.visible = false;
		
		drink3_tts.embedFonts = true;
		drink3_tts.selectable = true;	
		drink3_tts.type = TextFieldType.INPUT;
		drink3_tts.background = true;
		drink3_tts.backgroundColor = 0xFFFFFF; //white
		drink3_tts.maxChars = 100;		
		drink3_tts.antiAliasType = AntiAliasType.ADVANCED;	
		drink3_tts.defaultTextFormat = TTSTextFormat;
		drink3_tts.x = 200;
		drink3_tts.y = 450;
		drink3_tts.width = 800;
		drink3_tts.height = 18;
		drink3_tts.text = myXML.drink3_tts;
		addChild(drink3_tts);		
		drink3_tts.visible = false;
		
		drink4_tts_label.embedFonts = true;
		drink4_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		drink4_tts_label.defaultTextFormat = TTSTextLabelFormat;
		drink4_tts_label.x = 10;
		drink4_tts_label.y = 470;
		drink4_tts_label.width = 200;
		drink4_tts_label.height = 18;
		drink4_tts_label.text = "Breathalyzer Drunk";			
		addChild(drink4_tts_label);	
		drink4_tts_label.visible = false;
		
		drink4_tts.embedFonts = true;
		drink4_tts.selectable = true;	
		drink4_tts.type = TextFieldType.INPUT;
		drink4_tts.background = true;
		drink4_tts.backgroundColor = 0xFFFFFF; //white
		drink4_tts.maxChars = 100;		
		drink4_tts.antiAliasType = AntiAliasType.ADVANCED;	
		drink4_tts.defaultTextFormat = TTSTextFormat;
		drink4_tts.x = 200;
		drink4_tts.y = 470;
		drink4_tts.width = 800;
		drink4_tts.height = 18;
		drink4_tts.text = myXML.drink4_tts;
		addChild(drink4_tts);		
		drink4_tts.visible = false;
		
		blow_tts_label.embedFonts = true;
		blow_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		blow_tts_label.defaultTextFormat = TTSTextLabelFormat;
		blow_tts_label.x = 10;
		blow_tts_label.y = 490;
		blow_tts_label.width = 200;
		blow_tts_label.height = 18;
		blow_tts_label.text = "Breathalyzer Prompt to Blow";			
		addChild(blow_tts_label);	
		blow_tts_label.visible = false;
		
		blow_tts.embedFonts = true;
		blow_tts.selectable = true;	
		blow_tts.type = TextFieldType.INPUT;
		blow_tts.background = true;
		blow_tts.backgroundColor = 0xFFFFFF; //white
		blow_tts.maxChars = 60;		
		blow_tts.antiAliasType = AntiAliasType.ADVANCED;	
		blow_tts.defaultTextFormat = TTSTextFormat;
		blow_tts.x = 200;
		blow_tts.y = 490;
		blow_tts.width = 800;
		blow_tts.height = 18;
		blow_tts.text = myXML.blow_tts;
		addChild(blow_tts);		
		blow_tts.visible = false;
		
		wait_tts_label.embedFonts = true;
		wait_tts_label.antiAliasType = AntiAliasType.ADVANCED;
		wait_tts_label.defaultTextFormat = TTSTextLabelFormat;
		wait_tts_label.x = 10;
		wait_tts_label.y = 510;
		wait_tts_label.width = 200;
		wait_tts_label.height = 18;
		wait_tts_label.text = "Breathalyzer Prompt to Wait";			
		addChild(wait_tts_label);	
		wait_tts_label.visible = false;
		
		wait_tts.embedFonts = true;
		wait_tts.selectable = true;	
		wait_tts.type = TextFieldType.INPUT;
		wait_tts.background = true;
		wait_tts.backgroundColor = 0xFFFFFF; //white
		wait_tts.maxChars = 60;		
		wait_tts.antiAliasType = AntiAliasType.ADVANCED;	
		wait_tts.defaultTextFormat = TTSTextFormat;
		wait_tts.x = 200;
		wait_tts.y = 510;
		wait_tts.width = 800;
		wait_tts.height = 18;
		wait_tts.text = myXML.wait_tts;
		addChild(wait_tts);		
		wait_tts.visible = false;
		
		tts_instructions.embedFonts = true;
		tts_instructions.antiAliasType = AntiAliasType.ADVANCED;
		tts_instructions.defaultTextFormat = TTSTextLabelFormat;
		tts_instructions.autoSize = TextFieldAutoSize.LEFT;
		tts_instructions.wordWrap = true;
		tts_instructions.x = 10;
		tts_instructions.y = 550;
		tts_instructions.width = 1000;
		tts_instructions.height = 40;
		//tts_instructions.text = "Add the text for the Magic Mirror to speak for the events above. TTS (Text to Speech) can handle a maximum of 100 characters for each event. The Magic Mirror automatically adds text to the end of the Weather and Stock events. To use TTS, run the Magic Mirror and turn the character select knob until you hear 'Custom Audio Mode'.";
		tts_instructions.text = "To use Custom Audio, run the Magic Mirror and turn the character select knob until you hear 'Custom Audio Mode'.";		
		addChild(tts_instructions);	
		tts_instructions.visible = false;
		
				
		
		//********************************************
		
		photobooth_printing_check.x = 78;
		photobooth_printing_check.y = 127.35;
		photobooth_printing_check.width = 130;
		photobooth_printing_check.height = 22;		
		photobooth_printing_check.textField.autoSize = TextFieldAutoSize.LEFT;
		photobooth_printing_check.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_printing_check.label = "Enable Printing"; 
		addChild(photobooth_printing_check);
		photobooth_printing_check.visible = false;
		
		photobooth_PaperSize_dropdown.x = 293.45;
		photobooth_PaperSize_dropdown.y = 126.35;
		photobooth_PaperSize_dropdown.width = 122;
		photobooth_PaperSize_dropdown.height = 22;
		photobooth_PaperSize_dropdown.setStyle("textFormat", photoboothTextLabelFormat);
		addChild(photobooth_PaperSize_dropdown);
		photobooth_PaperSize_dropdown.visible = false;
		
		photobooth_promptprint_check.x = 533.05;
		photobooth_promptprint_check.y = 164.45;
		photobooth_promptprint_check.width = 208;
		photobooth_promptprint_check.height = 22;		
		photobooth_promptprint_check.textField.autoSize = TextFieldAutoSize.LEFT;
		photobooth_promptprint_check.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_promptprint_check.label = "Prompt User Before Printing"; 
		addChild(photobooth_promptprint_check);
		photobooth_promptprint_check.visible = false;
		
		photobooth_PrintCopies_label.autoSize = TextFieldAutoSize.RIGHT;
		photobooth_PrintCopies_label.setStyle("embedFonts", true);
		photobooth_PrintCopies_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_PrintCopies_label.text = "Print Copies";
		photobooth_PrintCopies_label.x = 141.8;
		photobooth_PrintCopies_label.y = 168.45;
		photobooth_PrintCopies_label.width = 74.55;
		photobooth_PrintCopies_label.height = 18;		
		//photobooth_PrintCopies_label.move(, 168.45);
		addChild(photobooth_PrintCopies_label);
		photobooth_PrintCopies_label.visible = false;
		
		photobooth_PrintCopies_slider.x = 242.25;
		photobooth_PrintCopies_slider.y = 175.95;
		photobooth_PrintCopies_slider.width = 203.90;
		photobooth_PrintCopies_slider.height = 3;
		photobooth_PrintCopies_slider.maximum = 10;
		photobooth_PrintCopies_slider.minimum = 1;
		photobooth_PrintCopies_slider.snapInterval = 1;
		photobooth_PrintCopies_slider.tickInterval = 1;				
		photobooth_PrintCopies_slider.value = myXML.photobooth_print_copies;
		addChild(photobooth_PrintCopies_slider);		
		photobooth_PrintCopies_slider.visible = false;
		
		photobooth_PrintCopiesValue_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_PrintCopiesValue_label.setStyle("embedFonts", true);
		photobooth_PrintCopiesValue_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_PrintCopiesValue_label.text = myXML.photobooth_print_copies;
		photobooth_PrintCopiesValue_label.move(463.85, 168.45);
		addChild(photobooth_PrintCopiesValue_label);
		photobooth_PrintCopiesValue_label.visible = false;
		
		photobooth_PrintCopies_slider.addEventListener(SliderEvent.THUMB_DRAG, photobooth_PrintCopies_sliderEvent);
		
		photobooth_save_check.x = 78;
		photobooth_save_check.y = 200.35;
		photobooth_save_check.width = 155;
		photobooth_save_check.height = 22;		
		photobooth_save_check.textField.autoSize = TextFieldAutoSize.LEFT;
		photobooth_save_check.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_save_check.label = "Save Individual Photos"; 
		addChild(photobooth_save_check);
		photobooth_save_check.visible = false;
		
		photobooth_SaveFolder_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_SaveFolder_label.setStyle("embedFonts", true);
		photobooth_SaveFolder_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_SaveFolder_label.text = "Save Folder Location:";
		photobooth_SaveFolder_label.move(253.75, 202.35);
		addChild(photobooth_SaveFolder_label);
		photobooth_SaveFolder_label.visible = false;
		
		photobooth_SaveFolderPath_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_SaveFolderPath_label.setStyle("embedFonts", true);
		photobooth_SaveFolderPath_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_SaveFolderPath_label.text = String(PhotoSaveDir.nativePath);
		//photobooth_SaveFolderPath_label.text = "C:\\Users\\al\\Documents\\diymagicmirror-settings\\photobooth";
		photobooth_SaveFolderPath_label.move(431.20, 200.35);
		addChild(photobooth_SaveFolderPath_label);
		photobooth_SaveFolderPath_label.visible = false;
		
		photobooth_x10_check.x = 78;
		photobooth_x10_check.y = 242.25;
		photobooth_x10_check.width = 155;
		photobooth_x10_check.height = 22;		
		photobooth_x10_check.textField.autoSize = TextFieldAutoSize.LEFT;
		photobooth_x10_check.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_x10_check.label = "Enable X-10 Lighting Control"; 
		addChild(photobooth_x10_check);
		photobooth_x10_check.visible = false;
		
		photobooth_x10HouseCode_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_x10HouseCode_label.setStyle("embedFonts", true);
		photobooth_x10HouseCode_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_x10HouseCode_label.text = "X-10 House Code";
		photobooth_x10HouseCode_label.move(298.7, 243.45);
		addChild(photobooth_x10HouseCode_label);
		photobooth_x10HouseCode_label.visible = false;
		
		photobooth_x10UnitCode_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_x10UnitCode_label.setStyle("embedFonts", true);
		photobooth_x10UnitCode_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_x10UnitCode_label.text = "X-10 Unit Code";
		photobooth_x10UnitCode_label.move(485.05, 243.45);
		addChild(photobooth_x10UnitCode_label);
		photobooth_x10UnitCode_label.visible = false;
		
		photobooth_leds_check.x = 682.30;
		photobooth_leds_check.y = 243.45;
		photobooth_leds_check.width = 155;
		photobooth_leds_check.height = 22;		
		photobooth_leds_check.textField.autoSize = TextFieldAutoSize.LEFT;
		photobooth_leds_check.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_leds_check.label = "Enable LED Control"; 
		addChild(photobooth_leds_check);
		photobooth_leds_check.visible = false;
		
		photobooth_WebcamResolution_label.autoSize = TextFieldAutoSize.RIGHT;
		photobooth_WebcamResolution_label.setStyle("embedFonts", true);
		photobooth_WebcamResolution_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_WebcamResolution_label.text = "Webcam Resolution";
		photobooth_WebcamResolution_label.x = 81.35;
		photobooth_WebcamResolution_label.y = 329.35;
		photobooth_WebcamResolution_label.width = 135;
		photobooth_WebcamResolution_label.height = 18;		
		addChild(photobooth_WebcamResolution_label);
		photobooth_WebcamResolution_label.visible = false;
		
		photobooth_WebcamResolution_dropdown.x = 226.35;
		photobooth_WebcamResolution_dropdown.y = 325.35;
		photobooth_WebcamResolution_dropdown.width = 122;
		photobooth_WebcamResolution_dropdown.height = 22;		
		photobooth_WebcamResolution_dropdown.setStyle("textFormat", photoboothTextLabelFormat);
		addChild(photobooth_WebcamResolution_dropdown);
		photobooth_WebcamResolution_dropdown.visible = false;
		
		photobooth_WebcamFPS_label.autoSize = TextFieldAutoSize.RIGHT;
		photobooth_WebcamFPS_label.setStyle("embedFonts", true);
		photobooth_WebcamFPS_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_WebcamFPS_label.text = "Webcam FPS";
		photobooth_WebcamFPS_label.x = 81.35;
		photobooth_WebcamFPS_label.y = 368;
		photobooth_WebcamFPS_label.width = 135;
		photobooth_WebcamFPS_label.height = 18;		
		addChild(photobooth_WebcamFPS_label);
		photobooth_WebcamFPS_label.visible = false;
		
		photobooth_WebcamFPS_slider.x = 242.25;
		photobooth_WebcamFPS_slider.y = 375.50;
		photobooth_WebcamFPS_slider.width = 203.90;
		photobooth_WebcamFPS_slider.height = 3;
		photobooth_WebcamFPS_slider.maximum = 30;
		photobooth_WebcamFPS_slider.minimum = 5;
		photobooth_WebcamFPS_slider.snapInterval = 5;
		photobooth_WebcamFPS_slider.tickInterval = 5;				
		photobooth_WebcamFPS_slider.value = myXML.photobooth_fps;
		addChild(photobooth_WebcamFPS_slider);		
		photobooth_WebcamFPS_slider.visible = false;
		
		photobooth_WebcamFPSValue_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_WebcamFPSValue_label.setStyle("embedFonts", true);
		photobooth_WebcamFPSValue_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_WebcamFPSValue_label.text = myXML.photobooth_fps;
		photobooth_WebcamFPSValue_label.move(463.85,366);
		addChild(photobooth_WebcamFPSValue_label);
		photobooth_WebcamFPSValue_label.visible = false;
		
		photobooth_WebcamFPS_slider.addEventListener(SliderEvent.THUMB_DRAG, photobooth_WebcamFPS_sliderEvent);
		
		photobooth_CountDownFrom_label.autoSize = TextFieldAutoSize.RIGHT;
		photobooth_CountDownFrom_label.setStyle("embedFonts", true);
		photobooth_CountDownFrom_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_CountDownFrom_label.text = "Count Down From";
		photobooth_CountDownFrom_label.x = 81.15;
		photobooth_CountDownFrom_label.y = 408.4;
		photobooth_CountDownFrom_label.width = 135;
		photobooth_CountDownFrom_label.height = 18;		
		addChild(photobooth_CountDownFrom_label);
		photobooth_CountDownFrom_label.visible = false;
		
		photobooth_CountDownFrom_slider.x = 245.25;
		photobooth_CountDownFrom_slider.y = 415.90;
		photobooth_CountDownFrom_slider.width = 203.90;
		photobooth_CountDownFrom_slider.height = 3;
		photobooth_CountDownFrom_slider.maximum = 10;
		photobooth_CountDownFrom_slider.minimum = 3;
		photobooth_CountDownFrom_slider.snapInterval = 1;
		photobooth_CountDownFrom_slider.tickInterval = 1;				
		photobooth_CountDownFrom_slider.value = myXML.photobooth_countdown;
		addChild(photobooth_CountDownFrom_slider);		
		photobooth_CountDownFrom_slider.visible = false;
		
		photobooth_CountDownFromValue_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_CountDownFromValue_label.setStyle("embedFonts", true);
		photobooth_CountDownFromValue_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_CountDownFromValue_label.text = myXML.photobooth_countdown;
		photobooth_CountDownFromValue_label.move(463.85,406.40);
		addChild(photobooth_CountDownFromValue_label);
		photobooth_CountDownFromValue_label.visible = false;
		
		photobooth_CountDownFrom_slider.addEventListener(SliderEvent.THUMB_DRAG, photobooth_CountDownFrom_sliderEvent);
		
		photobooth_ShotDelay_label.autoSize = TextFieldAutoSize.RIGHT;
		photobooth_ShotDelay_label.setStyle("embedFonts", true);
		photobooth_ShotDelay_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_ShotDelay_label.text = "Shot Delay (s)";
		photobooth_ShotDelay_label.x = 81.15;
		photobooth_ShotDelay_label.y = 448.45;
		photobooth_ShotDelay_label.width = 135;
		photobooth_ShotDelay_label.height = 18;		
		addChild(photobooth_ShotDelay_label);
		photobooth_ShotDelay_label.visible = false;
		
		photobooth_ShotDelay_slider.x = 245.25;
		photobooth_ShotDelay_slider.y = 455.95;
		photobooth_ShotDelay_slider.width = 203.90;
		photobooth_ShotDelay_slider.height = 3;
		photobooth_ShotDelay_slider.maximum = 10;
		photobooth_ShotDelay_slider.minimum = 1;
		photobooth_ShotDelay_slider.snapInterval = 1;
		photobooth_ShotDelay_slider.tickInterval = 1;				
		photobooth_ShotDelay_slider.value = myXML.photoboothShotDelay;
		addChild(photobooth_ShotDelay_slider);		
		photobooth_ShotDelay_slider.visible = false;
		photobooth_ShotDelay_slider.addEventListener(SliderEvent.THUMB_DRAG, photobooth_ShotDelay_sliderEvent);
		
		photobooth_ShotDelayValue_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_ShotDelayValue_label.setStyle("embedFonts", true);
		photobooth_ShotDelayValue_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_ShotDelayValue_label.text = myXML.photoboothShotDelay;
		photobooth_ShotDelayValue_label.move(463.85,446.45);
		addChild(photobooth_ShotDelayValue_label);
		photobooth_ShotDelayValue_label.visible = false;
		
		photobooth_PhotoPreviewDuration_label.autoSize = TextFieldAutoSize.RIGHT;
		photobooth_PhotoPreviewDuration_label.setStyle("embedFonts", true);
		photobooth_PhotoPreviewDuration_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_PhotoPreviewDuration_label.text = "Photos Preview Duration (s)";
		photobooth_PhotoPreviewDuration_label.x = 17.25;
		photobooth_PhotoPreviewDuration_label.y = 489.25;
		photobooth_PhotoPreviewDuration_label.width = 200;
		photobooth_PhotoPreviewDuration_label.height = 18;		
		addChild(photobooth_PhotoPreviewDuration_label);
		photobooth_PhotoPreviewDuration_label.visible = false;
		
		photobooth_PhotoPreviewDuration_slider.x = 245.25;
		photobooth_PhotoPreviewDuration_slider.y = 496.75;
		photobooth_PhotoPreviewDuration_slider.width = 203.90;
		photobooth_PhotoPreviewDuration_slider.height = 3;
		photobooth_PhotoPreviewDuration_slider.maximum = 30;
		photobooth_PhotoPreviewDuration_slider.minimum = 5;
		photobooth_PhotoPreviewDuration_slider.snapInterval = 5;
		photobooth_PhotoPreviewDuration_slider.tickInterval = 5;				
		photobooth_PhotoPreviewDuration_slider.value = myXML.photoboothGalleryTimer;
		addChild(photobooth_PhotoPreviewDuration_slider);		
		photobooth_PhotoPreviewDuration_slider.visible = false;
		photobooth_PhotoPreviewDuration_slider.addEventListener(SliderEvent.THUMB_DRAG, photobooth_PhotoPreviewDuration_sliderEvent);
		
		photobooth_PhotoPreviewDurationValue_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_PhotoPreviewDurationValue_label.setStyle("embedFonts", true);
		photobooth_PhotoPreviewDurationValue_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_PhotoPreviewDurationValue_label.text = myXML.photoboothGalleryTimer;
		photobooth_PhotoPreviewDurationValue_label.move(463.85,487.25);		
		addChild(photobooth_PhotoPreviewDurationValue_label);
		photobooth_PhotoPreviewDurationValue_label.visible = false;
		
		photoboothProofPreview_check.x = 78;
		photoboothProofPreview_check.y = 524.40;
		photoboothProofPreview_check.width = 155;
		photoboothProofPreview_check.height = 22;		
		photoboothProofPreview_check.textField.autoSize = TextFieldAutoSize.LEFT;
		photoboothProofPreview_check.setStyle("textFormat", photoboothTextLabelFormat);
		photoboothProofPreview_check.label = "Enable Proof Preview"; 
		addChild(photoboothProofPreview_check);
		photoboothProofPreview_check.visible = false;
		
		photoboothFacialRecognitionTrigger_check.x = 300;
		photoboothFacialRecognitionTrigger_check.y = 524.40;
		photoboothFacialRecognitionTrigger_check.width = 400;
		photoboothFacialRecognitionTrigger_check.height = 22;		
		photoboothFacialRecognitionTrigger_check.textField.autoSize = TextFieldAutoSize.LEFT;
		photoboothFacialRecognitionTrigger_check.setStyle("textFormat", photoboothTextLabelFormat);
		photoboothFacialRecognitionTrigger_check.label = "Enable Photobooth Start on Webcam Facial Recognition"; 
		addChild(photoboothFacialRecognitionTrigger_check);
		photoboothFacialRecognitionTrigger_check.visible = false;
		
		
		photobooth_ProofPreviewDuration_label.autoSize = TextFieldAutoSize.RIGHT;
		photobooth_ProofPreviewDuration_label.setStyle("embedFonts", true);
		photobooth_ProofPreviewDuration_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_ProofPreviewDuration_label.text = "Proof Preview Duration (s)";
		photobooth_ProofPreviewDuration_label.x = 16.25;
		photobooth_ProofPreviewDuration_label.y = 567.65;
		photobooth_ProofPreviewDuration_label.width = 200;
		photobooth_ProofPreviewDuration_label.height = 18;		
		//photobooth_ProofPreviewDuration_label.move(16.25,567.65);
		addChild(photobooth_ProofPreviewDuration_label);
		photobooth_ProofPreviewDuration_label.visible = false;
		
		photobooth_ProofPreviewDuration_slider.x = 245.25;
		photobooth_ProofPreviewDuration_slider.y = 575.15;
		photobooth_ProofPreviewDuration_slider.width = 203.90;
		photobooth_ProofPreviewDuration_slider.height = 3;
		photobooth_ProofPreviewDuration_slider.maximum = 16;
		photobooth_ProofPreviewDuration_slider.minimum = 4;
		photobooth_ProofPreviewDuration_slider.snapInterval = 2;
		photobooth_ProofPreviewDuration_slider.tickInterval = 2;				
		photobooth_ProofPreviewDuration_slider.value = myXML.photoboothProofDisplayTime;
		addChild(photobooth_ProofPreviewDuration_slider);		
		photobooth_ProofPreviewDuration_slider.visible = false;
		photobooth_ProofPreviewDuration_slider.addEventListener(SliderEvent.THUMB_DRAG, photobooth_ProofPreviewDuration_sliderEvent);
				
		photobooth_ProofPreviewDurationValue_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_ProofPreviewDurationValue_label.setStyle("embedFonts", true);
		photobooth_ProofPreviewDurationValue_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_ProofPreviewDurationValue_label.text = myXML.photoboothProofDisplayTime;
		photobooth_ProofPreviewDurationValue_label.move(463.85,565.65);
		addChild(photobooth_ProofPreviewDurationValue_label);
		photobooth_ProofPreviewDurationValue_label.visible = false;
		
		photobooth_PaperSize_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_PaperSize_label.setStyle("embedFonts", true);
		photobooth_PaperSize_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_PaperSize_label.text = "Paper Size";
		photobooth_PaperSize_label.x = 209.35;
		photobooth_PaperSize_label.y = 128.35;
		photobooth_PaperSize_label.width = 65;
		photobooth_PaperSize_label.height = 18;		
		addChild(photobooth_PaperSize_label);
		photobooth_PaperSize_label.visible = false;
		
		photobooth_PrintingInfo_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_PrintingInfo_label.setStyle("embedFonts", true);
		photobooth_PrintingInfo_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_PrintingInfo_label.text = "The Photobooth will print to your default printer in Portrait mode";
		photobooth_PrintingInfo_label.x = 459.9;
		photobooth_PrintingInfo_label.y = 128.35;
		photobooth_PrintingInfo_label.width = 392;
		photobooth_PrintingInfo_label.height = 18;		
		addChild(photobooth_PrintingInfo_label);
		photobooth_PrintingInfo_label.visible = false;
		
		photobooth_BackgroundImage_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_BackgroundImage_label.setStyle("embedFonts", true);
		photobooth_BackgroundImage_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_BackgroundImage_label.text = "Background Image:";
		photobooth_BackgroundImage_label.x = 285.05;
		photobooth_BackgroundImage_label.y = 609.40;
		photobooth_BackgroundImage_label.width = 149.4;
		photobooth_BackgroundImage_label.height = 18;		
		addChild(photobooth_BackgroundImage_label);
		photobooth_BackgroundImage_label.visible = false;
		
		//photoboothOverlayImagePath = File.applicationDirectory; //this is used later for the photobooth path
			photoboothOverlayImagePath = file2.resolvePath(myXML.photobooth_backgroundcustomimagepath);	
			
			//photoboothLogoPath = File.applicationDirectory; //this is used later for the photobooth path
			photoboothLogoPath = file2.resolvePath(myXML.photobooth_logoPath);	
		
		photobooth_BackgroundImagePath_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_BackgroundImagePath_label.wordWrap = true;
		photobooth_BackgroundImagePath_label.setStyle("embedFonts", true);
		photobooth_BackgroundImagePath_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_BackgroundImagePath_label.text = String(photoboothOverlayImagePath.nativePath);
		//photobooth_BackgroundImagePath_label.text = String(homepath + myXML.photobooth_backgroundcustomimagepath);
		photobooth_BackgroundImagePath_label.x = 413;
		photobooth_BackgroundImagePath_label.y = 609.40;
		photobooth_BackgroundImagePath_label.width = 475.8;
		photobooth_BackgroundImagePath_label.height = 36;		
		addChild(photobooth_BackgroundImagePath_label);
		photobooth_BackgroundImagePath_label.visible = false;
		
		photobooth_LogoImage_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_LogoImage_label.setStyle("embedFonts", true);
		photobooth_LogoImage_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_LogoImage_label.text = "Logo Image:";
		photobooth_LogoImage_label.x = 284;
		photobooth_LogoImage_label.y = 288;
		photobooth_LogoImage_label.width = 92;
		photobooth_LogoImage_label.height = 18;		
		addChild(photobooth_LogoImage_label);
		photobooth_LogoImage_label.visible = false;
		
		photobooth_LogoImagePath_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_LogoImagePath_label.wordWrap = true;
		photobooth_LogoImagePath_label.setStyle("embedFonts", true);
		photobooth_LogoImagePath_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_LogoImagePath_label.text = String(photoboothLogoPath.nativePath);
		//photobooth_LogoImagePath_label.text = String(homepath + myXML.photobooth_logoPath);
		photobooth_LogoImagePath_label.x = 376;
		photobooth_LogoImagePath_label.y = 288;
		photobooth_LogoImagePath_label.width = 620;
		photobooth_LogoImagePath_label.height = 40;		
		addChild(photobooth_LogoImagePath_label);
		photobooth_LogoImagePath_label.visible = false;
		
		photobooth_StartupText_label.autoSize = TextFieldAutoSize.LEFT;
		photobooth_StartupText_label.setStyle("embedFonts", true);
		photobooth_StartupText_label.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_StartupText_label.text = "Start Up Text";
		photobooth_StartupText_label.move(138.45, 648.40);
		addChild(photobooth_StartupText_label);
		photobooth_StartupText_label.visible = false;
		
		photobooth_StartupText_textarea.embedFonts = true;
		photobooth_StartupText_textarea.selectable = true;	
		photobooth_StartupText_textarea.type = TextFieldType.INPUT;
		photobooth_StartupText_textarea.background = true;
		photobooth_StartupText_textarea.backgroundColor = 0xFFFFFF; //white
		photobooth_StartupText_textarea.maxChars = 140;		
		photobooth_StartupText_textarea.antiAliasType = AntiAliasType.ADVANCED;	
		photobooth_StartupText_textarea.defaultTextFormat = TTSTextFormat;
		photobooth_StartupText_textarea.x = 240.25;
		photobooth_StartupText_textarea.y = 648.40;
		photobooth_StartupText_textarea.width = 700;
		photobooth_StartupText_textarea.height = 18;
		photobooth_StartupText_textarea.text = myXML.photobooth_startuptext;
		addChild(photobooth_StartupText_textarea);		
		photobooth_StartupText_textarea.visible = false;
		
		photobooth_LogoImage_check.x = 76;
		photobooth_LogoImage_check.y = 285;
		photobooth_LogoImage_check.width = 208;
		photobooth_LogoImage_check.height = 22;		
		photobooth_LogoImage_check.textField.autoSize = TextFieldAutoSize.LEFT;
		photobooth_LogoImage_check.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_LogoImage_check.label = "Include Custom Logo"; 
		addChild(photobooth_LogoImage_check);
		photobooth_LogoImage_check.visible = false;
		
		photobooth_BackgroundImage_check.x = 78;
		photobooth_BackgroundImage_check.y = 607.4;
		photobooth_BackgroundImage_check.width = 250;
		photobooth_BackgroundImage_check.height = 22;		
		photobooth_BackgroundImage_check.textField.autoSize = TextFieldAutoSize.LEFT;
		photobooth_BackgroundImage_check.setStyle("textFormat", photoboothTextLabelFormat);
		photobooth_BackgroundImage_check.label = "Overlay Background Image"; 
		addChild(photobooth_BackgroundImage_check);
		photobooth_BackgroundImage_check.visible = false;
		
		//*****************************
		
		photobooth_fps_label.embedFonts = true;
		photobooth_fps_label.antiAliasType = AntiAliasType.ADVANCED;
		photobooth_fps_label.defaultTextFormat = photoboothTextLabelFormat;
		photobooth_fps_label.x = 10;
		photobooth_fps_label.y = 310;
		photobooth_fps_label.width = 200;
		photobooth_fps_label.height = 18;
		photobooth_fps_label.text = "Webcam Frames per Second";			
		addChild(photobooth_fps_label);	
		photobooth_fps_label.visible = false;
		
		photobooth_fps.embedFonts = true;
		photobooth_fps.selectable = true;	
		photobooth_fps.type = TextFieldType.INPUT;
		photobooth_fps.background = true;
		photobooth_fps.backgroundColor = 0xFFFFFF; //white
		photobooth_fps.maxChars = 90;		
		photobooth_fps.antiAliasType = AntiAliasType.ADVANCED;	
		photobooth_fps.defaultTextFormat = photoboothTextLabelFormat;
		photobooth_fps.x = 200;
		photobooth_fps.y = 310;
		photobooth_fps.width = 30;
		photobooth_fps.height = 18;
		photobooth_fps.text = myXML.photobooth_fps;
		addChild(photobooth_fps);		
		photobooth_fps.visible = false;
		
				
		addChild(version_text);
		version_text.x = 880;
		version_text.y = 5.35;
		version_text.width = 100;
		version_text.height = 19.85;
		version_text.defaultTextFormat = VersionTextFormat;		
		//version_text.text = myXML.branding + " Magic Mirror Configuration Version 5.0";
		version_text.text = "Version 7.10";
		//version_text.text = "DIY Magic Mirror Configuration Version " + myXML.version;
		
		//square.graphics.lineStyle(1,0x000000);
		//square.graphics.beginFill(0xFFFFFF);
		//square.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
		//square.graphics.endFill();
		//square.x = stage.stageWidth/2-square.width/2;
		//square.y = stage.stageHeight/2-square.height/2;
		//addChildAt(square,0); //white square
		
		
		black_square.graphics.lineStyle(1,0x000000);
		black_square.graphics.beginFill(0x000000);
		black_square.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
		black_square.graphics.endFill();
		black_square.x = stage.stageWidth/2-black_square.width/2;
		black_square.y = stage.stageHeight/2-black_square.height/2;
		addChildAt(black_square,1);
		
		//myVid.x = 30;
		//myVid.y = 30.90;
		//myVid.x = 0;
		//myVid.y = 0;
		//myVid2.x = 0;
		//myVid2.y = 0;
		//myVid.width = 969.40;
		//myVid.height = 678.20;
		//myVid.align = "center";
		//myVid.scaleMode = "maintainAspectRatio";
		//addChild(myVid);
		//myVid.visible = false;		
		//addChild(myVid2);
		//myVid2.visible = false;		
		
		//pic.x = 0;
		//pic.y = 0;
		//pic.width=1026.05;
		//pic.height=766.40;
		//pic.maintainAspectRatio = true;
		addChild(pic);
		pic.visible = false;
		
		zip_code_input.text = myXML.weather_zip;
		woeid_input.text = myXML.weather_woeid;
		proximity_sensor_trigger1_distance_lower_input.text = myXML.proximity_sensor_trigger1_distance_lower;
		proximity_sensor_trigger1_distance_upper_input.text = myXML.proximity_sensor_trigger1_distance_upper;
		quiz_timer_input.text = myXML.quiz_timer;
		proximity_sensor_trigger1_time_input.text = myXML.proximity_sensor_trigger1_time;
		proximity_sensor_trigger2_distance_input.text = myXML.proximity_sensor_trigger2_distance;		
		
		proximity_sensor_trigger2_distance_lower_input.text = myXML.proximity_sensor_trigger2_distance_lower;
		proximity_sensor_trigger2_distance_upper_input.text = myXML.proximity_sensor_trigger2_distance_upper;
		proximity_sensor_trigger2_time_input.text = myXML.proximity_sensor_trigger2_time;
		
		
		forecast_cutoff_input.text = myXML.forecast_cutoff; 
		reg_code_input.text = myXML.reg_code;
		startup_delay_input.text = myXML.startup_delay;
		stock_good_threshold_input.text = myXML.stock_good_threshold;
		stock_bad_threshold_input.text = myXML.stock_bad_threshold;
		//com_port_input.text = myXML.com_port;
		good_weather_threshold_input.text = myXML.good_weather_threshold;
		
		//twitter_username_input.text = myXML.twitter_username;
		twitter_password_input.text = myXML.twitter_password;
		twitter_frequency_input.text = myXML.twitter_frequency;		
		twitter_search_term_input.text = myXML.twitter_search_term;
		
		if (myXML.twitter_my_tweets_only == "on") {
			only_my_tweets_checkbox.selected = true ;
		}
		else {
			only_my_tweets_checkbox.selected = false ;			
		}		
		
		if (myXML.twitter_do_not_speak_search_term == "on") {
			do_not_speak_twitter_search_term_checkbox.selected = true ;
		}
		else {
			do_not_speak_twitter_search_term_checkbox.selected = false ;			
		}		
		
		if (myXML.quiz_mode == "on") {
			quiz_mode_check.selected = true ;
		}
		else {
			quiz_mode_check.selected = false ;			
		}
		
		if (myXML.no_resize == "on") {
			no_resize_check.selected = true ;
		}
		else {
			no_resize_check.selected = false ;			
		}	
		
		if (myXML.video_interrupts == "on") {
			video_interrupts_check.selected = true ;
		}
		else {
			video_interrupts_check.selected = false ;			
		}	
		
		if (myXML.twitter_breathalyzer == "on") {
			tweetBreathalyzer_checkbox.selected = true ;
		}
		else {
			tweetBreathalyzer_checkbox.selected = false ;			
		}		
		
		if (myXML.twitter_feature == "on")  {
			twitter_radio_on.selected = true;			
		}
		else {twitter_radio_off.selected = true;			
		}
		
		
		if (myXML.alcohol_display_value == "on")  {
			Display_Breathalyzer_Value_check.selected = true;			
		}
		else {Display_Breathalyzer_Value_check.selected = false;			
		}
		
		if (myXML.twitter_mode == "user")  {
			twitter_mode_radio_user.selected = true;	
			twitter_search_term_input.enabled = false;
			do_not_speak_twitter_search_term_checkbox.enabled = false;
		}
		
		if (myXML.twitter_mode == "search")  {
			twitter_mode_radio_search.selected = true; //we're in twitter search mode
			//twitter_username_input.enabled = false;
			twitter_password_input.enabled = false;
			only_my_tweets_checkbox.enabled = false;
		}
		
		if (myXML.twitter_mode == "mentions")  {
			twitter_mode_radio_mentions.selected = true; //we're in twitter search mode
			//twitter_username_input.enabled = false;
			twitter_password_input.enabled = false;
			only_my_tweets_checkbox.enabled = false;
			twitter_search_term_input.enabled = false;
		}
		
		
		
		//else {
			//twitter_mode_radio_search.selected = true; //we're in twitter search mode
			
			//twitter_password_input.enabled = false;
			//only_my_tweets_checkbox.enabled = false;
		//}
		
		
		ipcamera_url.text = myXML.doorcam_host;
		ipcamera_port.text = myXML.doorcam_port;
		ipcamera_username.text = myXML.doorcam_username;
		ipcamera_password.text = myXML.doorcam_password;
		ipcamera_path.text = myXML.doorcam_path;		
		
		ipcamera_dropdown.selectedIndex = myXML.doorcam_make;
			
		slide_duration_input.text = myXML.slide_delay;	 			
				
		if (reg_code_input.text == "440537" || reg_code_input.text == "110534" || reg_code_input.text == "768223" || reg_code_input.text == "998765" || reg_code_input.text == "233229" || reg_code_input.text == "643229" || reg_code_input.text == "876233" ) {
				registered.text = "REGISTERED"
				reg_code_input.editable = false;
				reg_code_input.enabled = false;
		} 		
		
			
		//if (myXML.screen_mode == "portrait")  {   //not used anymore
		//	fullscreen_radio_on.selected = true;
		//}
		//else {fullscreen_radio_off.selected = true;
		//}	
		
		
		screenMode_radio_p90.group = screenMode_rbg;
		screenMode_radio_p270.group = screenMode_rbg;
		screenMode_radio_l0.group = screenMode_rbg;
		screenMode_radio_l180.group = screenMode_rbg;		
		
		prox2beforeprox1_radio_on.group = prox2beforeprox1_rbg;
		prox2beforeprox1_radio_off.group = prox2beforeprox1_rbg;
		
		video_resolution_radio_high.group = video_resolution_rbg;
		video_resolution_radio_low.group = video_resolution_rbg;

		
		if (myXML.screen_mode == "portrait90")  {   //do this before even listen so we don't trigger an event unnecessarily
			screenMode_radio_p90.selected = true;
		}
		
		if (myXML.screen_mode == "portrait270")  {   
			screenMode_radio_p270.selected = true;
		}
		
		if (myXML.screen_mode == "landscape0")  {   
			screenMode_radio_l0.selected = true;
		}
		
		if (myXML.screen_mode == "landscape180")  {   
			screenMode_radio_l180.selected = true;
		}	
		
		
		screenMode_rbg.addEventListener(Event.CHANGE, change_orientation_event);
		
		
		tts_feature_radio_on.group = TTS_rbg; 
	    tts_feature_radio_off.group = TTS_rbg;

		tts_engine_voicerss.group = TTS_rbg_engine; 
	    tts_engine_yakitome.group = TTS_rbg_engine;
		
		photobooth_printing_radio_on.group = photobooth_printing_rbg; 
	    photobooth_printing_radio_off.group = photobooth_printing_rbg;
		
		frame_radio_on.group = frame_rbg; 
	    frame_radio_off.group = frame_rbg;
		
		webcamvideo_radio_on.group = webcamvideo_rbg; 
	    webcamvideo_radio_off.group = webcamvideo_rbg;
		
		doorcamedit_radio_character.group = doorcamedit_rbg;
		doorcamedit_radio_doorcam.group = doorcamedit_rbg;
		doorcamedit_radio_thoughts.group = doorcamedit_rbg;
		
		positioningedit_radio_character.group = positioningedit_rbg;
		positioningedit_radio_stockText.group = positioningedit_rbg;
		positioningedit_radio_weatherText.group = positioningedit_rbg;
		positioningedit_radio_weatherImage.group = positioningedit_rbg;
		positioningedit_radio_webcamImage.group = positioningedit_rbg;
		positioningedit_radio_beerImage.group = positioningedit_rbg;
		positioningedit_radio_lipsync.group = positioningedit_rbg;
		positioningedit_radio_twitterbird.group = positioningedit_rbg;
		positioningedit_radio_webcamvideo.group = positioningedit_rbg;
		positioningedit_radio_AlcoholResults.group = positioningedit_rbg;
		
		doorcamedit_radio_character.x = 300;
		doorcamedit_radio_character.y = 0;
		doorcamedit_radio_character.setStyle("textFormat", radiotext);
		doorcamedit_radio_character.textField.autoSize = TextFieldAutoSize.LEFT;		
		doorcamedit_radio_character.label = "Adjust Character";
		doorcamedit_radio_doorcam.x = 450;
		doorcamedit_radio_doorcam.y = 0;
		doorcamedit_radio_doorcam.setStyle("textFormat", radiotext);
		doorcamedit_radio_doorcam.textField.autoSize = TextFieldAutoSize.LEFT;
		doorcamedit_radio_doorcam.label = "Adjust CAM Feed";
		doorcamedit_radio_thoughts.x = 600;
		doorcamedit_radio_thoughts.y = 0;
		doorcamedit_radio_thoughts.setStyle("textFormat", radiotext);
		doorcamedit_radio_thoughts.textField.autoSize = TextFieldAutoSize.LEFT;
		doorcamedit_radio_thoughts.label = "Adjust Thoughts Image";
		doorcamedit_radio_character.selected = true;
		addChild (doorcamedit_radio_character);
		addChild (doorcamedit_radio_doorcam);
		addChild (doorcamedit_radio_thoughts);
		doorcamedit_radio_character.visible = false;
		doorcamedit_radio_doorcam.visible = false;
		doorcamedit_radio_thoughts.visible = false;		
		
		positioningedit_radio_character.x = 300;
		positioningedit_radio_character.y = 0;
		positioningedit_radio_character.setStyle("textFormat", radiotext);
		positioningedit_radio_character.textField.autoSize = TextFieldAutoSize.LEFT;		
		positioningedit_radio_character.label = "Adjust Character";		
		positioningedit_radio_stockText.x = 450;
		positioningedit_radio_stockText.y = 0;
		positioningedit_radio_stockText.setStyle("textFormat", radiotext);
		positioningedit_radio_stockText.textField.autoSize = TextFieldAutoSize.LEFT;
		positioningedit_radio_stockText.label = "Adjust Stock Text";
		positioningedit_radio_weatherText.x = 600;
		positioningedit_radio_weatherText.y = 0;
		positioningedit_radio_weatherText.setStyle("textFormat", radiotext);
		positioningedit_radio_weatherText.textField.autoSize = TextFieldAutoSize.LEFT;
		positioningedit_radio_weatherText.label = "Adjust Weather Text";
		
		positioningedit_radio_webcamvideo.x = 550;
		positioningedit_radio_webcamvideo.y = 20;
		positioningedit_radio_webcamvideo.setStyle("textFormat", radiotext);
		positioningedit_radio_webcamvideo.textField.autoSize = TextFieldAutoSize.LEFT;
		positioningedit_radio_webcamvideo.label = "Adjust USB Webcam";	
		
		positioningedit_radio_weatherImage.x = 850;
		positioningedit_radio_weatherImage.y = 0;
		positioningedit_radio_weatherImage.setStyle("textFormat", radiotext);
		positioningedit_radio_weatherImage.textField.autoSize = TextFieldAutoSize.LEFT;
		positioningedit_radio_weatherImage.label = "Adjust Weather Icon";		
		
		positioningedit_radio_webcamImage.x = 850;
		positioningedit_radio_webcamImage.y = 20;
		positioningedit_radio_webcamImage.setStyle("textFormat", radiotext);
		positioningedit_radio_webcamImage.textField.autoSize = TextFieldAutoSize.LEFT;
		positioningedit_radio_webcamImage.label = "Adjust Webcam Frame";
		
		positioningedit_radio_beerImage.x = 850;
		positioningedit_radio_beerImage.y = 40;
		positioningedit_radio_beerImage.setStyle("textFormat", radiotext);
		positioningedit_radio_beerImage.textField.autoSize = TextFieldAutoSize.LEFT;
		positioningedit_radio_beerImage.label = "Adjust Beer Icon";
		
		positioningedit_radio_lipsync.x = 850;
		positioningedit_radio_lipsync.y = 60;
		positioningedit_radio_lipsync.setStyle("textFormat", radiotext);
		positioningedit_radio_lipsync.textField.autoSize = TextFieldAutoSize.LEFT;
		positioningedit_radio_lipsync.label = "Adjust Lips for LipSync";
		
		positioningedit_radio_twitterbird.x = 850;
		positioningedit_radio_twitterbird.y = 80;
		positioningedit_radio_twitterbird.setStyle("textFormat", radiotext);
		positioningedit_radio_twitterbird.textField.autoSize = TextFieldAutoSize.LEFT;
		positioningedit_radio_twitterbird.label = "Adjust Twitter Bird";
		
		positioningedit_radio_AlcoholResults.x = 300;
		positioningedit_radio_AlcoholResults.y = 20;
		positioningedit_radio_AlcoholResults.setStyle("textFormat", radiotext);
		positioningedit_radio_AlcoholResults.textField.autoSize = TextFieldAutoSize.LEFT;
		positioningedit_radio_AlcoholResults.label = "Adjust Breathalyzer Results Text";
				
		positioningedit_radio_character.selected = true;
		
		tts_feature_radio_on.x = 10; 
	    tts_feature_radio_on.y = 40;
		tts_feature_radio_on.setStyle("textFormat", radiotext);
		tts_feature_radio_on.textField.autoSize = TextFieldAutoSize.LEFT;
		tts_feature_radio_on.label = "Use Text to Speech";		
		tts_feature_radio_off.x = 300; 
	    tts_feature_radio_off.y = 40;
		tts_feature_radio_off.setStyle("textFormat", radiotext);
		tts_feature_radio_off.textField.autoSize = TextFieldAutoSize.LEFT;
		tts_feature_radio_off.label = "Use Custom MP3s";
		
		photobooth_printing_radio_on.x = 10; 
	    photobooth_printing_radio_on.y = 40;
		photobooth_printing_radio_on.setStyle("textFormat", radiotext);
		photobooth_printing_radio_on.textField.autoSize = TextFieldAutoSize.LEFT;
		photobooth_printing_radio_on.label = "Photobooth Printing ON";		
		photobooth_printing_radio_off.x = 300; 
	    photobooth_printing_radio_off.y = 40;
		photobooth_printing_radio_off.setStyle("textFormat", radiotext);
		photobooth_printing_radio_off.textField.autoSize = TextFieldAutoSize.LEFT;
		photobooth_printing_radio_off.label = "Photobooth Printing Off";
		
		custom_audio_path_label.embedFonts = true;
		custom_audio_path_label.antiAliasType = AntiAliasType.ADVANCED;
		custom_audio_path_label.defaultTextFormat = TTSTextLabelFormat;
		custom_audio_path_label.wordWrap = true;
		custom_audio_path_label.x = 450;
		custom_audio_path_label.y = 40;
		custom_audio_path_label.width = 550;
		custom_audio_path_label.height = 80;
		custom_audio_path_label.text = "If using Custom MP3s, replace the files in " + String(file2.nativePath) + "\\custom_audio with your own MP3s. You must over-write the existing files not changing the file names.";	 		
		addChild(custom_audio_path_label);	
		custom_audio_path_label.visible = false;
			
		addChild (tts_engine_voicerss);
		addChild (tts_engine_yakitome);		
		
		tts_engine_voicerss.visible = false;
		tts_engine_yakitome.visible = false;
		
		addChild (tts_feature_radio_on);
		addChild (tts_feature_radio_off);		
		
		tts_feature_radio_on.visible = false;
		tts_feature_radio_off.visible = false;
		
		addChild (photobooth_printing_radio_on);
		addChild (photobooth_printing_radio_off);	
		
		photobooth_printing_radio_on.visible = false;
		photobooth_printing_radio_off.visible = false;
		
		addChild (positioningedit_radio_character);
		addChild (positioningedit_radio_stockText);
		addChild (positioningedit_radio_weatherText);
		addChild (positioningedit_radio_weatherImage);
		addChild (positioningedit_radio_webcamImage);
		addChild (positioningedit_radio_beerImage);
		addChild (positioningedit_radio_lipsync);
		addChild (positioningedit_radio_twitterbird);
		addChild (positioningedit_radio_webcamvideo);
		addChild (positioningedit_radio_AlcoholResults);
		
		positioningedit_radio_character.visible = false;
		positioningedit_radio_stockText.visible = false;
		positioningedit_radio_weatherText.visible = false;
		positioningedit_radio_weatherImage.visible = false;	
		positioningedit_radio_webcamImage.visible = false;	
		positioningedit_radio_beerImage.visible = false;	
		positioningedit_radio_lipsync.visible = false;	
		positioningedit_radio_twitterbird.visible = false;	
		positioningedit_radio_webcamvideo.visible = false;	
		positioningedit_radio_AlcoholResults.visible = false;	
						
		setupComboBox();
		add_stock_button.addEventListener(MouseEvent.CLICK, add_stock);
		clear_stock_button.addEventListener(MouseEvent.CLICK, clear_stock);
		saveBtn.addEventListener(MouseEvent.CLICK, saveValue);
		ResetBtn.addEventListener(MouseEvent.CLICK,Reset );
		
		var unit_temp:String;
		unit_temp = myXML.weather_reading;
		if (unit_temp == "f") {
			weather_reading_input.selectedIndex = 0;
			}
		else {weather_reading_input.selectedIndex = 1; }	
		
		var mode_temp:String;
		mode_temp = myXML.mirror_mode;
		trace(mode_temp);
		switch (mode_temp)  //sets the video playlists based on the mode
				{
				case "princess": 			
					mirror_mode_input.selectedIndex = 0;
					//URLModeString = "http://diymagicmirror.com/images/princess_sm.jpg"
					URLModeString = homepath + "images/princess_sm.jpg";					
					ModeThumb.source = URLModeString;
					break;
				case "pirate":
					mirror_mode_input.selectedIndex = 1;
					//URLModeString = "http://diymagicmirror.com/images/pirate_sm.jpg"
					URLModeString = homepath + "images/pirate_sm.jpg";						
					ModeThumb.source = URLModeString;
					break;
				case "halloween": 
					mirror_mode_input.selectedIndex = 2;
					//URLModeString = "http://diymagicmirror.com/images/halloween_sm.jpg"
					URLModeString = homepath + "images/halloween_sm.jpg";	
					ModeThumb.source = URLModeString;
					break;
				case "insult": 
					mirror_mode_input.selectedIndex = 3;
					//URLModeString = "http://diymagicmirror.com/images/insult_sm.jpg"
					URLModeString = homepath + "images/insult_sm.jpg";	
					ModeThumb.source = URLModeString;
					break;	
				case "tts_mode": 
					mirror_mode_input.selectedIndex = 4;
					//URLModeString = "http://diymagicmirror.com/images/insult_sm.jpg"
					URLModeString = homepath + "images/princess_sm.jpg";	
					ModeThumb.source = URLModeString;
					break;		
				}		
				
		
		display_mode_preset = myXML.display_mode_preset;
		
		switch (display_mode_preset)  //sets the video playlists based on the mode
				{
				case 0: 			
					display_mode_input.selectedIndex = 0;
					break;
				case 1:
					display_mode_input.selectedIndex = 1;
					break;
				case 2: 
					display_mode_input.selectedIndex = 2;
					break;
				case 3: 
					display_mode_input.selectedIndex = 3;
					break;	
				case 4: 
					display_mode_input.selectedIndex = 4;
					break;	
				case 5: 
					display_mode_input.selectedIndex = 5;
					break;	
				}
				
		selected_frame_index = myXML.frame_selected_index;		
		switch (selected_frame_index)  
				{
				case 0: 			
					frame_input.selectedIndex = 0;
					frame_selected = myXML.frame_path[0]
					break;
				case 1:
					frame_input.selectedIndex = 1;
					frame_selected = myXML.frame_path[1]
					break;
				case 2: 
					frame_input.selectedIndex = 2;
					frame_selected = myXML.frame_path[2]
					break;
				case 3: 
					frame_input.selectedIndex = 3;
					frame_selected = myXML.frame_path[3]
					break;	
				case 4: 
					frame_input.selectedIndex = 4;
					frame_selected = myXML.frame_path[4]
					break;	
				case 5: 
					frame_input.selectedIndex = 5;
					frame_selected = myXML.frame_path[5]
					break;	
				}				
						
				
		if (Number(myXML.board_version) >= 99 ) {  //not using this right now but can use down the road if the board inputs change and need to control the pins and config based on which board is selected
			URLHubGraphic = homepath + "images/sensor_hubv4.jpg";	
			HubGraphic.source = URLHubGraphic;
			//position_hub_text();
			
		}
		else {
			URLHubGraphic = homepath + "images/sensor_hub.jpg";	
			HubGraphic.source = URLHubGraphic;
			position_hub_text_below_4();
		}
				
		var com_port_temp:String;
		com_port_temp = myXML.com_port;
		switch (com_port_temp)  
				{
				case "5331": 			
					com_port_drop.selectedIndex = 0;
					break;
				case "5332":
					com_port_drop.selectedIndex = 1;
					break;
				case "5333": 
					com_port_drop.selectedIndex = 2;
					break;
				case "5334": 
					com_port_drop.selectedIndex = 3;
					break;	
				case "5335": 			
					com_port_drop.selectedIndex = 4;
					break;
				case "5336":
					com_port_drop.selectedIndex = 5;
					break;
				case "5337": 
					com_port_drop.selectedIndex = 6;
					break;
				case "5338": 
					com_port_drop.selectedIndex = 7;
					break;		
				case "5339": 
					com_port_drop.selectedIndex = 8;
					break;			
				}
				
		var webcam_restemp2:String;
		webcam_restemp2 =  myXML.photobooth_videoWidth;
		switch (webcam_restemp2)  
				{
				case "160": 			
					photobooth_WebcamResolution_dropdown.selectedIndex = 0;
					break;
				case "320":
					photobooth_WebcamResolution_dropdown.selectedIndex = 1;
					break;
				case "480": 
					photobooth_WebcamResolution_dropdown.selectedIndex = 2;
					break;
				case "640": 
					photobooth_WebcamResolution_dropdown.selectedIndex = 3;
					break;	
				case "720": 			
					photobooth_WebcamResolution_dropdown.selectedIndex = 4;
					break;
				case "1080":
					photobooth_WebcamResolution_dropdown.selectedIndex = 5;
					break;
				default:
					photobooth_WebcamResolution_dropdown.selectedIndex = 1;
				}
				
		var photobooth_papertemp2:String;
		photobooth_papertemp2 =  myXML.photobooth_papersize;
		switch (photobooth_papertemp2)  
				{
				case "A6": 			
					photobooth_PaperSize_dropdown.selectedIndex = 0;
					break;
				case "Letter": 
					photobooth_PaperSize_dropdown.selectedIndex = 1;
					break;				
				default:
					photobooth_PaperSize_dropdown.selectedIndex = 0;
		}				
				
		var quiz_temp:String;
		quiz_temp = myXML.quiz_correctanswer;
		switch (quiz_temp)  
				{
				case "0": 			
					quiz_correctanswer_drop.selectedIndex = 0;
					break;
				case "2":
					quiz_correctanswer_drop.selectedIndex = 1;
					break;
				case "3": 
					quiz_correctanswer_drop.selectedIndex = 2;
					break;
				case "5": 
					quiz_correctanswer_drop.selectedIndex = 3;
					break;	
				default:
					quiz_correctanswer_drop.selectedIndex = 0;
				}
		
		if (myXML.video_resolution == "high")  {
			video_resolution_radio_high.selected = true;
		}
		else {video_resolution_radio_low.selected = true;
		}
		
		//if (myXML.board_version == "3")  {
			//arduino_version_input.selectedIndex = 1;
			//arduino_version_input.enabled = false;			
		//}
		
		//else {arduino_version_input.enabled = true;
		//}
		
		initFiles(); //get the files names
		//output.text = idle_clipp;
		
		
		
		video_resolution_rbg.addEventListener(Event.CHANGE, video_resolution_changedEvent); //the video res was changed so reload
		board_version_input.addEventListener(Event.CHANGE, board_version_changedEvent); 
		
		if (myXML.atmega == "m168")  {
			arduino_version_input.selectedIndex = 0;
		}
		else {
			arduino_version_input.selectedIndex = 1;
		}
		
		if (myXML.analog_input1 == "on")  {
			analog1_radio_on.selected = true;
			a1.text = "ON";
			analog1_video1_check.enabled = true ;
		}
		else {analog1_radio_off.selected = true;
			a1.text = "OFF";
			analog1_video1_check.enabled = false ;
		}
		
		if (myXML.analog_input2 == "on")  {
			analog2_radio_on.selected = true;
			a2.text = "ON";
			analog2_video2_check.enabled = true ;
		}
		else {analog2_radio_off.selected = true;
			a2.text = "OFF";
			analog2_video2_check.enabled = false ;
		}
		
		if (myXML.analog_input3 == "on")  {
			analog3_radio_on.selected = true;
			a3.text = "ON";
			analog3_prox.enabled = true ;
			analog3_video3_check.enabled = true ;
		}
		else {analog3_radio_off.selected = true;
			a3.text = "OFF";
			analog3_prox.enabled = false;
			analog3_video3_check.enabled = false ;
		}
		
		if (myXML.analog1_video1 == "on") {
			analog1_video1_check.selected = true ;
		}
		else {
			analog1_video1_check.selected = false ;			
		}
		
		if (myXML.analog2_video2 == "on") {
			analog2_video2_check.selected = true ;
		}
		else {
			analog2_video2_check.selected = false ;			
		}
		
		if (myXML.analog3_video3 == "on") {
			analog3_video3_check.selected = true ;
		}
		else {
			analog3_video3_check.selected = false ;			
		}
		
		if (myXML.analog3_prox == "on") {
			analog3_prox.selected = true ;
		}
		else {
			analog3_prox.selected = false ;			
		}
		
		if (myXML.digital2_video1 == "on") {
			digital2_video1_check.selected = true ;
		}
		else {
			digital2_video1_check.selected = false ;			
		}
		
		if (myXML.digital3_video2 == "on") {
			digital3_video2_check.selected = true ;
		}
		else {
			digital3_video2_check.selected = false ;			
		}
		
		if (myXML.digital5_video3 == "on") {
			digital5_video3_check.selected = true ;
		}
		else {
			digital5_video3_check.selected = false ;			
		}
		
		if (myXML.picasa_insteadofphotobooth == "on") {
			picasa_instead_check.selected = true ;
			picasa_instead_check.enabled = true;
		}
		else {
			picasa_instead_check.selected = false ;			
			picasa_instead_check.enabled = false;
		}
		
		
		if (myXML.stand_alone == "on") {
			StandAloneCheck.selected = true ;
		}
		else {
			StandAloneCheck.selected = false ;			
		}
		
		if (myXML.stand_alone_weather == "on") {
			StandAloneWeatherCheck.selected = true ;
		}
		else {
			StandAloneWeatherCheck.selected = false ;			
		}
		
		if (myXML.stand_alone_stock == "on") {
			StandAloneStockCheck.selected = true ;
		}
		else {
			StandAloneStockCheck.selected = false ;			
		}
		
		
		if (myXML.switch1 == "on")  {
			switch1_radio_on.selected = true;
			d2.text = "ON";
			digital1_prox.enabled = true ;
		}
		else {switch1_radio_off.selected = true;
			d2.text = "OFF";
			digital1_prox.enabled = false;
		}
		
		if (myXML.digital1_prox == "on") {
			digital1_prox.selected = true ;
		}
		else {
			digital1_prox.selected = false ;			
		}
		
		if (myXML.switch2 == "on")  {
			switch2_radio_on.selected = true;
			digital2_video1_check.enabled = true;
			d3.text = "ON";
		}
		else {switch2_radio_off.selected = true;
			digital2_video1_check.enabled = false;
			d3.text = "OFF";
		}
		
		if (myXML.switch3 == "on")  {
			switch3_radio_on.selected = true;
			digital3_video2_check.enabled = true;
			d4.text = "ON";
		}
		else {switch3_radio_off.selected = true;
			digital3_video2_check.enabled = false;
			d4.text = "OFF";
		}
		
		if (myXML.switch4 == "on")  {
			switch4_radio_on.selected = true;
			display_mode_input.selectedIndex = 0;
			webcamvideo_radio_off.selected = true;
			d7.text = "ON";
		}
		else {switch4_radio_off.selected = true;
			d7.text = "OFF";
		}
				
		if (myXML.switch5 == "on")  {
			switch5_radio_on.selected = true;
			digital5_video3_check.enabled = true;
			d5.text = "ON";
		}
		else {
			switch5_radio_off.selected = true;
			digital5_video3_check.enabled = false;
			d5.text = "OFF";
		}
		
		if (myXML.picasa_insteadofphotobooth == "on")  {
			picasa_instead_check.enabled = true;
		}
		else {			
			picasa_instead_check.enabled = false;
		}
				
		if (myXML.switch6 == "on")  {
			switch6_radio_on.selected = true;
			d6.text = "ON";
		}
		else {switch6_radio_off.selected = true;
			d6.text = "OFF";
		}
		
		if (myXML.LED_mode == "fire")  {
			LEDmode_radio_on.selected = true;
		}
		else {LEDmode_radio_off.selected = true;			
		}
		
		if (myXML.x10_commands == "on")  {
			x10_radio_on.selected = true;			
		}
		else {x10_radio_off.selected = true;			
		}
		
		if (myXML.display_breathalyzer_text == "on")  {
			AlcoholResults_readout_radio_on.selected = true;			
		}
		else {AlcoholResults_readout_radio_off.selected = true;			
		}
		
		if (myXML.display_stock_text == "on")  {
			stock_readout_radio_on.selected = true;			
		}
		else {stock_readout_radio_off.selected = true;			
		}
		
		if (myXML.display_weather_text == "on")  {
			weather_readout_radio_on.selected = true;			
		}
		else {weather_readout_radio_off.selected = true;			
		}
		
		if (myXML.display_weather_image == "on")  {
			weather_graphic_radio_on.selected = true;			
		}
		else {weather_graphic_radio_off.selected = true;			
		}
		
		if (myXML.frame == "on")  {
			frame_radio_on.selected = true;			
		}
		else {frame_radio_off.selected = true;			
		}
		
		if (myXML.webcam_on == "on")  {
			webcamvideo_radio_on.selected = true;			
		}
		else {
			webcamvideo_radio_off.selected = true; //it's off so we also need to disable the frame			
		}
		
		if (myXML.webcamStealth == "on")  {   
			webcamStealthCheck.selected = true;			
		}
		else {webcamStealthCheck.selected = false;	
		}	
		
		if (myXML.idle_videos == "on")  {
			idle_radio_on.selected = true;			
		}
		else {idle_radio_off.selected = true;			
		}
		
		if (myXML.doorcam_on == "on")  {
			doorcam_radio_on.selected = true;			
		}
		else {
			doorcam_radio_off.selected = true;			
		}
				
		if (myXML.hardware_mode_select == "on")  {
			hardware_mode_select_radio_on.selected = true;
			a4.text = "ON";
		}
		else {hardware_mode_select_radio_off.selected = true;
			a4.text = "OFF";
		}
		
		if (myXML.proximity_sensor_on == "on")  {
			analog0_radio_on.selected = true;
			a0.text = "ON";
		}
		else {analog0_radio_off.selected = true;
			a0.text = "OFF";
		}
		
		if (myXML.prox2_before_prox1 == "on")  {
			prox2beforeprox1_radio_on.selected = true;
		}
		else {prox2beforeprox1_radio_off.selected = true;
		}
				
		//if (myXML.full_screen == "yes")  {   //not used anymore
			//fullscreen_radio_on.selected = true;
		//}
		//else {fullscreen_radio_off.selected = true;
		//}	
		
		if (myXML.verbose == "yes")  {
			verbose_radio_on.selected = true;
		}
		else {verbose_radio_off.selected = true;
		}	
		
		//stock_list
		var stockArray:Array = new Array();
		var i:int = 0;
		for each (var item:XML in myXML.stocks.symbol)
					{
						stockArray.push(myXML.stocks.symbol[i]);
						i++;
					}
		var num_stocks = stockArray.length;
		var stock_string:String = stockArray.join("+");
		//trace (stock_string);
		stock_list.text = stock_string;	
		
		arduino_version_input.enabled = false;
		var board_version_temp:String;
		board_version_temp = myXML.board_version;
		switch (board_version_temp)  //sets the video playlists based on the mode
				{
				case "1": 			
					board_version_input.selectedIndex = 0;	//v1
					arduino_version_input.selectedIndex = 0;
					break;
				case "2": 
					 board_version_input.selectedIndex = 1; //v2
					 arduino_version_input.selectedIndex = 0;
					break;
				case "3": 
					 board_version_input.selectedIndex = 2; //v3 board
					 arduino_version_input.selectedIndex = 1;
					break;	
				case "4": 
					 board_version_input.selectedIndex = 3; //v4 board
					 arduino_version_input.selectedIndex = 1;
					break;	
				case "5": 
					 board_version_input.selectedIndex = 4; //v5 board
					 arduino_version_input.selectedIndex = 1;
					break;		
				default:
					board_version_input.selectedIndex = 4; //changed to default v5 board which is an arduino uno
					arduino_version_input.selectedIndex = 1;
				}
								
		
		var house_temp:String;
		house_temp = myXML.x10_house1;
		trace(house_temp);
		switch (house_temp)  //sets the video playlists based on the mode
				{
				case "A": 			
					house_code_input.selectedIndex = 0;					
					break;
				case "B": //tropical storm
					house_code_input.selectedIndex = 1;
					break;
				case "C": //hurricane
					house_code_input.selectedIndex = 2;
					break;
				case "D": //hurricane
					house_code_input.selectedIndex = 3;
					break;
				case "E": //hurricane
					house_code_input.selectedIndex = 4;
					break;
				case "F": //hurricane
					house_code_input.selectedIndex = 5;
					break;
				case "G": //hurricane
					house_code_input.selectedIndex = 6;
					break;
				case "H": 			
					house_code_input.selectedIndex = 7;					
					break;
				case "I": //tropical storm
					house_code_input.selectedIndex = 8;
					break;
				case "J": //hurricane
					house_code_input.selectedIndex = 9;
					break;
				case "K": //hurricane
					house_code_input.selectedIndex = 10;
					break;
				case "L": //hurricane
					house_code_input.selectedIndex = 11;
					break;
				case "M": //hurricane
					house_code_input.selectedIndex = 12;
					break;
				case "N": //hurricane
					house_code_input.selectedIndex = 13;
					break;
				case "O": //hurricane
					house_code_input.selectedIndex = 14;
					break;
				case "P": //hurricane
					house_code_input.selectedIndex = 15;
					break;			
				default: //hurricane
					house_code_input.selectedIndex = 0;
					break;
				}		
		var unit_temp2:String;
		unit_temp2 = myXML.x10_unit1;
		switch (unit_temp2)  //sets the video playlists based on the mode
				{
				case "1": 			
					unit_code_input.selectedIndex = 0;					
					break;
				case "2": //tropical storm
					unit_code_input.selectedIndex = 1;
					break;
				case "3": //hurricane
					unit_code_input.selectedIndex = 2;
					break;
				case "4": //hurricane
					unit_code_input.selectedIndex = 3;
					break;
				case "5": //hurricane
					unit_code_input.selectedIndex = 4;
					break;
				case "6": //hurricane
					unit_code_input.selectedIndex = 5;
					break;
				case "7": //hurricane
					unit_code_input.selectedIndex = 6;
					break;
				case "8": 			
					unit_code_input.selectedIndex = 7;					
					break;
				case "9": //tropical storm
					unit_code_input.selectedIndex = 8;
					break;
				case "10": //hurricane
					unit_code_input.selectedIndex = 9;
					break;
				case "11": //hurricane
					unit_code_input.selectedIndex = 10;
					break;
				case "12": //hurricane
					unit_code_input.selectedIndex = 11;
					break;
				case "13": //hurricane
					unit_code_input.selectedIndex = 12;
					break;
				case "14": //hurricane
					unit_code_input.selectedIndex = 13;
					break;
				case "15": //hurricane
					unit_code_input.selectedIndex = 14;
					break;
				case "16": //hurricane
					unit_code_input.selectedIndex = 15;
					break;			
				default: //hurricane
					unit_code_input.selectedIndex = 0;
					break;
				}		
				
		var house_temp2:String;
		house_temp2 = myXML.x10_house2;
		trace(house_temp2);
		switch (house_temp2)  //sets the video playlists based on the mode
				{
				case "A": 			
					onoff_house_code_input.selectedIndex = 0;					
					break;
				case "B": //tropical storm
					onoff_house_code_input.selectedIndex = 1;
					break;
				case "C": //hurricane
					onoff_house_code_input.selectedIndex = 2;
					break;
				case "D": //hurricane
					onoff_house_code_input.selectedIndex = 3;
					break;
				case "E": //hurricane
					onoff_house_code_input.selectedIndex = 4;
					break;
				case "F": //hurricane
					onoff_house_code_input.selectedIndex = 5;
					break;
				case "G": //hurricane
					onoff_house_code_input.selectedIndex = 6;
					break;
				case "H": 			
					onoff_house_code_input.selectedIndex = 7;					
					break;
				case "I": //tropical storm
					onoff_house_code_input.selectedIndex = 8;
					break;
				case "J": //hurricane
					onoff_house_code_input.selectedIndex = 9;
					break;
				case "K": //hurricane
					onoff_house_code_input.selectedIndex = 10;
					break;
				case "L": //hurricane
					onoff_house_code_input.selectedIndex = 11;
					break;
				case "M": //hurricane
					onoff_house_code_input.selectedIndex = 12;
					break;
				case "N": //hurricane
					onoff_house_code_input.selectedIndex = 13;
					break;
				case "O": //hurricane
					onoff_house_code_input.selectedIndex = 14;
					break;
				case "P": //hurricane
					onoff_house_code_input.selectedIndex = 15;
					break;			
				default: //hurricane
					onoff_house_code_input.selectedIndex = 0;
					break;
				}		
		var unit_temp3:String;
		unit_temp3 = myXML.x10_unit2;
		switch (unit_temp3)  //sets the video playlists based on the mode
				{
				case "1": 			
					onoff_unit_code_input.selectedIndex = 0;					
					break;
				case "2": //tropical storm
					onoff_unit_code_input.selectedIndex = 1;
					break;
				case "3": //hurricane
					onoff_unit_code_input.selectedIndex = 2;
					break;
				case "4": //hurricane
					onoff_unit_code_input.selectedIndex = 3;
					break;
				case "5": //hurricane
					onoff_unit_code_input.selectedIndex = 4;
					break;
				case "6": //hurricane
					onoff_unit_code_input.selectedIndex = 5;
					break;
				case "7": //hurricane
					onoff_unit_code_input.selectedIndex = 6;
					break;
				case "8": 			
					onoff_unit_code_input.selectedIndex = 7;					
					break;
				case "9": //tropical storm
					onoff_unit_code_input.selectedIndex = 8;
					break;
				case "10": //hurricane
					onoff_unit_code_input.selectedIndex = 9;
					break;
				case "11": //hurricane
					onoff_unit_code_input.selectedIndex = 10;
					break;
				case "12": //hurricane
					onoff_unit_code_input.selectedIndex = 11;
					break;
				case "13": //hurricane
					onoff_unit_code_input.selectedIndex = 12;
					break;
				case "14": //hurricane
					onoff_unit_code_input.selectedIndex = 13;
					break;
				case "15": //hurricane
					onoff_unit_code_input.selectedIndex = 14;
					break;
				case "16": //hurricane
					onoff_unit_code_input.selectedIndex = 15;
					break;			
				default: //hurricane
					onoff_unit_code_input.selectedIndex = 0;
					break;
				}		
				
		if (myXML.tts_feature == "on")  { //this is the default
			tts_feature_radio_on.selected = true;			
		}
		else {tts_feature_radio_off.selected = true;			
		}
		
		if (myXML.tts_engine == "voicerss")  { //this is the default
			tts_engine_voicerss.selected = true;			
		}
		else {tts_engine_yakitome.selected = true;			
		}
		
		if (myXML.photobooth_printing == "on")  { 
			photobooth_printing_radio_on.selected = true;			
		}
		else {photobooth_printing_radio_off.selected = true;			
		}
		
		
			/* These are the supported languages from Voices RSS as of June 2016 http://www.voicerss.org/api/documentation.aspx
			ca-es	Catalan
			zh-cn	Chinese (China)
			zh-hk	Chinese (Hong Kong)
			zh-tw	Chinese (Taiwan)
			da-dk	Danish
			nl-nl	Dutch
			en-au	English (Australia)
			en-ca	English (Canada)
			en-gb	English (Great Britain)
			en-in	English (India)
			en-us	English (United States)
			fi-fi	Finnish
			fr-ca	French (Canada)
			fr-fr	French (France)
			de-de	German
			it-it	Italian
			ja-jp	Japanese
			ko-kr	Korean
			nb-no	Norwegian
			pl-pl	Polish
			pt-br	Portuguese (Brazil)
			pt-pt	Portuguese (Portugal)
			ru-ru	Russian
			es-mx	Spanish (Mexico)
			es-es	Spanish (Spain)
			sv-se	Swedish (Sweden)		
					*/
					
		/*	Languages from Yakitome as of June 26, 2016, note these are the free ones, they have pay ones but those are not included here	
					TTS_languages_dropdown.addItem( { label: "German Female", data:"Klara" } );
				TTS_languages_dropdown.addItem( { label: "German Male", data:"Reiner" } );
				TTS_languages_dropdown.addItem( { label: "Spanish Male", data:"Alberto" } );
				TTS_languages_dropdown.addItem( { label: "French Candadian Male", data:"Arnaud" } );
				TTS_languages_dropdown.addItem( { label: "French Female", data:"Juliette" } );
				TTS_languages_dropdown.addItem( { label: "French Male", data:"Alain" } );			
				TTS_languages_dropdown.addItem( { label: "UK Female", data:"Anjali" } );	
				TTS_languages_dropdown.addItem( { label: "UK Female 2", data:"Audrey" } );
				TTS_languages_dropdown.addItem( { label: "US Female", data:"Crystal" } );
				TTS_languages_dropdown.addItem( { label: "US Female 2", data:"Julia" } );
				TTS_languages_dropdown.addItem( { label: "US Female 3", data:"Lauren" } );
				TTS_languages_dropdown.addItem( { label: "US Female 4", data:"Randy" } );
				TTS_languages_dropdown.addItem( { label: "US Male Default", data:"Dave" } );
				TTS_languages_dropdown.addItem( { label: "US Male", data:"Mike" } );*/
		
		//*** now set the TTL language
		//var language_temp:String;
		//language_temp = myXML.tts_language;  //old google tts code, google killed the public tts api so we had to switch
		
		//setTTSLanguageDropDownfromXML();
		
		
		if (myXML.tts_engine == "voicerss") {
			setVoiceRSSDropDownfromXML();
		}
		else if (myXML.tts_engine == "yakitome") {
			setYakitomeDropDownfromXML();
		}
		else {
			setVoiceRSSDropDownfromXML();
			tts_engine_voicerss.selected == true;
			trace("we got no match for the TTS engine from the XML, so let's just set it to voicerss as the default");
		}
	}
	
	private function setVoiceRSSDropDownfromXML():void {
		var language:String = myXML.ttsrss_language;
		switch (language)    //IMPORTANT evidently you can't switch on myXML.x so that's why we added the temp language string
					{
					case "ca-es": 			
						TTS_languages_dropdown.selectedIndex = 0;
						break;
					case "zh-cn":
						TTS_languages_dropdown.selectedIndex = 1;
						break;
					case "zh-hk": 
						TTS_languages_dropdown.selectedIndex = 2;
						break;
					case "zh-tw": 
						TTS_languages_dropdown.selectedIndex = 3;
						break;	
					case "da-dk": 			
						TTS_languages_dropdown.selectedIndex = 4;
						break;
					case "nl-nl":
						TTS_languages_dropdown.selectedIndex = 5;
						break;
					case "en-au": 
						TTS_languages_dropdown.selectedIndex = 6;
						break;
					case "en-ca": 
						TTS_languages_dropdown.selectedIndex = 7;
						break;		
					case "en-gb": 
						TTS_languages_dropdown.selectedIndex = 8;
						break;			
					case "en-in": 			
						TTS_languages_dropdown.selectedIndex = 9;
						break;
					case "en-us":
						TTS_languages_dropdown.selectedIndex = 10;
						break;
					case "fi-fi": 
						TTS_languages_dropdown.selectedIndex = 11;
						break;
					case "fr-ca": 
						TTS_languages_dropdown.selectedIndex = 12;
						break;	
					case "fr-fr": 			
						TTS_languages_dropdown.selectedIndex = 13;
						break;
					case "de-de":
						TTS_languages_dropdown.selectedIndex = 14;
						break;
					case "it-it": 
						TTS_languages_dropdown.selectedIndex = 15;
						break;
					case "ja-jp": 
						TTS_languages_dropdown.selectedIndex = 16;
						break;		
					case "ko-kr": 
						TTS_languages_dropdown.selectedIndex = 17;
						break;				
					case "nb-no": 			
						TTS_languages_dropdown.selectedIndex = 18;
						break;
					case "pl-pl":
						TTS_languages_dropdown.selectedIndex = 19;
						break;
					case "pt-br": 
						TTS_languages_dropdown.selectedIndex = 20;
						break;
					case "pt-pt": 
						TTS_languages_dropdown.selectedIndex = 21;
						break;	
					case "ru-ru": 			
						TTS_languages_dropdown.selectedIndex = 22;
						break;
					case "es-mx":
						TTS_languages_dropdown.selectedIndex = 23;
						break;
					case "es-es": 
						TTS_languages_dropdown.selectedIndex = 24;
						break;
					case "sv-se": 
						TTS_languages_dropdown.selectedIndex = 25;
						break;
					default:
						TTS_languages_dropdown.selectedIndex = 8;
					}	
	}
	
	private function setYakitomeDropDownfromXML():void {
		var language:String = myXML.ttsyakitome_voice;
		switch (language)  
					{
					case "Klara": 			
						TTS_languages_dropdown.selectedIndex = 0;
						break;
					case "Reiner":
						TTS_languages_dropdown.selectedIndex = 1;
						break;
					case "Alberto": 
						TTS_languages_dropdown.selectedIndex = 2;
						break;
					case "Arnaud": 
						TTS_languages_dropdown.selectedIndex = 3;
						break;	
					case "Juliette": 			
						TTS_languages_dropdown.selectedIndex = 4;
						break;
					case "Alain":
						TTS_languages_dropdown.selectedIndex = 5;
						break;
					case "Anjali": 
						TTS_languages_dropdown.selectedIndex = 6;
						break;
					case "Audrey": 
						TTS_languages_dropdown.selectedIndex = 7;
						break;		
					case "Crystal": 
						TTS_languages_dropdown.selectedIndex = 8;
						break;			
					case "Julia": 			
						TTS_languages_dropdown.selectedIndex = 9;
						break;
					case "Lauren":
						TTS_languages_dropdown.selectedIndex = 10;
						break;
					case "Randy": 
						TTS_languages_dropdown.selectedIndex = 11;
						break;
					case "Dave": 
						TTS_languages_dropdown.selectedIndex = 12;
						break;	
					case "Mike": 			
						TTS_languages_dropdown.selectedIndex = 13;
						break;
					default:
						TTS_languages_dropdown.selectedIndex = 12;
					}	
	}
	
	private function photobooth_PrintCopies_sliderEvent(event:SliderEvent):void {
    	photobooth_PrintCopiesValue_label.text = String(event.value);
	}
	
	private function photobooth_WebcamFPS_sliderEvent(event:SliderEvent):void {
    	photobooth_WebcamFPSValue_label.text = String(event.value);
	}
	
	private function photobooth_CountDownFrom_sliderEvent(event:SliderEvent):void {
    	photobooth_CountDownFromValue_label.text = String(event.value);
	}
	
	private function photobooth_ShotDelay_sliderEvent(event:SliderEvent):void {
    	photobooth_ShotDelayValue_label.text = String(event.value);
	}
	
	private function photobooth_PhotoPreviewDuration_sliderEvent(event:SliderEvent):void {
    	photobooth_PhotoPreviewDurationValue_label.text = String(event.value);
	}
	
	private function photobooth_ProofPreviewDuration_sliderEvent(event:SliderEvent):void {
    	photobooth_ProofPreviewDurationValue_label.text = String(event.value);
	}
	
	
	
	private function video_resolution_changedEvent(e:Event):void { //this is now really setting portrait and landscape parameters
			initFiles(); //set this flag telling the user the program must be re-started
			switch_mode();
	}
	
	private function board_version_changedEvent(e:Event):void { 
		switch (board_version_input.selectedIndex)  //sets the video playlists based on the mode
				{
				case 0: 			
					arduino_version_input.selectedIndex = 0;  //v1 board with atmega168 and touch sensor on pin1
					//URLHubGraphic = homepath + "images/sensor_hub.jpg";	
					//HubGraphic.source = URLHubGraphic;
					//position_hub_text_below_4(); //this function will move the position of the text to match the changed sensor hub graphic
					
					break;
				case 1:
					arduino_version_input.selectedIndex = 0;  //v2 board with atmega168
					//URLHubGraphic = homepath + "images/sensor_hub.jpg";	
					//HubGraphic.source = URLHubGraphic;
					//position_hub_text_below_4();
					break;
				case 2:
					arduino_version_input.selectedIndex = 1;  //v3 board
					//URLHubGraphic = homepath + "images/sensor_hub.jpg";	
					//HubGraphic.source = URLHubGraphic;					
					//position_hub_text_below_4();
					break;
				case 3:
					arduino_version_input.selectedIndex = 1;  //v4 board
					//URLHubGraphic = homepath + "images/sensor_hub.jpg";	
					//URLHubGraphic = homepath + "images/sensor_hubv4.jpg";	
					//HubGraphic.source = URLHubGraphic;					
					//position_hub_text();  //this function will move the position of the text to match the changed sensor hub graphic
					break;					
				case 4:
					arduino_version_input.selectedIndex = 1;  //v5 board
					//URLHubGraphic = homepath + "images/sensor_hub.jpg";	
					//URLHubGraphic = homepath + "images/sensor_hubv4.jpg";	
					//HubGraphic.source = URLHubGraphic;					
					//position_hub_text();  //this function will move the position of the text to match the changed sensor hub graphic
					break;						
					
				default: 
					arduino_version_input.selectedIndex = 1;
					//URLHubGraphic = homepath + "images/sensor_hub.jpg";	
					//URLHubGraphic = homepath + "images/sensor_hubv4.jpg";	
					//HubGraphic.source = URLHubGraphic;
					//position_hub_text();
					break;
				}		
				
		
		//if (board_version_input.selectedIndex == 2)  {
			//arduino_version_input.selectedIndex = 1;
			//arduino_version_input.enabled = false;
		//}
		//else {arduino_version_input.enabled = true;
		//}
	}
	
	
	private function position_hub_text():void {
		a0.x = 424;
		a0.y = 59.50;
		a1.x = 424;
		a1.y = 102.35;
		a2.x = 424;
		a2.y = 146.35;
		a3.x = 424;
		a3.y = 190.50;
		d2.x = 487;
		d2.y = 233.10;
		d3.x = 487;
		d3.y = 280.85;
		d4.x = 487;
		d4.y = 326.05;
		d7.x = 487;
		d7.y = 373.50;
		d5.x = 487;
		d5.y = 416.55;
		d6.visible = true;
		d6.x = 487;
		d6.y = 451.55;
		a4.x = 483.90;
		a4.y = 484.45;
		switch6_radio_on.visible = true;
		switch6_radio_off.visible = true;
		switch6_text.visible = true;
	}
	
	private function position_hub_text_below_4():void {
		a0.x = 424;
		a0.y = 73;
		a1.x = 424;
		a1.y = 115;
		a2.x = 424;
		a2.y = 160;
		a3.x = 424;
		a3.y = 205;
		d2.x = 487;
		d2.y = 248;
		d3.x = 487;
		d3.y = 292;
		d4.x = 487;
		d4.y = 340;
		d7.x = 487;
		d7.y = 385;
		d5.x = 487;
		d5.y = 428;
		d6.visible = false;
		a4.x = 483.90;
		a4.y = 467;
		switch6_radio_on.visible=false;
		switch6_radio_off.visible=false;
		switch6_text.visible = false;
		switch6_radio_off.selected = true;		
	}
	
	private function initFiles():void  {
		
			
			if (video_resolution_radio_high.selected == true) { //show the high res videos	
		        
							
				idle_clipp =   		homepath + myXML.princess[0];  
				idle_dup_clipp =	homepath + myXML.princess[0];  
				proximity1_clipp = 	homepath + myXML.princess[1];
				proximity2_clipp =   homepath + myXML.princess[2];
				touch1_clipp =       homepath + myXML.princess[3];
				weather_good_clipp = homepath + myXML.princess[4];
				weather_ok_clipp =   homepath + myXML.princess[5];
				weather_rain_clipp = homepath + myXML.princess[6];
				no_internet_clipp = homepath + myXML.princess[7];
				stock_up_clipp = 	homepath + myXML.princess[8];
				stock_no_change_clipp= homepath + myXML.princess[9];
				stock_down_clipp =   homepath + myXML.princess[10];
				doorbell_clipp =     homepath + myXML.princess[11];
				phone_clipp = 		homepath + myXML.princess[12];
				video1_clipp = 		homepath + myXML.princess[13];
				video2_clipp = 		homepath + myXML.princess[14];
				video3_clipp = 		homepath + myXML.princess[15];
				video4_clipp = 		homepath + myXML.princess[16];
				proximity3_clipp =   homepath + myXML.princess[17];	
	 			x10_on_clipp = 		homepath + myXML.princess[18];	
				x10_off_clipp = 	homepath + myXML.princess[19];	
				
				idle_cliph =   		homepath + myXML.halloween[0];  
				idle_dup_cliph =   	homepath + myXML.halloween[0]; 
				proximity1_cliph = 	homepath + myXML.halloween[1];
				proximity2_cliph =   homepath + myXML.halloween[2];
				touch1_cliph =       homepath + myXML.halloween[3];
				weather_good_cliph = homepath + myXML.halloween[4];
				weather_ok_cliph =   homepath + myXML.halloween[5];
				weather_rain_cliph = homepath + myXML.halloween[6];
				no_internet_cliph = homepath + myXML.halloween[7];
				stock_up_cliph = 	homepath + myXML.halloween[8];
				stock_no_change_cliph = homepath + myXML.halloween[9];
				stock_down_cliph =   homepath + myXML.halloween[10];
				doorbell_cliph =    homepath + myXML.halloween[11];
				phone_cliph = 		homepath + myXML.halloween[12];
				video1_cliph = 		homepath + myXML.halloween[13];
				video2_cliph = 		homepath + myXML.halloween[14];
				video3_cliph = 		homepath + myXML.halloween[15];
				video4_cliph = 		homepath + myXML.halloween[16];				
				proximity3_cliph =  homepath + myXML.halloween[17];	
	 			x10_on_cliph = 		homepath + myXML.halloween[18];	
				x10_off_cliph = 	homepath + myXML.halloween[19];	
				
				idle_clippi =   	homepath + myXML.pirate[0];  
				idle_dup_clippi =  	homepath + myXML.pirate[0];  
				proximity1_clippi = homepath + myXML.pirate[1];
				proximity2_clippi = homepath +   myXML.pirate[2];
				touch1_clippi =      homepath +  myXML.pirate[3];
				weather_good_clippi = homepath + myXML.pirate[4];
				weather_ok_clippi =   homepath + myXML.pirate[5];
				weather_rain_clippi = homepath + myXML.pirate[6];
				no_internet_clippi = 	homepath + myXML.pirate[7];
				stock_up_clippi = 		homepath + myXML.pirate[8];
				stock_no_change_clippi= homepath + myXML.pirate[9];
				stock_down_clippi =   homepath + myXML.pirate[10];
				doorbell_clippi =     homepath + myXML.pirate[11];
				phone_clippi = 			homepath + myXML.pirate[12];
				video1_clippi = 		homepath + myXML.pirate[13];
				video2_clippi = 		homepath + myXML.pirate[14];
				video3_clippi = 		homepath + myXML.pirate[15];
				video4_clippi = 		homepath + myXML.pirate[16];								
				proximity3_clippi =  	homepath + myXML.pirate[17];	
	 			x10_on_clippi = 		homepath + myXML.pirate[18];	
				x10_off_clippi = 		homepath + myXML.pirate[19];	
				
				idle_clipi =   		homepath + myXML.insult[0];  
				idle_dup_clipi =  	homepath + myXML.insult[0];  
				proximity1_clipi = 	homepath + myXML.insult[1];
				proximity2_clipi =   homepath + myXML.insult[2];
				touch1_clipi =       homepath + myXML.insult[3];
				weather_good_clipi = homepath + myXML.insult[4];
				weather_ok_clipi =   homepath + myXML.insult[5];
				weather_rain_clipi = homepath + myXML.insult[6];
				no_internet_clipi = homepath + myXML.insult[7];
				stock_up_clipi = 	homepath + myXML.insult[8];
				stock_no_change_clipi= homepath + myXML.insult[9];
				stock_down_clipi =   homepath + myXML.insult[10];
				doorbell_clipi =     homepath + myXML.insult[11];
				phone_clipi = 		homepath + myXML.insult[12];
				video1_clipi = 		homepath + myXML.insult[13];
				video2_clipi = 		homepath + myXML.insult[14];
				video3_clipi = 		homepath + myXML.insult[15];
				video4_clipi = 		homepath + myXML.insult[16];								
				proximity3_clipi = 	homepath + myXML.insult[17];	
	 			x10_on_clipi = 		homepath + myXML.insult[18];	
				x10_off_clipi = 	homepath + myXML.insult[19];	
				
				lipsync_clip = 	homepath + myXML.lipsync_clip;	
	   	}
	   else { //get the lower res videos instead
	   			idle_clipp = homepath + myXML.princess[0].substr(0,myXML.princess[0].lastIndexOf('.')) + "l" + myXML.princess[0].substr(-4);   
				idle_dup_clipp = homepath + myXML.princess[0].substr(0,myXML.princess[0].lastIndexOf('.')) + "l" + myXML.princess[0].substr(-4);; 
				proximity1_clipp = 	homepath + myXML.princess[1].substr(0,myXML.princess[1].lastIndexOf('.')) + "l" + myXML.princess[1].substr(-4);
				proximity2_clipp =   homepath + myXML.princess[2].substr(0,myXML.princess[2].lastIndexOf('.')) + "l" + myXML.princess[2].substr(-4);
				touch1_clipp =       homepath + myXML.princess[3].substr(0,myXML.princess[3].lastIndexOf('.')) + "l" + myXML.princess[3].substr(-4);
				weather_good_clipp = homepath + myXML.princess[4].substr(0,myXML.princess[4].lastIndexOf('.')) + "l" + myXML.princess[4].substr(-4);
				weather_ok_clipp =   homepath + myXML.princess[5].substr(0,myXML.princess[5].lastIndexOf('.')) + "l" + myXML.princess[5].substr(-4);
				weather_rain_clipp = homepath + myXML.princess[6].substr(0,myXML.princess[6].lastIndexOf('.')) + "l" + myXML.princess[6].substr(-4);
				no_internet_clipp = homepath + myXML.princess[7].substr(0,myXML.princess[7].lastIndexOf('.')) + "l" + myXML.princess[7].substr(-4);
				stock_up_clipp = 	homepath + myXML.princess[8].substr(0,myXML.princess[8].lastIndexOf('.')) + "l" + myXML.princess[8].substr(-4);
				stock_no_change_clipp = homepath + myXML.princess[9].substr(0,myXML.princess[9].lastIndexOf('.')) + "l" + myXML.princess[9].substr(-4);
				stock_down_clipp =   homepath + myXML.princess[10].substr(0,myXML.princess[10].lastIndexOf('.')) + "l" + myXML.princess[10].substr(-4);
				doorbell_clipp =     homepath + myXML.princess[11].substr(0,myXML.princess[11].lastIndexOf('.')) + "l" + myXML.princess[11].substr(-4);
				phone_clipp = 		homepath + myXML.princess[12].substr(0,myXML.princess[12].lastIndexOf('.')) + "l" + myXML.princess[12].substr(-4);
				video1_clipp = 		homepath + myXML.princess[13].substr(0,myXML.princess[13].lastIndexOf('.')) + "l" + myXML.princess[13].substr(-4);
				video2_clipp = 		homepath + myXML.princess[14].substr(0,myXML.princess[14].lastIndexOf('.')) + "l" + myXML.princess[14].substr(-4);
				video3_clipp = 		homepath + myXML.princess[15].substr(0,myXML.princess[15].lastIndexOf('.')) + "l" + myXML.princess[15].substr(-4);
				video4_clipp = 		homepath + myXML.princess[16].substr(0,myXML.princess[16].lastIndexOf('.')) + "l" + myXML.princess[16].substr(-4);
				proximity3_clipp =  homepath + myXML.princess[17].substr(0,myXML.princess[17].lastIndexOf('.')) + "l" + myXML.princess[17].substr(-4);
	 			x10_on_clipp = 		homepath + myXML.princess[18].substr(0,myXML.princess[18].lastIndexOf('.')) + "l" + myXML.princess[18].substr(-4);
				x10_off_clipp = 	homepath + myXML.princess[19].substr(0,myXML.princess[19].lastIndexOf('.')) + "l" + myXML.princess[19].substr(-4);
				
				idle_cliph = homepath + myXML.halloween[0].substr(0,myXML.halloween[0].lastIndexOf('.')) + "l" + myXML.halloween[0].substr(-4);   
				idle_dup_cliph = homepath + myXML.halloween[0].substr(0,myXML.halloween[0].lastIndexOf('.')) + "l" + myXML.halloween[0].substr(-4);; 
				proximity1_cliph = 	homepath + myXML.halloween[1].substr(0,myXML.halloween[1].lastIndexOf('.')) + "l" + myXML.halloween[1].substr(-4);
				proximity2_cliph =   homepath + myXML.halloween[2].substr(0,myXML.halloween[2].lastIndexOf('.')) + "l" + myXML.halloween[2].substr(-4);
				touch1_cliph =       homepath + myXML.halloween[3].substr(0,myXML.halloween[3].lastIndexOf('.')) + "l" + myXML.halloween[3].substr(-4);
				weather_good_cliph = homepath + myXML.halloween[4].substr(0,myXML.halloween[4].lastIndexOf('.')) + "l" + myXML.halloween[4].substr(-4);
				weather_ok_cliph =   homepath + myXML.halloween[5].substr(0,myXML.halloween[5].lastIndexOf('.')) + "l" + myXML.halloween[5].substr(-4);
				weather_rain_cliph = homepath + myXML.halloween[6].substr(0,myXML.halloween[6].lastIndexOf('.')) + "l" + myXML.halloween[6].substr(-4);
				no_internet_cliph = homepath + myXML.halloween[7].substr(0,myXML.halloween[7].lastIndexOf('.')) + "l" + myXML.halloween[7].substr(-4);
				stock_up_cliph = 	homepath + myXML.halloween[8].substr(0,myXML.halloween[8].lastIndexOf('.')) + "l" + myXML.halloween[8].substr(-4);
				stock_no_change_cliph = homepath + myXML.halloween[9].substr(0,myXML.halloween[9].lastIndexOf('.')) + "l" + myXML.halloween[9].substr(-4);
				stock_down_cliph =   homepath + myXML.halloween[10].substr(0,myXML.halloween[10].lastIndexOf('.')) + "l" + myXML.halloween[10].substr(-4);
				doorbell_cliph =     homepath + myXML.halloween[11].substr(0,myXML.halloween[11].lastIndexOf('.')) + "l" + myXML.halloween[11].substr(-4);
				phone_cliph = 		homepath + myXML.halloween[12].substr(0,myXML.halloween[12].lastIndexOf('.')) + "l" + myXML.halloween[12].substr(-4);
				video1_cliph = 		homepath + myXML.halloween[13].substr(0,myXML.halloween[13].lastIndexOf('.')) + "l" + myXML.halloween[13].substr(-4);
				video2_cliph = 		homepath + myXML.halloween[14].substr(0,myXML.halloween[14].lastIndexOf('.')) + "l" + myXML.halloween[14].substr(-4);
				video3_cliph = 		homepath + myXML.halloween[15].substr(0,myXML.halloween[15].lastIndexOf('.')) + "l" + myXML.halloween[15].substr(-4);
				video4_cliph = 		homepath + myXML.halloween[16].substr(0,myXML.halloween[16].lastIndexOf('.')) + "l" + myXML.halloween[16].substr(-4);
				proximity3_cliph =  homepath + myXML.halloween[17].substr(0,myXML.halloween[17].lastIndexOf('.')) + "l" + myXML.halloween[17].substr(-4);
	 			x10_on_cliph = 		homepath + myXML.halloween[18].substr(0,myXML.halloween[18].lastIndexOf('.')) + "l" + myXML.halloween[18].substr(-4);
				x10_off_cliph = 	homepath + myXML.halloween[19].substr(0,myXML.halloween[19].lastIndexOf('.')) + "l" + myXML.halloween[19].substr(-4);
				
				idle_clippi = homepath + myXML.pirate[0].substr(0,myXML.pirate[0].lastIndexOf('.')) + "l" + myXML.pirate[0].substr(-4);   
				idle_dup_clippi = homepath + myXML.pirate[0].substr(0,myXML.pirate[0].lastIndexOf('.')) + "l" + myXML.pirate[0].substr(-4);; 
				proximity1_clippi = 	homepath + myXML.pirate[1].substr(0,myXML.pirate[1].lastIndexOf('.')) + "l" + myXML.pirate[1].substr(-4);
				proximity2_clippi =   homepath + myXML.pirate[2].substr(0,myXML.pirate[2].lastIndexOf('.')) + "l" + myXML.pirate[2].substr(-4);
				touch1_clippi =       homepath + myXML.pirate[3].substr(0,myXML.pirate[3].lastIndexOf('.')) + "l" + myXML.pirate[3].substr(-4);
				weather_good_clippi = homepath + myXML.pirate[4].substr(0,myXML.pirate[4].lastIndexOf('.')) + "l" + myXML.pirate[4].substr(-4);
				weather_ok_clippi =   homepath + myXML.pirate[5].substr(0,myXML.pirate[5].lastIndexOf('.')) + "l" + myXML.pirate[5].substr(-4);
				weather_rain_clippi = homepath + myXML.pirate[6].substr(0,myXML.pirate[6].lastIndexOf('.')) + "l" + myXML.pirate[6].substr(-4);
				no_internet_clippi = homepath + myXML.pirate[7].substr(0,myXML.pirate[7].lastIndexOf('.')) + "l" + myXML.pirate[7].substr(-4);
				stock_up_clippi = 	homepath + myXML.pirate[8].substr(0,myXML.pirate[8].lastIndexOf('.')) + "l" + myXML.pirate[8].substr(-4);
				stock_no_change_clippi = homepath + myXML.pirate[9].substr(0,myXML.pirate[9].lastIndexOf('.')) + "l" + myXML.pirate[9].substr(-4);
				stock_down_clippi =   homepath + myXML.pirate[10].substr(0,myXML.pirate[10].lastIndexOf('.')) + "l" + myXML.pirate[10].substr(-4);
				doorbell_clippi =     homepath + myXML.pirate[11].substr(0,myXML.pirate[11].lastIndexOf('.')) + "l" + myXML.pirate[11].substr(-4);
				phone_clippi = 		homepath + myXML.pirate[12].substr(0,myXML.pirate[12].lastIndexOf('.')) + "l" + myXML.pirate[12].substr(-4);
				video1_clippi = 		homepath + myXML.pirate[13].substr(0,myXML.pirate[13].lastIndexOf('.')) + "l" + myXML.pirate[13].substr(-4);
				video2_clippi = 		homepath + myXML.pirate[14].substr(0,myXML.pirate[14].lastIndexOf('.')) + "l" + myXML.pirate[14].substr(-4);
				video3_clippi = 		homepath + myXML.pirate[15].substr(0,myXML.pirate[15].lastIndexOf('.')) + "l" + myXML.pirate[15].substr(-4);
				video4_clippi = 		homepath + myXML.pirate[16].substr(0,myXML.pirate[16].lastIndexOf('.')) + "l" + myXML.pirate[16].substr(-4);
				proximity3_clippi =  homepath + myXML.pirate[17].substr(0,myXML.pirate[17].lastIndexOf('.')) + "l" + myXML.pirate[17].substr(-4);
	 			x10_on_clippi = 		homepath + myXML.pirate[18].substr(0,myXML.pirate[18].lastIndexOf('.')) + "l" + myXML.pirate[18].substr(-4);
				x10_off_clippi = 	homepath + myXML.pirate[19].substr(0,myXML.pirate[19].lastIndexOf('.')) + "l" + myXML.pirate[19].substr(-4);
				
				idle_clipi = homepath + myXML.insult[0].substr(0,myXML.insult[0].lastIndexOf('.')) + "l" + myXML.insult[0].substr(-4);   
				idle_dup_clipi = homepath + myXML.insult[0].substr(0,myXML.insult[0].lastIndexOf('.')) + "l" + myXML.insult[0].substr(-4);; 
				proximity1_clipi = 	homepath + myXML.insult[1].substr(0,myXML.insult[1].lastIndexOf('.')) + "l" + myXML.insult[1].substr(-4);
				proximity2_clipi =   homepath + myXML.insult[2].substr(0,myXML.insult[2].lastIndexOf('.')) + "l" + myXML.insult[2].substr(-4);
				touch1_clipi =       homepath + myXML.insult[3].substr(0,myXML.insult[3].lastIndexOf('.')) + "l" + myXML.insult[3].substr(-4);
				weather_good_clipi = homepath + myXML.insult[4].substr(0,myXML.insult[4].lastIndexOf('.')) + "l" + myXML.insult[4].substr(-4);
				weather_ok_clipi =   homepath + myXML.insult[5].substr(0,myXML.insult[5].lastIndexOf('.')) + "l" + myXML.insult[5].substr(-4);
				weather_rain_clipi = homepath + myXML.insult[6].substr(0,myXML.insult[6].lastIndexOf('.')) + "l" + myXML.insult[6].substr(-4);
				no_internet_clipi = homepath + myXML.insult[7].substr(0,myXML.insult[7].lastIndexOf('.')) + "l" + myXML.insult[7].substr(-4);
				stock_up_clipi = 	homepath + myXML.insult[8].substr(0,myXML.insult[8].lastIndexOf('.')) + "l" + myXML.insult[8].substr(-4);
				stock_no_change_clipi = homepath + myXML.insult[9].substr(0,myXML.insult[9].lastIndexOf('.')) + "l" + myXML.insult[9].substr(-4);
				stock_down_clipi =   homepath + myXML.insult[10].substr(0,myXML.insult[10].lastIndexOf('.')) + "l" + myXML.insult[10].substr(-4);
				doorbell_clipi =     homepath + myXML.insult[11].substr(0,myXML.insult[11].lastIndexOf('.')) + "l" + myXML.insult[11].substr(-4);
				phone_clipi = 		homepath + myXML.insult[12].substr(0,myXML.insult[12].lastIndexOf('.')) + "l" + myXML.insult[12].substr(-4);
				video1_clipi = 		homepath + myXML.insult[13].substr(0,myXML.insult[13].lastIndexOf('.')) + "l" + myXML.insult[13].substr(-4);
				video2_clipi = 		homepath + myXML.insult[14].substr(0,myXML.insult[14].lastIndexOf('.')) + "l" + myXML.insult[14].substr(-4);
				video3_clipi = 		homepath + myXML.insult[15].substr(0,myXML.insult[15].lastIndexOf('.')) + "l" + myXML.insult[15].substr(-4);
				video4_clipi = 		homepath + myXML.insult[16].substr(0,myXML.insult[16].lastIndexOf('.')) + "l" + myXML.insult[16].substr(-4);
				proximity3_clipi =  homepath + myXML.insult[17].substr(0,myXML.insult[17].lastIndexOf('.')) + "l" + myXML.insult[17].substr(-4);
	 			x10_on_clipi = 		homepath + myXML.insult[18].substr(0,myXML.insult[18].lastIndexOf('.')) + "l" + myXML.insult[18].substr(-4);
				x10_off_clipi = 	homepath + myXML.insult[19].substr(0,myXML.insult[19].lastIndexOf('.')) + "l" + myXML.insult[19].substr(-4);		
				
				lipsync_clip = 	homepath + myXML.lipsync_clip.substr(0,myXML.lipsync_clip.lastIndexOf('.')) + "l" + myXML.lipsync_clip.substr(-4);		
				
				
	  	 }
	
	}
	
	private function updates(event:MouseEvent):void {       
		    var url:String = "http://diymagicmirror.com/updates.html";            
            var request:URLRequest = new URLRequest(url);
            try {            
                navigateToURL(request);
            }
            catch (e:Error) {
                output.text = "http://diymagicmirror.com/updates.html not available";
		}
	}
	
	private function browse_custom_audio_event(event:MouseEvent):void {       
		    var url:String = "file:///" + homepath + "custom_audio";            
            var request:URLRequest = new URLRequest(url);
            try {            
                navigateToURL(request);
            }
            catch (e:Error) {
                output.text = "Unable to browse custom audio mp3 files";
		}
	}
	
	private function lip1Loaded(e:Event):void {
	   addChild(lip1);
	   lip1.visible = false;	 
       lip1.scaleX = myXML.lipsync_scaling;
	   lip1.scaleY = myXML.lipsync_scaling;
	   lip1.x = myXML.lipsync_x;	
	   lip1.y = myXML.lipsync_y;
	   lip1.rotation = myXML.lipsync_rotation;
	} 
	
	private function twitterOauthEvent(event:MouseEvent):void { 
				  		
			    tweetr = new Tweetr();         
			    tweetr.serviceHost = myXML.twitter_serviceHost;            
			    oauth = new OAuth();			
			   // oauth.addEventListener(OAuthEvent.COMPLETE, handleOAuthEvent, false, 0, true);
			   // oauth.addEventListener(OAuthEvent.ERROR, handleOAuthEvent, false, 0, true);
				
				oauth.consumerKey = myXML.twitter_consumerKey; 
				oauth.consumerSecret = myXML.twitter_consumerSecret;
				oauth.callbackURL = myXML.twitter_callbackURL;
				oauth.pinlessAuth = true;
				  
				oauth.addEventListener(OAuthEvent.COMPLETE, handleOAuthEvent);
				oauth.addEventListener(OAuthEvent.ERROR, handleOAuthEvent);
				
				htmlLoader = HTMLLoader.createRootWindow(true, null, true, new Rectangle(50,50, 780, 500));
				htmlLoader.stage.nativeWindow.alwaysInFront = true;
				oauth.htmlLoader = htmlLoader;
				oauth.getAuthorizationRequest();
				
	
				
			
			    //Twitter settings if the user token is already there
				//tweetr = new Tweetr();         
			    //tweetr.serviceHost = myXML.twitter_serviceHost;            
			    //oauth = new OAuth();				
				//oauth.consumerKey = myXML.twitter_consumerKey;  
				//oauth.consumerSecret = myXML.twitter_consumerSecret;
				//oauth.oauthToken = myXML.twitter_oauthToken;
				//oauth.oauthTokenSecret = myXML.twitter_oauthTokenSecret;				
				//tweetr.oAuth = oauth;				
				//tweetr.verifyCredentials();
				//trace (oauth.toString());
				//tweetr.updateStatus("test tweet from magic mirror 11");
				//trace ("oath token is: " + oauth.oauthTokenSecret);
	}
	
	
	 private function handleOAuthEvent(event:OAuthEvent):void
        {
            if (event.type == OAuthEvent.COMPLETE)
            {
                htmlLoader.stage.nativeWindow.close();
                tweetr.oAuth = oauth;
				trace (oauth.toString());
				//******** Twitter Auth was successful so let's save the settings
				twitterAuthButton.label = "Change Twitter Account";
				twitter_username_input.text = oauth.username;
				myXML.twitter_username = oauth.username; 
				myXML.twitter_oauthToken = oauth.oauthToken;
				myXML.twitter_oauthTokenSecret = oauth.oauthTokenSecret;   
				myXML.twitter_authenticated = "yes";
				saveValues(); //save the settings
				
            }
			
            else
            {           
				 trace ("Twitter Authentication Error");
				 //output.text = "Twitter Authentication Error: " + event.type.toLocaleUpperCase();	
				 output.text = "Twitter Authentication Error. Most likely the Twitter service is having a hiccup, please try again";
            }
       }
	
	private function alcohol_help_buttonEvent(event:MouseEvent):void {       
		    var url:String = "http://diymagicmirror.com/config.html#breathalyzer";            
            var request:URLRequest = new URLRequest(url);
            try {            
                navigateToURL(request);
            }
            catch (e:Error) {
                output.text = "http://diymagicmirror.com/config.html not available";
		}
	}
	
	private function ipcamera_change_event(e:Event):void {
		
			ipcamera_selected = ipcamera_dropdown.selectedIndex;
				 							
			switch (ipcamera_selected)  //sets the video playlists based on the mode
				{
				case 0: 								
					ipcamera_path.text = "/mjpeg.cgi" //airlink101
					ipcamera_path.enabled = false; //other
					break;
				case 1: 
					ipcamera_path.text = "/axis-cgi/mjpg/video.cgi" //axis
					ipcamera_path.enabled = false; //other
					break;
				case 2: 
					ipcamera_path.text = "/mjpeg.cgi" //dlink
					ipcamera_path.enabled = false; //other
					break;
				case 3: 
					ipcamera_path.text = "/-wvhttp-01-/getoneshot?frame_count=no_limit" //cannon
					ipcamera_path.enabled = false; //other
					break;	
				case 4: 
					ipcamera_path.text = "/snapshot.cgi" //edimax
					ipcamera_path.enabled = false; //other
					break;	
				case 5: 
					ipcamera_path.text = "/GetData.cgi?Status=0" //gadspot
					ipcamera_path.enabled = false; //other
					break;	
				case 6: 
					ipcamera_path.text = "/cgi-bin/Stream?Video?webcamPWD=RootCookies00000" //goscam 
					ipcamera_path.enabled = false; //other
					break;	
				case 7: 
					ipcamera_path.text = "/control/faststream.jpg?stream=full" //mobotix
					ipcamera_path.enabled = false; //other
					break;	
				case 8: 
					ipcamera_path.text = "/img/video.mjpeg" //linksys
					ipcamera_path.enabled = false; //other
					break;	
				case 9: 
					ipcamera_path.text = "/nphMotionJpeg?Quality=Standard" //panasonic					
					ipcamera_path.enabled = false; //other
					break;	
				case 10: 
					ipcamera_path.text = "/cgi/mjpg/mjpeg.cgi" //qnap
					ipcamera_path.enabled = false; //other
					break;	
				case 11: 
					ipcamera_path.text = "/stream.jpg"  //sharx
					ipcamera_path.enabled = false; //other
					break;	
				case 12: 
					ipcamera_path.text = "/image" //sony
					ipcamera_path.enabled = false; //other
					break;					
				case 13: 
					ipcamera_path.text = "/user/cgi-bin/getstream.cgi?10&&&&0&0&0&0&0" //toshiba
					ipcamera_path.enabled = false; //other
					break;	
				case 14: 
					ipcamera_path.text = "/cam_1.cgi" //webcamxp
					ipcamera_path.enabled = false; //other
					break;	
				case 15: 
					ipcamera_path.text = "/stream.jpg" //y-cam
					ipcamera_path.enabled = false; //other
					break;					
				case 16: 
					ipcamera_path.enabled = true; //other
					ipcamera_path.text = "Enter Video Stream Path Here"; //other
					break;						
				}
		
	}
	
	private function BuildPositionUI():void {		//add the bigger, smaller, move left, right, up , down buttons
		
		myVid_bigger.x = 4.45;
		myVid_bigger.y = 7.35;
		myVid_bigger.width = 99;
		myVid_bigger.height = 37;
		myVid_bigger.label = "+ Bigger";
		addChild(myVid_bigger);
		myVid_bigger.visible = false;
		
		myVid_smaller.x = 4.45;
		myVid_smaller.y = 55.35;
		myVid_smaller.width = 99;
		myVid_smaller.height = 37;
		myVid_smaller.label = "+ Smaller";
		addChild(myVid_smaller);
		myVid_smaller.visible = false;
		
		move_upButton.x = 169.65;
		move_upButton.y = 7.95;
		move_upButton.width = 90;
		move_upButton.height = 22;
		move_upButton.label = "Move Up";
		addChild(move_upButton);
		move_upButton.visible = false;
		
		move_leftButton.x = 126.80;
		move_leftButton.y = 40.30;
		move_leftButton.width = 78;
		move_leftButton.height = 22;
		move_leftButton.label = "Move Left";
		addChild(move_leftButton);
		move_leftButton.visible = false;
		
		move_rightButton.x = 221.60;
		move_rightButton.y = 40.30;
		move_rightButton.width = 78;
		move_rightButton.height = 22;
		move_rightButton.label = "Move Right";
		addChild(move_rightButton);
		move_rightButton.visible = false;
		
		move_downButton.x = 169.65;
		move_downButton.y = 70.35;
		move_downButton.width = 90;
		move_downButton.height = 22;
		move_downButton.label = "Move Down";
		addChild(move_downButton);
		move_downButton.visible = false;
		
		instructions.x = 324.20;
		instructions.y = 40.40;
		instructions.width = 412.50;
		instructions.height = 31.90;
		instructions.text = "Add Instructions Here";
		addChild(instructions);
		instructions.visible = false;		
		instructions.antiAliasType = AntiAliasType.ADVANCED;		
		instructions.defaultTextFormat = InstructionsTextFormat;
		
		SaveButton.x = 470.45;
		//SaveButton.y = 656.90;
		SaveButton.y = 700;
		SaveButton.width = 133.95;
		SaveButton.height = 36.10;
		SaveButton.label = "Save";
		addChild(SaveButton);
		SaveButton.visible = false;
		
		goBackMain.x = 915.20;
		//goBackMain.y = 4.85;
		goBackMain.y = 120;
		goBackMain.width = 99.90;
		goBackMain.height = 22;
		goBackMain.label = "Go Back";
		addChild(goBackMain);
		goBackMain.visible = false;
		
		BrowseAudioButton.x = 450;
		BrowseAudioButton.y = 100;
		BrowseAudioButton.width = 150;
		BrowseAudioButton.height = 22;
		BrowseAudioButton.label = "Browse Custom Audio Files";
		addChild(BrowseAudioButton);
		BrowseAudioButton.visible = false;
		
		tts_feature_radio_on.x = 10; 
	    tts_feature_radio_on.y = 40;
		tts_feature_radio_on.setStyle("textFormat", radiotext);
		tts_feature_radio_on.textField.autoSize = TextFieldAutoSize.LEFT;
		tts_feature_radio_on.label = "Use Text to Speech";		
		tts_feature_radio_off.x = 300; 
	    tts_feature_radio_off.y = 40;
		tts_feature_radio_off.setStyle("textFormat", radiotext);
		tts_feature_radio_off.textField.autoSize = TextFieldAutoSize.LEFT;
		tts_feature_radio_off.label = "Use Custom MP3s";
		
		tts_engine_voicerss.x = 180; 
	    tts_engine_voicerss.y = 60;
		tts_engine_voicerss.setStyle("textFormat", radiotext);
		tts_engine_voicerss.textField.autoSize = TextFieldAutoSize.LEFT;
		tts_engine_voicerss.label = "VoiceRSS";		
		tts_engine_yakitome.x = 300; 
	    tts_engine_yakitome.y = 60;
		tts_engine_yakitome.setStyle("textFormat", radiotext);
		tts_engine_yakitome.textField.autoSize = TextFieldAutoSize.LEFT;
		tts_engine_yakitome.label = "Yakitome (has delay)";
		
		lipsync_checkbox.x = 10;
		lipsync_checkbox.y = 100;
		lipsync_checkbox.width = 100;
		lipsync_checkbox.setStyle("textFormat", radiotext);
		lipsync_checkbox.textField.autoSize = TextFieldAutoSize.LEFT;
		lipsync_checkbox.label = "Lipsync Enabled";
		addChild(lipsync_checkbox);
		lipsync_checkbox.visible = false;
		
		weathertext_check.x = 4.45;
		weathertext_check.y = 100.65;
		weathertext_check.width = 100;
		weathertext_check.height = 22;		
		weathertext_check.textField.autoSize = TextFieldAutoSize.LEFT;
		weathertext_check.setStyle("textFormat", radiotext);
		weathertext_check.label = "Display Weather Text"; 
		addChild(weathertext_check);
		weathertext_check.visible = false;		 
		
		AlcoholResults_check.x = 4.45;
		AlcoholResults_check.y = 180.25;
		AlcoholResults_check.width = 100;
		AlcoholResults_check.height = 22;				
		AlcoholResults_check.textField.autoSize = TextFieldAutoSize.LEFT;
		AlcoholResults_check.setStyle("textFormat", radiotext);
		AlcoholResults_check.label = "Display Breathalyzer Text";
		addChild(AlcoholResults_check);
		AlcoholResults_check.visible = false;
		
		stocktext_check.x = 4.45;
		stocktext_check.y = 154.30;
		stocktext_check.width = 100;
		stocktext_check.height = 22;				
		stocktext_check.textField.autoSize = TextFieldAutoSize.LEFT;
		stocktext_check.setStyle("textFormat", radiotext);
		stocktext_check.label = "Display Stock Performance Text";
		addChild(stocktext_check);
		stocktext_check.visible = false;
		
		weathergraphic_check.x = 4.45;
		weathergraphic_check.y = 128.35;
		weathergraphic_check.width = 100;
		weathergraphic_check.height = 22;				
		weathergraphic_check.textField.autoSize = TextFieldAutoSize.LEFT;
		weathergraphic_check.setStyle("textFormat", radiotext);
		weathergraphic_check.label = "Display Weather Icon";
		addChild(weathergraphic_check);
		weathergraphic_check.visible = false;		
		
		webcamvideo_check.x = 4.45;
		webcamvideo_check.y = 207;
		webcamvideo_check.width = 100;
		webcamvideo_check.height = 22;				
		webcamvideo_check.textField.autoSize = TextFieldAutoSize.LEFT;
		webcamvideo_check.setStyle("textFormat", radiotext);
		//webcamvideo_check.label = "Display USB Webcam";
		addChild(webcamvideo_check);
		webcamvideo_check.visible = false;		
		
		webcamgraphic_check.x = 4.45;
		webcamgraphic_check.y = 207;
		webcamgraphic_check.width = 100;
		webcamgraphic_check.height = 22;				
		webcamgraphic_check.textField.autoSize = TextFieldAutoSize.LEFT;
		webcamgraphic_check.setStyle("textFormat", radiotext);
		webcamgraphic_check.label = "Display Webcam Frame";
		addChild(webcamgraphic_check);
		webcamgraphic_check.visible = false;		
		
		
		
	}
	
	private function setupComboBox():void { //setup the combo boxes
		    mirror_mode_input.addItem( { label: "Princess", data:1 } );
            mirror_mode_input.addItem( { label: "Pirate", data:2 } );
            mirror_mode_input.addItem( { label: "Halloween", data:3 } );
			mirror_mode_input.addItem( { label: "Insult", data:4 } );		
			mirror_mode_input.addItem( { label: "Custom Audio", data:5 } );		
			
			display_mode_input.addItem( { label: "Normal", data:1 } );
            display_mode_input.addItem( { label: "Normal+Frame", data:2 } );
            display_mode_input.addItem( { label: "Normal+Frame+Webcam Face Recog", data:3 } );
			display_mode_input.addItem( { label: "Normal+Webcam Face w/ Frame", data:4 } );			
			display_mode_input.addItem( { label: "Stealth", data:5 } );
			display_mode_input.addItem( { label: "Stealth+Frame+Webcam Face Recog", data:6 } );		
			
			frame_input.addItem( { label: "Frame 1", data:1 } );
            frame_input.addItem( { label: "Frame 2", data:2 } );
            frame_input.addItem( { label: "Frame 3", data:3 } );
			frame_input.addItem( { label: "Frame 4", data:4 } );			
			frame_input.addItem( { label: "Frame 5", data:5 } );
			frame_input.addItem( { label: "Frame 6", data:6 } );		
			
			
			arduino_version_input.addItem( { label: "ATmega168", data:1 } );
            arduino_version_input.addItem( { label: "ATmega328", data:2 } );
			
			weather_reading_input.addItem( { label: "Fahrenheit ", data:1 } );
			weather_reading_input.addItem( { label: "Celcius", data:2 } );	
			
			board_version_input.addItem( { label: "Version 1.0", data:1 } );
			board_version_input.addItem( { label: "Version 2.0", data:2 } );	
			board_version_input.addItem( { label: "Version 3.0", data:3 } );	
			board_version_input.addItem( { label: "Sensor Hub v1", data:4 } );	
			board_version_input.addItem( { label: "Sensor Hub v2 or Arduino Uno", data:5 } );	
			
			house_code_input.addItem( { label: "A", data:1 } );
			house_code_input.addItem( { label: "B", data:2 } );
			house_code_input.addItem( { label: "C", data:3 } );
			house_code_input.addItem( { label: "D", data:4 } );
			house_code_input.addItem( { label: "E", data:5 } );
			house_code_input.addItem( { label: "F", data:6 } );
			house_code_input.addItem( { label: "G", data:7 } );
			house_code_input.addItem( { label: "H", data:8 } );
			house_code_input.addItem( { label: "I", data:9 } );
			house_code_input.addItem( { label: "J", data:10 } );
			house_code_input.addItem( { label: "K", data:11 } );
			house_code_input.addItem( { label: "L", data:12 } );
			house_code_input.addItem( { label: "M", data:13 } );
			house_code_input.addItem( { label: "N", data:14 } );
			house_code_input.addItem( { label: "O", data:15 } );
			house_code_input.addItem( { label: "P", data:16 } );
			
			onoff_house_code_input.addItem( { label: "A", data:1 } );
			onoff_house_code_input.addItem( { label: "B", data:2 } );
			onoff_house_code_input.addItem( { label: "C", data:3 } );
			onoff_house_code_input.addItem( { label: "D", data:4 } );
			onoff_house_code_input.addItem( { label: "E", data:5 } );
			onoff_house_code_input.addItem( { label: "F", data:6 } );
			onoff_house_code_input.addItem( { label: "G", data:7 } );
			onoff_house_code_input.addItem( { label: "H", data:8 } );
			onoff_house_code_input.addItem( { label: "I", data:9 } );
			onoff_house_code_input.addItem( { label: "J", data:10 } );
			onoff_house_code_input.addItem( { label: "K", data:11 } );
			onoff_house_code_input.addItem( { label: "L", data:12 } );
			onoff_house_code_input.addItem( { label: "M", data:13 } );
			onoff_house_code_input.addItem( { label: "N", data:14 } );
			onoff_house_code_input.addItem( { label: "O", data:15 } );
			onoff_house_code_input.addItem( { label: "P", data:16 } );
			
			unit_code_input.addItem( { label: "1", data:1 } );
			unit_code_input.addItem( { label: "2", data:2 } );
			unit_code_input.addItem( { label: "3", data:3 } );
			unit_code_input.addItem( { label: "4", data:4 } );
			unit_code_input.addItem( { label: "5", data:5 } );
			unit_code_input.addItem( { label: "6", data:6 } );
			unit_code_input.addItem( { label: "7", data:7 } );
			unit_code_input.addItem( { label: "8", data:8 } );
			unit_code_input.addItem( { label: "9", data:9 } );
			unit_code_input.addItem( { label: "10", data:10 } );
			unit_code_input.addItem( { label: "11", data:11 } );
			unit_code_input.addItem( { label: "12", data:12 } );
			unit_code_input.addItem( { label: "13", data:13 } );
			unit_code_input.addItem( { label: "14", data:14 } );
			unit_code_input.addItem( { label: "15", data:15 } );
			unit_code_input.addItem( { label: "16", data:16 } );			
			
			onoff_unit_code_input.addItem( { label: "1", data:1 } );
			onoff_unit_code_input.addItem( { label: "2", data:2 } );
			onoff_unit_code_input.addItem( { label: "3", data:3 } );
			onoff_unit_code_input.addItem( { label: "4", data:4 } );
			onoff_unit_code_input.addItem( { label: "5", data:5 } );
			onoff_unit_code_input.addItem( { label: "6", data:6 } );
			onoff_unit_code_input.addItem( { label: "7", data:7 } );
			onoff_unit_code_input.addItem( { label: "8", data:8 } );
			onoff_unit_code_input.addItem( { label: "9", data:9 } );
			onoff_unit_code_input.addItem( { label: "10", data:10 } );
			onoff_unit_code_input.addItem( { label: "11", data:11 } );
			onoff_unit_code_input.addItem( { label: "12", data:12 } );
			onoff_unit_code_input.addItem( { label: "13", data:13 } );
			onoff_unit_code_input.addItem( { label: "14", data:14 } );
			onoff_unit_code_input.addItem( { label: "15", data:15 } );
			onoff_unit_code_input.addItem( { label: "16", data:16 } );			
			
			ipcamera_dropdown.addItem( { label: "Airlink101", data:1 } );
			ipcamera_dropdown.addItem( { label: "Axis", data:2 } );
			ipcamera_dropdown.addItem( { label: "D-Link", data:3 } );
			ipcamera_dropdown.addItem( { label: "Cannon", data:4 } );
			ipcamera_dropdown.addItem( { label: "Edimax", data:5 } );
			ipcamera_dropdown.addItem( { label: "Gadspot", data:6 } );
			ipcamera_dropdown.addItem( { label: "Goscam", data:7 } );
			ipcamera_dropdown.addItem( { label: "Mobotix", data:8 } );
			ipcamera_dropdown.addItem( { label: "Linksys", data:9 } );
			ipcamera_dropdown.addItem( { label: "Panasonic", data:10 } );
			ipcamera_dropdown.addItem( { label: "Qnap", data:11} );
			ipcamera_dropdown.addItem( { label: "Sharx", data:12 } );
			ipcamera_dropdown.addItem( { label: "Sony", data:13 } );
			ipcamera_dropdown.addItem( { label: "Toshiba", data:14 } );
			ipcamera_dropdown.addItem( { label: "WebcamXP", data:15 } );
			ipcamera_dropdown.addItem( { label: "Y-cam", data:16 } );
			ipcamera_dropdown.addItem( { label: "Other", data:17 } );
			
			quiz_correctanswer_drop.addItem( { label: "Select Quiz Answer", data:0 } );
			quiz_correctanswer_drop.addItem( { label: "Switch 2", data:2 } );
			quiz_correctanswer_drop.addItem( { label: "Switch 3", data:3 } );
			quiz_correctanswer_drop.addItem( { label: "Switch 5", data:5 } );
			
			com_port_drop.addItem( { label: "5331", data:1 } );
			com_port_drop.addItem( { label: "5332", data:2 } );
			com_port_drop.addItem( { label: "5333", data:3 } );
			com_port_drop.addItem( { label: "5334", data:4 } );
			com_port_drop.addItem( { label: "5335", data:5 } );
			com_port_drop.addItem( { label: "5336", data:6 } );
			com_port_drop.addItem( { label: "5337", data:7 } );
			com_port_drop.addItem( { label: "5338", data:8 } );
			com_port_drop.addItem( { label: "5339", data:9 } );
			
		/*	old values from google tts, google killed the public google TTS API so had to switch
			TTS_languages_dropdown.addItem( { label: "English", data:"en" } );
			TTS_languages_dropdown.addItem( { label: "Spanish", data:"es" } );
			TTS_languages_dropdown.addItem( { label: "German", data:"de" } );
			TTS_languages_dropdown.addItem( { label: "French", data:"fr" } );
			TTS_languages_dropdown.addItem( { label: "Italian", data:"it" } );
			TTS_languages_dropdown.addItem( { label: "Hindi", data:"hi" } );			
			TTS_languages_dropdown.addItem( { label: "Afrikaans", data:"af" } );	
			TTS_languages_dropdown.addItem( { label: "Czech", data:"cs" } );
			TTS_languages_dropdown.addItem( { label: "Croatian", data:"hr" } );
			TTS_languages_dropdown.addItem( { label: "Dutch", data:"nl" } );
			TTS_languages_dropdown.addItem( { label: "Dannish", data:"da" } );
			TTS_languages_dropdown.addItem( { label: "Finnish", data:"fi" } );
			TTS_languages_dropdown.addItem( { label: "Greek", data:"el" } );
			TTS_languages_dropdown.addItem( { label: "Hatian Creole", data:"ht" } );
			TTS_languages_dropdown.addItem( { label: "Hungarian", data:"hu" } );
			TTS_languages_dropdown.addItem( { label: "Indonesian", data:"id" } );
			TTS_languages_dropdown.addItem( { label: "Islandic", data:"is" } );
			TTS_languages_dropdown.addItem( { label: "Latvian", data:"lv" } );
			TTS_languages_dropdown.addItem( { label: "Macedonian", data:"mk" } );
			TTS_languages_dropdown.addItem( { label: "Norweigen", data:"no" } );
			TTS_languages_dropdown.addItem( { label: "Polish", data:"pl" } );
			TTS_languages_dropdown.addItem( { label: "Portugese", data:"pt" } );
			TTS_languages_dropdown.addItem( { label: "Romanian", data:"ro" } );
			TTS_languages_dropdown.addItem( { label: "Serbian", data:"sr" } );	
			TTS_languages_dropdown.addItem( { label: "Slovak", data:"sk" } );
			TTS_languages_dropdown.addItem( { label: "Russian", data:"ru" } );
			TTS_languages_dropdown.addItem( { label: "Swahili", data:"sw" } );
			TTS_languages_dropdown.addItem( { label: "Swedish", data:"sv" } );
			TTS_languages_dropdown.addItem( { label: "Turkish", data:"tr" } );
			TTS_languages_dropdown.addItem( { label: "Vietnamese", data:"vi" } );*/
			
			/*The possibles voices are:{"free": {"German": [["de", "Female", "Klara"], ["de", "Male", "Reiner"]], 
			"Spanish": [["es", "Male", "Alberto"]], "French": [["ca", "Male", "Arnaud"], ["fr", "Female", "Juliette"],
			["fr", "Male", "Alain"]], "English": [["gb", "Female", "Anjali"], ["gb", "Female", "Audrey"], ["us", "Female",
			"Crystal"], ["us", "Female", "Julia"], ["us", "Female", "Lauren"], ["us", "Female", "Randy"], ["us", "Male", 
			"Dave"], ["us", "Male", "Mike"]]}*/
			
			var ttsEngine:String = myXML.tts_engine;
			
			if (ttsEngine == "voicerss") {
				populateVoiceRSSLanguageDropdown();  //put these into a function as we need to call from other places too so it will make maintenance easier if these ever change
				trace("went to initial xml population for voicerss");
		    }
			
			else if (ttsEngine == "yakitome") {
				populateYakitomeLanguageDropdown();
				trace("went to initial xml population for Y");
			}
			
			else {
				trace("oops, we couldn't find the default TTS engine to use, let's use voice RSS by default");
				populateVoiceRSSLanguageDropdown();
			}
			
			photobooth_WebcamResolution_dropdown.addItem( { label: "160", data:0 } );
			photobooth_WebcamResolution_dropdown.addItem( { label: "320", data:1 } );
			photobooth_WebcamResolution_dropdown.addItem( { label: "480", data:2 } );
			photobooth_WebcamResolution_dropdown.addItem( { label: "640", data:3 } );
			photobooth_WebcamResolution_dropdown.addItem( { label: "720 HD", data:4 } );
			photobooth_WebcamResolution_dropdown.addItem( { label: "1080 HD", data:5 } );
			
			photobooth_PaperSize_dropdown.addItem( { label: "Photo Size 4 x 6", data:0 } );
			photobooth_PaperSize_dropdown.addItem( { label: "Letter 8.5 x 11", data:1 } );
						
			//TTS_languages_dropdown.addItem( { label: "Chinese Traditional", data:"zh-CN" } );
			//TTS_languages_dropdown.addItem( { label: "Chinese Simplified", data:"zh-TW" } );
			
	}
	
	private function populateVoiceRSSLanguageDropdown():void {
		
		TTS_languages_dropdown.addItem( { label: "Catalan Female", data:"ca-es" } );
		TTS_languages_dropdown.addItem( { label: "Chinese (China) Female", data:"zh-cn" } );
		TTS_languages_dropdown.addItem( { label: "Chinese (Hong Kong) Female", data:"zh-hk" } );
		TTS_languages_dropdown.addItem( { label: "Chinese (Taiwan) Female", data:"zh-tw" } );
		TTS_languages_dropdown.addItem( { label: "Danish Female", data:"da-dk" } );
		TTS_languages_dropdown.addItem( { label: "Dutch Female", data:"nl-nl" } );			
		TTS_languages_dropdown.addItem( { label: "English (Australia) Female", data:"en-au" } );	
		TTS_languages_dropdown.addItem( { label: "English (Canada) Female", data:"en-ca" } );
		TTS_languages_dropdown.addItem( { label: "English (Great Britain) Female", data:"en-gb" } );
		TTS_languages_dropdown.addItem( { label: "English (India) Female", data:"en-in" } );
		TTS_languages_dropdown.addItem( { label: "English (United States) Female", data:"en-us" } );
		TTS_languages_dropdown.addItem( { label: "Finnish Female", data:"fi-fi" } );
		TTS_languages_dropdown.addItem( { label: "French (Canada) Female", data:"fr-ca" } );
		TTS_languages_dropdown.addItem( { label: "French (France) Female", data:"fr-fr" } );
		TTS_languages_dropdown.addItem( { label: "German Female", data:"de-de" } );
		TTS_languages_dropdown.addItem( { label: "Italian Female", data:"it-it" } );
		TTS_languages_dropdown.addItem( { label: "Japanese Female", data:"ja-jp" } );
		TTS_languages_dropdown.addItem( { label: "Korean Female", data:"ko-kr" } );
		TTS_languages_dropdown.addItem( { label: "Norwegian Female", data:"nb-no" } );
		TTS_languages_dropdown.addItem( { label: "Polish Female", data:"pl-pl" } );
		TTS_languages_dropdown.addItem( { label: "Portuguese (Brazil) Female", data:"pt-br" } );
		TTS_languages_dropdown.addItem( { label: "Portuguese (Portugal) Female", data:"pt-pt" } );
		TTS_languages_dropdown.addItem( { label: "Russian Female", data:"ru-ru" } );
		TTS_languages_dropdown.addItem( { label: "Spanish (Mexico) Female", data:"es-mx" } );	
		TTS_languages_dropdown.addItem( { label: "Spanish (Spain) Female", data:"es-es" } );
		TTS_languages_dropdown.addItem( { label: "Swedish (Sweden) Female", data:"sv-se" } );
	}
	
	private function populateYakitomeLanguageDropdown():void {
		
		TTS_languages_dropdown.addItem( { label: "German Female", data:"Klara" } );
		TTS_languages_dropdown.addItem( { label: "German Male", data:"Reiner" } );
		TTS_languages_dropdown.addItem( { label: "Spanish Male", data:"Alberto" } );
		TTS_languages_dropdown.addItem( { label: "French Candadian Male", data:"Arnaud" } );
		TTS_languages_dropdown.addItem( { label: "French Female", data:"Juliette" } );
		TTS_languages_dropdown.addItem( { label: "French Male", data:"Alain" } );			
		TTS_languages_dropdown.addItem( { label: "UK Female", data:"Anjali" } );	
		TTS_languages_dropdown.addItem( { label: "UK Female 2", data:"Audrey" } );
		TTS_languages_dropdown.addItem( { label: "US Female", data:"Crystal" } );
		TTS_languages_dropdown.addItem( { label: "US Female 2", data:"Julia" } );
		TTS_languages_dropdown.addItem( { label: "US Female 3", data:"Lauren" } );
		TTS_languages_dropdown.addItem( { label: "US Female 4", data:"Randy" } );
		TTS_languages_dropdown.addItem( { label: "US Male Default", data:"Dave" } );
		TTS_languages_dropdown.addItem( { label: "US Male", data:"Mike" } );
		
	}
	
	
	private function BuildUI():void { //one time initial
				
	  ////***** setup the text readout displays ***********************
		
		//AlertTextFormat.color = 0x000000; //black
		//AlertTextFormat.font = myFont.fontName;
		//AlertTextFormat.size = 30;  //70 default		
		//AlertManager.overlayAlpha = .8;
		//AlertManager.maxWidth = 800;
		//AlertManager.hasDropShadow = true;
		//AlertManager.setMessageBoxStyle("textFormat", AlertTextFormat);
		
		AlcoholResultsdyntext.x = AlcoholResults.x;
		AlcoholResultsdyntext.y = AlcoholResults.y;
		AlcoholResults.x = AlcoholResults.y = 0;
		addChild(AlcoholResultsdyntext);				
		AlcoholResultsFormat.font = myFont.fontName;
		AlcoholResultsFormat.size = alcohol_results_text_fontsize; //75 default
		// we set the font color down in the stock function depending on how the stock did for the day
		AlcoholResults.autoSize = TextFieldAutoSize.CENTER;		
		AlcoholResults.embedFonts = true;
		AlcoholResults.x = alcohol_results_text_x;   
		AlcoholResults.y = alcohol_results_text_y;    
		AlcoholResultsFormat.color = 0xFF0033; //red
		AlcoholResults.rotation = alcohol_results_text_rotation; //0 default for landscape
		AlcoholResults.antiAliasType = AntiAliasType.ADVANCED;		
		AlcoholResults.defaultTextFormat = AlcoholResultsFormat;
		AlcoholResultsdyntext.addChild(AlcoholResults);
		AlcoholResultsdyntext.mouseChildren = false; 
		AlcoholResultsdyntext.buttonMode = true; 			
		AlcoholResults.text = "You're Drunk!";
		AlcoholResults.visible = false;
		
		album_url.visible = false;
		album_id.visible = false;
		Stockdyntext.x = stock_display.x;
		Stockdyntext.y = stock_display.y;
		stock_display.x = stock_display.y = 0;
		addChild(Stockdyntext);
		
		StockTextFormat.font = myFont.fontName;
		StockTextFormat.size = stock_text_fontsize;  //70 default		
		// we set the font color down in the stock function depending on how the stock did for the day
		stock_display.autoSize = TextFieldAutoSize.LEFT;
		stock_display.defaultTextFormat = StockTextFormat;
		stock_display.embedFonts = true;
		//add back
		
		stock_display.x = stock_text_x;    //620 default for landscape
		stock_display.y = stock_text_y;    //120 default for landscape
		
		
		//stock_display.x = 850;    //620 default for landscape
		//stock_display.y = 380;    //120 default for landscape
		
		stock_display.rotation = stock_text_rotation; //0 default for landscape
		stock_display.antiAliasType = AntiAliasType.ADVANCED;		
		Stockdyntext.addChild(stock_display);
		//addChild(stock_display);
		Stockdyntext.mouseChildren = false; // OPTIONAL - STOPS TEXT FROM BEING SELECTED
		Stockdyntext.buttonMode = true; // OPTIONAL - SHOWS BUTTON CURSOR
		stock_display.visible = false;	
		
		
		  //stock_display.addEventListener( MouseEvent.MOUSE_DOWN, pickup ); //for drag and drop
		 // stock_display.addEventListener( MouseEvent.MOUSE_UP, place );
		
		
		InstructionsTextFormat.font = myFont.fontName;
		InstructionsTextFormat.size = 20;	
		InstructionsTextFormat.color = 0xF5F5F5;			
		positioning_instructions.backgroundColor = 0xFFFFFF; //white
		positioning_instructions.embedFonts = true;
		positioning_instructions.antiAliasType = AntiAliasType.ADVANCED;
		positioning_instructions.defaultTextFormat = InstructionsTextFormat;
		positioning_instructions.x = 4.45;
		positioning_instructions.y = 600;
		positioning_instructions.width = 600;
		positioning_instructions.height = 60;
		positioning_instructions.text = "You may also drag and drop to move the various icons and text";		
		addChild(positioning_instructions);	
		positioning_instructions.visible = false;
		
		Weatherdyntext.x = weather_display2.x;
		Weatherdyntext.y = weather_display2.y;
		weather_display2.x = weather_display2.y = 0;
		addChild(Weatherdyntext);				
		WeatherTextFormat.font = myFont.fontName;
		WeatherTextFormat.size = weather_text_fontsize; //30 default
		// we set the font color down in the stock function depending on how the stock did for the day
		weather_display2.autoSize = TextFieldAutoSize.CENTER;		
		weather_display2.embedFonts = true;
		weather_display2.x = weather_text_x;   //500 default for landscape
		weather_display2.y = weather_text_y;    //120 default for landscape
		WeatherTextFormat.color = 0xF5F5F5; //white
		weather_display2.rotation = weather_text_rotation; //0 default for landscape
		weather_display2.antiAliasType = AntiAliasType.ADVANCED;		
		weather_display2.defaultTextFormat = WeatherTextFormat;
		//addChild(weather_display2);
		Weatherdyntext.addChild(weather_display2);
		weather_display2.visible = false;
		Weatherdyntext.mouseChildren = false; // OPTIONAL - STOPS TEXT FROM BEING SELECTED
		Weatherdyntext.buttonMode = true; // OPTIONAL - SHOWS BUTTON CURSOR
		trace ("weather text x before: " + weather_display2.x);
		
		
        ////******* scale and position the picture frame mode **********
		pic.rotation = picture_rotation;
		pic.x = picture_x_position;		
		pic.y = picture_y_position;		
		pic.scaleX = picture_scale;
		pic.scaleY = picture_scale;				
		////************************************************************		
	  
	  // character_change.addEventListener(Event.CHANGE, ModeChanged);	
	  // character_change.addItem( { label: "Princess", data:1 } );
      // character_change.addItem( { label: "Pirate", data:2 } );
      // character_change.addItem( { label: "Halloween", data:3 } );
      // character_change.addItem( { label: "Insult", data:4 } );
		
		myVidx_original = x_position;  //get the original positions which we'll need for offset references
		myVidy_original = y_position;
		stock_text_x_original = stock_text_x;
	    stock_text_y_original = stock_text_y;
		weather_text_x_original = weather_text_x;
	    weather_text_y_original = weather_text_y;		
		alcohol_results_text_x_original = alcohol_results_text_x;
	    alcohol_results_text_y_original = alcohol_results_text_y;		
		
		weather_image_x_original = weather_image_x;
		weather_image_y_original = weather_image_y;		
		
		beer_image_x_original = beer_image_x;
		beer_image_y_original = beer_image_y;		
		
		twitterbird_image_x_original = twitterbird_image_x;
		twitterbird_image_y_original = twitterbird_image_y;		
		
		frame_x_original = frame_x;
		frame_y_original = frame_y;		
		
		lip1_x_original = lip1_x;
		lip1_y_original = lip1_y;		
		
		weather_text_rotation_original = weather_text_rotation;
		stock_text_rotation_original = stock_text_rotation;
		weather_image_rotation_original = weather_image_rotation;
		beer_image_rotation_original = beer_image_rotation;
		twitterbird_image_rotation_original = twitterbird_image_rotation;
		
		frame_rotation_original = frame_rotation;
	   
		myVid2.rotation = video_rotation;
		myVid2.setScale(doorcam_video_scale,doorcam_video_scale);
		myVid2.x = doorcam_video_x;	
		myVid2.y = doorcam_video_y;
		addChild(myVid2);
		myVid2.visible = false;		
		
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
		
		addChild(myVid);
		myVid.visible = false;		
		myVid2.visible = true;
		
		if (myXML.twitter_breathalyzer_value == "on") {
			Tweet_Breathalyzer_Value_check.selected = true ;
		}
		else {
			Tweet_Breathalyzer_Value_check.selected = false ;			
		}
		
		if (myXML.alcohol_no_switch == "on") {
			BreathalyzerNoSwitch_check.selected = true ;
		}
		else {
			BreathalyzerNoSwitch_check.selected = false ;
			
		}
		
		if (display_weather_text == "on") {
			weather_display2.visible = true;
			weathertext_check.selected = true ;
			trace ("went here for weather display");
		}
		else {
			weather_display2.visible = false;
			weathertext_check.selected = false ;
			
		}
		
		if (myXML.lipsync_feature == "on") { //the lipsync checkbox
			lipsync_checkbox.selected = true;
		}
		else {
			lipsync_checkbox.selected = false;
			
		}
		
		if (display_weather_image == "on") {
			weathergraphic_check.selected = true;
			weather_image.visible = true;
		}
		else {
			weathergraphic_check.selected = false;
			weather_image.visible = false;
		}
		
		if (display_frame == "on") {
			webcamgraphic_check.selected = true;
			frame.visible = true;
		}
		else {
			webcamgraphic_check.selected = false;
			frame.visible = false;
		}
		
		if (display_webcamvideo == "on") {
			webcamvideo_check.selected = true;
			//webcamvideo.visible = true;
		}
		else {
			webcamvideo_check.selected = false;
			//webcamvideo.visible = false;
		}
		
		if (display_breathalyzer_text == "on") {
			AlcoholResults_check.selected = true;
			//AlcoholResults.visible = true;
		}		
		else {
			//AlcoholResults.visible = false;
			AlcoholResults_check.selected = false;
		}
		
		if (display_stock_text == "on") {
			stocktext_check.selected = true;
			stock_display.visible = true;
		}		
		else {
			stock_display.visible = false;
			stocktext_check.selected = false;
		}
		
		if (myXML.no_resize == "on") {  //if touch3 is on, then let enable this check box
			screenMode_radio_p90.enabled = false;
			screenMode_radio_p270.enabled = false;
			screenMode_radio_l0.enabled = false;
			screenMode_radio_l180.enabled = false;
		}
		
		if (myXML.photobooth_printing == "on") {
			photobooth_printing_check.selected = true ;
		}
		else {
			photobooth_printing_check.selected = false ;			
		}
		
		if (myXML.photobooth_promptprint == "on") {
			photobooth_promptprint_check.selected = true ;
		}
		else {
			photobooth_promptprint_check.selected = false ;			
		}
		
		if (myXML.photobooth_save == "on") {
			photobooth_save_check.selected = true ;
		}
		else {
			photobooth_save_check.selected = false ;			
		}
		
		if (myXML.photobooth_x10 == "on") {
			photobooth_x10_check.selected = true ;
		}
		else {
			photobooth_x10_check.selected = false ;			
		}
		
		if (myXML.photobooth_leds == "on") {
			photobooth_leds_check.selected = true ;
		}
		else {
			photobooth_leds_check.selected = false ;			
		}
		
		if (myXML.photoboothProofPreview == "on") {
			photoboothProofPreview_check.selected = true ;
		}
		else {
			photoboothProofPreview_check.selected = false ;			
		}
		
		if (myXML.photobooth_facialRecognitionTrigger == "on") {
			photoboothFacialRecognitionTrigger_check.selected = true ;
		}
		else {
			photoboothFacialRecognitionTrigger_check.selected = false ;			
		}
		
		if (myXML.photobooth_backgroundcustomimage == "on") {
			photobooth_BackgroundImage_check.selected = true ;
		}
		else {
			photobooth_BackgroundImage_check.selected = false ;			
		}
		
		if (myXML.photobooth_logo == "on") {
			photobooth_LogoImage_check.selected = true ;
		}
		else {
			photobooth_LogoImage_check.selected = false ;			
		}
		 
		if (photoboothProofPreview_check.selected == false) {  
			photobooth_ProofPreviewDuration_slider.enabled = false;
			photobooth_ProofPreviewDuration_label.enabled = false;
		}
		else {
			photobooth_ProofPreviewDuration_slider.enabled = true;
			photobooth_ProofPreviewDuration_label.enabled = true;
		}		
	
		if (photobooth_printing_check.selected == false) {  
			photobooth_PaperSize_dropdown.enabled = false;
			photobooth_promptprint_check.enabled = false;
			photobooth_PrintCopies_slider.enabled = false;
		}
		else {
			photobooth_PaperSize_dropdown.enabled = true;
			photobooth_promptprint_check.enabled = true;
			photobooth_PrintCopies_slider.enabled = true;
		}		
		
		//fullscreen_rbg.addEventListener(Event.CHANGE, rotate_objects); //make sure this is after the initial radio box is selected
	weathergraphic_check.addEventListener(MouseEvent.CLICK, weathergraphic_checkEvent);
	webcamgraphic_check.addEventListener(MouseEvent.CLICK, webcamgraphic_checkEvent);
	webcamvideo_check.addEventListener(MouseEvent.CLICK, webcamvideo_checkEvent);
	stocktext_check.addEventListener(MouseEvent.CLICK, stocktext_checkEvent); 
	weathertext_check.addEventListener(MouseEvent.CLICK, weathertext_checkEvent); 
	AlcoholResults_check.addEventListener(MouseEvent.CLICK, AlcoholResults_checkEvent); 
		
	}
	
				
	private function _setupCamera() : void{
			
			var camera : Camera;
			
			var index:int = 0;
			for ( var i : int = 0 ; i < Camera.names.length ; i ++ ) {
                
				if ( Camera.names[ i ] == "USB Video Class Video" ) {
					index = i;
				}
			}
			
			
			try {  	camera  = Camera.getCamera( String( index ) );	
					camera.setMode(webcam_width, webcam_height, webcam_fps); 					
				}
			 
				catch (e:Error) {      
				output.text = "Could not unload weather display";
			}			
			
			//camera  = Camera.getCamera( String( index ) );			
			//camera.setMode(webcam_width, webcam_height, webcam_fps); //120, 150, 24

            if (camera != null) {
				
				webcamvideo = new Video( camera.width , camera.height );
				webcamvideo.x = webcamvideo_x;
				webcamvideo.y = webcamvideo_y;
				webcamvideo.rotation = webcamvideo_rotation;
				webcamvideo.scaleX = webcamvideo_scale;
				webcamvideo.scaleY = webcamvideo_scale;
				webcamvideo.attachCamera( camera );				
				addChild(webcamvideo);		
				webcamvideo.visible = false;
				webcamfound = 1;
				
				
			//webcamMask = new Shape();						
				//webcamMask.graphics.beginFill(0xFF0000);
				//webcamMask.graphics.drawEllipse(0,0,camera.width,camera.height);			
				//addChild(webcamMask);
				//webcamMask.x = webcamvideo.x;
				//webcamMask.y = webcamvideo.y;		
				//webcamvideo.mask = webcamMask;			//the ellipse mask
				
				
			} else {
				trace( "A USB webcam was not detected" );
				output.text = "A USB webcam was not detected";
			}
			
		}
	
	private function BreathalyzerButtonEvent(event:Event):void {	
	
		  setChildIndex(black_square,numChildren-1);
			   black_square.visible = true;
			   
			   if (SlideShowStarted == 1) {
					StopSlideShow();
				}
		  setChildIndex(SaveButton,getChildIndex(black_square));
		  setChildIndex(goBackMain,getChildIndex(black_square));				
		  
		  SaveButton.visible = true;
		  goBackMain.visible = true;		
		  alcohol_help_button.visible = true;
		  
		  setChildIndex(alcohol_baseline_text,getChildIndex(black_square));
		  setChildIndex(alcohol_level1_text,getChildIndex(black_square));
		  setChildIndex(alcohol_level2_text,getChildIndex(black_square));
		  setChildIndex(alcohol_level3_text,getChildIndex(black_square));
		  setChildIndex(alcohol_baseline_difference_allowance_text,getChildIndex(black_square));
		  setChildIndex(alcohol_countdown_text,getChildIndex(black_square));
		  setChildIndex(alcohol_baseline_label,getChildIndex(black_square));
		  setChildIndex(alcohol_level1_label,getChildIndex(black_square));
		  setChildIndex(alcohol_level2_label,getChildIndex(black_square));
		  setChildIndex(alcohol_level3_label,getChildIndex(black_square));
		  setChildIndex(alcohol_baseline_difference_allowance_label,getChildIndex(black_square));
		  setChildIndex(alcohol_countdown_label,getChildIndex(black_square));
		  setChildIndex(output,getChildIndex(black_square)); //remove this
		  setChildIndex(Breathalyzer_Label,getChildIndex(black_square));
		  setChildIndex(Breathalyzer_WarningLabel,getChildIndex(black_square));
		  setChildIndex(alcohol_help_button,getChildIndex(black_square));
		  
		  setChildIndex(drink1_tweet_label,getChildIndex(black_square));
		  setChildIndex(drink1_tweet,getChildIndex(black_square));		  
		  setChildIndex(drink2_tweet_label,getChildIndex(black_square));
		  setChildIndex(drink2_tweet,getChildIndex(black_square));		  
		  setChildIndex(drink3_tweet_label,getChildIndex(black_square));
		  setChildIndex(drink3_tweet,getChildIndex(black_square));		  
		  setChildIndex(drink4_tweet_label,getChildIndex(black_square));
		  setChildIndex(drink4_tweet,getChildIndex(black_square));				
		  
		  setChildIndex(Tweet_Breathalyzer_Value_check,getChildIndex(black_square));	
		  setChildIndex(BreathalyzerNoSwitch_check,getChildIndex(black_square));	
				  
		  alcohol_baseline_text.visible = true;
		  alcohol_level1_text.visible = true;
		  alcohol_level2_text.visible = true;
		  alcohol_level3_text.visible = true;
		  alcohol_baseline_difference_allowance_text.visible = true;
		  alcohol_countdown_text.visible = true;				
		  alcohol_baseline_label.visible = true;
		  alcohol_level1_label.visible = true;
		  alcohol_level2_label.visible = true;
		  alcohol_level3_label.visible = true;
		  alcohol_baseline_difference_allowance_label.visible = true;
		  alcohol_countdown_label.visible = true;		
		  Breathalyzer_Label.visible = true;
		  Breathalyzer_WarningLabel.visible = true;		
		  
		  drink1_tweet_label.visible = true;
		  drink1_tweet.visible = true;
		  drink2_tweet_label.visible = true;
		  drink2_tweet.visible = true;
		  drink3_tweet_label.visible = true;
		  drink3_tweet.visible = true;
		  drink4_tweet_label.visible = true;
		  drink4_tweet.visible = true;
		  
		  Tweet_Breathalyzer_Value_check.visible = true;
		  BreathalyzerNoSwitch_check.visible = true;
		  
		  
		  output.visible = true;
	
	}
	
	private function TTSButtonEvent(event:Event):void {	
	
		  setChildIndex(black_square,numChildren-1);
			   black_square.visible = true;
			   
			   if (SlideShowStarted == 1) {
					StopSlideShow();
				}
		  setChildIndex(SaveButton,getChildIndex(black_square));
		  setChildIndex(goBackMain,getChildIndex(black_square));				
		  setChildIndex(BrowseAudioButton,getChildIndex(black_square));
		  setChildIndex(lipsync_checkbox,getChildIndex(black_square));
		  
		  SaveButton.visible = true;
		  goBackMain.visible = true;	
		  BrowseAudioButton.visible = true;	
		  lipsync_checkbox.visible = true;
		  alcohol_help_button.visible = true;
		  
		  setChildIndex(TTS_Screen_Label,getChildIndex(black_square));
		//  setChildIndex(tts_feature_label,getChildIndex(black_square));
		  setChildIndex(tts_url_label,getChildIndex(black_square));
		  setChildIndex(tts_language_label,getChildIndex(black_square));
		  setChildIndex(tts_engine_label,getChildIndex(black_square));	
		  setChildIndex(custom_audio_path_label,getChildIndex(black_square));
		  setChildIndex(TTS_languages_dropdown,getChildIndex(black_square));
		  setChildIndex(proximity1_tts,getChildIndex(black_square));
		  setChildIndex(proximity1_tts_label,getChildIndex(black_square));
		  setChildIndex(proximity2_tts,getChildIndex(black_square));
		  setChildIndex(proximity2_tts_label,getChildIndex(black_square));
		  setChildIndex(proximity3_tts,getChildIndex(black_square));
		  setChildIndex(proximity3_tts_label,getChildIndex(black_square));		 
		  setChildIndex(weather_good_tts,getChildIndex(black_square));
		  setChildIndex(weather_good_tts_label,getChildIndex(black_square));
		  setChildIndex(weather_ok_tts_label,getChildIndex(black_square));
		  setChildIndex(weather_ok_tts,getChildIndex(black_square));
		  setChildIndex(weather_rain_tts_label,getChildIndex(black_square));
		  setChildIndex(weather_rain_tts,getChildIndex(black_square));		  
		  setChildIndex(no_internet_tts,getChildIndex(black_square));
		  setChildIndex(no_internet_tts_label,getChildIndex(black_square));
		  setChildIndex(stock_up_tts_label,getChildIndex(black_square));
		  setChildIndex(stock_up_tts,getChildIndex(black_square));
		  setChildIndex(stock_no_change_tts_label,getChildIndex(black_square));
		  setChildIndex(stock_no_change_tts,getChildIndex(black_square));		 
		  setChildIndex(stock_down_tts,getChildIndex(black_square));
		  setChildIndex(stock_down_tts_label,getChildIndex(black_square));
		  setChildIndex(doorbell_tts,getChildIndex(black_square));
		  setChildIndex(doorbell_tts_label,getChildIndex(black_square));
		  setChildIndex(x10_on_tts,getChildIndex(black_square));
		  setChildIndex(x10_on_tts_label,getChildIndex(black_square));		 
		  setChildIndex(x10_off_tts,getChildIndex(black_square));
		  setChildIndex(x10_off_tts_label,getChildIndex(black_square));
		  setChildIndex(drink1_tts_label,getChildIndex(black_square));
		  setChildIndex(drink1_tts,getChildIndex(black_square));
		  setChildIndex(drink2_tts_label,getChildIndex(black_square));
		  setChildIndex(drink2_tts,getChildIndex(black_square));		  
		  setChildIndex(drink3_tts,getChildIndex(black_square));
		  setChildIndex(drink3_tts_label,getChildIndex(black_square));
		  setChildIndex(drink4_tts_label,getChildIndex(black_square));
		  setChildIndex(drink4_tts,getChildIndex(black_square));			
		  setChildIndex(wait_tts_label,getChildIndex(black_square));
		  setChildIndex(wait_tts,getChildIndex(black_square));
		  setChildIndex(blow_tts_label,getChildIndex(black_square));
		  setChildIndex(blow_tts,getChildIndex(black_square));				  
		  setChildIndex(tts_feature_radio_on,getChildIndex(black_square));
		  setChildIndex(tts_feature_radio_off,getChildIndex(black_square));	
		  
		  setChildIndex(tts_engine_voicerss,getChildIndex(black_square));
		  setChildIndex(tts_engine_yakitome,getChildIndex(black_square));	
		  
		  setChildIndex(tts_url,getChildIndex(black_square));	
		  setChildIndex(tts_instructions,getChildIndex(black_square));			  
		  setChildIndex(output,getChildIndex(black_square)); //remove this	  
		  
		  setChildIndex(tts_api_key,getChildIndex(black_square));
		  setChildIndex(tts_api_key_label,getChildIndex(black_square));
		  
		  setChildIndex(tts_api_keyYakitome,getChildIndex(black_square));
		  setChildIndex(tts_api_key_labelYakitome,getChildIndex(black_square));
		
		  custom_audio_path_label.visible = true;
		  TTS_Screen_Label.visible = true;
		  tts_feature_radio_off.visible = true;
		  tts_instructions.visible = true;
		  
		                                       
		  proximity1_tts.visible = true;
		  proximity1_tts_label.visible = true;
		  proximity2_tts.visible = true;
		  
		  proximity2_tts_label.visible = true;
		  proximity3_tts.visible = true;
	      proximity3_tts_label.visible = true;
		  tts_language_label.visible = true;
		  tts_engine_label.visible = true;
		 
		  TTS_languages_dropdown.visible = true;
		
		  weather_good_tts.visible = true;
		  weather_good_tts_label.visible = true;
		  weather_ok_tts_label.visible = true;
		  weather_ok_tts.visible = true;
		  weather_rain_tts_label.visible = true;
		  weather_rain_tts.visible = true;		  
		  no_internet_tts.visible = true;
		  no_internet_tts_label.visible = true;
		  stock_up_tts_label.visible = true; 
		  stock_up_tts.visible = true;
		  stock_no_change_tts_label.visible = true;
		  stock_no_change_tts.visible = true;		  
		  stock_down_tts_label.visible = true;
		  doorbell_tts_label.visible = true;
		  x10_on_tts_label.visible = true;
		  x10_off_tts_label.visible = true;
		  drink1_tts_label.visible = true;
		  drink2_tts_label.visible = true;
		  drink3_tts_label.visible = true;
		  drink4_tts_label.visible = true;		  
		  stock_down_tts.visible = true;
		  doorbell_tts.visible = true;
		  x10_on_tts.visible = true;
		  x10_off_tts.visible = true;
		  drink1_tts.visible = true;
		  drink2_tts.visible = true;
		  drink3_tts.visible = true;
		  drink4_tts.visible = true;
		  blow_tts.visible = true;
		  blow_tts_label.visible = true;
		  wait_tts.visible = true;
		  wait_tts_label.visible = true;
		  tts_feature_radio_on.visible = true;
		  tts_feature_radio_off.visible = true;
		  
		  tts_engine_voicerss.visible = true;
		  tts_engine_yakitome.visible = true;
		  
		  tts_instructions.visible = true;
		  
		  tts_api_key.visible = true;
		  tts_api_key_label.visible = true;
		  
		  tts_api_keyYakitome.visible = true;
		  tts_api_key_labelYakitome.visible = true;
		  
		  output.visible = true;
		 
	}
	
		
	private function photoboothButtonEvent(event:Event):void {	
	
		  setChildIndex(black_square,numChildren-1);
			   black_square.visible = true;
			   
			   if (SlideShowStarted == 1) {
					StopSlideShow();
				}
		  setChildIndex(SaveButton,getChildIndex(black_square));
		  setChildIndex(goBackMain,getChildIndex(black_square));				
		  
		  
		  
		  SaveButton.visible = true;
		  goBackMain.visible = true;	
		  alcohol_help_button.visible = true;
		  
			  
		  setChildIndex(photobooth_Screen_Label,getChildIndex(black_square));
		  setChildIndex( photobooth_PrintCopies_label,getChildIndex(black_square));
		  setChildIndex( photobooth_PrintCopies_slider,getChildIndex(black_square));
		  setChildIndex( photobooth_PrintCopiesValue_label,getChildIndex(black_square));
		  
		  setChildIndex( photobooth_printing_check,getChildIndex(black_square));
		  setChildIndex( photobooth_promptprint_check,getChildIndex(black_square));
		  setChildIndex( photobooth_PaperSize_dropdown,getChildIndex(black_square));
		  setChildIndex( photobooth_save_check,getChildIndex(black_square));
		  setChildIndex( photobooth_SaveFolder_label,getChildIndex(black_square));
		  setChildIndex( photobooth_SaveFolderPath_label,getChildIndex(black_square));
		  setChildIndex( photobooth_x10_check,getChildIndex(black_square));
		  setChildIndex( photobooth_x10HouseCode_label,getChildIndex(black_square));
		  setChildIndex( photobooth_x10UnitCode_label,getChildIndex(black_square));
		  setChildIndex( photobooth_leds_check,getChildIndex(black_square));
		  setChildIndex( photobooth_WebcamResolution_label,getChildIndex(black_square));
		  setChildIndex( photobooth_WebcamResolution_dropdown,getChildIndex(black_square));
		  setChildIndex( photobooth_WebcamFPS_label,getChildIndex(black_square));
		  setChildIndex( photobooth_WebcamFPSValue_label,getChildIndex(black_square));
		  setChildIndex( photobooth_WebcamFPS_slider,getChildIndex(black_square));
		  
		  setChildIndex( photobooth_PrintingInfo_label,getChildIndex(black_square));
		  setChildIndex( photobooth_BackgroundImage_label,getChildIndex(black_square));
		  setChildIndex( photobooth_BackgroundImagePath_label,getChildIndex(black_square));
		  setChildIndex( photobooth_BackgroundImage_check,getChildIndex(black_square));
		  setChildIndex( photobooth_LogoImage_label,getChildIndex(black_square));
		  setChildIndex( photobooth_LogoImagePath_label,getChildIndex(black_square));
		  setChildIndex( photobooth_LogoImage_check,getChildIndex(black_square));
		  setChildIndex( photobooth_StartupText_label,getChildIndex(black_square));
		  setChildIndex( photobooth_PaperSize_label,getChildIndex(black_square));		  
		  setChildIndex( photobooth_StartupText_textarea,getChildIndex(black_square));
		  
		  setChildIndex( onoff_house_code_input,getChildIndex(black_square));
		  setChildIndex( onoff_unit_code_input,getChildIndex(black_square));
		  
		  onoff_house_code_input.move(416.05,242.85);
		  onoff_unit_code_input.move(594.15,242.85);
			
		//setChildIndex( photobooth_kinect_check,getChildIndex(black_square));
		setChildIndex( photoboothProofPreview_check,getChildIndex(black_square));			
		setChildIndex( photoboothFacialRecognitionTrigger_check,getChildIndex(black_square));			
		setChildIndex( photobooth_CountDownFrom_label,getChildIndex(black_square));
		setChildIndex( photobooth_ShotDelay_label,getChildIndex(black_square));
		setChildIndex( photobooth_PhotoPreviewDuration_label,getChildIndex(black_square));
		setChildIndex( photobooth_ProofPreviewDuration_label,getChildIndex(black_square));
		setChildIndex( photobooth_CountDownFromValue_label,getChildIndex(black_square));
		setChildIndex( photobooth_ShotDelayValue_label,getChildIndex(black_square));
		setChildIndex( photobooth_PhotoPreviewDurationValue_label,getChildIndex(black_square));
		setChildIndex( photobooth_ProofPreviewDurationValue_label,getChildIndex(black_square));
		setChildIndex( photobooth_CountDownFrom_slider,getChildIndex(black_square));
		setChildIndex( photobooth_ShotDelay_slider,getChildIndex(black_square));
		setChildIndex( photobooth_PhotoPreviewDuration_slider,getChildIndex(black_square));
		setChildIndex( photobooth_ProofPreviewDuration_slider,getChildIndex(black_square));
		setChildIndex(output,getChildIndex(black_square)); 
			  
		 photobooth_Screen_Label.visible = true;
		 photobooth_printing_check.visible=true;
		 photobooth_promptprint_check.visible=true;
		 photobooth_save_check.visible=true;
		 photobooth_x10_check.visible=true;
		 photobooth_leds_check.visible=true;
		 photobooth_kinect_check.visible=true;
		 photoboothProofPreview_check.visible=true;
		 photoboothFacialRecognitionTrigger_check.visible = true;
		 photobooth_PaperSize_dropdown.visible=true;
		 photobooth_PrintCopies_label.visible=true;
		 photobooth_PrintCopiesValue_label.visible=true;
		 photobooth_SaveFolder_label.visible=true;
		 photobooth_SaveFolderPath_label.visible=true;
		 photobooth_x10HouseCode_label.visible=true;
		 photobooth_x10UnitCode_label.visible=true;
		 photobooth_WebcamResolution_label.visible=true;
		 photobooth_WebcamResolution_dropdown.visible=true;
		 photobooth_WebcamFPS_label.visible=true;
		 photobooth_CountDownFrom_label.visible=true;
		 photobooth_ShotDelay_label.visible=true;
		 photobooth_PhotoPreviewDuration_label.visible=true;
		 photobooth_ProofPreviewDuration_label.visible=true;
		 photobooth_WebcamFPSValue_label.visible=true;
		 photobooth_CountDownFromValue_label.visible=true;
		 photobooth_ShotDelayValue_label.visible=true;
		 photobooth_PhotoPreviewDurationValue_label.visible=true;
		 photobooth_ProofPreviewDurationValue_label.visible=true;
		 photobooth_PrintCopies_slider.visible=true;
		 photobooth_WebcamFPS_slider.visible=true;
		 photobooth_CountDownFrom_slider.visible=true;
		 photobooth_ShotDelay_slider.visible=true;
		 photobooth_PhotoPreviewDuration_slider.visible=true;
		 photobooth_ProofPreviewDuration_slider.visible=true;
		 photobooth_PrintingInfo_label.visible = true;
		 photobooth_BackgroundImage_label.visible = true;
		 photobooth_BackgroundImagePath_label.visible = true;
		 photobooth_BackgroundImage_check .visible = true;
		 photobooth_LogoImage_label.visible = true;
	     photobooth_LogoImagePath_label.visible = true;
	     photobooth_LogoImage_check.visible = true;
		 photobooth_StartupText_label.visible = true;
		 photobooth_PaperSize_label.visible = true;
		 photobooth_StartupText_textarea.visible = true;
		 output.visible = true;
		 
	}
	
	private function PositioningScreenButtonEvent(event:Event):void {
		   if (ScreenOrientationFlag == 1) {
			   output.text = "The screen orientation was changed, please re-start the configuratin program";			
			 
			   AlertManager.createAlert(this, "The screen orientation was changed, please Save, Exit, and then re-start this configuratin program and then you will be able to adjust the positioning");
		   }
			   
		   else {	   
			  
			   removeChild(myVid);
			  // myVidChanged();
			   addChild(myVid);
			   
			   editing_mode = "positioning";
			   
			   positioningedit_radio_character.selected = true;  
			   			   
			   if (webcamvideo_radio_on.selected == true) {
					_setupCamera();					
					if (webcamfound == 1) {
						webcamvideo_check.selected = true;
						webcamvideo.visible = true;
					}					
				}
				else {
					webcamvideo_check.selected = false;
				}
			   
			   setChildIndex(black_square,numChildren-1);
			   black_square.visible = true;
			   
			   if (SlideShowStarted == 1) {
					StopSlideShow();
			   } 				
				
				setChildIndex(weathergraphic_check,getChildIndex(black_square));
				
				//if (frame_radio_on.selected == true) { //webcam frame
				//setChildIndex(webcamgraphic_check,getChildIndex(black_square));
				//}
				
				setChildIndex(weathertext_check,getChildIndex(black_square));
				setChildIndex(stocktext_check,getChildIndex(black_square));
				setChildIndex(AlcoholResults_check,getChildIndex(black_square));
				
				setChildIndex(output,getChildIndex(black_square)); //remove this
				setChildIndex(AlcoholResultsdyntext,getChildIndex(black_square));  //need to add some errror handling here
				setChildIndex(Stockdyntext,getChildIndex(black_square));  //need to add some errror handling here
				setChildIndex(Weatherdyntext,getChildIndex(black_square)); //need to add some error handling here
				setChildIndex(WeatherdynImage,getChildIndex(black_square));		//need to add some error handling here
				setChildIndex(BeerdynImage,getChildIndex(black_square));		//need to add some error handling here
				setChildIndex(TwitterBirddynImage,getChildIndex(black_square));		//need to add some error handling here
				setChildIndex(FramedynImage,getChildIndex(black_square));	
				setChildIndex(Lip1dynImage,getChildIndex(black_square));	
				
				if (webcamfound == 1 && webcamvideo_radio_on.selected == true) {
					setChildIndex(webcamvideo,getChildIndex(black_square));	
				}
				setChildIndex(webcamgraphic_check,getChildIndex(black_square));
				setChildIndex(instructions,getChildIndex(black_square));
				setChildIndex(myVid_bigger,getChildIndex(black_square));
				setChildIndex(myVid_smaller,getChildIndex(black_square));
				setChildIndex(move_upButton,getChildIndex(black_square));
				setChildIndex(move_leftButton,getChildIndex(black_square));
				setChildIndex(move_rightButton,getChildIndex(black_square));
				setChildIndex(move_downButton,getChildIndex(black_square));
				setChildIndex(SaveButton,getChildIndex(black_square));
				setChildIndex(goBackMain,getChildIndex(black_square));					
				setChildIndex(positioningedit_radio_character,getChildIndex(black_square));
				setChildIndex(positioningedit_radio_stockText,getChildIndex(black_square));
				setChildIndex(positioningedit_radio_weatherText,getChildIndex(black_square));
				setChildIndex(positioningedit_radio_weatherImage,getChildIndex(black_square));
				setChildIndex(positioningedit_radio_webcamImage,getChildIndex(black_square));
				setChildIndex(positioningedit_radio_beerImage,getChildIndex(black_square));
				setChildIndex(positioningedit_radio_lipsync,getChildIndex(black_square));
				setChildIndex(positioningedit_radio_twitterbird,getChildIndex(black_square));
				setChildIndex(positioningedit_radio_webcamvideo,getChildIndex(black_square));
				setChildIndex(positioningedit_radio_AlcoholResults,getChildIndex(black_square));
				setChildIndex(positioning_instructions,getChildIndex(black_square));
				
				//lip1.visible = true;	 
				
				positioning_instructions.visible = true;
				
				beer_image.visible = true;
				twitterbird_image.visible = true;
				
				if (weather_graphic_radio_on.selected == true) {
					weather_image.visible = true;
					weathergraphic_check.selected = true;
				}
				else {
					weather_image.visible = false;
					weathergraphic_check.selected = false;
				}
				
				if (frame_radio_on.selected == true) { //webcam frame
					frame.visible = true;
					webcamgraphic_check.selected = true;
				}
				else {
					frame.visible = false;
					webcamgraphic_check.selected = false;
				}
				
				//if (webcamvideo_radio_off.selected == true) { //the frame could be on but if the webcab is not on, then don't show it
					//frame.visible = false;
					//webcamgraphic_check.enabled = false;
				//}
				//else {
					//webcamgraphic_check.enabled = true;
				//}
				
				if (weather_readout_radio_on.selected == true) {
					weather_display2.visible = true;
					weathertext_check.selected = true;
				}
				else {
					weather_display2.visible = false;
					weathertext_check.selected = false;
				}
				
				if (AlcoholResults_readout_radio_on.selected == true) {
					AlcoholResults_check.selected = true;		
					AlcoholResults.visible = true;
				}
				else {
					AlcoholResults_check.selected = false;		
					AlcoholResults.visible = false;
				}
				
				if (stock_readout_radio_on.selected == true) {
					stocktext_check.selected = true;		
					stock_display.visible = true;
				}
				else {
					stocktext_check.selected = false;		
					stock_display.visible = false;
				}
				
				setChildIndex(myVid,getChildIndex(black_square));						
				
				positioningedit_radio_character.visible = true;
				positioningedit_radio_stockText.visible = true;
				positioningedit_radio_weatherText.visible = true;
				positioningedit_radio_weatherImage.visible = true;	
				positioningedit_radio_webcamImage.visible = true;	
				positioningedit_radio_beerImage.visible = true;	
				positioningedit_radio_lipsync.visible = true;	
				positioningedit_radio_twitterbird.visible = true;	
				positioningedit_radio_webcamvideo.visible = true;	
				positioningedit_radio_AlcoholResults.visible = true;	
							
				myVid.visible = true;
				output.visible = true;
				
				weathergraphic_check.visible = true;
				webcamgraphic_check.visible = true;
				//webcamvideo_check.visible = true;
				weathertext_check.visible = true;
				AlcoholResults_check.visible = true;											
				stocktext_check.visible = true;									
				myVid_bigger.visible = true;	
				myVid_smaller.visible = true;
				move_upButton.visible = true;
				move_leftButton.visible = true;
				move_rightButton.visible = true;
				move_downButton.visible = true;		
				SaveButton.visible = true;
				goBackMain.visible = true;				
				instructions.visible = true;
				webcamvideo_check.visible = false;  //this check box not used
		   }
	}
	
	private function PositioningScreenPicasaButtonEvent(event:Event):void {
		 if (internet == 1) {	 
			 
			 if (ScreenOrientationFlag == 1) {
				   output.text = "The screen orientation was changed, please re-start the configuratin program";			
				   AlertManager.createAlert(this, "The screen orientation was changed, please Save, Exit, and then Re-start this configuratin program and then you will be able to adjust the positioning");
			 }
			 else {
				
				editing_mode = "picasa";
				PicasaLoaded = 0;
				picasa_positioning_flag = 1; //set this and then the return responder function will see this and call the slideshow
				//var responder2 = service.photos.list(picasa_id_input.text, album_id.text); 
				
			/*	var responder2:PicasaResponder = service.photos.list(picasa_id_input.text, album_id.text);
				responder2.addEventListener(PicasaDataEvent.DATA, onGetAlbumsComplete);			*/
				   
				setChildIndex(black_square,numChildren-1);
				black_square.visible = true;
				
				setChildIndex(myVid_bigger,getChildIndex(black_square));
				setChildIndex(myVid_smaller,getChildIndex(black_square));
				setChildIndex(move_upButton,getChildIndex(black_square));
				setChildIndex(move_leftButton,getChildIndex(black_square));
				setChildIndex(move_rightButton,getChildIndex(black_square));
				setChildIndex(move_downButton,getChildIndex(black_square));
				setChildIndex(SaveButton,getChildIndex(black_square));
				setChildIndex(goBackMain,getChildIndex(black_square));
				setChildIndex(pic,getChildIndex(black_square));
				setChildIndex(instructions,getChildIndex(black_square));
				
				myVid_bigger.visible = true;	
				myVid_smaller.visible = true;
				move_upButton.visible = true;
				move_leftButton.visible = true;
				move_rightButton.visible = true;
				move_downButton.visible = true;		
				SaveButton.visible = true;
				goBackMain.visible = true;
				instructions.visible = true;		
				instructions.text = "Use the buttons to position the slideshow";
				//StartSlideShow(); 							
			 }
		 }
		 else {
			 AlertManager.createAlert(this, "You'll need Internet connectivity before you can adjust the Picasa Slide Show Settings");			 
		 }
	}
	
	private function PositioningScreenDoorcamButtonEvent(event:Event):void {		
		if (internet == 1) {   
			  if (ScreenOrientationFlag == 1) {
				   output.text = "The screen orientation was changed, please re-start the configuratin program";			
				   AlertManager.createAlert(this, "The screen orientation was changed, please Save, Exit, and then Re-start this configuratin program and then you will be able to adjust the positioning");
			  }
			  else {
			 
				   doorcamedit_radio_character.selected = true;   //by default, the moves controls are for the character first
				   doorcamFlag = 1; //once the go back main button is called, then we'll know the doorcam was loaded to know to hide it
				   
				   var doorcamError:int = 0;
				   
				   if (SlideShowStarted == 1) {
						StopSlideShow();
					}
					
					editing_mode = "doorcam";
								
							  
					  doorcam = new MJPEG(ipcamera_url.text, ipcamera_path.text, int(ipcamera_port.text),ipcamera_username.text,ipcamera_password.text ); //connect to serial proxy server						  
					
						doorcam.rotation = doorcam_rotate;
						doorcam.x = doorcam_x;		
						doorcam.y = doorcam_y;
						doorcam.scaleX = doorcam_scale; //whether or not the reduce the video
						doorcam.scaleY = doorcam_scale;
						
						doorcamWidth = doorcam_width * doorcam_scale; //for the mask
						doorcamHeight = doorcam_height * doorcam_scale;										
						addChild(doorcam)
						
						
						doorcamLoadTimer.reset();  
						doorcamMaskingShape = new Shape();						
						doorcamMaskingShape.graphics.beginFill(0xFF0000);
						doorcamMaskingShape.graphics.drawEllipse(0,0,doorcamWidth,doorcamHeight);			
						addChild(doorcamMaskingShape);
						doorcamMaskingShape.x = doorcam.x;
						doorcamMaskingShape.y = doorcam.y;		
						doorcamMaskingShape.rotation = doorcam.rotation;
						doorcam.mask = doorcamMaskingShape;			//the ellipse mask
						
						setChildIndex(black_square,numChildren-1);
						black_square.visible = true;			
						 
						setChildIndex(myVid_bigger,getChildIndex(black_square));
						setChildIndex(myVid_smaller,getChildIndex(black_square));
						setChildIndex(move_upButton,getChildIndex(black_square));
						setChildIndex(move_leftButton,getChildIndex(black_square));
						setChildIndex(move_rightButton,getChildIndex(black_square));
						setChildIndex(move_downButton,getChildIndex(black_square));
						setChildIndex(SaveButton,getChildIndex(black_square));
						setChildIndex(goBackMain,getChildIndex(black_square));
						setChildIndex(thoughts_image,getChildIndex(black_square));
						setChildIndex(doorcam,getChildIndex(black_square)); //must be on the stage before we can do this				
						setChildIndex(instructions,getChildIndex(black_square));
						setChildIndex (doorcamedit_radio_character,getChildIndex(black_square));
						setChildIndex (doorcamedit_radio_doorcam,getChildIndex(black_square));
						setChildIndex (doorcamedit_radio_thoughts,getChildIndex(black_square));
						setChildIndex (output,getChildIndex(black_square)); //comment out later
						setChildIndex(myVid2,getChildIndex(black_square)); //must be on the stage before we can do this			
						
						myVid_bigger.visible = true;	
						myVid_smaller.visible = true;
						move_upButton.visible = true;
						move_leftButton.visible = true;
						move_rightButton.visible = true;
						move_downButton.visible = true;		
						SaveButton.visible = true;
						goBackMain.visible = true;
						instructions.visible = true;			
						doorcamedit_radio_character.visible = true;
						doorcamedit_radio_doorcam.visible = true;
						doorcamedit_radio_thoughts.visible = true;
						thoughts_image.visible = true;
						instructions.text = "Use the buttons to adjust the positions";		
										
						myVid2.visible = true;				
						myVid2.play("file:///"+doorbell_clip);
						output.visible = true;			
			  }
		}
		else {
			 AlertManager.createAlert(this, "You'll need Internet connectivity before you can adjust the Doorcam settings");		
		}
	}
	
	//private function doorcamLoaded (event:Event ):void {	//go here once doorcam video stream loaded
	    
           //removeListener( Event.ADDED, doorcamLoaded );
           	//doorcam.visible = true;
			//thoughts_image.visible = true;
			
			
	//}
	
	
	private function goBackMainScreen(event:Event):void {  //back to main config screen so hide other stuff		
		
		editing_mode = "main";
		
		onoff_house_code_input.move(660.05,396.45);
		onoff_unit_code_input.move(815.15,395.45);
		
		weathergraphic_check.visible = false;
		webcamgraphic_check.visible = false;
		webcamvideo_check.visible = false;
		weathertext_check.visible = false;
		AlcoholResults_check.visible = false;
		stocktext_check.visible = false;		
		goBackMain.visible = false;
		BrowseAudioButton.visible = false;
		lipsync_checkbox.visible = false;
		doorcamedit_radio_character.selected = true;
		myVid_bigger.visible = false;	
		myVid_smaller.visible = false;
		move_upButton.visible = false;
		move_leftButton.visible = false;
		move_rightButton.visible = false;
		move_downButton.visible = false;		
		SaveButton.visible = false;
		
		  TTS_Screen_Label.visible = false;
		  proximity1_tts.visible = false;
		  proximity1_tts_label.visible = false;
		  proximity2_tts.visible = false;
		  proximity2_tts_label.visible = false;
		  proximity3_tts.visible = false;
		  proximity3_tts_label.visible = false;
		 // tts_feature_label.visible = false;
		  tts_url_label.visible = false;
		  tts_language_label.visible = false;
		  tts_engine_label.visible = false;
		  custom_audio_path_label.visible = false;
		  TTS_languages_dropdown.visible = false;
		  weather_good_tts.visible = false;
		  weather_good_tts_label.visible = false;
		  weather_ok_tts_label.visible = false;
		  weather_ok_tts.visible = false;
		  weather_rain_tts_label.visible = false;
		  weather_rain_tts.visible = false;		  
		  no_internet_tts.visible = false;
		  no_internet_tts_label.visible = false;
		  stock_up_tts_label.visible = false; 
		  stock_up_tts.visible = false;
		  stock_no_change_tts_label.visible = false;
		  stock_no_change_tts.visible = false;		  
		  stock_down_tts_label.visible = false;
		  doorbell_tts_label.visible = false;
		  x10_on_tts_label.visible = false;
		  x10_off_tts_label.visible = false;
		  drink1_tts_label.visible = false;
		  drink2_tts_label.visible = false;
		  drink3_tts_label.visible = false;
		  drink4_tts_label.visible = false;		  
		  stock_down_tts.visible = false;
		  doorbell_tts.visible = false;
		  x10_on_tts.visible = false;
		  x10_off_tts.visible = false;
		  drink1_tts.visible = false;
		  drink2_tts.visible = false;
		  drink3_tts.visible = false;
		  drink4_tts.visible = false;
		  tts_feature_radio_on.visible = false;
		  tts_feature_radio_off.visible = false;
		  
		  tts_engine_voicerss.visible = false;
		  tts_engine_yakitome.visible = false;
		  
		  
		  tts_url.visible = false;
		  tts_instructions.visible = false;
		  blow_tts.visible = false;
		  blow_tts_label.visible = false;
		  wait_tts.visible = false;
		  wait_tts_label.visible = false;
		  
		  tts_api_key.visible = false;
		  tts_api_key_label.visible = false;
		  
		  tts_api_keyYakitome.visible = false;
		  tts_api_key_labelYakitome.visible = false;
		
		drink1_tweet_label.visible = false;
		drink1_tweet.visible = false;
		drink2_tweet_label.visible = false;
		drink2_tweet.visible = false;
		drink3_tweet_label.visible = false;
		drink3_tweet.visible = false;
		drink4_tweet_label.visible = false;
		drink4_tweet.visible = false;
		
		Tweet_Breathalyzer_Value_check.visible = false;
		BreathalyzerNoSwitch_check.visible = false;
		
		output.visible = true;
		instructions.visible = false;
		doorcamedit_radio_character.visible = false;
		doorcamedit_radio_doorcam.visible = false;
		doorcamedit_radio_thoughts.visible = false;
		positioningedit_radio_character.visible = false;
		positioningedit_radio_stockText.visible = false;
		positioningedit_radio_weatherText.visible = false;
		positioningedit_radio_weatherImage.visible = false;	
		positioningedit_radio_webcamImage.visible = false;	
		positioningedit_radio_beerImage.visible = false;	
		positioningedit_radio_lipsync.visible = false;	
		positioningedit_radio_twitterbird.visible = false;	
		positioningedit_radio_webcamvideo.visible = false;	
		positioningedit_radio_AlcoholResults.visible = false;	
		positioning_instructions.visible = false;
				
		
		alcohol_baseline_text.visible = false;
		alcohol_level1_text.visible = false;
		alcohol_level2_text.visible = false;
		alcohol_level3_text.visible = false;
		alcohol_baseline_difference_allowance_text.visible = false;
		alcohol_countdown_text.visible = false;
		alcohol_baseline_label.visible = false;
		alcohol_level1_label.visible = false;
		alcohol_level2_label.visible = false;
		alcohol_level3_label.visible = false;
		alcohol_baseline_difference_allowance_label.visible = false;
		alcohol_countdown_label.visible = false;				
		Breathalyzer_Label.visible = false;
		Breathalyzer_WarningLabel.visible = false;		
		alcohol_help_button.visible = false;
		
		photobooth_Screen_Label.visible = false;
		 photobooth_printing_check.visible=false;
		 photobooth_promptprint_check.visible=false;
		 photobooth_save_check.visible=false;
		 photobooth_x10_check.visible=false;
		 photobooth_leds_check.visible=false;
		 photobooth_kinect_check.visible=false;
		 photoboothProofPreview_check.visible=false;
		 photoboothFacialRecognitionTrigger_check.visible = false;
		 photobooth_PaperSize_dropdown.visible=false;
		 photobooth_PrintCopies_label.visible=false;
		 photobooth_PrintCopiesValue_label.visible=false;
		 photobooth_SaveFolder_label.visible=false;
		 photobooth_SaveFolderPath_label.visible=false;
		 photobooth_x10HouseCode_label.visible=false;
		 photobooth_x10UnitCode_label.visible=false;
		 photobooth_WebcamResolution_label.visible=false;
		 photobooth_WebcamResolution_dropdown.visible=false;
		 photobooth_WebcamFPS_label.visible=false;
		 photobooth_CountDownFrom_label.visible=false;
		 photobooth_ShotDelay_label.visible=false;
		 photobooth_PhotoPreviewDuration_label.visible=false;
		 photobooth_ProofPreviewDuration_label.visible=false;
		 photobooth_WebcamFPSValue_label.visible=false;
		 photobooth_CountDownFromValue_label.visible=false;
		 photobooth_ShotDelayValue_label.visible=false;
		 photobooth_PhotoPreviewDurationValue_label.visible=false;
		 photobooth_ProofPreviewDurationValue_label.visible=false;
		 photobooth_PrintCopies_slider.visible=false;
		 photobooth_WebcamFPS_slider.visible=false;
		 photobooth_CountDownFrom_slider.visible=false;
		 photobooth_ShotDelay_slider.visible=false;
		 photobooth_PhotoPreviewDuration_slider.visible=false;
		 photobooth_ProofPreviewDuration_slider.visible=false;
		 photobooth_PrintingInfo_label.visible = false;
		 photobooth_BackgroundImage_label.visible = false;
		 photobooth_BackgroundImagePath_label.visible = false;
		 photobooth_BackgroundImage_check .visible = false;
		 photobooth_LogoImage_label.visible = false;
		 photobooth_LogoImagePath_label.visible = false;
	     photobooth_LogoImage_check.visible = false;
		 photobooth_StartupText_label.visible = false;
		 photobooth_PaperSize_label.visible = false;
		 photobooth_StartupText_textarea.visible = false;


		
		if (SlideShowStarted == 1) {
			StopSlideShow();
		}
		
		black_square.visible = false;		
		myVid.visible = false;
		myVid2.visible = false;
		
		
		try {  if (stage.contains(weather_display2)) {
					weather_display2.visible = false;
				}
			 }
				catch (e:Error) {      
				output.text = "Could not unload weather display";
			}			
		
		
		try {  if (stage.contains(AlcoholResults)) {
					AlcoholResults.visible = false;
				}
			 }
				catch (e:Error) {      
				output.text = "Could not unload Breathalhyzer Text";
			}			
		
		try {  if (stage.contains(stock_display)) {
					stock_display.visible = false;
				}
			 }
				catch (e:Error) {      
				output.text = "Could not unload stock display";
			}			
		
		
		try {  if (stage.contains(weather_image)) {
					weather_image.visible = false;
				}
			 }
				catch (e:Error) {      
				output.text = "Could not unload weather image";
			}			
			
		try {  if (stage.contains(beer_image)) {
					beer_image.visible = false;
				}
			 }
				catch (e:Error) {      
				output.text = "Could not unload beer image";
			}				
			
		try {  if (stage.contains(twitterbird_image)) {
				twitterbird_image.visible = false;
			}
		 }
			catch (e:Error) {      
			output.text = "Could not unload twitterbird image";
		}				
			
		try {  if (stage.contains(frame)) {
					frame.visible = false;
				}
			 }
				catch (e:Error) {      
				output.text = "Could not unload webcam image";
			}			
			
		try {  if (stage.contains(lip1)) {
				lip1.visible = false;
			}
		 }
			catch (e:Error) {      
			output.text = "Could not unload lip1 image";
		}			
		
		if (webcamfound == 1) {		
			try {            
				  if (stage.contains(webcamvideo)) {
					removeChild(webcamvideo);					
				}
			 }
				catch (e:Error) {      
				output.text = "Could not unload webcam";
			}			
			webcamfound = 0; //reset the flag, it will be set again once the _setupwebcam function is called
		}
		
	
		
		if (doorcamFlag == 1) {		
			try {            
				  if (stage.contains(doorcam)) {
					removeChild(doorcam);
					//doorcam.visible = false;
					thoughts_image.visible = false;
					myVid2.visible = false;
				}
			 }
				catch (e:Error) {      
				output.text = "Could not unload doorcam";
			}			
			doorcamFlag = 0; //reset the flag, it will be set again once the doorcam function is called
		}
	}		
	
	private function move_leftButtonEvent(event:Event):void {   
		
		if (editing_mode == "positioning") {
			if  (positioningedit_radio_character.selected == true) {  //character
				 myVid.x = myVid.x -10;
				 x_position = x_position - 10;
				 //output.text = ("x: " + myVid.x + " y: " + myVid.y + " Scale " + myVid.scaleX);
			}
			
			if (positioningedit_radio_stockText.selected == true) {  // ip cam feed
				Stockdyntext.x = Stockdyntext.x - 10;
				stock_text_x = stock_text_x - 10;
			}
			
			if (positioningedit_radio_weatherText.selected == true) {
				Weatherdyntext.x = Weatherdyntext.x - 10;
				weather_text_x = weather_text_x - 10;	
			}		
			
			if (positioningedit_radio_weatherImage.selected == true) {
				WeatherdynImage.x = WeatherdynImage.x - 10;
				weather_image_x = weather_image_x - 10;	
			}			
			
			if (positioningedit_radio_webcamImage.selected == true) {
				FramedynImage.x = FramedynImage.x - 10;
				frame_x = frame_x - 10;	
			}					
			
			if (positioningedit_radio_beerImage.selected == true) {
				BeerdynImage.x = BeerdynImage.x - 10;
				beer_image_x = beer_image_x - 10;	
			}			
			
			if (positioningedit_radio_twitterbird.selected == true) {
				TwitterBirddynImage.x = TwitterBirddynImage.x - 10;
				twitterbird_image_x = twitterbird_image_x - 10;	
			}				
			
			if (positioningedit_radio_lipsync.selected == true) {
				Lip1dynImage.x = Lip1dynImage.x - 10;
				lip1_x = lip1_x - 10;	
			}		
			
					
			if (positioningedit_radio_webcamvideo.selected == true) {
				webcamvideo.x = webcamvideo.x - 10;
				webcamvideo_x = webcamvideo_x - 10;	
			}	
			
			if (positioningedit_radio_AlcoholResults.selected == true) {
				AlcoholResultsdyntext.x = AlcoholResultsdyntext.x - 10;
				alcohol_results_text_x = alcohol_results_text_x - 10;	
			}					
		} 				
				
		if (editing_mode == "picasa") { 	
			 pic.x = pic.x -10;
			 picture_x_position = picture_x_position - 10;
		}
		
		if (editing_mode == "doorcam") {
			if  (doorcamedit_radio_character.selected == true) {  //character
				 myVid2.x = myVid2.x - 10;
				 doorcam_video_x = doorcam_video_x - 10;
				// output.text = ("x: " + myVid2.x + " y: " + myVid2.y + " Scale " + myVid2.scaleX);
			}
			
			if (doorcamedit_radio_doorcam.selected == true) {  // ip cam feed
				doorcam.x = doorcam.x - 10;
				doorcam_x = doorcam_x - 10;
				doorcamMaskingShape.x = doorcamMaskingShape.x - 10;
			}
			
			if (doorcamedit_radio_thoughts.selected == true) {
				thoughts_image.x = thoughts_image.x - 10;
				thoughts_image_x = thoughts_image_x - 10;				
			}			
			 
		} 
		
	}
	
	private function move_rightButtonEvent(event:Event):void {   
		 if (editing_mode == "positioning") {
			if  (positioningedit_radio_character.selected == true) {  //character
				 myVid.x = myVid.x + 10;
				 x_position = x_position + 10;
				  //output.text = ("x: " + myVid.x + " y: " + myVid.y + " Scale " + myVid.scaleX);
			}
			
			if (positioningedit_radio_stockText.selected == true) {  // ip cam feed
				Stockdyntext.x = Stockdyntext.x + 10;
				stock_text_x = stock_text_x + 10;
			}
			
			if (positioningedit_radio_weatherText.selected == true) {
				Weatherdyntext.x = Weatherdyntext.x + 10;
				weather_text_x = weather_text_x + 10;	
			}		
			
			if (positioningedit_radio_weatherImage.selected == true) {
				WeatherdynImage.x = WeatherdynImage.x + 10;
				weather_image_x = weather_image_x + 10;	
			}		
			
			if (positioningedit_radio_webcamImage.selected == true) {
				FramedynImage.x = FramedynImage.x + 10;
				frame_x = frame_x + 10;	
			}	
			
			if (positioningedit_radio_beerImage.selected == true) {
				BeerdynImage.x = BeerdynImage.x + 10;
				beer_image_x = beer_image_x + 10;	
			}			
			
			if (positioningedit_radio_twitterbird.selected == true) {
				TwitterBirddynImage.x = TwitterBirddynImage.x + 10;
				twitterbird_image_x = twitterbird_image_x + 10;	
			}				
			
			if (positioningedit_radio_lipsync.selected == true) {
				Lip1dynImage.x = Lip1dynImage.x + 10;
				lip1_x = lip1_x + 10;
			}
			
			
			if (positioningedit_radio_webcamvideo.selected == true) {
				webcamvideo.x = webcamvideo.x + 10;
				webcamvideo_x = webcamvideo_x + 10;	
			}	
			
			if (positioningedit_radio_AlcoholResults.selected == true) {
				AlcoholResultsdyntext.x = AlcoholResultsdyntext.x + 10;
				alcohol_results_text_x = alcohol_results_text_x + 10;	
			}					
		 }
		 
		 if (editing_mode == "picasa") { 	
			 pic.x = pic.x + 10;
			 picture_x_position = picture_x_position + 10;
		}
		
		if (editing_mode == "doorcam") {
			if  (doorcamedit_radio_character.selected == true) { //charater
				 myVid2.x = myVid2.x + 10;
				 doorcam_video_x = doorcam_video_x + 10;
				//output.text = ("x: " + myVid2.x + " y: " + myVid2.y + " Scale " + myVid2.scaleX);
			}
			
			if (doorcamedit_radio_doorcam.selected == true) { //ip cam feed
				doorcam.x = doorcam.x + 10;
				doorcamMaskingShape.x = doorcamMaskingShape.x + 10;
				doorcam_x = doorcam_x + 10;
			}
			
			if (doorcamedit_radio_thoughts.selected == true) {
				thoughts_image.x = thoughts_image.x + 10;
				thoughts_image_x = thoughts_image_x + 10;
			}			
		} 
	}
	
	private function move_upButtonEvent(event:Event):void {   
		 if (editing_mode == "positioning") {
			 if (positioningedit_radio_character.selected == true) {  //character
				 myVid.y = myVid.y - 10;
				 y_position = y_position - 10;
				  //output.text = ("x: " + myVid.x + " y: " + myVid.y + " Scale " + myVid.scaleX);
			}
			
			if (positioningedit_radio_stockText.selected == true) {  // ip cam feed
				Stockdyntext.y = Stockdyntext.y - 10;
				stock_text_y = stock_text_y - 10;
			}
			
			if (positioningedit_radio_weatherText.selected == true) {
				Weatherdyntext.y = Weatherdyntext.y - 10;
				weather_text_y = weather_text_y - 10;	
			}		
			
			if (positioningedit_radio_weatherImage.selected == true) {
				WeatherdynImage.y = WeatherdynImage.y - 10;
				weather_image_y = weather_image_y - 10;	
			}			
			
			if (positioningedit_radio_webcamImage.selected == true) {
				FramedynImage.y = FramedynImage.y - 10;
				frame_y = frame_y - 10;	
			}		
			
			if (positioningedit_radio_beerImage.selected == true) {
				BeerdynImage.y = BeerdynImage.y - 10;
				beer_image_y = beer_image_y - 10;	
			}
			
			if (positioningedit_radio_twitterbird.selected == true) {
				TwitterBirddynImage.y = TwitterBirddynImage.y - 10;
				twitterbird_image_y = twitterbird_image_y - 10;	
			}				
			
			if (positioningedit_radio_lipsync.selected == true) {
				Lip1dynImage.y = Lip1dynImage.y - 10;
				lip1_y = lip1_y - 10;
			}
			
			
			if (positioningedit_radio_webcamvideo.selected == true) {
				webcamvideo.y = webcamvideo.y - 10;
				webcamvideo_y = webcamvideo_y - 10;	
			}	
			
			if (positioningedit_radio_AlcoholResults.selected == true) {
				AlcoholResultsdyntext.y = AlcoholResultsdyntext.y - 10;
				alcohol_results_text_y = alcohol_results_text_y - 10;	
			}					
		 }
		 
		 if (editing_mode == "picasa") { 	
			 pic.y = pic.y -10;
			 picture_y_position = picture_y_position - 10;
		}
		
		if (editing_mode == "doorcam") {
			if  (doorcamedit_radio_character.selected == true) {  //character
				 myVid2.y = myVid2.y - 10;
				 doorcam_video_y = doorcam_video_y - 10;
				 //output.text = ("x: " + myVid2.x + " y: " + myVid2.y + " Scale " + myVid2.scaleX);
			}
			
			if (doorcamedit_radio_doorcam.selected == true) {   //ip cam feed
				doorcam.y = doorcam.y - 10;
				doorcam_y = doorcam_y - 10;
				doorcamMaskingShape.y = doorcamMaskingShape.y - 10;
			}
			
			if (doorcamedit_radio_thoughts.selected == true) {
				thoughts_image.y = thoughts_image.y - 10;
				thoughts_image_y = thoughts_image_y - 10;
			}			
		} 
	}
	
	private function move_downButtonEvent(event:Event):void {   
		 if (editing_mode == "positioning") { 
			 if (positioningedit_radio_character.selected == true) {  //character
				 myVid.y = myVid.y + 10;
				 y_position = y_position + 10;
				  //output.text = ("x: " + myVid.x + " y: " + myVid.y + " Scale " + myVid.scaleX);
			}
			
			if (positioningedit_radio_stockText.selected == true) {  // ip cam feed
				Stockdyntext.y = Stockdyntext.y + 10;
				stock_text_y = stock_text_y + 10;
			}
			
			if (positioningedit_radio_weatherText.selected == true) {
				Weatherdyntext.y = Weatherdyntext.y + 10;
				weather_text_y = weather_text_y + 10;	
			}		
			
			if (positioningedit_radio_weatherImage.selected == true) {
				WeatherdynImage.y = WeatherdynImage.y + 10;
				weather_image_y = weather_image_y + 10;	
			}		
			
			if (positioningedit_radio_webcamImage.selected == true) {
				FramedynImage.y = FramedynImage.y + 10;
				frame_y = frame_y + 10;	
			}	
			
			if (positioningedit_radio_beerImage.selected == true) {
				BeerdynImage.y = BeerdynImage.y + 10;
				beer_image_y = beer_image_y + 10;	
			}		
			
			if (positioningedit_radio_twitterbird.selected == true) {
				TwitterBirddynImage.y = TwitterBirddynImage.y + 10;
				twitterbird_image_y = twitterbird_image_y + 10;	
			}				
			
			if (positioningedit_radio_lipsync.selected == true) {
				Lip1dynImage.y = Lip1dynImage.y + 10;
				lip1_y = lip1_y + 10;
			}
			
			
			if (positioningedit_radio_webcamvideo.selected == true) {
				webcamvideo.y = webcamvideo.y + 10;
				webcamvideo_y = webcamvideo_y + 10;	
			}	
			
			if (positioningedit_radio_AlcoholResults.selected == true) {
				AlcoholResultsdyntext.y = AlcoholResultsdyntext.y + 10;
				alcohol_results_text_y = alcohol_results_text_y + 10;	
			}					
		 }
		 
		  if (editing_mode == "picasa") { 	
			 pic.y = pic.y + 10;
			 picture_y_position = picture_y_position + 10;
		}
		
		if (editing_mode == "doorcam") {
			if  (doorcamedit_radio_character.selected == true) {  //character
				 myVid2.y = myVid2.y + 10;
				 doorcam_video_y = doorcam_video_y + 10;
				// output.text = ("x: " + myVid2.x + " y: " + myVid2.y + " Scale " + myVid2.scaleX);
			}
			
			if (doorcamedit_radio_doorcam.selected == true) {   //ip cam feed
				doorcam.y = doorcam.y + 10;
				doorcam_y = doorcam_y + 10;
				doorcamMaskingShape.y = doorcamMaskingShape.y + 10;
			}
			
			if (doorcamedit_radio_thoughts.selected == true) {
				thoughts_image.y = thoughts_image.y + 10;
				thoughts_image_y = thoughts_image_y + 10;
			}			
		} 
	}
	
	private function myVid_bigger_event(event:MouseEvent):void {
		if (editing_mode == "positioning") { 
			 if (positioningedit_radio_character.selected == true) {  //character
				new_video_scaling = video_scaling_factor + .05;		
				myVid.setScale(new_video_scaling,new_video_scaling);
				video_scaling_factor = new_video_scaling;			
				// output.text = ("x: " + myVid.x + " y: " + myVid.y + " Scale " + myVid.scaleX);
			}
			
			if (positioningedit_radio_stockText.selected == true) {  // ip cam feed
				stock_text_fontsize = stock_text_fontsize + 2;
				StockTextFormat.size = stock_text_fontsize; 
				stock_display.setTextFormat(StockTextFormat);
			}
			
			if (positioningedit_radio_weatherText.selected == true) {
				weather_text_fontsize = weather_text_fontsize + 2;
				WeatherTextFormat.size = weather_text_fontsize; 
				weather_display2.setTextFormat(WeatherTextFormat);
			}		
			
			if (positioningedit_radio_weatherImage.selected == true) {
				weather_image_scale = weather_image_scale + .05;
				weather_image.scaleX = weather_image_scale;
				weather_image.scaleY = weather_image_scale;
			}			
			
			if (positioningedit_radio_webcamImage.selected == true) {
				frame_scale = frame_scale + .05;
				frame.scaleX = frame_scale;
				frame.scaleY = frame_scale;
			}	
			
			if (positioningedit_radio_beerImage.selected == true) {
				beer_image_scale = beer_image_scale + .05;
				beer_image.scaleX = beer_image_scale;
				beer_image.scaleY = beer_image_scale;
			}	
			
			if (positioningedit_radio_twitterbird.selected == true) {
				twitterbird_image_scale = twitterbird_image_scale + .05;
				twitterbird_image.scaleX = twitterbird_image_scale;
				twitterbird_image.scaleY = twitterbird_image_scale;
			}	
						
			if (positioningedit_radio_lipsync.selected == true) {
				lip1_scale = lip1_scale + .05;
				lip1.scaleX = lip1_scale;
				lip1.scaleY = lip1_scale;
			}	
			
			if (positioningedit_radio_webcamvideo.selected == true) {
				webcamvideo_scale = webcamvideo_scale + .05;
				webcamvideo.scaleX = webcamvideo_scale;
				webcamvideo.scaleY = webcamvideo_scale;
			}	
			
				
			if (positioningedit_radio_AlcoholResults.selected == true) {
				alcohol_results_text_fontsize = alcohol_results_text_fontsize + 2;
				AlcoholResultsFormat.size = alcohol_results_text_fontsize; 
				AlcoholResults.setTextFormat(AlcoholResultsFormat);
			}		
		}
		
		 if (editing_mode == "doorcam") {
			if  (doorcamedit_radio_character.selected == true) {  //character
				doorcam_video_scale = doorcam_video_scale + .05;
				myVid2.setScale(doorcam_video_scale,doorcam_video_scale);
				output.text = ("x: " + myVid2.x + " y: " + myVid2.y + " Scale " + myVid2.scaleX);
			}
			
			if (doorcamedit_radio_doorcam.selected == true) {  // ip cam feed
				doorcam_scale = doorcam_scale + .05;
				//doorcam.setScale(doorcam_scale,doorcam_scale);
				doorcam.scaleX = doorcam_scale;
				doorcam.scaleY = doorcam_scale;		
				doorcamMaskingShape.scaleX = doorcam_scale;
				doorcamMaskingShape.scaleY = doorcam_scale;		
			}
			
			if (doorcamedit_radio_thoughts.selected == true) {
				thoughts_image_scale = thoughts_image_scale + .05;
				thoughts_image.scaleX = thoughts_image_scale;
				thoughts_image.scaleY = thoughts_image_scale;
			}			 
		} 
		 		 
		 if (editing_mode == "picasa") { 	
			new_picture_scaling = picture_scale + .05;		
			pic.scaleX = new_picture_scaling;
			pic.scaleY = new_picture_scaling;				
			picture_scale =  new_picture_scaling;		
		 }
		 
	}
	
	private function myVid_smaller_event(event:MouseEvent):void {
		 if (editing_mode == "positioning") { 	
			 if (positioningedit_radio_character.selected == true) {  //character
				new_video_scaling = video_scaling_factor - .05;		
				myVid.setScale(new_video_scaling,new_video_scaling);
				video_scaling_factor =  new_video_scaling;		
				//output.text = ("x: " + myVid.x + " y: " + myVid.y + " Scale " + myVid.scaleX);				
			}
			
			if (positioningedit_radio_stockText.selected == true) {  // ip cam feed
				stock_text_fontsize = stock_text_fontsize - 2;
				StockTextFormat.size = stock_text_fontsize; 
				stock_display.setTextFormat(StockTextFormat);
			}
			
			if (positioningedit_radio_weatherText.selected == true) {
				weather_text_fontsize = weather_text_fontsize - 2;
				WeatherTextFormat.size = weather_text_fontsize; 
				weather_display2.setTextFormat(WeatherTextFormat);
			}		
			
			if (positioningedit_radio_weatherImage.selected == true) {
				weather_image_scale = weather_image_scale - .05;
				weather_image.scaleX = weather_image_scale;
				weather_image.scaleY = weather_image_scale;
			}		
			
			if (positioningedit_radio_webcamImage.selected == true) {
				frame_scale = frame_scale - .05;
				frame.scaleX = frame_scale;
				frame.scaleY = frame_scale;
			}
			
			if (positioningedit_radio_beerImage.selected == true) {
				beer_image_scale = beer_image_scale - .05;
				beer_image.scaleX = beer_image_scale;
				beer_image.scaleY = beer_image_scale;
			}	
			
			if (positioningedit_radio_twitterbird.selected == true) {
				twitterbird_image_scale = twitterbird_image_scale - .05;
				twitterbird_image.scaleX = twitterbird_image_scale;
				twitterbird_image.scaleY = twitterbird_image_scale;
			}	
			
			if (positioningedit_radio_lipsync.selected == true) {
				lip1_scale = lip1_scale - .05;
				lip1.scaleX = lip1_scale;
				lip1.scaleY = lip1_scale;
			}	
			
			if (positioningedit_radio_webcamvideo.selected == true) {
				webcamvideo_scale = webcamvideo_scale - .05;
				webcamvideo.scaleX = webcamvideo_scale;
				webcamvideo.scaleY = webcamvideo_scale;
			}	
			
			if (positioningedit_radio_AlcoholResults.selected == true) {
				alcohol_results_text_fontsize = alcohol_results_text_fontsize - 2;
				AlcoholResultsFormat.size = alcohol_results_text_fontsize; 
				AlcoholResults.setTextFormat(AlcoholResultsFormat);
			}	
			
		 }
		 
		  if (editing_mode == "doorcam") {
			if  (doorcamedit_radio_character.selected == true) {  //character
				doorcam_video_scale = doorcam_video_scale - .05;
				myVid2.setScale(doorcam_video_scale,doorcam_video_scale);
				//myVid2.scaleX = doorcam_video_scale;
				//myVid2.scaleY = doorcam_video_scale;				
				//output.text = ("x: " + myVid2.x + " y: " + myVid2.y + " Scale " + myVid2.scaleX);				
			}
			
			if (doorcamedit_radio_doorcam.selected == true) {  // ip cam feed
				doorcam_scale = doorcam_scale - .05;
				//doorcam.setScale(doorcam_scale,doorcam_scale);
				doorcam.scaleX = doorcam_scale;
				doorcam.scaleY = doorcam_scale;		
				doorcamMaskingShape.scaleX = doorcam_scale;
				doorcamMaskingShape.scaleY = doorcam_scale;		
			}
			
			if (doorcamedit_radio_thoughts.selected == true) {
				thoughts_image_scale = thoughts_image_scale - .05;
				thoughts_image.scaleX = thoughts_image_scale;
				thoughts_image.scaleY = thoughts_image_scale;
			}			
		 }
		 
		 if (editing_mode == "picasa") { 	
			new_picture_scaling = picture_scale - .05;		
			pic.scaleX = new_picture_scaling;
			pic.scaleY = new_picture_scaling;				
			picture_scale =  new_picture_scaling;		
		 }		 
	 }	
	
	private function doorcamedit_rbg_event(e:Event):void {
		if (doorcamedit_radio_doorcam.selected == true) {  // ip cam feed
			myVid_bigger.enabled = false;
			myVid_smaller.enabled = false;
		}
		else {
			myVid_bigger.enabled = true;
			myVid_smaller.enabled = true;			
		}		
	}
	
	
	
	function CharacterChanged(event:Event):void {    
		index_selected = mirror_mode_input.selectedIndex;
		
		switch (index_selected)  //sets the video playlists based on the mode
				{
				case 0: 					
					URLModeString = homepath + "images/princess_sm.jpg";									
					ModeThumb.source = URLModeString;
					mode_select = "princess";
					switch_mode();
					break;
				case 1: 
					URLModeString = homepath + "images/pirate_sm.jpg";				
					ModeThumb.source = URLModeString;
					mode_select = "pirate";
					switch_mode();
					break;
				case 2: 
					URLModeString = homepath + "images/halloween_sm.jpg";	
					ModeThumb.source = URLModeString;
					mode_select = "halloween";
					switch_mode();
					break;
				case 3: 
					URLModeString = homepath + "images/insult_sm.jpg";	
					ModeThumb.source = URLModeString;
					mode_select = "insult";
					switch_mode();
					break;	
				case 4: 
					URLModeString = homepath + "images/princess_sm.jpg";	
					ModeThumb.source = URLModeString;
					mode_select = "tts_mode";
					switch_mode();
					break;		
				}
	}
	
	function FrameChanged(event:Event):void {    
		selected_frame_index = frame_input.selectedIndex;
		switch (selected_frame_index)  //sets the video playlists based on the mode
				{
				case 0: 			
					frame_input.selectedIndex = 0;
					frame_selected = myXML.frame_path[0];
					 Frame_Loader.load(new URLRequest("file:///" + homepath + frame_selected));
					break;
				case 1:
					frame_input.selectedIndex = 1;
					frame_selected = myXML.frame_path[1];
					 Frame_Loader.load(new URLRequest("file:///" + homepath + frame_selected));
					break;
				case 2: 
					frame_input.selectedIndex = 2;
					frame_selected = myXML.frame_path[2];
					 Frame_Loader.load(new URLRequest("file:///" + homepath + frame_selected));
					break;
				case 3: 
					frame_input.selectedIndex = 3;
					frame_selected = myXML.frame_path[3];
					 Frame_Loader.load(new URLRequest("file:///" + homepath + frame_selected));
					break;	
				case 4: 
					frame_input.selectedIndex = 4;
					frame_selected = myXML.frame_path[4];
					 Frame_Loader.load(new URLRequest("file:///" + homepath + frame_selected));
					break;	
				case 5: 
					frame_input.selectedIndex = 5;
					frame_selected = myXML.frame_path[5];
					Frame_Loader.load(new URLRequest("file:///" + homepath + frame_selected));
					break;	
				}				
	}
	
	private function myVidChanged(): void { //this funtion is called when myVid coordinates are changed
		myVid.setScale(video_scaling_factor,video_scaling_factor);
		myVid.rotation = video_rotation;
		myVid.x = x_position;
		myVid.y = y_position;
		
		
	}
	
	function DisplayModeChanged(event:Event):void {    
		mode_selected = display_mode_input.selectedIndex;
		ScreenOrientationFlag = 1; 
		
		switch (mode_selected)  //sets the video playlists based on the mode
				{
				case 0: 	//normal
					
					idle_radio_on.selected = true; //turn stealth off
					frame_radio_off.selected = true;
					webcamvideo_radio_off.selected = true;			
				
					if (screenMode_radio_l0.selected == true) { //default portrait mode						
						video_scaling_factor = 2.25;
						x_position= 140;
						y_position= 710;
						video_rotation = 270;	
						myVidChanged();
						
					}
					
					if (screenMode_radio_p270.selected == true) { 
						video_scaling_factor = 2.6;
						x_position = 920;
						y_position = 760;
						video_rotation = 180;
						myVidChanged();
						
														
					}
						
					if (screenMode_radio_p90.selected == true) { //default landscape mode
						video_scaling_factor = 2.6;
						x_position = 110;
						y_position = -20;
						video_rotation = 0;
						myVidChanged();
							
					}
					
					if (screenMode_radio_l180.selected == true) { 
						video_scaling_factor = 2.25;
						x_position = 890;
						y_position = -10;
						video_rotation = 90;
						myVidChanged();
							
					}					
					break;
					
				case 1:     //normal + frame
				
					idle_radio_on.selected = true; //turn stealth off
					frame_radio_on.selected = true;
					webcamvideo_radio_off.selected = true;
					
					if (screenMode_radio_l0.selected == true) { //default portrait mode						
						      
								webcam_width = 320; //webcam is created dynamically so we're ok to just set the params
								webcam_height = 380;
								webcamvideo_x = 340;
								webcamvideo_y = 190;
								webcamvideo_rotation = 0;
								webcamvideo_scale = 1.4;
								
								frame_x = 258;								
								frame_y = 43;								
								frame_rotation =0;								
								frame_scale = 1.1;								
								frame.x = 258;
								frame.y = 43;
								frame.rotation = 0;
								frame.scaleX = 1.1;
								frame.scaleY = 1.1;
								
								x_position = 270;
								y_position = 610;
								video_rotation = 270;
								video_scaling_factor = 1.5;
								myVidChanged(); //call this to change on the screen
								
								lip1_x = 422;
								lip1_y = 412;
								lip1_rotation = 0;
								lip1_scale = 1;
								
						}
						
						if (screenMode_radio_p270.selected == true) { 
										
								webcam_width = 320;
								webcam_height = 380;
								webcamvideo_x = 340;
								webcamvideo_y = 190;
								webcamvideo_rotation = 270;
								webcamvideo_scale = 1.4;
								
								frame_x = 258;
								frame_y = 43;
								frame_rotation = 270;
								frame_scale = 1.1; 
								frame.x = 258;
								frame.y = 43;
								frame.rotation = 270;
								frame.scaleX = 1.1;
								frame.scaleY = 1.1;
								
								lip1_x = 574;
								lip1_y = 438;
								lip1_rotation = 270;
								lip1_scale = 1.2000000000000002;
							
						}
							
						if (screenMode_radio_p90.selected == true) { //default landscape mode
							
								webcam_width = 320;
								webcam_height = 380;
								webcamvideo_x = 710;
								webcamvideo_y = 183;
								webcamvideo_rotation = 90;
								webcamvideo_scale = 1.5;
								
								frame_x = 875;
								frame_y = 83;
								frame_rotation =90;
								frame_scale = 1.2;
								frame.x = 875;
								frame.y = 83;
								frame.rotation = 90;
								frame.scaleX = 1.2;
								frame.scaleY = 1.2;
								
								lip1_x = 457;
								lip1_y = 303;
								lip1_rotation = 90;
								lip1_scale = 1.2000000000000002;		
						}
						
						if (screenMode_radio_l180.selected == true) { 
							
								webcam_width = 320;
								webcam_height = 380;
								webcamvideo_x = 690;
								webcamvideo_y = 550;
								webcamvideo_rotation = 180;
								webcamvideo_scale = 1.35;
								
								frame_x = 781;
								frame_y = 700;
								frame_rotation = 180;
								frame_scale = 1.1; 	
								frame.x = 781;
								frame.y = 700;
								frame.rotation = 180;
								frame.scaleX = 1.1;
								frame.scaleY = 1.1;
								
								lip1_x = 612;
								lip1_y = 289;
								lip1_rotation = 180;
								lip1_scale = 1.05;
			
						}
					
					break;
				case 2:     //normal + frame + webcam facial recognition
						
						idle_radio_on.selected = true; //turn stealth off						
						frame_radio_on.selected = true;
						webcamvideo_radio_on.selected = true;
						
						if (screenMode_radio_l0.selected == true) { //default portrait mode						
							
								webcam_width = 320;
								webcam_height = 380;
								webcamvideo_x = 340;
								webcamvideo_y = 190;
								webcamvideo_rotation = 0;
								webcamvideo_scale = 1.4;
								
								frame_x = 258;
								frame_y = 43;
								frame_rotation =0;
								frame_scale = 1.1; 		
								frame.x = 258;
								frame.y = 43;
								frame.rotation = 0;
								frame.scaleX = 1.1;
								frame.scaleY = 1.1;
								
								lip1_x = 422;
								lip1_y = 412;
								lip1_rotation = 0;
								lip1_scale = 1;

						}
						
						if (screenMode_radio_p270.selected == true) { 										
								
								webcam_width = 320;
								webcam_height = 380;
								webcamvideo_x = 340;
								webcamvideo_y = 190;
								webcamvideo_rotation = 270;
								webcamvideo_scale = 1.4;
								
								frame_x = 258;
								frame_y = 43;
								frame_rotation = 270;
								frame_scale = 1.1; 
								frame.x = 258;
								frame.y = 43;
								frame.rotation = 270;
								frame.scaleX = 1.1;
								frame.scaleY = 1.1;
								
								lip1_x = 574;
								lip1_y = 438;
								lip1_rotation = 270;
								lip1_scale = 1.2000000000000002;
							
						}
							
						if (screenMode_radio_p90.selected == true) { //default landscape mode							
								
								webcam_width = 320;
								webcam_height = 380;
								webcamvideo_x = 710;
								webcamvideo_y = 183;
								webcamvideo_rotation = 90;
								webcamvideo_scale = 1.5;
								
								frame_x = 875;
								frame_y = 83;
								frame_rotation =90;
								frame_scale = 1.2; 
								frame.x = 875;
								frame.y = 83;
								frame.rotation = 90;
								frame.scaleX = 1.2;
								frame.scaleY = 1.2;
								
								lip1_x = 457;
								lip1_y = 303;
								lip1_rotation = 90;
								lip1_scale = 1.2000000000000002;	
								
						}
						
						if (screenMode_radio_l180.selected == true) { 
							
								webcam_width = 320;
								webcam_height = 380;
								webcamvideo_x = 690;
								webcamvideo_y = 550;
								webcamvideo_rotation = 180;
								webcamvideo_scale = 1.35;
								
								frame_x = 781;
								frame_y = 700;
								frame_rotation = 180;
								frame_scale = 1.1; 	
								frame.x = 781;
								frame.y = 700;
								frame.rotation = 180;
								frame.scaleX = 1.1;
								frame.scaleY = 1.1;
								
								lip1_x = 612;
								lip1_y = 289;
								lip1_rotation = 180;
								lip1_scale = 1.05;
						}
					
					break;
				case 3:     //normal + webcam facial recognition in frame
						idle_radio_on.selected = true; //turn stealth off						
						frame_radio_on.selected = true;
						webcamvideo_radio_on.selected = true;
						
						if (screenMode_radio_l0.selected == true) { //default portrait mode
										
								webcam_width = 160;
								webcam_height = 190;
								webcamvideo_x = 810;
								webcamvideo_y = 100;		
								webcamvideo_rotation = 0;		
								webcamvideo_scale = 1.1;		
								
								frame_x = 776;
								frame_y = 40;		
								frame_rotation = 0;		
								frame_scale = .44;							
								frame.x = 776;
								frame.y = 40;
								frame.rotation = 0;
								frame.scaleX = .44;
								frame.scaleY = .44;
								
								lip1_x = 422;
								lip1_y = 412;
								lip1_rotation = 0;
								lip1_scale = 1;

						}
						
						if (screenMode_radio_p270.selected == true) { 
								
								webcam_width = 160;
								webcam_height = 190; //need to save
								webcamvideo_x = 970;
								webcamvideo_y = 438;		
								webcamvideo_rotation = 270;		
								webcamvideo_scale = 1.1;		
								
								frame_x = 1018;
								frame_y = 456;		
								frame_rotation = 270;		
								frame_scale = .60;
								frame.x = 1018;
								frame.y = 456;
								frame.rotation = 270;
								frame.scaleX = .60;
								frame.scaleY = .60;
								
								lip1_x = 574;
								lip1_y = 438;
								lip1_rotation = 270;
								lip1_scale = 1.2000000000000002;
						}
			
						if (screenMode_radio_p90.selected == true) { //default landscape mode
							
								webcam_width = 160;
								webcam_height = 190; //need to save
								webcamvideo_x = 970;
								webcamvideo_y = 438;		
								webcamvideo_rotation = 90;		
								webcamvideo_scale = 1.1;		
								
								frame_x = 1018;
								frame_y = 456;		
								frame_rotation = 90;		
								frame_scale = .60;
								frame.x = 1018;
								frame.y = 456;
								frame.rotation = 90;
								frame.scaleX = .60;
								frame.scaleY = .60;
								
								lip1_x = 457;
								lip1_y = 303;
								lip1_rotation = 90;
								lip1_scale = 1.2000000000000002;
						}
						
						if (screenMode_radio_l180.selected == true) { 							
															
								webcam_width = 160;
								webcam_height = 190; //need to save
								webcamvideo_x = 324;
								webcamvideo_y = 637;		
								webcamvideo_rotation = 180;		
								webcamvideo_scale = 1.1;				
								
								frame_x = 290;
								frame_y = 580;		
								frame_rotation = 180;		
								frame_scale = .60;
								frame.x = 290;
								frame.y = 580;
								frame.rotation = 180;
								frame.scaleX = .60;
								frame.scaleY = .60;
								
								lip1_x = 612;
								lip1_y = 289;
								lip1_rotation = 180;
								lip1_scale = 1.05;

						}
					
					break;	
				case 4:     //stealth
					idle_radio_off.selected = true; //turn stealth on						
					frame_radio_off.selected = true;
					webcamvideo_radio_off.selected = true;
					
					break;	
				case 5:     //stealth + frame + webcam facial recognition
						idle_radio_off.selected = true; //turn stealth on						
						frame_radio_on.selected = true;
						webcamvideo_radio_on.selected = true;
							
							if (screenMode_radio_l0.selected == true) { //default portrait mode						
							
								idle_radio_off.selected = true; //turn stealth on
								webcam_width = 320;
								webcam_height = 380;
								webcamvideo_x = 340;
								webcamvideo_y = 190;
								webcamvideo_rotation = 0;
								webcamvideo_scale = 1.4;
								
								frame_x = 258;
								frame_y = 43;
								frame_rotation =0;
								frame_scale = 1.1;
								frame.x = 258;
								frame.y = 43;
								frame.rotation = 0;
								frame.scaleX = 1.1;
								frame.scaleY = 1.1;
								
								lip1_x = 422;
								lip1_y = 412;
								lip1_rotation = 0;
								lip1_scale = 1;
						}
						
						if (screenMode_radio_p270.selected == true) { 
										
								webcam_width = 320;
								webcam_height = 380;
								webcamvideo_x = 340;
								webcamvideo_y = 190;
								webcamvideo_rotation = 270;
								webcamvideo_scale = 1.4;
								
								frame_x = 258;
								frame_y = 43;
								frame_rotation = 270;
								frame_scale = 1.1;
								frame.x = 258;
								frame.y = 43;
								frame.rotation = 270;
								frame.scaleX = 1.1;
								frame.scaleY = 1.1;
								
								lip1_x = 574;
								lip1_y = 438;
								lip1_rotation = 270;
								lip1_scale = 1.2000000000000002;
							
						}
							
						if (screenMode_radio_p90.selected == true) { //default landscape mode
							
								webcam_width = 320;
								webcam_height = 380;
								webcamvideo_x = 710;
								webcamvideo_y = 183;
								webcamvideo_rotation = 90;
								webcamvideo_scale = 1.5;
								
								frame_x = 875;
								frame_y = 83;
								frame_rotation =90;
								frame_scale = 1.2;
								frame.x = 875;
								frame.y = 83;
								frame.rotation = 90;
								frame.scaleX = 1.2;
								frame.scaleY = 1.2;
								
								lip1_x = 457;
								lip1_y = 303;
								lip1_rotation = 90;
								lip1_scale = 1.2000000000000002;
						}
						
						if (screenMode_radio_l180.selected == true) { 
							
								webcam_width = 320;
								webcam_height = 380;
								webcamvideo_x = 690;
								webcamvideo_y = 550;
								webcamvideo_rotation = 180;
								webcamvideo_scale = 1.35;
								
								frame_x = 781;
								frame_y = 700;
								frame_rotation = 180;
								frame_scale = 1.1; 
								frame.x = 781;
								frame.y = 700;
								frame.rotation = 180;
								frame.scaleX = 1.1;
								frame.scaleY = 1.1;
								
								lip1_x = 612;
								lip1_y = 289;
								lip1_rotation = 180;
								lip1_scale = 1.05;
						}
					
					
					break;		
				}
	}
	
	private function webcamStealthCheckChanged(event:Event):void {   
	
	    
		
		if (screenMode_radio_l0.selected == true) { //default portrait mode
						
			if (webcamStealthCheck.selected == true)  {  //webcam in the front and big
				idle_radio_off.selected = true;
				webcam_width = 320;
				webcam_height = 380;
				webcamvideo_x = 340;
				webcamvideo_y = 190;
				webcamvideo_rotation = 0;
				webcamvideo_scale = 1.4;
				
				frame_x = 258;
				frame_y = 43;
				frame_rotation =0;
				frame_scale = 1.1; 
			}
			else {			
				idle_radio_on.selected = true; //webcam to the side and smaller				
				webcam_width = 160;
				webcam_height = 190;
				webcamvideo_x = 810;
				webcamvideo_y = 100;		
				webcamvideo_rotation = 0;		
				webcamvideo_scale = 1.1;		
				
				frame_x = 776;
				frame_y = 40;		
				frame_rotation = 0;		
				frame_scale = .44;				
			}
		}
		
		if (screenMode_radio_p270.selected == true) { 
						
			if (webcamStealthCheck.selected == true)  {  
				idle_radio_off.selected = true;
				webcam_width = 320;
				webcam_height = 380;
				webcamvideo_x = 340;
				webcamvideo_y = 190;
				webcamvideo_rotation = 270;
				webcamvideo_scale = 1.4;
				
				frame_x = 258;
				frame_y = 43;
				frame_rotation = 270;
				frame_scale = 1.1; 
			}
			else {			
				idle_radio_on.selected = true; //set it back to how it was
				webcam_width = 160;
				webcam_height = 190; //need to save
				webcamvideo_x = 970;
				webcamvideo_y = 438;		
				webcamvideo_rotation = 270;		
				webcamvideo_scale = 1.1;		
				
				frame_x = 1018;
				frame_y = 456;		
				frame_rotation = 270;		
				frame_scale = .60;				
				
			}
			
		}
			
		if (screenMode_radio_p90.selected == true) { //default landscape mode
			if (webcamStealthCheck.selected == true)  {  //it's on to enable and keep things on
				idle_radio_off.selected = true;
				webcam_width = 320;
				webcam_height = 380;
				webcamvideo_x = 710;
				webcamvideo_y = 183;
				webcamvideo_rotation = 90;
				webcamvideo_scale = 1.5;
				
				frame_x = 875;
				frame_y = 83;
				frame_rotation =90;
				frame_scale = 1.2; 
			}
			else {			
				idle_radio_on.selected = true; //set it back to how it was
				webcam_width = 160;
				webcam_height = 190; //need to save
				webcamvideo_x = 970;
				webcamvideo_y = 438;		
				webcamvideo_rotation = 90;		
				webcamvideo_scale = 1.1;		
				
				frame_x = 1018;
				frame_y = 456;		
				frame_rotation = 90;		
				frame_scale = .60;				
			}
		}
		
		if (screenMode_radio_l180.selected == true) { 
			if (webcamStealthCheck.selected == true)  {  //it's on to enable and keep things on
				idle_radio_off.selected = true;
				webcam_width = 320;
				webcam_height = 380;
				webcamvideo_x = 690;
				webcamvideo_y = 550;
				webcamvideo_rotation = 180;
				webcamvideo_scale = 1.35;
				
				frame_x = 781;
				frame_y = 700;
				frame_rotation = 180;
				frame_scale = 1.1; 				
			}
			else {			
				idle_radio_on.selected = true; //set it back to how it was
				webcam_width = 160;
				webcam_height = 190; //need to save
				webcamvideo_x = 324;
				webcamvideo_y = 637;		
				webcamvideo_rotation = 180;		
				webcamvideo_scale = 1.1;				
				
				frame_x = 290;
				frame_y = 580;		
				frame_rotation = 180;		
				frame_scale = .60;				
				
			}
			
		}
	}
	
	//private function webcamvideoChanged(event:Event):void {  //if webcam is off, then also need to turn off the webcam frame and grey it out  	
		
		//if (webcamvideo_radio_on.selected == true)  {  //it's on to enable and keep things on
			//frame_radio_on.selected = true;
			//frame_radio_off.enabled = true;
			//frame_radio_on.enabled = true;		
		//}
		//else {			
			//frame_radio_off.selected = true;
			//frame_radio_off.enabled = false;
			//frame_radio_on.enabled = false;
		//}
		
	//}
	
	private function TwitterModeChanged(event:Event):void {    
		if (twitter_mode_radio_user.selected == true)  {  //we're in twitter user mode so grey out the search stuff
			twitter_search_term_input.enabled = false;
			do_not_speak_twitter_search_term_checkbox.enabled = false;
			//twitter_username_input.enabled = true;
			twitter_password_input.enabled = true;
			//twitter_frequency_input.enabled = true;
			only_my_tweets_checkbox.enabled = true;
		}
		
		if (twitter_mode_radio_mentions.selected == true)  {  //we're in mentions mode
			twitter_search_term_input.enabled = false;
			do_not_speak_twitter_search_term_checkbox.enabled = false;
			twitter_password_input.enabled = false;
			only_my_tweets_checkbox.enabled = false;
		}
		
		if (twitter_mode_radio_search.selected == true)  {  //we're in mentions mode
			twitter_username_input.enabled = false;  //we're in search mode
			twitter_password_input.enabled = false;
			only_my_tweets_checkbox.enabled = false;
			twitter_search_term_input.enabled = true;
			do_not_speak_twitter_search_term_checkbox.enabled = true;
		}
	}
	
	private function TTSEngineChanged(event:Event):void {    
		
		/*first we need to remove all the items
		secondly add them back
		third make the default selection based on the XML settings*/
		
		//step 1 - clear all values
		TTS_languages_dropdown.removeAll();
		
		//step 2 and 3 - add all items based on which radio button is picked
		if (tts_engine_voicerss.selected == true) {
			
			populateVoiceRSSLanguageDropdown();  //put these into a function as we need to call from other places too so it will make maintenance easier if these ever change
			setVoiceRSSDropDownfromXML();
			trace("Voice RSS radio button changed");
		}
		else {
			populateYakitomeLanguageDropdown();
			setYakitomeDropDownfromXML();
			trace("Yakimote radio button changed");
		}
		
	}	
	
	
	private function PositioningRadioChanged(event:Event):void {    
		if (positioningedit_radio_lipsync.selected == true) {  //then in lipsync mode so show the lips and idle lipsync video			
			
			myVid.play("file:///"+lipsync_clip);	
			lip1.visible = true;
		}
		
		else {			
			
			myVid.play("file:///"+idle_clip);			
			lip1.visible = false;
		}		
	}
	
	
	private function Analog1Changed(event:Event):void {    
		if (analog1_radio_on.selected == true) {  //if touch1 is on, then let enable this check box
			analog1_video1_check.enabled = true;
		}
		else {analog1_video1_check.enabled = false;
		}		
	}
	
	private function Analog2Changed(event:Event):void {    
		if (analog2_radio_on.selected == true) {  //if touch2 is on, then let enable this check box
			analog2_video2_check.enabled = true;
		}
		else {analog2_video2_check.enabled = false;
		}		
	}
	
	private function Analog3Changed(event:Event):void {    
		if (analog3_radio_on.selected == true) {  //if touch3 is on, then let enable this check box
			analog3_prox.enabled = true;
			analog3_video3_check.enabled = true;
		}
		else {analog3_prox.enabled = false;
			  analog3_video3_check.enabled = false;
		}		
	}
	
	private function Digital1Changed(event:Event):void {    
		if (switch1_radio_on.selected == true) {  //if touch3 is on, then let enable this check box
			digital1_prox.enabled = true;
		}
		else {digital1_prox.enabled = false;
		}		
	}
	
	private function Digital2Changed(event:Event):void {    
		if (switch2_radio_on.selected == true) {  //if touch3 is on, then let enable this check box
			digital2_video1_check.enabled = true;
		}
		else {digital2_video1_check.enabled = false;
		}		
	}
	
	private function Digital3Changed(event:Event):void {    
		if (switch3_radio_on.selected == true) {  //if touch3 is on, then let enable this check box
			digital3_video2_check.enabled = true;
		}
		else {digital3_video2_check.enabled = false;
		}		
	}
	
	private function Digital4Changed(event:Event):void {    
		if (switch4_radio_on.selected == true) {  //if touch3 is on, then let enable this check box
			picasa_instead_check.enabled = true;
			display_mode_input.selectedIndex = 0; 
			webcamvideo_radio_off.selected = true;
		}
		else {picasa_instead_check.enabled = false;
		}		
	}
	
	private function Digital5Changed(event:Event):void {    
		if (switch5_radio_on.selected == true) {  //if touch3 is on, then let enable this check box
			digital5_video3_check.enabled = true;
		}
		else {digital5_video3_check.enabled = false;
		}		
	}
	
	private function QuizModeCheckChanged(event:Event):void {    
		if (quiz_mode_check.selected == true) {  //if touch3 is on, then let enable this check box
			switch1_radio_on.selected = true;
			switch2_radio_on.selected = true;
			switch3_radio_on.selected = true;
			switch5_radio_on.selected = true;
			digital1_prox.selected = true;
			digital2_video1_check.selected = true;
			digital3_video2_check.selected = true;
			digital5_video3_check.selected = true;
			prox2beforeprox1_radio_off.selected = true;
			analog0_radio_on.selected = true;
			no_resize_check.selected = true;
			video_interrupts_check.selected = true;
		}
		else {
			digital1_prox.selected = false;
			digital2_video1_check.selected = false;
			digital3_video2_check.selected = false;
			digital5_video3_check.selected = false;
			no_resize_check.selected = false;
			prox2beforeprox1_radio_on.selected = true;
		}
		
	}
	
	private function photoboothProofPreview_checkChanged(event:Event):void {    
		if (photoboothProofPreview_check.selected == false) {  //if touch3 is on, then let enable this check box
			photobooth_ProofPreviewDuration_slider.enabled = false;
			photobooth_ProofPreviewDuration_label.enabled = false;
		}
		else {
			photobooth_ProofPreviewDuration_slider.enabled = true;
			photobooth_ProofPreviewDuration_label.enabled = true;
		}		
	}
	
	private function photobooth_printing_checkChanged(event:Event):void {    
		if (photobooth_printing_check.selected == false) {  //if touch3 is on, then let enable this check box
			photobooth_PaperSize_dropdown.enabled = false;
			photobooth_promptprint_check.enabled = false;
			photobooth_PrintCopies_slider.enabled = false;
		}
		else {
			photobooth_PaperSize_dropdown.enabled = true;
			photobooth_promptprint_check.enabled = true;
			photobooth_PrintCopies_slider.enabled = true;
		}		
	}
	
	private function NoResizeCheckChanged(event:Event):void {    
		if (no_resize_check.selected == true) {  //if touch3 is on, then let enable this check box
			screenMode_radio_p90.enabled = false;
			screenMode_radio_p270.enabled = false;
			screenMode_radio_l0.enabled = false;
			screenMode_radio_l180.enabled = false;
		}
		else {
			screenMode_radio_p90.enabled = true;
			screenMode_radio_p270.enabled = true;
			screenMode_radio_l0.enabled = true;
			screenMode_radio_l180.enabled = true;
		}
		
	}	
	
	private function ModeChanged(event:Event):void {    
		index_selected = mirror_mode_input.selectedIndex;
		
		switch (index_selected)  //sets the video playlists based on the mode
				{
				case 0: 								
					mode_select = "princess";
					switch_mode();
					break;
				case 1: 
					mode_select = "pirate";
					switch_mode();
					break;
				case 2: 
					mode_select = "halloween";
					switch_mode();
					break;
				case 3: 
					mode_select = "insult";
					switch_mode();
					break;	
				case 4: 
					mode_select = "tts_mode";
					switch_mode();
					break;		
					
				}
	}
	
	
	private function weathertext_checkEvent(event:MouseEvent):void { 
		 if (weathertext_check.selected == false) {
			weather_display2.visible = false;			
			weather_readout_radio_off.selected = true;
		 }
		 else {
			weather_display2.visible = true;
			weather_readout_radio_on.selected = true;
			
		}
	}
	
	private function weathergraphic_checkEvent(event:MouseEvent):void { 
		if (weathergraphic_check.selected == false) {
			weather_image.visible = false;
			weather_graphic_radio_off.selected = true;
			
		}
		else {
			weather_image.visible = true;
			weather_graphic_radio_on.selected = true;
		}
	}
	
	private function webcamgraphic_checkEvent(event:MouseEvent):void { 
		if (webcamgraphic_check.selected == false) {
			frame.visible = false;
			frame_radio_off.selected = true;
			
		}
		else {
			frame.visible = true;
			frame_radio_on.selected = true;
		}
	}
	
	private function webcamvideo_checkEvent(event:MouseEvent):void { 
		if (webcamvideo_check.selected == false) {
			//unload the webcam
			if (webcamfound == 1) {		
				try {            
					  if (stage.contains(webcamvideo)) {
						removeChild(webcamvideo);					
					}
				 }
					catch (e:Error) {      
					output.text = "Could not unload webcam";
				}			
			webcamfound = 0; //reset the flag, it will be set again once the _setupwebcam function is called
		}
			//webcamvideo.visible = false;
			//webcamvideo_radio_off.selected = true;
			
		}
		else { //load the webcam
			   if (webcamvideo_radio_on.selected == true) {
					_setupCamera();					
					if (webcamfound == 1) {
						webcamvideo_check.selected = true;
						setChildIndex(webcamvideo,getChildIndex(frame));	
						//setChildIndex(frame,getChildIndex(webcamvideo));
						webcamvideo.visible = true;
					}					
				}
				else {
					webcamvideo_check.selected = false;
				}
			//webcamvideo.visible = true;
			//webcamvideo_radio_on.selected = true;
		}
	}
	
	private function AlcoholResults_checkEvent(event:MouseEvent):void { 
		 if (AlcoholResults_check.selected == false) {
			AlcoholResults.visible = false;			
			AlcoholResults_readout_radio_off.selected = true;
		 }
		 else {
			AlcoholResults.visible = true;
			AlcoholResults_readout_radio_on.selected = true;
			
		}
	}
	
	private function stocktext_checkEvent(event:MouseEvent):void { 
		if (stocktext_check.selected == false) {
			stock_display.visible = false;
			stock_readout_radio_off.selected = true;
		}
		else {
			stock_display.visible = true;		
			stock_readout_radio_on.selected = true;
			
		}			
	}
	
	
	  
	//  WeatherdynImage.addEventListener(MouseEvent.MOUSE_DOWN, pickupWeatherImage);
	  //WeatherdynImage.addEventListener(MouseEvent.MOUSE_UP, placeWeatherImage);
	  
	  //Weatherdyntext.addEventListener(MouseEvent.MOUSE_DOWN, pickupWeatherText);
	  //Weatherdyntext.addEventListener(MouseEvent.MOUSE_UP, placeWeatherText);
	
	private function pickupStockText(event:MouseEvent):void {
			// Save the original location so you can put the target back			
			  startingLocation = new Point();
			  startingLocation.x = event.target.x;
			  startingLocation.y = event.target.y;			 
			  event.target.startDrag();
			  event.target.filters = [ new DropShadowFilter() ];
			  setChildIndex( DisplayObject( event.target ), numChildren - 1 );
	}
		
	private function placeStockText(event:MouseEvent):void {		 
		 event.target.stopDrag();
		 event.target.filters = null;			 
		 stock_text_x = stock_text_x_original + event.target.x;
		 stock_text_y = stock_text_y_original + event.target.y;
	}
	
	private function pickupAlcoholResultsText(event:MouseEvent):void {
			// Save the original location so you can put the target back			
			  startingLocation = new Point();
			  startingLocation.x = event.target.x;
			  startingLocation.y = event.target.y;			 
			  event.target.startDrag();
			  event.target.filters = [ new DropShadowFilter() ];
			  setChildIndex( DisplayObject( event.target ), numChildren - 1 );
	}
		
	private function placeAlcoholResultsText(event:MouseEvent):void {		 
		 event.target.stopDrag();
		 event.target.filters = null;			 
		 alcohol_results_text_x = alcohol_results_text_x_original + event.target.x;
		 alcohol_results_text_y = alcohol_results_text_y_original + event.target.y;
	}
	
	private function pickupWeatherText(event:MouseEvent):void {
			// Save the original location so you can put the target back			
			  startingLocation = new Point();
			  startingLocation.x = event.target.x;
			  startingLocation.y = event.target.y;			 
			  event.target.startDrag();
			  event.target.filters = [ new DropShadowFilter() ];
			  setChildIndex( DisplayObject( event.target ), numChildren - 1 );
	}
		
	private function placeWeatherText(event:MouseEvent):void {		 
		 event.target.stopDrag();
		 event.target.filters = null;			 
		// output.text =  "x position after drag: " + event.target.x;
		 weather_text_x = weather_text_x_original + event.target.x;
		 weather_text_y = weather_text_y_original + event.target.y;
		// trace ("x change: " + event.target.x);
		// trace ("y change: " + event.target.y);
		// trace ("x position after drag: " + weather_text_x);
		// trace ("y position after drag: " + weather_text_y);
	}
	
	private function pickupWeatherImage(event:MouseEvent):void {
			// Save the original location so you can put the target back			
			  startingLocation = new Point();
			  startingLocation.x = event.target.x;
			  startingLocation.y = event.target.y;			 
			  event.target.startDrag();
			  event.target.filters = [ new DropShadowFilter() ];
			  setChildIndex( DisplayObject( event.target ), numChildren - 1 );
	}
		
	private function placeWeatherImage(event:MouseEvent):void {		 
		 event.target.stopDrag();
		 event.target.filters = null;			 
		 //output.text =  "x position after drag: " + event.target.x;
		 weather_image_x = weather_image_x_original + event.target.x;
		 weather_image_y = weather_image_y_original + event.target.y;
	}
	
	private function pickupBeerImage(event:MouseEvent):void {
			// Save the original location so you can put the target back			
			  startingLocation = new Point();
			  startingLocation.x = event.target.x;
			  startingLocation.y = event.target.y;			 
			  event.target.startDrag();
			  event.target.filters = [ new DropShadowFilter() ];
			  setChildIndex( DisplayObject( event.target ), numChildren - 1 );
	}
		
	private function placeBeerImage(event:MouseEvent):void {		 
		 event.target.stopDrag();
		 event.target.filters = null;			 
		 //output.text =  "x position after drag: " + event.target.x;
		 beer_image_x = beer_image_x_original + event.target.x;
		 beer_image_y = beer_image_y_original + event.target.y;
	}
	
	private function pickupTwitterBirdImage(event:MouseEvent):void {
			// Save the original location so you can put the target back			
			  startingLocation = new Point();
			  startingLocation.x = event.target.x;
			  startingLocation.y = event.target.y;			 
			  event.target.startDrag();
			  event.target.filters = [ new DropShadowFilter() ];
			  setChildIndex( DisplayObject( event.target ), numChildren - 1 );
	}
		
	private function placeTwitterBirdImage(event:MouseEvent):void {		 
		 event.target.stopDrag();
		 event.target.filters = null;			 
		 //output.text =  "x position after drag: " + event.target.x;
		 twitterbird_image_x = twitterbird_image_x_original + event.target.x;
		 twitterbird_image_y = twitterbird_image_y_original + event.target.y;
	}
	
	
	private function pickupWebcamImage(event:MouseEvent):void {
			// Save the original location so you can put the target back			
			  startingLocation = new Point();
			  startingLocation.x = event.target.x;
			  startingLocation.y = event.target.y;			 
			  event.target.startDrag();
			  event.target.filters = [ new DropShadowFilter() ];
			  setChildIndex( DisplayObject( event.target ), numChildren - 1 );
	}
		
	private function placeWebcamImage(event:MouseEvent):void {		 
		 event.target.stopDrag();
		 event.target.filters = null;			 
		 //output.text =  "x position after drag: " + event.target.x;
		 frame_x = frame_x_original + event.target.x;
		 frame_y = frame_y_original + event.target.y;
	}
	
	private function pickupLip1Image(event:MouseEvent):void {
			// Save the original location so you can put the target back			
			  startingLocation = new Point();
			  startingLocation.x = event.target.x;
			  startingLocation.y = event.target.y;			 
			  event.target.startDrag();
			  event.target.filters = [ new DropShadowFilter() ];
			  setChildIndex( DisplayObject( event.target ), numChildren - 1 );
	}
		
	private function placeLip1Image(event:MouseEvent):void {		 
		 event.target.stopDrag();
		 event.target.filters = null;			 
		 //output.text =  "x position after drag: " + event.target.x;
		 lip1_x = lip1_x_original + event.target.x;
		 lip1_y = lip1_y_original + event.target.y;
	}
	
	//private function pickup(event:MouseEvent):void {
			
			//  startingLocation = new Point();
			 // startingLocation.x = event.target.x;
			 // startingLocation.y = event.target.y;
			 // event.target.startDrag();
			 // event.target.filters = [ new DropShadowFilter() ];
			 // setChildIndex( DisplayObject( event.target ), numChildren - 1 );
	//}
		
	//private function place(event:MouseEvent):void {
		//  event.target.stopDrag();
		 // event.target.filters = null;	  	  
		 //trace (event.target);
	//}
	
	private function clear_stock(event:MouseEvent):void {
	  stock_list.text= "";
	  first_stock = 1;
	  temp_stock_array.length = 0; //clear the array	
	  var r:int = 0;
	  for each (var item:XML in myXML.stocks.symbol)
					{		
						delete myXML.stocks.symbol[1];
						trace (r + ": " + myXML.stocks.symbol[r]);
						r++;
					}	
	  //trace (myXML);					
					
	}
	
	private function add_stock(event:MouseEvent):void {
			if (enter_stock_input.text == "") {
				output2.text = "Please enter a stock symbol";
			}
			
			else {
				output2.text = "";
				stock_counter++; 
				if (first_stock == 1) {
					stock_list.appendText(enter_stock_input.text);
					enter_stock_input.text="";
					first_stock = 0;
				}
				else { 
					stock_list.appendText("+" + enter_stock_input.text);
					enter_stock_input.text="";
				}
			}
        }
	
	private function onHTTPStatus(evt : HTTPStatusEvent) : void
		{
		// if the status is 200 do nothing, it's ok
		if(evt.status <= 200) return;
		// but if it's a 404 response display a alert (the user, album, photo or whatever doesn't exists)
		if(evt.status == 404)
		{
		output.text = "Picasa/Google User Not Found";
		} else
		{
		// else this could be other error
		trace("other error " + evt.status)
		}
	}
	
	
	////////******************************************
	private function AlbumLoadError(evt : ErrorEvent):void {
    	output.text = "The Picasa Service is Unavailable";
	}
   
   
   private function AlbumChanged(event:Event):void {
    var cb:ComboBox = event.currentTarget as ComboBox;
	var item2:Object = cb.selectedItem;
    if (item2.data.id != "") {
		album_id.text = item2.data.id;
		URLString = item2.data.url;
		AlbumThumb.source = URLString;
		//if (picasa_id_input.text != "") {
				//var al : Object;
				//al = combo.selectedItem;
		album_name.text = item2.label;
		album_url.text = item2.data.url;		
		}
	}
   
   //private function RefreshAlbums(evt : PicasaDataEvent) : void  //google killed this api
	//{
	//	var drop : Object;	
	//	for(var a : int = 0; a < evt.data.entries.length; a++)
	//	{
	//		drop = evt.data.entries[a];
	//		combo.addItem (
	//			{
	//				label: drop.media.title, //summary
	//				data: {
	//					url: drop.media.content.url,
	//					//url: drop.media.thumbnails.url,
	//					id: drop.gphoto.id
	//					}
	//			});
	//	}		
	//	combo.addItem (
	//			{
	//				label: "--- Select Album ---", //summary
	//				data: {
	//					url: "",
	//					//url: drop.media.thumbnails.url,
	//					id: ""
	//					}
	//			});
	//	combo.sortItemsOn("label", "ASC"); 


	//}
   // 
   //private function RefreshAlbumsButtonClicked(event:MouseEvent) : void
	//{
	//	if (internet == 1) {		
	//		if (picasa_id_input.text != "") {
	//			combo.removeAll();  //remove the items in the list and then populate again
	//			google_id = picasa_id_input.text;
	//			var album_responder2 : PicasaResponder = service.albums.list(google_id);
	//			album_responder2.addEventListener(PicasaDataEvent.DATA, RefreshAlbums);			
	//			album_responder2.addEventListener(ErrorEvent.ERROR, AlbumLoadError);
	//			album_responder2.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHTTPStatus);
	//		}
	//		else {  output.text = "Please enter your Picasa/Google ID";			
	//		}	
	//	}
	//	
	//	else {
	//		AlertManager.createAlert(this, "You'll need Internet connectivity before you can select a Picasa Web Album");
	//	}
	//	
	//}
	//
	
	private function CreateConfig():void {
      				
		//var newXMLStr:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + myXML.toXMLString();
		
var newconfigXML:XML =
<mirror>
  <mirror_mode>princess</mirror_mode>
  <verbose>no</verbose>
  <screen_mode>landscape0</screen_mode>
  <display_mode_preset>0</display_mode_preset>
  <idle_videos>on</idle_videos>
  <video_resolution>high</video_resolution>
  <version>7.10</version>
  <digital_switches>on</digital_switches>
  <switch1>off</switch1>
  <switch2>off</switch2>
  <switch3>off</switch3>
  <switch4>off</switch4>
  <switch5>off</switch5>
  <switch6>off</switch6>
  <debounce>on</debounce>
  <debounce1>20</debounce1>
  <debounce2>200</debounce2>
  <digital2_video1>off</digital2_video1>
  <digital3_video2>off</digital3_video2>
  <digital5_video3>off</digital5_video3>
  <quiz_mode>off</quiz_mode>
  <quiz_correctanswer>0</quiz_correctanswer>
  <quiz_timer>120</quiz_timer>
  <video_interrupts>off</video_interrupts>
  <x10_commands>off</x10_commands>
  <x10_house1>A</x10_house1>
  <x10_house2>A</x10_house2>
  <x10_house3>C</x10_house3>
  <x10_house4>D</x10_house4>
  <x10_unit1>2</x10_unit1>
  <x10_unit2>4</x10_unit2>
  <x10_unit3>3</x10_unit3>
  <x10_unit4>4</x10_unit4>
  <x10_wait>1000</x10_wait>
  <x10_resends>3</x10_resends>
  <proximity_sensor_on>off</proximity_sensor_on>
  <analog_input1>off</analog_input1>
  <analog_input2>off</analog_input2>
  <analog_input3>off</analog_input3>
  <analog1_video1>off</analog1_video1>
  <analog2_video2>off</analog2_video2>
  <analog3_video3>off</analog3_video3>
  <analog3_prox>off</analog3_prox>
  <digital1_prox>off</digital1_prox>
  <hardware_mode_select>on</hardware_mode_select>
  <switch1_pin>2</switch1_pin>
  <switch2_pin>3</switch2_pin>
  <switch3_pin>4</switch3_pin>
  <switch4_pin>7</switch4_pin>
  <switch5_pin>5</switch5_pin>
  <switch6_pin>6</switch6_pin>
  <switch1_trigger>1</switch1_trigger>
  <switch2_trigger>1</switch2_trigger>
  <switch3_trigger>1</switch3_trigger>
  <switch4_trigger>0</switch4_trigger>
  <switch5_trigger>1</switch5_trigger>
  <switch6_trigger>1</switch6_trigger>
  <proximity_sensor_pin>0</proximity_sensor_pin>
  <analog_input1_pin>5</analog_input1_pin>
  <analog_input2_pin>2</analog_input2_pin>
  <analog_input3_pin>3</analog_input3_pin>
  <hardware_mode_select_pin>4</hardware_mode_select_pin>
  <alcohol_sensor>off</alcohol_sensor>
  <alcohol_no_switch>off</alcohol_no_switch>
  <alcohol_no_switch_interval>1000</alcohol_no_switch_interval>
  <alcohol_no_switch_trigger_delta>100</alcohol_no_switch_trigger_delta>
  <alcohol_sensor_pin>1</alcohol_sensor_pin>
  <alcohol_baseline>300</alcohol_baseline>
  <alcohol_baseline_difference_allowance>200</alcohol_baseline_difference_allowance>
  <alcohol_level1>300</alcohol_level1>
  <alcohol_level2>300</alcohol_level2>
  <alcohol_level3>500</alcohol_level3>
  <alcohol_countdown>5</alcohol_countdown>
  <alcohol_text_duration>6</alcohol_text_duration>
  <alcohol_display_value>off</alcohol_display_value>
  <beer_image_x>684</beer_image_x>
  <beer_image_y>87</beer_image_y>
  <beer_image_rotation>0</beer_image_rotation>
  <beer_image_scale>1</beer_image_scale>
  <beer_images_url>images/</beer_images_url>
  <twitterbird_image_x>166</twitterbird_image_x>
  <twitterbird_image_y>73</twitterbird_image_y>
  <twitterbird_image_rotate>0</twitterbird_image_rotate>
  <twitterbird_image_scale>0.35</twitterbird_image_scale>
  <twitterbird_images_url>images/</twitterbird_images_url>
  <proximity_sensor_trigger1_distance_lower>40</proximity_sensor_trigger1_distance_lower>
  <proximity_sensor_trigger1_distance_upper>46</proximity_sensor_trigger1_distance_upper>
  <proximity_sensor_trigger1_time>100</proximity_sensor_trigger1_time>
  <proximity_sensor_trigger2_distance_lower>20</proximity_sensor_trigger2_distance_lower>
  <proximity_sensor_trigger2_distance_upper>26</proximity_sensor_trigger2_distance_upper>
  <proximity_sensor_trigger2_time>100</proximity_sensor_trigger2_time>
  <proximity_sensor_trigger2_distance>18</proximity_sensor_trigger2_distance>
  <prox2_before_prox1>on</prox2_before_prox1>
  <stock_good_threshold>3</stock_good_threshold>
  <stock_bad_threshold>-1</stock_bad_threshold>
  <full_screen>no</full_screen>
  <no_resize>off</no_resize>
  <video_scaling_factor>2.25</video_scaling_factor>
  <x_position>140</x_position>
  <y_position>710</y_position>
  <video_rotation>270</video_rotation>
  <com_port>5333</com_port>
  <startup_delay>0</startup_delay>
  <find_arduino_delay>0</find_arduino_delay>
  <reg_code/>
  <weather_zip>97411</weather_zip>
  <weather_woeid>2488836</weather_woeid>
  <weather_reading>f</weather_reading>
  <weather_display>no</weather_display>
  <forecast_cutoff>11</forecast_cutoff>
  <good_weather_threshold>70</good_weather_threshold>
  <display_breathalyzer_text>on</display_breathalyzer_text>
  <display_stock_text>on</display_stock_text>
  <display_weather_text>on</display_weather_text>
  <display_weather_image>on</display_weather_image>
  <weather_images_url>images/</weather_images_url>
  <alcohol_results_text_x>488</alcohol_results_text_x>
  <alcohol_results_text_y>31</alcohol_results_text_y>
  <alcohol_results_text_fontsize>75</alcohol_results_text_fontsize>
  <alcohol_results_text_rotation>0</alcohol_results_text_rotation>
  <stock_text_x>643</stock_text_x>
  <stock_text_y>85</stock_text_y>
  <stock_text_fontsize>72</stock_text_fontsize>
  <stock_text_rotation>0</stock_text_rotation>
  <weather_text_x>530</weather_text_x>
  <weather_text_y>56.7</weather_text_y>
  <weather_text_fontsize>29</weather_text_fontsize>
  <weather_text_rotation>0</weather_text_rotation>
  <weather_image_x>184</weather_image_x>
  <weather_image_y>87</weather_image_y>
  <weather_image_rotation>0</weather_image_rotation>
  <weather_image_scale>1</weather_image_scale>
  <doorcam_on>off</doorcam_on>
  <doorcam_host>plazacam.studentaffairs.duke.edu</doorcam_host>
  <doorcam_path>/axis-cgi/mjpg/video.cgi</doorcam_path>
  <doorcam_make>1</doorcam_make>
  <doorcam_port>80</doorcam_port>
  <doorcam_x>500</doorcam_x>
  <doorcam_y>30</doorcam_y>
  <doorcam_rotate>0</doorcam_rotate>
  <doorcam_scale>0.45</doorcam_scale>
  <doorcam_username/>
  <doorcam_password/>
  <doorcam_width>640</doorcam_width>
  <doorcam_height>480</doorcam_height>
  <doorcam_timer>1500</doorcam_timer>
  <doorcam_video_x>280</doorcam_video_x>
  <doorcam_video_y>726</doorcam_video_y>
  <doorcam_video_scale>1.42</doorcam_video_scale>
  <webcam_on>off</webcam_on>
  <webcam_width>320</webcam_width>
  <webcam_height>380</webcam_height>
  <webcam_fps>24</webcam_fps>
  <faceDetectInterval>500</faceDetectInterval>
  <noFaceTimeout>500</noFaceTimeout>
  <faceDetectrectColor>0xff0000</faceDetectrectColor>
  <webcam_x>340</webcam_x>
  <webcam_y>190</webcam_y>
  <webcam_rotation>0</webcam_rotation>
  <webcam_scale>1.4</webcam_scale>
  <webcamStealth>off</webcamStealth>
  <frame>off</frame>
  <frame_x>258</frame_x>
  <frame_y>43</frame_y>
  <frame_rotation>0</frame_rotation>
  <frame_scale>1.1</frame_scale>
  <frame_selected>images/frame1.png</frame_selected>
  <frame_selected_index>0</frame_selected_index>
  <frame_path>images/frame1.png</frame_path>
  <frame_path>images/frame2.png</frame_path>
  <frame_path>images/frame3.png</frame_path>
  <frame_path>images/frame4.png</frame_path>
  <frame_path>images/frame5.png</frame_path>
  <frame_path>images/frame6.png</frame_path>
  <stand_alone>off</stand_alone>
  <stand_alone_weather>off</stand_alone_weather>
  <stand_alone_stock>off</stand_alone_stock>
  <thoughts_image_x>550</thoughts_image_x>
  <thoughts_image_y>260</thoughts_image_y>
  <thoughts_image_rotate>0</thoughts_image_rotate>
  <thoughts_image_scale>0.9</thoughts_image_scale>
  <avatar_image_x>700</avatar_image_x>
  <avatar_image_y>100</avatar_image_y>
  <avatar_image_rotate>0</avatar_image_rotate>
  <avatar_image_scale>0.15</avatar_image_scale>
  <princess>videos/idle_princess.flv</princess>
  <princess>videos/proximity1_princess.flv</princess>
  <princess>videos/proximity2_princess.flv</princess>
  <princess>videos/touch1_princess.flv</princess>
  <princess>videos/weather_good_princess.flv</princess>
  <princess>videos/weather_ok_princess.flv</princess>
  <princess>videos/weather_rain_princess.flv</princess>
  <princess>videos/no_internet_princess.flv</princess>
  <princess>videos/stock_up_princess.flv</princess>
  <princess>videos/stock_no_change_princess.flv</princess>
  <princess>videos/stock_down_princess.flv</princess>
  <princess>videos/doorbell_princess.flv</princess>
  <princess>videos/phone_princess.flv</princess>
  <princess>videos/video1_princess.flv</princess>
  <princess>videos/video2_princess.flv</princess>
  <princess>videos/video3_princess.flv</princess>
  <princess>videos/video4_princess.flv</princess>
  <princess>videos/proximity3_princess.flv</princess>
  <princess>videos/x10_on_princess.flv</princess>
  <princess>videos/x10_off_princess.flv</princess>
  <princess>videos/drink1_princess.flv</princess>
  <princess>videos/drink2_princess.flv</princess>
  <princess>videos/drink3_princess.flv</princess>
  <princess>videos/drink4_princess.flv</princess>
  <princess>videos/quizloop_princess.flv</princess>
  <halloween>videos/idle_halloween.flv</halloween>
  <halloween>videos/proximity1_halloween.flv</halloween>
  <halloween>videos/proximity2_halloween.flv</halloween>
  <halloween>videos/touch1_halloween.flv</halloween>
  <halloween>videos/weather_good_halloween.flv</halloween>
  <halloween>videos/weather_ok_halloween.flv</halloween>
  <halloween>videos/weather_rain_halloween.flv</halloween>
  <halloween>videos/no_internet_halloween.flv</halloween>
  <halloween>videos/stock_up_halloween.flv</halloween>
  <halloween>videos/stock_no_change_halloween.flv</halloween>
  <halloween>videos/stock_down_halloween.flv</halloween>
  <halloween>videos/doorbell_halloween.flv</halloween>
  <halloween>videos/phone_halloween.flv</halloween>
  <halloween>videos/video1_halloween.flv</halloween>
  <halloween>videos/video2_halloween.flv</halloween>
  <halloween>videos/video3_halloween.flv</halloween>
  <halloween>videos/video4_halloween.flv</halloween>
  <halloween>videos/proximity3_halloween.flv</halloween>
  <halloween>videos/x10_on_halloween.flv</halloween>
  <halloween>videos/x10_off_halloween.flv</halloween>
  <halloween>videos/drink1_halloween.flv</halloween>
  <halloween>videos/drink2_halloween.flv</halloween>
  <halloween>videos/drink3_halloween.flv</halloween>
  <halloween>videos/drink4_halloween.flv</halloween>
  <halloween>videos/quizloop_halloween.flv</halloween>
  <pirate>videos/idle_pirate.flv</pirate>
  <pirate>videos/proximity1_pirate.flv</pirate>
  <pirate>videos/proximity2_pirate.flv</pirate>
  <pirate>videos/touch1_pirate.flv</pirate>
  <pirate>videos/weather_good_pirate.flv</pirate>
  <pirate>videos/weather_ok_pirate.flv</pirate>
  <pirate>videos/weather_rain_pirate.flv</pirate>
  <pirate>videos/no_internet_pirate.flv</pirate>
  <pirate>videos/stock_up_pirate.flv</pirate>
  <pirate>videos/stock_no_change_pirate.flv</pirate>
  <pirate>videos/stock_down_pirate.flv</pirate>
  <pirate>videos/doorbell_pirate.flv</pirate>
  <pirate>videos/phone_pirate.flv</pirate>
  <pirate>videos/video1_pirate.flv</pirate>
  <pirate>videos/video2_pirate.flv</pirate>
  <pirate>videos/video3_pirate.flv</pirate>
  <pirate>videos/video4_pirate.flv</pirate>
  <pirate>videos/proximity3_pirate.flv</pirate>
  <pirate>videos/x10_on_pirate.flv</pirate>
  <pirate>videos/x10_off_pirate.flv</pirate>
  <pirate>videos/drink1_pirate.flv</pirate>
  <pirate>videos/drink2_pirate.flv</pirate>
  <pirate>videos/drink3_pirate.flv</pirate>
  <pirate>videos/drink4_pirate.flv</pirate>
  <pirate>videos/quizloop_pirate.flv</pirate>
  <insult>videos/idle_insult.flv</insult>
  <insult>videos/proximity1_insult.flv</insult>
  <insult>videos/proximity2_insult.flv</insult>
  <insult>videos/touch1_insult.flv</insult>
  <insult>videos/weather_good_insult.flv</insult>
  <insult>videos/weather_ok_insult.flv</insult>
  <insult>videos/weather_rain_insult.flv</insult>
  <insult>videos/no_internet_insult.flv</insult>
  <insult>videos/stock_up_insult.flv</insult>
  <insult>videos/stock_no_change_insult.flv</insult>
  <insult>videos/stock_down_insult.flv</insult>
  <insult>videos/doorbell_insult.flv</insult>
  <insult>videos/phone_insult.flv</insult>
  <insult>videos/video1_insult.flv</insult>
  <insult>videos/video2_insult.flv</insult>
  <insult>videos/video3_insult.flv</insult>
  <insult>videos/video4_insult.flv</insult>
  <insult>videos/proximity3_insult.flv</insult>
  <insult>videos/x10_on_insult.flv</insult>
  <insult>videos/x10_off_insult.flv</insult>
  <insult>videos/drink1_insult.flv</insult>
  <insult>videos/drink2_insult.flv</insult>
  <insult>videos/drink3_insult.flv</insult>
  <insult>videos/drink4_insult.flv</insult>
  <insult>videos/quizloop_insult.flv</insult>
  <tts>videos/idle_tts.flv</tts>
  <tts>videos/proximity1_tts.flv</tts>
  <tts>videos/proximity2_tts.flv</tts>
  <tts>videos/touch1_tts.flv</tts>
  <tts>videos/weather_good_tts.flv</tts>
  <tts>videos/weather_ok_tts.flv</tts>
  <tts>videos/weather_rain_tts.flv</tts>
  <tts>videos/no_internet_tts.flv</tts>
  <tts>videos/stock_up_tts.flv</tts>
  <tts>videos/stock_no_change_tts.flv</tts>
  <tts>videos/stock_down_tts.flv</tts>
  <tts>videos/doorbell_tts.flv</tts>
  <tts>videos/phone_tts.flv</tts>
  <tts>videos/video1_tts.flv</tts>
  <tts>videos/video2_tts.flv</tts>
  <tts>videos/video3_tts.flv</tts>
  <tts>videos/video4_tts.flv</tts>
  <tts>videos/proximity3_tts.flv</tts>
  <tts>videos/x10_on_tts.flv</tts>
  <tts>videos/x10_off_tts.flv</tts>
  <tts>videos/drink1_tts.flv</tts>
  <tts>videos/drink2_tts.flv</tts>
  <tts>videos/drink3_tts.flv</tts>
  <tts>videos/drink4_tts.flv</tts>
  <tts>videos/quizloop_tts.flv</tts>
  <picasa_insteadofphotobooth>off</picasa_insteadofphotobooth>
  <photobooth_printing>off</photobooth_printing>
  <photobooth_promptprint>off</photobooth_promptprint>
  <photobooth_papersize>A6</photobooth_papersize>
  <photobooth_printorientation>Portrait</photobooth_printorientation>
  <photobooth_scaling>.71</photobooth_scaling>
  <photobooth_logo>on</photobooth_logo>
  <photobooth_logoPath>photobooth/images/photobooth_logo.png</photobooth_logoPath>
  <photobooth_logo_x>30</photobooth_logo_x>
  <photobooth_logo_y>29</photobooth_logo_y>
  <photobooth_keyboardtrigger>Space</photobooth_keyboardtrigger>
  <photobooth_backgroundimage>on</photobooth_backgroundimage>
  <photobooth_backdropimage>photobooth/images/photobooth_background.png</photobooth_backdropimage>
  <photobooth_backgroundboxes>photobooth/images/photobooth_boxes.png</photobooth_backgroundboxes>
  <photobooth_countdownimage>photobooth/images/countdown.png</photobooth_countdownimage>
  <photobooth_backgroundcustomimage>off</photobooth_backgroundcustomimage>
  <photobooth_backgroundcustomimagepath>photobooth/images/photobooth_custombackground.png</photobooth_backgroundcustomimagepath>
  <photobooth_backgroundcustomimage_x>327</photobooth_backgroundcustomimage_x>
  <photobooth_backgroundcustomimage_y>109</photobooth_backgroundcustomimage_y>
  <photobooth_startuptext>Press Button or Space Key to Start</photobooth_startuptext>
  <photobooth_save>off</photobooth_save>
  <photobooth_fullres_save>on</photobooth_fullres_save>
  <photobooth_savefolder>diymagicmirror-settings/photobooth/savedphotos/</photobooth_savefolder>
  <photobooth_x10>off</photobooth_x10>
  <photobooth_leds>off</photobooth_leds>
  <photobooth_kinect>on</photobooth_kinect>
  <photobooth_hidemouse>on</photobooth_hidemouse>
  <photobooth_videoBandwidth>0</photobooth_videoBandwidth>
  <photobooth_videoQuality>100</photobooth_videoQuality>
  <photobooth_videoWidth>480</photobooth_videoWidth>
  <photobooth_videoHeight>480</photobooth_videoHeight>
  <photobooth_webcam_x>315</photobooth_webcam_x>
  <photobooth_webcam_y>57</photobooth_webcam_y>
  <photobooth_webcam_width>631</photobooth_webcam_width>
  <photobooth_webcam_height>637</photobooth_webcam_height>
  <photobooth_fps>20</photobooth_fps>
  <photobooth_countdown>6</photobooth_countdown>
  <photobooth_print_copies>1</photobooth_print_copies>
  <photoboothShotDelay>1</photoboothShotDelay>
  <photoboothFlashDuration>150</photoboothFlashDuration>
  <photoboothDelayAfterCameraSound>1</photoboothDelayAfterCameraSound>
  <photoboothPleaseWaitTimer1>1</photoboothPleaseWaitTimer1>
  <photoboothPreGalleryTimer>5</photoboothPreGalleryTimer>
  <photoboothGalleryTimer>10</photoboothGalleryTimer>
  <photoboothProofPreview>on</photoboothProofPreview>
  <photoboothProofDisplayTime>8</photoboothProofDisplayTime>
  <photoboothThanksBoxTimer>3</photoboothThanksBoxTimer>
  <photobooth_beepSound>sounds/photobooth_beep.mp3</photobooth_beepSound>
  <photobooth_cameraSound>sounds/photobooth_camera.mp3</photobooth_cameraSound>
  <photobooth_developingfilmSound>sounds/photobooth_developingfilm.mp3</photobooth_developingfilmSound>
  <photobooth_IntroSoundPathp>sounds/photobooth_introsound_princess.mp3</photobooth_IntroSoundPathp>
  <photobooth_getReadySoundPathp>sounds/photobooth_getreadysound_princess.mp3</photobooth_getReadySoundPathp>
  <photobooth_pic2SoundPathp>sounds/photobooth_pic2sound_princess.mp3</photobooth_pic2SoundPathp>
  <photobooth_pic3SoundPathp>sounds/photobooth_pic3sound_princess.mp3</photobooth_pic3SoundPathp>
  <photobooth_pic4SoundPathp>sounds/photobooth_pic4sound_princess.mp3</photobooth_pic4SoundPathp>
  <photobooth_developingSoundPathp>sounds/photobooth_developingsound_princess.mp3</photobooth_developingSoundPathp>
  <photobooth_thanksSoundPathp>sounds/photobooth_thankssound_princess.mp3</photobooth_thanksSoundPathp>
  <photobooth_IntroSoundPathh>sounds/photobooth_introsound_halloween.mp3</photobooth_IntroSoundPathh>
  <photobooth_getReadySoundPathh>sounds/photobooth_getreadysound_halloween.mp3</photobooth_getReadySoundPathh>
  <photobooth_pic2SoundPathh>sounds/photobooth_pic2sound_halloween.mp3</photobooth_pic2SoundPathh>
  <photobooth_pic3SoundPathh>sounds/photobooth_pic3sound_halloween.mp3</photobooth_pic3SoundPathh>
  <photobooth_pic4SoundPathh>sounds/photobooth_pic4sound_halloween.mp3</photobooth_pic4SoundPathh>
  <photobooth_developingSoundPathh>sounds/photobooth_developingsound_halloween.mp3</photobooth_developingSoundPathh>
  <photobooth_thanksSoundPathh>sounds/photobooth_thankssound_halloween.mp3</photobooth_thanksSoundPathh>
  <photobooth_IntroSoundPathpi>sounds/photobooth_introsound_pirate.mp3</photobooth_IntroSoundPathpi>
  <photobooth_getReadySoundPathpi>sounds/photobooth_getreadysound_pirate.mp3</photobooth_getReadySoundPathpi>
  <photobooth_pic2SoundPathpi>sounds/photobooth_pic2sound_pirate.mp3</photobooth_pic2SoundPathpi>
  <photobooth_pic3SoundPathpi>sounds/photobooth_pic3sound_pirate.mp3</photobooth_pic3SoundPathpi>
  <photobooth_pic4SoundPathpi>sounds/photobooth_pic4sound_pirate.mp3</photobooth_pic4SoundPathpi>
  <photobooth_developingSoundPathpi>sounds/photobooth_developingsound_pirate.mp3</photobooth_developingSoundPathpi>
  <photobooth_thanksSoundPathpi>sounds/photobooth_thankssound_pirate.mp3</photobooth_thanksSoundPathpi>
  <photobooth_IntroSoundPathi>sounds/photobooth_introsound_insult.mp3</photobooth_IntroSoundPathi>
  <photobooth_getReadySoundPathi>sounds/photobooth_getreadysound_insult.mp3</photobooth_getReadySoundPathi>
  <photobooth_pic2SoundPathi>sounds/photobooth_pic2sound_insult.mp3</photobooth_pic2SoundPathi>
  <photobooth_pic3SoundPathi>sounds/photobooth_pic3sound_insult.mp3</photobooth_pic3SoundPathi>
  <photobooth_pic4SoundPathi>sounds/photobooth_pic4sound_insult.mp3</photobooth_pic4SoundPathi>
  <photobooth_developingSoundPathi>sounds/photobooth_developingsound_insult.mp3</photobooth_developingSoundPathi>
  <photobooth_thanksSoundPathi>sounds/photobooth_thankssound_insult.mp3</photobooth_thanksSoundPathi>
  <photobooth_facialRecognitionTrigger>off</photobooth_facialRecognitionTrigger>
  <photobooth_facialRecognitionDelay>5</photobooth_facialRecognitionDelay>
  <custom_audio>off</custom_audio>
  <custom_audio_clip>videos/idle_lipsync.flv</custom_audio_clip>
  <custom_audio_lip_pattern>lip_pattern.swf</custom_audio_lip_pattern>
  <lipsync_feature>on</lipsync_feature>
  <lipsync_interval>50</lipsync_interval>
  <lipsync_x>417</lipsync_x>
  <lipsync_y>412</lipsync_y>
  <lipsync_rotation>0</lipsync_rotation>
  <lipsync_clip>videos/idle_lipsync.flv</lipsync_clip>
  <lipsync_scale>1.05</lipsync_scale>
  <mp3>custom_audio/proximity1.mp3</mp3>
  <mp3>custom_audio/proximity2.mp3</mp3>
  <mp3>custom_audio/proximity3.mp3</mp3>
  <mp3>custom_audio/weather_good.mp3</mp3>
  <mp3>custom_audio/weather_ok.mp3</mp3>
  <mp3>custom_audio/weather_rain.mp3</mp3>
  <mp3>custom_audio/no_internet.mp3</mp3>
  <mp3>custom_audio/stock_up.mp3</mp3>
  <mp3>custom_audio/stock_no_change.mp3</mp3>
  <mp3>custom_audio/stock_down.mp3</mp3>
  <mp3>custom_audio/doorbell.mp3</mp3>
  <mp3>custom_audio/x10_on.mp3</mp3>
  <mp3>custom_audio/x10_off.mp3</mp3>
  <mp3>custom_audio/drink1.mp3</mp3>
  <mp3>custom_audio/drink2.mp3</mp3>
  <mp3>custom_audio/drink3.mp3</mp3>
  <mp3>custom_audio/drink4.mp3</mp3>
  <mp3>custom_audio/blow.mp3</mp3>
  <mp3>custom_audio/wait.mp3</mp3>
  <idle_black>videos/idle_black.flv</idle_black>
  <twitter_feature>off</twitter_feature>
  <twitter_mode>search</twitter_mode>
  <twitter_username/>
  <twitter_password/>
  <twitter_serviceHost>http://diymagicmirror.com/proxy</twitter_serviceHost>
  <twitter_consumerKey>UqwagrMLQEwGsBfmxzxg</twitter_consumerKey>
  <twitter_consumerSecret>uvEa0gbwFoPlUTrhirhhK0OATpLG7mXqeDSZvZ0UtI</twitter_consumerSecret>
  <twitter_callbackURL>http://diymagicmirror.com/oath/verified.html</twitter_callbackURL>
  <twitter_pinlessAuth>on</twitter_pinlessAuth>
  <twitter_oauthToken/>
  <twitter_oauthTokenSecret/>
  <twitter_authenticated>no</twitter_authenticated>
  <twitter_drink1>I've had nothing to drink</twitter_drink1>
  <twitter_drink2>I've had a few drinks</twitter_drink2>
  <twitter_drink3>I'm Buzzed</twitter_drink3>
  <twitter_drink4>I'm Flat Out Drunk</twitter_drink4>
  <twitter_frequency>10</twitter_frequency>
  <twitter_my_tweets_only>off</twitter_my_tweets_only>
  <twitter_search_term>speakmirror</twitter_search_term>
  <twitter_do_not_speak_search_term>off</twitter_do_not_speak_search_term>
  <twitter_breathalyzer>off</twitter_breathalyzer>
  <twitter_breathalyzer_value>on</twitter_breathalyzer_value>
  <tts_feature>on</tts_feature>
  <tts_avatar>off</tts_avatar>
  <tts_charlimit>100</tts_charlimit>
  <tts_url>http://translate.google.co.uk/translate_tts?q=</tts_url>
  <tts_language>en</tts_language>
  <tts_sendheader>on</tts_sendheader>
  <tts_headername>Referer</tts_headername>
  <tts_headervalue>http://translate.google.co.uk/</tts_headervalue>
  
  <ttsrss_url>http://api.voicerss.org/</ttsrss_url>
  <ttsrss_apikey>ff013119f75b411e81f1bdcde7ea8c38</ttsrss_apikey>
  <ttsrss_language>en-gb</ttsrss_language>
  <ttsrss_mp3samplerate>44khz_16bit_stereo</ttsrss_mp3samplerate>
  
  <tts_engine>voicerss</tts_engine>
  <ttsyakitome_resturl>https://www.yakitome.com/api/rest/tts</ttsyakitome_resturl>
  <ttsyakitome_audiourl>https://www.yakitome.com/api/rest/audio</ttsyakitome_audiourl>
  <ttsyakitome_api_key>qha4ndDY1amd3_BCGuD65HO</ttsyakitome_api_key>
  <ttsyakitome_voice>Dave</ttsyakitome_voice>
  <ttsyakitome_speed>5</ttsyakitome_speed>
  
  <proximity1_tts>Hi Jane, can you come closer pretty please</proximity1_tts>
  <proximity2_tts>You look great, have you lost some weight?</proximity2_tts>
  <proximity3_tts>Say you really look great today, is that a new shirt you're wearing?</proximity3_tts>
  <weather_good_tts>What a beautiful day, the forecast is</weather_good_tts>
  <weather_ok_tts>Today's weather forecast is</weather_ok_tts>
  <weather_rain_tts>Better get your umbrella, the forecast is</weather_rain_tts>
  <no_internet_tts>Your Internet connection is down, I would help you but I'm just a computer</no_internet_tts>
  <stock_up_tts>Your stocks were up today with a rise of</stock_up_tts>
  <stock_no_change_tts>Not much change in your stocks today, the change was</stock_no_change_tts>
  <stock_down_tts>Your stocks were down with a loss of</stock_down_tts>
  <doorbell_tts>You've got a visitor at the door</doorbell_tts>
  <x10_on_tts>I will now turn on your X-10 device</x10_on_tts>
  <x10_off_tts>I will now turn off your X-10 device</x10_off_tts>
  <drink1_tts>You've not had anything to drink</drink1_tts>
  <drink2_tts>I can smell a few drinks on you</drink2_tts>
  <drink3_tts>Looks like someone is buzzed, are you having problems walking?</drink3_tts>
  <drink4_tts>You're Drunk!  I'd recommend you give someone your keys</drink4_tts>
  <blow_tts>Blow</blow_tts>
  <wait_tts>Please Wait</wait_tts>
  <warning_tts>Warning</warning_tts>
  <google_id>magicmirror2000</google_id>
  <picasa_album_id>5306254408597153889</picasa_album_id>
  <picasa_album_name>DIY Magic Mirror</picasa_album_name>
  <picasa_album_url>http://lh4.ggpht.com/_VgC3-P6sPnE/SaOaRVhIqGE/AAAAAAAAAB8/lBQOxSQy-BU/s160-c/DIYMagicMirror.jpg</picasa_album_url>
  <slide_delay>5</slide_delay>
  <slideshow_restart_switch>off</slideshow_restart_switch>
  <picture_x_position>-260</picture_x_position>
  <picture_y_position>-290</picture_y_position>
  <picture_rotation>0</picture_rotation>
  <picture_scale>14</picture_scale>
  <doorbell_delay>3</doorbell_delay>
  <stocks>
    <symbol>sbux</symbol>
    <symbol>goog</symbol>
    <symbol>aapl</symbol>
    <symbol>cy</symbol>
    <symbol>ge</symbol>
  </stocks>
  <board_version>5</board_version>
  <atmega>m328p</atmega>
  <LED_mode>indicator</LED_mode>
  <branding>DIY</branding>
</mirror>;

		
		var newXMLStr:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + newconfigXML.toXMLString();
		try {
                  filestream.open(file, FileMode.WRITE);
				  filestream.writeUTFBytes(newXMLStr);
                  output.text = "New Configuration File Created";			
            } catch (error:IOError) {
                  output.text = "IMPORTANT!!! Settings were not saved, re-start this program and Run as Administrator";			
				  AlertManager.createAlert(this, "IMPORTANT!!! Settings were not saved, please re-start this program and Run as Administrator and then you will be able to Save");
				  admin_flag = 1;
            }
		filestream.close(); 	
		
		var myTimer:Timer = new Timer(6000, 1);
        myTimer.addEventListener(TimerEvent.TIMER, ClearOutputText);
        myTimer.start();
		
	}
	
	private function saveValue(event:MouseEvent):void {
		saveValues();
	}
	
	private function saveValues():void {
       	myXML.picasa_album_id = album_id.text;	
		myXML.google_id = picasa_id_input.text;
		myXML.picasa_album_name = album_name.text;
		myXML.picasa_album_url = album_url.text;
		myXML.weather_zip = zip_code_input.text;
		myXML.weather_woeid = woeid_input.text;
		myXML.proximity_sensor_trigger1_distance_lower = proximity_sensor_trigger1_distance_lower_input.text;
		myXML.proximity_sensor_trigger1_distance_upper = proximity_sensor_trigger1_distance_upper_input.text;
		myXML.quiz_timer = quiz_timer_input.text;
		myXML.proximity_sensor_trigger1_time = proximity_sensor_trigger1_time_input.text;
		myXML.proximity_sensor_trigger2_distance_lower = proximity_sensor_trigger2_distance_lower_input.text;
		myXML.proximity_sensor_trigger2_distance_upper = proximity_sensor_trigger2_distance_upper_input.text;
		myXML.proximity_sensor_trigger2_time = proximity_sensor_trigger2_time_input.text;
		myXML.proximity_sensor_trigger2_distance = proximity_sensor_trigger2_distance_input.text;		
		myXML.forecast_cutoff = forecast_cutoff_input.text; 
		myXML.reg_code = reg_code_input.text; 
		myXML.startup_delay = startup_delay_input.text; 
		myXML.stock_good_threshold = stock_good_threshold_input.text;
		myXML.stock_bad_threshold = stock_bad_threshold_input.text;
		
		myXML.alcohol_baseline = alcohol_baseline_text.text;
		myXML.alcohol_level1   = alcohol_level1_text.text;
		myXML.alcohol_level2 = alcohol_level2_text.text;
		myXML.alcohol_level3 = alcohol_level3_text.text;
		myXML.alcohol_baseline_difference_allowance = alcohol_baseline_difference_allowance_text.text;
		myXML.alcohol_countdown = alcohol_countdown_text.text;
		
		
 
		//***************************************
		
		/*if ( TTS_languages_dropdown.selectedItem.data == null) {  //old google tts code
			myXML.tts_language = "en";
		}
		
		else {
			myXML.tts_language = TTS_languages_dropdown.selectedItem.data;
		}*/
		
		if (TTS_languages_dropdown.selectedItem.data == null) {
			myXML.ttsrss_language = "en-gb";
			myXML.ttsyakitome_voice = "Dave";
		}
		else {
			
			if (tts_engine_voicerss.selected == true ) {
				myXML.ttsrss_language = TTS_languages_dropdown.selectedItem.data;
			}
			else {
				myXML.ttsyakitome_voice = TTS_languages_dropdown.selectedItem.data;
			}
		}
		
		myXML.tts_url = tts_url.text;
		
		//ComboBox(event.target).selectedItem.data
		
		myXML.proximity1_tts = proximity1_tts.text;
		myXML.proximity2_tts = proximity2_tts.text;
		myXML.proximity3_tts = proximity3_tts.text;
		myXML.weather_good_tts = weather_good_tts.text;
		myXML.weather_ok_tts = weather_ok_tts.text;
		myXML.weather_rain_tts = weather_rain_tts.text;
		myXML.stock_up_tts = stock_up_tts.text;
		myXML.stock_no_change_tts = stock_no_change_tts.text;
		myXML.stock_down_tts = stock_down_tts.text;
		myXML.doorbell_tts = doorbell_tts.text;
		myXML.x10_on_tts = x10_on_tts.text;
		myXML.x10_off_tts = x10_off_tts.text;
		myXML.drink1_tts = drink1_tts.text;
		myXML.drink2_tts = drink2_tts.text;
		myXML.drink3_tts = drink3_tts.text;
		myXML.drink4_tts = drink4_tts.text;
		myXML.blow_tts = blow_tts.text;
		myXML.wait_tts = wait_tts.text;
		myXML.no_internet_tts = no_internet_tts.text;	
		
		myXML.twitter_drink1 = drink1_tweet.text;
		myXML.twitter_drink2 = drink2_tweet.text;
		myXML.twitter_drink3 = drink3_tweet.text;
		myXML.twitter_drink4 = drink4_tweet.text;
		
		
		if (tts_feature_radio_on.selected == true) { //tts on means custom mp3 is off
			myXML.tts_feature = "on"; 
			myXML.custom_audio = "off";
		}
		else {
			myXML.tts_feature = "off";  //tts is off means custom mp3 is one
			myXML.custom_audio = "on";
		}
		
		if (tts_engine_voicerss.selected == true) { //the voicerss tts engine is selected, not yakitome
			myXML.tts_engine = "voicerss"; 
		}
		else {
			myXML.tts_engine = "yakitome"; 
		
		}
		
		if (photobooth_printing_radio_on.selected == true) { //photobooth printing is turned on
			myXML.photobooth_printing = "on"; 
		}
		else {
			myXML.photobooth_printing = "off";  //tts is off means custom mp3 is one
		}
		
		///*******************************
				
		//myXML.com_port = com_port_input.text;
		myXML.good_weather_threshold = good_weather_threshold_input.text;		
		myXML.slide_delay = slide_duration_input.text;	  
  		
		myXML.picture_x_position = picture_x_position;
		myXML.picture_y_position = picture_y_position;
		myXML.picture_rotation = picture_rotation;  
		myXML.picture_scale = picture_scale;			
		myXML.alcohol_results_text_x = alcohol_results_text_x;
		myXML.alcohol_results_text_y = alcohol_results_text_y;
		myXML.alcohol_results_text_fontsize = alcohol_results_text_fontsize;
		myXML.alcohol_results_text_rotation = alcohol_results_text_rotation;		
		myXML.stock_text_x = stock_text_x;
		myXML.stock_text_y = stock_text_y;
		myXML.stock_text_fontsize = stock_text_fontsize;
		myXML.stock_text_rotation = stock_text_rotation;
		myXML.weather_text_fontsize = weather_text_fontsize;
		myXML.weather_text_rotation = weather_text_rotation;		
		myXML.weather_text_x = weather_text_x;
		myXML.weather_text_y = weather_text_y;
		myXML.weather_image_x = weather_image_x;
		myXML.weather_image_y = weather_image_y;		
		myXML.weather_image_rotation = weather_image_rotation;		
		myXML.weather_image_scale = weather_image_scale;
		
		myXML.frame_x = frame_x;
		myXML.frame_y = frame_y;
		myXML.frame_rotation = frame_rotation;		
		myXML.frame_scale = frame_scale;		
		
		myXML.beer_image_x = beer_image_x;
		myXML.beer_image_y = beer_image_y;
		myXML.beer_image_rotation = beer_image_rotation;		
		myXML.beer_image_scale = beer_image_scale;		
		
		myXML.twitterbird_image_x = twitterbird_image_x;
		myXML.twitterbird_image_y = twitterbird_image_y;
		myXML.twitterbird_image_rotation = twitterbird_image_rotation;		
		myXML.twitterbird_image_scale = twitterbird_image_scale;		
		
		myXML.lipsync_x = lip1_x;
		myXML.lipsync_y = lip1_y;
		myXML.lipsync_rotation = lip1_rotation;		
		myXML.lipsync_scale = lip1_scale;		
		
		myXML.webcam_width = webcam_width;
		myXML.webcam_height = webcam_height;
		myXML.webcam_x = webcamvideo_x;
		myXML.webcam_y = webcamvideo_y;
		myXML.webcam_rotation = webcamvideo_rotation;		
		myXML.webcam_scale = webcamvideo_scale;			
				
		myXML.video_scaling_factor = video_scaling_factor;
		myXML.x_position = x_position;
		myXML.y_position = y_position;
		myXML.video_rotation = video_rotation;
		myXML.thoughts_image_x = thoughts_image_x;
		myXML.thoughts_image_y = thoughts_image_y;
		myXML.thoughts_image_scale = thoughts_image_scale;
		myXML.thoughts_image_rotate = thoughts_image_rotate;
		myXML.doorcam_x = doorcam_x;
		myXML.doorcam_y = doorcam_y;
		myXML.doorcam_rotate = doorcam_rotate;
		myXML.doorcam_scale = doorcam_scale;
		
		myXML.doorcam_video_x = doorcam_video_x;
		myXML.doorcam_video_y = doorcam_video_y;
		myXML.doorcam_video_scale = doorcam_video_scale;
		
		myXML.doorcam_video_x = doorcam_video_x;
		myXML.doorcam_video_y = doorcam_video_y;
		myXML.doorcam_video_scale = doorcam_video_scale;
				
		if (reg_code_input.text == "440537" || reg_code_input.text == "110534" || reg_code_input.text == "768223" || reg_code_input.text == "998765" || reg_code_input.text == "233229" || reg_code_input.text == "643229" || reg_code_input.text == "876233" ) {
				registered.text = "REGISTERED";
				reg_code_input.editable = false;
				reg_code_input.enabled = false;
			} 
		
		//now write what's in stock list back to an array and then to xml
		
		var str:String = stock_list.text;
		
  		
			temp_stock_array = str.split("+"); 
			var y:int = 0;
			for each (var item in temp_stock_array)
				{	
					myXML.stocks.symbol[y] = temp_stock_array[y];				
					y++;
				}
						
			
		if (weather_reading_input.selectedIndex == 0) {
			myXML.weather_reading = "f";
			}
		else {myXML.weather_reading = "c";}	
		
		var index_temp:int;
		index_temp = mirror_mode_input.selectedIndex;
		
		switch (index_temp)  //sets the video playlists based on the mode
				{
				case 0: 			
					myXML.mirror_mode = "princess";
					URLModeString = homepath + "images/princess_sm.jpg";		
					ModeThumb.source = URLModeString;
					break;
				case 1: 
					myXML.mirror_mode = "pirate";
					URLModeString = homepath + "images/pirate_sm.jpg";		
					ModeThumb.source = URLModeString;
					break;
				case 2: 
					myXML.mirror_mode = "halloween";
					URLModeString = homepath + "images/halloween_sm.jpg";		
					ModeThumb.source = URLModeString;
					break;
				case 3: 
					myXML.mirror_mode = "insult";
					URLModeString = homepath + "images/insult_sm.jpg";		
					ModeThumb.source = URLModeString;
					break;	
				case 4: 
					myXML.mirror_mode = "tts_mode";
					URLModeString = homepath + "images/princess_sm.jpg";		
					ModeThumb.source = URLModeString;
					break;		
				}
		   
		var index_temp2:int;
		index_temp2 = display_mode_input.selectedIndex;
		
		switch (index_temp2)  //sets the video playlists based on the mode
				{
				case 0: 			
					myXML.display_mode_preset = 0;
					break;
				case 1: 
					myXML.display_mode_preset = 1;
					break;
				case 2: 
					myXML.display_mode_preset = 2;
					break;
				case 3: 
					myXML.display_mode_preset = 3;
					break;	
				case 4: 
					myXML.display_mode_preset = 4;
					break;	
				case 5: 
					myXML.display_mode_preset = 5;
					break;		
				}
				
				
		
		var index_temp5:int;
		index_temp5 = frame_input.selectedIndex;
				
		switch (index_temp5)  //sets the video playlists based on the mode
				{
				case 0: 			
					myXML.frame_selected = String(myXML.frame_path[0]);
					myXML.frame_selected_index = 0;
					break;
				case 1: 
					myXML.frame_selected = String(myXML.frame_path[1]);
					myXML.frame_selected_index = 1;
					break;
				case 2: 
					myXML.frame_selected = String(myXML.frame_path[2]);
					myXML.frame_selected_index = 2;
					break;
				case 3: 
					myXML.frame_selected = String(myXML.frame_path[3]);
					myXML.frame_selected_index = 3;
					break;	
				case 4: 
					myXML.frame_selected = String(myXML.frame_path[4]);
					myXML.frame_selected_index = 4;
					break;	
				case 5: 
					myXML.frame_selected = String(myXML.frame_path[5]);
					myXML.frame_selected_index = 5;
					break;		
				}
		
		var com_index_temp:int;
		com_index_temp = com_port_drop.selectedIndex;		
		switch (com_index_temp) 
				{
				case 0: 			
					myXML.com_port = "5331";
					break;
				case 1: 
					myXML.com_port = "5332";
					break;
				case 2: 
					myXML.com_port = "5333";
					break;
				case 3: 
					myXML.com_port = "5334";
					break;	
				case 4: 			
					myXML.com_port = "5335";
					break;
				case 5: 
					myXML.com_port = "5336";
					break;
				case 6: 
					myXML.com_port = "5337";
					break;
				case 7: 
					myXML.com_port = "5338";
					break;		
				case 8: 
					myXML.com_port = "5339";
					break;			
				}
		
		var quiz_index_temp:int;
		quiz_index_temp = quiz_correctanswer_drop.selectedIndex;		
		switch (quiz_index_temp) 
				{
				case 0: 			
					myXML.quiz_correctanswer = "0";
					break;
				case 1: 
					myXML.quiz_correctanswer = "2";
					break;
				case 2: 
					myXML.quiz_correctanswer = "3";
					break;
				case 3: 
					myXML.quiz_correctanswer = "5";
					break;	
				}
		
			
		if (arduino_version_input.selectedIndex == 0)  {
			myXML.atmega = "m168";
		}
		else {
			myXML.atmega = "m328p";
		}
		
		if (video_resolution_radio_high.selected == true) {
			myXML.video_resolution = "high"; 
		}
		else {myXML.video_resolution = "low";
		}
		
		if (analog1_radio_on.selected == true) {
			myXML.analog_input1 = "on"; 
			a1.text = "ON";
		}
		else {myXML.analog_input1 = "off";
			a1.text = "OFF";
		}
											  
		if (analog2_radio_on.selected == true) {
			myXML.analog_input2 = "on"; 
			a2.text = "ON";
		}
		else {myXML.analog_input2 = "off"; 
			a2.text = "OFF";
		}
		
		if (analog3_radio_on.selected == true) {
			myXML.analog_input3 = "on"; 
			a3.text = "ON";
		}
		else {myXML.analog_input3 = "off";
			a3.text = "OFF";
		}
		
		if (analog1_video1_check.selected == true) {  //for touch sensor 3, plays the prox videos instead of x10 on/off control
			myXML.analog1_video1 = "on";
		}
		else {
			myXML.analog1_video1 = "off";	
		}
		
		if (analog2_video2_check.selected == true) {  //for touch sensor 3, plays the prox videos instead of x10 on/off control
			myXML.analog2_video2 = "on";
		}
		else {
			myXML.analog2_video2 = "off";	
		}
		
		if (analog3_video3_check.selected == true) {  //for touch sensor 3, plays the prox videos instead of x10 on/off control
			myXML.analog3_video3 = "on";
		}
		else {
			myXML.analog3_video3 = "off";	
		}
				
		if (digital2_video1_check.selected == true) { 
			myXML.digital2_video1 = "on";
		}
		else {
			myXML.digital2_video1 = "off";	
		}
		
		if (digital3_video2_check.selected == true) { 
			myXML.digital3_video2 = "on";
		}
		else {
			myXML.digital3_video2 = "off";	
		}
		
		if (digital5_video3_check.selected == true) { 
			myXML.digital5_video3 = "on";
		}
		else {
			myXML.digital5_video3 = "off";	
		}		
		
		if (picasa_instead_check.selected == true) { 
			myXML.picasa_insteadofphotobooth = "on";
		}
		else {
			myXML.picasa_insteadofphotobooth = "off";	
		}		
		
		if (analog3_prox.selected == true) {  //for touch sensor 3, plays the prox videos instead of x10 on/off control
			myXML.analog3_prox = "on";
		}
		else {
			myXML.analog3_prox = "off";	
		}
		
		if (digital1_prox.selected == true) {  //for touch sensor 3, plays the prox videos instead of x10 on/off control
			myXML.digital1_prox = "on";
		}
		else {
			myXML.digital1_prox = "off";	
		}
		
		if (StandAloneCheck.selected == true) {  
			myXML.stand_alone = "on";
		}
		else {
			myXML.stand_alone = "off";	
		}
		
		if (StandAloneWeatherCheck.selected == true) {  
			myXML.stand_alone_weather = "on";
		}
		else {
			myXML.stand_alone_weather = "off";	
		}
		
		if (StandAloneStockCheck.selected == true) {  
			myXML.stand_alone_stock = "on";
		}
		else {
			myXML.stand_alone_stock = "off";	
		}		
		
		if (hardware_mode_select_radio_on.selected == true) {
			myXML.hardware_mode_select = "on"; 
			a4.text = "ON";
		}
		else {myXML.hardware_mode_select = "off";
			a4.text = "OFF"
		}
		
		if (x10_radio_on.selected == true) {
			myXML.x10_commands = "on"; 			
		}
		else {myXML.x10_commands = "off";			
		}		
		
		//if (fullscreen_radio_on.selected == true) {  
			//myXML.screen_mode = "portrait"; 
		//}
		//else {myXML.screen_mode = "landscape"; }
		
		if (screenMode_radio_p90.selected == true) {  
			myXML.screen_mode = "portrait90"; 
		}
		
		if (screenMode_radio_p270.selected == true) {  
			myXML.screen_mode = "portrait270"; 
		}
		
		if (screenMode_radio_l0.selected == true) {  
			myXML.screen_mode = "landscape0"; 
		}
		
		if (screenMode_radio_l180.selected == true) {  
			myXML.screen_mode = "landscape180"; 
		}	
		
		if (verbose_radio_on.selected == true) {
			myXML.verbose = "yes"; 
		}
		else {myXML.verbose = "no"; }
		
		if (AlcoholResults_readout_radio_on.selected == true)  {   
			myXML.display_breathalyzer_text = "on";			
		}
		else {myXML.display_breathalyzer_text = "off"};			
		
		if (stock_readout_radio_on.selected == true)  {   
			myXML.display_stock_text = "on";			
		}
		else {myXML.display_stock_text = "off"};			
		
		if (weather_readout_radio_on.selected == true)  {   
			myXML.display_weather_text = "on";			
		}
		else {myXML.display_weather_text = "off"};			
				
		if (weather_graphic_radio_on.selected == true)  {   
			myXML.display_weather_image = "on";			
		}
		else {myXML.display_weather_image = "off";}			
		
		//******************webcam settings ********
		if (frame_radio_on.selected == true)  {   
			myXML.frame = "on";			
		}
		else {myXML.frame = "off";}		
		
		if (webcamvideo_radio_on.selected == true)  {   
			myXML.webcam_on = "on";			
		}
		else {myXML.webcam_on = "off";}		
		
		if (webcamStealthCheck.selected == true)  {   
			myXML.webcamStealth = "on";			
		}
		else {myXML.webcamStealth = "off";}		
		//********************************************
		
		if (idle_radio_on.selected == true)  {   
			myXML.idle_videos = "on";			
		}
		else {myXML.idle_videos = "off";}					
		
		if (analog0_radio_on.selected == true) {
			myXML.proximity_sensor_on = "on"; 
			a0.text = "ON";
		}
		else {myXML.proximity_sensor_on = "off";
			a0.text = "OFF";		
		}
		
		if (prox2beforeprox1_radio_on.selected == true) {
			myXML.prox2_before_prox1 = "on"; 
		}
		else {myXML.prox2_before_prox1 = "off";
		}
		
		if (switch1_radio_on.selected == true) {
			myXML.switch1 = "on"; 
			d2.text = "ON";
		}
		else {myXML.switch1 = "off";
			d2.text = "OFF";		
		}
		
		if (switch2_radio_on.selected == true) {
			myXML.switch2 = "on"; 
			d3.text = "ON";
		}
		else {myXML.switch2 = "off";
			d3.text = "OFF";		
		}
		
		if (switch3_radio_on.selected == true) {
			myXML.switch3 = "on"; 
			d4.text = "ON";
		}
		else {myXML.switch3 = "off";
			d4.text = "OFF";		
		}
		
		if (switch4_radio_on.selected == true) {
			myXML.switch4 = "on"; 
			d7.text = "ON";
		}
		else {myXML.switch4 = "off";
			d7.text = "OFF";		
		}
		
		if (switch5_radio_on.selected == true) {  //this is the breathalyzer switch so also set the alcohol sensor to on
			myXML.switch5 = "on"; 
			d5.text = "ON";
			myXML.alcohol_sensor = "on";
		}
		else {
			myXML.switch5 = "off";
			d5.text = "OFF";		
			myXML.alcohol_sensor = "off";
		}
		
		if (switch6_radio_on.selected == true) {
			myXML.switch6 = "on"; 
			d6.text = "ON";
		}
		else {myXML.switch6 = "off";
			d6.text = "OFF";		
		}
		
		if (LEDmode_radio_on.selected == true) {
			myXML.LED_mode = "fire"; 
		}
		else {myXML.LED_mode = "indicator";
		}
		
		if (lipsync_checkbox.selected == true) {
			myXML.lipsync_feature = "on"; 
		}
		else {myXML.lipsync_feature = "off";
		}
		
		if (Display_Breathalyzer_Value_check.selected == true)  {   
			myXML.alcohol_display_value = "on";			
		}
		else {myXML.alcohol_display_value = "off"};	
		
		var board_temp2:int;
		board_temp2 = board_version_input.selectedIndex;
		
		switch (board_temp2)  //sets the video playlists based on the mode
				{
				case 0: 			
					myXML.board_version = "1";				
					myXML.analog_input1_pin = "1"; 
					break;
				case 1: 
					myXML.board_version = "2";	
					myXML.analog_input1_pin = "5"; //touch sensor bug fix
					break;				
				case 2: 
					myXML.board_version = "3";	
					myXML.analog_input1_pin = "5"; //touch sensor bug fix
					arduino_version_input.selectedIndex = 1;
					break;		
				case 3: 
					myXML.board_version = "4";	
					myXML.analog_input1_pin = "5"; //touch sensor bug fix
					arduino_version_input.selectedIndex = 1;
					break;				
				case 4: 
					myXML.board_version = "5";	
					myXML.analog_input1_pin = "5"; //touch sensor bug fix
					arduino_version_input.selectedIndex = 1;
					break;					
				default:
					myXML.board_version = "5";	//changed default to 5
				}
		
		var index_temp3:int;
		index_temp3 = house_code_input.selectedIndex;
		
		switch (index_temp3)  //sets the video playlists based on the mode
				{
				case 0: 			

					myXML.x10_house1 = "A";					
					break;
				case 1: 
					myXML.x10_house1 = "B";	
					break;
				case 2: 			
					myXML.x10_house1 = "C";					
					break;
				case 3: 
					myXML.x10_house1 = "D";	
					break;
				case 4: 			
					myXML.x10_house1 = "E";					
					break;
				case 5: 
					myXML.x10_house1 = "F";	
					break;
				case 6: 
					myXML.x10_house1 = "G";	
					break;		
				case 7: 
					myXML.x10_house1 = "H";	
					break;		
				case 8: 
					myXML.x10_house1 = "I";	
					break;		
				case 9: 
					myXML.x10_house1 = "J";	
					break;		
				case 10: 
					myXML.x10_house1 = "K";	
					break;			
				case 11: 
					myXML.x10_house1 = "L";	
					break;			
				case 12: 
					myXML.x10_house1 = "M";	
					break;			
				case 13: 
					myXML.x10_house1 = "N";	
					break;			
				case 14: 
					myXML.x10_house1 = "O";	
					break;				
				case 15: 
					myXML.x10_house1 = "P";	
					break;					
				default:
					myXML.x10_house1 = "A";	
				}
				
		var unit_temp:int;
		unit_temp = unit_code_input.selectedIndex;
		
		switch (unit_temp)  //sets the video playlists based on the mode
				{
				case 0: 			
					myXML.x10_unit1 = "1";					
					break;
				case 1: 
					myXML.x10_unit1 = "2";	
					break;
				case 2: 			
					myXML.x10_unit1 = "3";					
					break;
				case 3: 
					myXML.x10_unit1 = "4";	
					break;
				case 4: 			
					myXML.x10_unit1 = "5";					
					break;
				case 5: 
					myXML.x10_unit1 = "6";	
					break;
				case 6: 
					myXML.x10_unit1 = "7";	
					break;		
				case 7: 
					myXML.x10_unit1 = "8";	
					break;		
				case 8: 
					myXML.x10_unit1 = "9";	
					break;		
				case 9: 
					myXML.x10_unit1 = "10";	
					break;		
				case 10: 
					myXML.x10_unit1 = "11";	
					break;			
				case 11: 
					myXML.x10_unit1 = "12";	
					break;			
				case 12: 
					myXML.x10_unit1 = "13";	
					break;			
				case 13: 
					myXML.x10_unit1 = "14";	
					break;			
				case 14: 
					myXML.x10_unit1 = "15";	
					break;				
				case 15: 
					myXML.x10_unit1 = "16";	
					break;					
				default:
					myXML.x10_unit1 = "2";	
				}		
				
		var index_temp4:int;
		index_temp4 = onoff_house_code_input.selectedIndex;
		
		switch (index_temp4)  //sets the video playlists based on the mode
				{
				case 0: 			
					myXML.x10_house2 = "A";					
					break;
				case 1: 
					myXML.x10_house2 = "B";	
					break;
				case 2: 			
					myXML.x10_house2 = "C";					
					break;
				case 3: 
					myXML.x10_house2 = "D";	
					break;
				case 4: 			
					myXML.x10_house2 = "E";					
					break;
				case 5: 
					myXML.x10_house2 = "F";	
					break;
				case 6: 
					myXML.x10_house2 = "G";	
					break;		
				case 7: 
					myXML.x10_house2 = "H";	
					break;		
				case 8: 
					myXML.x10_house2 = "I";	
					break;		
				case 9: 
					myXML.x10_house2 = "J";	
					break;		
				case 10: 
					myXML.x10_house2 = "K";	
					break;			
				case 11: 
					myXML.x10_house2 = "L";	
					break;			
				case 12: 
					myXML.x10_house2 = "M";	
					break;			
				case 13: 
					myXML.x10_house2 = "N";	
					break;			
				case 14: 
					myXML.x10_house2 = "O";	
					break;				
				case 15: 
					myXML.x10_house2 = "P";	
					break;					
				default:
					myXML.x10_house2 = "A";	
				}
				
		var unit_temp4:int;
		unit_temp4 = onoff_unit_code_input.selectedIndex;
		
		switch (unit_temp4)  //sets the video playlists based on the mode
				{
				case 0: 			
					myXML.x10_unit2 = "1";					
					break;
				case 1: 
					myXML.x10_unit2 = "2";	
					break;
				case 2: 			
					myXML.x10_unit2 = "3";					
					break;
				case 3: 
					myXML.x10_unit2 = "4";	
					break;
				case 4: 			
					myXML.x10_unit2 = "5";					
					break;
				case 5: 
					myXML.x10_unit2 = "6";	
					break;
				case 6: 
					myXML.x10_unit2 = "7";	
					break;		
				case 7: 
					myXML.x10_unit2 = "8";	
					break;		
				case 8: 
					myXML.x10_unit2 = "9";	
					break;		
				case 9: 
					myXML.x10_unit2 = "10";	
					break;		
				case 10: 
					myXML.x10_unit2 = "11";	
					break;			
				case 11: 
					myXML.x10_unit2 = "12";	
					break;			
				case 12: 
					myXML.x10_unit2 = "13";	
					break;			
				case 13: 
					myXML.x10_unit2 = "14";	
					break;			
				case 14: 
					myXML.x10_unit2 = "15";	
					break;				
				case 15: 
					myXML.x10_unit2 = "16";	
					break;					
				default:
					myXML.x10_unit2 = "2";	
				}				
				
		myXML.doorcam_host = ipcamera_url.text;
		myXML.doorcam_port = ipcamera_port.text;
		myXML.doorcam_username = ipcamera_username.text;
		myXML.doorcam_password = ipcamera_password.text;		
		myXML.doorcam_make = ipcamera_dropdown.selectedIndex; 
		myXML.doorcam_path = ipcamera_path.text; 
		
		if (twitter_radio_on.selected == true)  {   
			myXML.twitter_feature = "on";			
		}
		else {myXML.twitter_feature = "off"};			
		
		if (twitter_mode_radio_user.selected == true)  {   //twitter username and password mode
			myXML.twitter_mode = "user";			
		}
		
		if (twitter_mode_radio_mentions.selected == true)  {   //twitter username and password mode
			myXML.twitter_mode = "mentions";			
		}
		
		if (twitter_mode_radio_search.selected == true)  {   //twitter username and password mode
			myXML.twitter_mode = "search";			
		}
		
		//else {myXML.twitter_mode = "search"};			
		
		if (only_my_tweets_checkbox.selected == true) {
			myXML.twitter_my_tweets_only = "on";
		}
		else {
			myXML.twitter_my_tweets_only = "off";			
		}	
		
		if (do_not_speak_twitter_search_term_checkbox.selected == true) {
			myXML.twitter_do_not_speak_search_term = "on";
		}
		else {
			myXML.twitter_do_not_speak_search_term = "off";			
		}	
		
		if (quiz_mode_check.selected == true) {
			myXML.quiz_mode = "on";
		}
		else {
			myXML.quiz_mode = "off";			
		}	
		
		if (no_resize_check.selected == true) {
			myXML.no_resize = "on";
		}
		else {
			myXML.no_resize = "off";			
		}		
		
		if (video_interrupts_check.selected == true) {
			myXML.video_interrupts = "on";
		}
		else {
			myXML.video_interrupts = "off";			
		}		
		
		if (tweetBreathalyzer_checkbox.selected == true) {
			myXML.twitter_breathalyzer = "on";
		}
		else {
			myXML.twitter_breathalyzer = "off";			
		}	
		
		if (Tweet_Breathalyzer_Value_check.selected == true) {
			myXML.twitter_breathalyzer_value = "on";
		}
		else {
			myXML.twitter_breathalyzer_value = "off";			
		}	
		
		if (BreathalyzerNoSwitch_check.selected == true) {
			myXML.alcohol_no_switch = "on";
		}
		else {
			myXML.alcohol_no_switch = "off";			
		}	
		
		myXML.twitter_username = twitter_username_input.text;
		myXML.twitter_password = twitter_password_input.text;
		myXML.twitter_frequency = twitter_frequency_input.text;		
		myXML.twitter_search_term = twitter_search_term_input.text;
		
		if (doorcam_radio_on.selected == true) {
			myXML.doorcam_on = "on"; 
		}
		else {
			myXML.doorcam_on = "off";			
		}
		
		if (photobooth_printing_check.selected == true) {
			myXML.photobooth_printing = "on";
		}
		else {
			myXML.photobooth_printing = "off";			
		}	
		
		if (photobooth_promptprint_check.selected == true) {
			myXML.photobooth_promptprint = "on";
		}
		else {
			myXML.photobooth_promptprint = "off";			
		}	
		
		if (photobooth_save_check.selected == true) {
			myXML.photobooth_save = "on";
		}
		else {
			myXML.photobooth_save = "off";			
		}	
		
		if (photobooth_x10_check.selected == true) {
			myXML.photobooth_x10 = "on";
		}
		else {
			myXML.photobooth_x10 = "off";			
		}	
		
		if (photobooth_leds_check.selected == true) {
			myXML.photobooth_leds = "on";
		}
		else {
			myXML.photobooth_leds = "off";			
		}	
		
		if (photoboothProofPreview_check.selected == true) {
			myXML.photoboothProofPreview = "on";
		}
		else {
			myXML.photoboothProofPreview = "off";			
		}
		
		if (photoboothFacialRecognitionTrigger_check.selected == true) {
			myXML.photobooth_facialRecognitionTrigger = "on";
		}
		else {
			myXML.photobooth_facialRecognitionTrigger = "off";			
		}	
		
		if (photobooth_BackgroundImage_check.selected == true) {
			myXML.photobooth_backgroundcustomimage = "on";
		}
		else {
			myXML.photobooth_backgroundcustomimage = "off";			
		}	
		
		if (photobooth_LogoImage_check.selected == true) {
			myXML.photobooth_logo = "on";
		}
		else {
			myXML.photobooth_logo = "off";			
		}	
		
		myXML.photobooth_startuptext = photobooth_StartupText_textarea.text;
		
		var webcam_restemp:int;
		webcam_restemp = photobooth_WebcamResolution_dropdown.selectedIndex;
		switch (webcam_restemp)  
				{
				case 0: 			
					myXML.photobooth_videoWidth = "160";				
					myXML.photobooth_videoHeight = "120"; 
					break;
				case 1: 
					myXML.photobooth_videoWidth = "320";				
					myXML.photobooth_videoHeight = "240"; 
					break;				
				case 2: 
					myXML.photobooth_videoWidth = "480";				
					myXML.photobooth_videoHeight = "480"; 
					break;		
				case 3: 
					myXML.photobooth_videoWidth = "640";				
					myXML.photobooth_videoHeight = "480"; 
					break;				
				case 4: 
					myXML.photobooth_videoWidth = "720";				
					myXML.photobooth_videoHeight = "720"; 
					break;		
				case 5: 
					myXML.photobooth_videoWidth = "1080";				
					myXML.photobooth_videoHeight = "1080"; 
					break;		
				default:
					myXML.photobooth_videoWidth = "480";				
					myXML.photobooth_videoHeight = "480"; 
				}
				
		var photobooth_papertemp:int;
		photobooth_papertemp = photobooth_PaperSize_dropdown.selectedIndex;
		switch (photobooth_papertemp)  
				{
				case 0: 			
					myXML.photobooth_papersize = "A6";	
					break;
				case 1: 
					myXML.photobooth_papersize = "Letter";		
					break;				
				default:
					myXML.photobooth_papersize = "A6";	
				}		
				
				
				
		myXML.photobooth_print_copies = photobooth_PrintCopies_slider.value;
		myXML.photobooth_fps = photobooth_WebcamFPS_slider.value;
		myXML.photobooth_countdown = photobooth_CountDownFrom_slider.value;
		myXML.photoboothShotDelay = photobooth_ShotDelay_slider.value;
		myXML.photoboothGalleryTimer = photobooth_PhotoPreviewDuration_slider.value;
		myXML.photoboothProofDisplayTime = photobooth_ProofPreviewDuration_slider.value;
				
		myXML.ttsrss_apikey = tts_api_key.text;	
		myXML.ttsyakitome_api_key = tts_api_keyYakitome.text;
		
		var newXMLStr:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + myXML.toXMLString();
		try {
                  filestream.open(file, FileMode.WRITE);
				  filestream.writeUTFBytes(newXMLStr);
                  output.text = "Settings Saved";			
            } catch (error:IOError) {
                  output.text = "IMPORTANT!!! Settings were not saved, re-start this program and Run as Administrator";			
				   AlertManager.createAlert(this, "IMPORTANT!!! Settings were not saved, please re-start this program and Run as Administrator and then you will be able to Save");
				  admin_flag = 1;
            }
		filestream.close(); 	
		
		//filestream.open(file, FileMode.WRITE);
		//filestream.writeUTFBytes(newXMLStr);
		//filestream.close(); 
		//output.text = "Settings Saved";
		
		var myTimer:Timer = new Timer(3000, 1);
        myTimer.addEventListener(TimerEvent.TIMER, ClearOutputText);
        myTimer.start();
		
	}
					
	private function Reset(event:MouseEvent):void {
        ScreenOrientationFlag = 1;
		myXML.weather_zip = "95050";
		myXML.proximity_sensor_trigger1_distance_lower = "40";
		myXML.proximity_sensor_trigger1_distance_upper = "46";
		myXML.quiz_timer = "120";
		myXML.video_interrupts = "off";
		myXML.proximity_sensor_trigger1_time = "100";
		myXML.proximity_sensor_trigger2_distance = "18";		
		myXML.forecast_cutoff = "11";
		myXML.stock_good_threshold = "3";
		myXML.stock_bad_threshold = "-1";		
		
		myXML.tts_feature = "on";
		myXML.custom_audio = "off";
		myXML.tts_avatar = "off";
		myXML.tts_charlimit = "100";		
		myXML.tts_url = "http://translate.google.co.uk/translate_tts?q=";
		myXML.tts_language = "en";
		myXML.tts_sendheader = "on";		
		myXML.tts_headername = "Referer";
		myXML.tts_headervalue = "http://translate.google.com/";				
		
		tts_feature_radio_on.selected = true;
		tts_engine_voicerss.selected = true;
		photobooth_printing_radio_off.selected = true;
		tts_url.text = "http://translate.google.co.uk/translate_tts?q=";
		TTS_languages_dropdown.selectedIndex = 8; //because we're defauling to voicerss
		
		myXML.twitter_my_tweets_only = "off";		
		myXML.twitter_feature = "off";	
		myXML.twitter_username = "magicmirror2000";
		myXML.twitter_password = "mirror";
		myXML.twitter_frequency = "10";
		myXML.twitter_search_term = "speakmirror";
		myXML.twitter_mode = "search";
		myXML.twitter_do_not_speak_search_term = "on";
		myXML.twitter_serviceHost = "http://diymagicmirror.com/proxy";
		myXML.twitter_consumerKey = "xyI9XYpCuz5gjfxzlWyPwA";
		myXML.twitter_consumerSecret = "8YZSrYeTS3gNMgPat1U0RsGK7pqNUBN3ggIHp7hBR8";
				
		twitter_radio_off.selected = true;		
		only_my_tweets_checkbox.selected = false;
		do_not_speak_twitter_search_term_checkbox.selected = true;
		quiz_mode_check.selected = false;
		no_resize_check.selected = false;
		video_interrupts_check.selected = false;
		//twitter_username_input.text = "magicmirror2000";
		//twitter_password_input.text = "mirror";
		twitter_frequency_input.text = "10";		
		twitter_search_term_input.text = "speakmirror";
		twitter_mode_radio_search.selected = true;
		
				
		myXML.good_weather_threshold = "70";
		myXML.startup_delay = "0";
		zip_code_input.text = "95050";
		proximity_sensor_trigger1_distance_lower_input.text = "40";
		proximity_sensor_trigger1_distance_upper_input.text = "46";
		proximity_sensor_trigger1_time_input.text = "100";
		proximity_sensor_trigger2_distance_lower_input.text = "20";
		proximity_sensor_trigger2_distance_upper_input.text = "26";
		proximity_sensor_trigger2_time_input.text = "100";
		proximity_sensor_trigger2_distance_input.text = "18";		
		forecast_cutoff_input.text = "11";
		stock_good_threshold_input.text = "3";
		stock_bad_threshold_input.text = "-1";		
		
		alcohol_baseline_text.text = "300";
	    alcohol_baseline_difference_allowance_text.text = "200";
	    alcohol_level1_text.text = "100";
	    alcohol_level2_text.text = "300";
	    alcohol_level3_text.text = "600";
	    alcohol_countdown_text.text = "6";
		
		myXML.alcohol_sensor = "off";
	    myXML.alcohol_baseline = "100";
	    myXML.alcohol_baseline_difference_allowance = "100";
	    myXML.alcohol_level1 = "100";
	    myXML.alcohol_level2 = "300";
	    myXML.alcohol_level3 = "600";
	    myXML.alcohol_countdown = "6";
	    myXML.alcohol_text_duration = "6";
		
		picture_x_position = 1070;
		picture_y_position = -130;
		picture_rotation = 90;  
		picture_scale = 11.3;					
		alcohol_results_text_x = 820;
		alcohol_results_text_y = 350;
		alcohol_results_text_fontsize = 75;
		alcohol_results_text_rotation = 90;		
		stock_text_x = 750;
		stock_text_y = 471;
		stock_text_fontsize = 72;
		stock_text_rotation = 90;
		weather_text_fontsize = 29;
		weather_text_rotation = 90;		
		weather_text_x = 897;
		weather_text_y = 275.7;
		weather_image_x = 741;
		weather_image_y = 93;		
		weather_image_rotation = 90;		
		weather_image_scale = 1;
		video_scaling_factor = 2.6;
		x_position = 110;
		y_position = -20;
		video_rotation = 0;
		thoughts_image_x = 570;
		thoughts_image_y = 390;
		thoughts_image_scale = .9;
		thoughts_image_rotate = 90;
		doorcam_x = 800;
		doorcam_y = 250;
		doorcam_rotate = 90;
		doorcam_scale = .45;
		doorcam_video_x = 130;
		doorcam_video_y = 186;
		doorcam_video_scale = 1.27;			
		
		myXML.video_scaling_factor = video_scaling_factor;  //animation positioning
		myXML.x_position = x_position;
		myXML.y_position = y_position;
		myXML.video_rotation = video_rotation;
		
		myXML.alcohol_results_text_x = alcohol_results_text_x;
		myXML.alcohol_results_text_y = alcohol_results_text_y;
		myXML.alcohol_results_text_fontsize = alcohol_results_text_fontsize;
		myXML.alcohol_results_text_rotation = alcohol_results_text_rotation;		
				
		myXML.stock_text_x = stock_text_x;
		myXML.stock_text_y = stock_text_y;
		myXML.stock_text_fontsize = stock_text_fontsize;
		myXML.stock_text_rotation = stock_text_rotation;		
			
		myXML.weather_text_x = weather_text_x;  //weather readout
		myXML.weather_text_y = weather_text_y;
		myXML.weather_text_fontsize = weather_text_fontsize;
		myXML.weather_text_rotation = weather_text_rotation;
				
		myXML.picture_x_position = picture_x_position; //picasa slideshow
		myXML.picture_y_position = picture_y_position;
		myXML.picture_rotation  = picture_rotation; 
		myXML.picture_scale = picture_scale;						
				
		myXML.weather_image_x = weather_image_x; //weather graphic
		myXML.weather_image_y  = weather_image_y;		
		myXML.weather_image_rotation = weather_image_rotation;				
		myXML.weather_image_scale = weather_image_scale;				
				
		//com_port_input.text = "5336";
		good_weather_threshold_input.text = "70";
		startup_delay_input.text = "0";
		
		picasa_id_input.text = "magicmirror2000"
		album_id.text = "5306254408597153889";	
		album_url.text = "http://lh4.ggpht.com/_VgC3-P6sPnE/SaOaRVhIqGE/AAAAAAAAAB8/lBQOxSQy-BU/s160-c/DIYMagicMirror.jpg";		
		album_name.text = "DIY Magic Mirror";
		
		slide_duration_input.text = "5";	
		ipcamera_url.text = "thepoolcam.dyndns.tv";
		ipcamera_path.text = "/axis-cgi/mjpg/video.cgi";
		ipcamera_port.text = "80";
		
		ipcamera_dropdown.selectedIndex = 1;
		
		
		//ipcamera_username = "";
		//ipcamera_password = "";
 		myXML.doorcam_host = "thepoolcam.dyndns.tv";
        myXML.doorcam_path =  "/axis-cgi/mjpg/video.cgi"; 
        myXML.doorcam_make = "1";
        myXML.doorcam_port = "80";
		myXML.doorcam_x = "600";
        myXML.doorcam_y = "100";
  		myXML.doorcam_rotate = "90";
        myXML.doorcam_scale = ".5";
        myXML.doorcam_username = "";
        myXML.doorcam_password = "";
		
		weather_reading_input.selectedIndex = 0; //show it visually
		myXML.weather_reading = "f"; //write up too
			
		mirror_mode_input.selectedIndex = 0; //show it visually
		myXML.mirror_mode = "princess";
		
		com_port_drop.selectedIndex = 2; //show it visually
		myXML.com_port = "5333";
		
		myXML.board_version = "5";
		board_version_input.selectedIndex = 4 //show it visually too
		
		quiz_correctanswer_drop.selectedIndex = 0; //show it visually
		myXML.quiz_correctanswer = "0";
		
		prox2beforeprox1_radio_on.selected = true;
		myXML.prox2_before_prox1 = "on";
					
		video_resolution_radio_high.selected = true;
		myXML.video_resolution = "high"; 
		
		analog1_radio_off.selected = true;
		myXML.analog_input1 = "off";
		a1.text = "OFF";
		
		analog2_radio_off.selected = true;
		myXML.analog_input2 = "off";
		a2.text = "OFF";
		
		analog3_radio_off.selected = true;
		myXML.analog_input3 = "off";
		a3.text = "OFF";
		
		myXML.analog1_video1 = "off";
		analog1_video1_check.selected = false;
		
		myXML.analog2_video2 = "off";
		analog2_video2_check.selected = false;
		
		myXML.analog3_video3 = "off";
		analog3_video3_check.selected = false;
		
		myXML.digital2_video1 = "off";
		digital2_video1_check.selected = false;
		
		myXML.digital3_video2 = "off";
		digital3_video2_check.selected = false;
		
		myXML.digital5_video3 = "off";
		digital5_video3_check.selected = false;
		
		myXML.analog3_prox = "off";
		analog3_prox.selected = false;
		
		myXML.digital1_prox = "off";
		digital1_prox.selected = false;
		
		hardware_mode_select_radio_on.selected = true;
		myXML.hardware_mode_select = "on";	
		a4.text = "ON";
		
		LEDmode_radio_off.selected = true;
		myXML.LED_mode = "indicator";
		
		//screenMode_radio_p90.selected = true;
		screenMode_radio_l0.selected = true;
		myXML.full_screen = "no";	
		myXML.screen_mode = "landscape0";  //in 7.8, this was portrait90, changed to this
		//myXML.screen_mode = "portrait90";	
		
		verbose_radio_off.selected = true;
		myXML.verbose = "yes"; 
		
		AlcoholResults_readout_radio_on.selected = true;
		myXML.display_breathalyzer_text = "on";		
		
		stock_readout_radio_on.selected = true;
		myXML.display_stock_text = "on";			
		
		twitter_radio_off.selected = true;
		myXML.twitter_feature = "off";		
		
		weather_readout_radio_on.selected = true;  
		myXML.display_weather_text == "on";
		
		weather_graphic_radio_on.selected = true;  
		myXML.display_weather_image == "on";	
		
		frame_radio_on.selected = false;  
		myXML.frame == "off";	
		
		webcamvideo_radio_on.selected = false;  
		myXML.webcam_on == "off";	
		
		idle_radio_on.selected = true;  
		myXML.idle_videos == "on";					
		
		doorcam_radio_on.selected = false;  
		myXML.doorcam_on == "off";					
				
		//digital_switches_radio_on.selected = true;
		//myXML.digital_switches = "on"; 
		//d2.text = "OFF";
		//d3.text = "OFF";
		//d4.text = "OFF";
		//d7.text = "ON";
		//d5.text = "OFF";
		
		analog0_radio_off.selected = true;
		myXML.proximity_sensor_on = "off"; 
		a0.text = "OFF";
		
		var newXMLStr:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + myXML.toXMLString();
		filestream.open(file, FileMode.WRITE);
		filestream.writeUTFBytes(newXMLStr);
		filestream.close();
		output.text = "Settings Reverted to Defaults & Saved";
    }
	
	private function rotate_objects(event:Event):void {   //this function not used
		if (screenMode_radio_p90.selected == true)  {   //reset to portrait mode
				//var relative:Point = new Point (myVid.x,myVid.y);
				//var global_location:Point = myVid.localToGlobal(add here);
				video_rotation = 0;
				myVid.rotation = video_rotation;
				x_position = 0;
				y_position = 0;
				myVid.x = x_position;
				myVid.y = y_position;
				//myVid.x=myVid.stage.stageWidth/2-myVid.width/2;
				//myVid.y=myVid.stage.stageHeight/2-myVid.height/2;		
				video_scaling_factor = 1;
				myVid.setScale(video_scaling_factor,video_scaling_factor);
				//myVid.x = x_position;
				//myVid.x = myVidx_original - x_position;
				//myVid.y = myVidy_original - y_position;
				
				stock_text_rotation = 90;
				stock_display.rotation = stock_text_rotation;
				stock_display.x = 850;
				stock_display.y = 380;
				weather_text_rotation = 90;
				weather_display2.rotation = weather_text_rotation;
				weather_display2.x = 900;
				weather_display2.y = 320;
				weather_image.x = 820;
				weather_image.y = 100;			
				weather_image.rotation = 90;		
				//frame.x = 820;
				//frame.y = 100;			
				frame.rotation = 90;			
				//myVid.x=myVid.stage.stageWidth/2-myVid.width/2;
				//myVid.y=myVid.stage.stageHeight/2-myVid.height/2;						
			}
			else {  //reset to landscape mode
				
				
				x_position = 242;  //242 and 780
				y_position = 780;
				//myVid.y = y_position;
				myVid.x = x_position;
				myVid.y = y_position;
				video_scaling_factor = 1;
				myVid.setScale(video_scaling_factor,video_scaling_factor);
				video_rotation = 270;
				myVid.rotation = video_rotation;
				
				weather_text_rotation = 0;
				weather_display2.rotation = weather_text_rotation;
				stock_text_rotation = 0;
				stock_display.rotation = stock_text_rotation;				
				
				
				stock_display.x = 620;
				stock_display.y = 120;
				weather_display2.x = 500;
				weather_display2.y = 120;
				weather_image.x = 200;
				weather_image.y = 150;
				weather_image.rotation = 0;		
				frame.x = 200;
				frame.y = 150;
				frame.rotation = 0;		
				//myVid.x=(myVid.stage.stageWidth / 2) - (myVid.width / 2);
				//myVid.y=(myVid.stage.stageHeight /2) - (myVid.height / 2) + myVid.height;		
			}			
	}
	
	private function ClearOutputText (event:TimerEvent):void {
		 if (admin_flag == 0) {
			 output.text = "";
			 myTimer.reset();
		 }
		 else {
			 myTimer.reset(); 
		 }
	 }
	
	private function secondDelayTimer(e:TimerEvent):void {
		initial_values_done = 1; //loop			
	}
	
	private function thoughtsLoaded (event:Event):void {
		thoughts_image = Bitmap(thoughtsLoader.content);
		thoughts_bitmapdata = thoughts_image.bitmapData;
		addChild(thoughts_image);
		thoughts_image.visible = false;						
		//thoughts_image.x = doorcam.x - 240;
		//thoughts_image.y = doorcam.y + 200;
		thoughts_image.scaleX = thoughts_image_scale;
		thoughts_image.scaleY = thoughts_image_scale;
		thoughts_image.rotation = thoughts_image_rotate;		
		thoughts_image.x = thoughts_image_x;
		thoughts_image.y = thoughts_image_y;		
		//thoughts_image.scaleX = thoughts_image_scale;
		//thoughts_image.scaleY = thoughts_image_scale;
		//thoughts_image = doorcam_scale;										
	}
	
	
	
	//public function onGetAlbumsComplete(evt : PicasaDataEvent) : void  //google killed this api
	//{
	//	//responder2.removeEventListener(PicasaDataEvent.DATA, onGetAlbumsComplete);			
	//	imageArray.splice(0,imageArray.length);

	//	var item : Object;	
	//	for(var a : int = 0; a < evt.data.entries.length; a++)
	//	{
	//		item = evt.data.entries[a];
	//		imageArray.push(item.media.content.url); //add the URL of each image to the imageArray			
	//	}		
	//	PicasaLoaded = 1; //set this flag so the rest of the program knows it loaded correctly
	//	if (picasa_positioning_flag == 1) { //means its in the picasa positioning mode so run the slideshow
	//		trace("went here to positiong");
	//		StartSlideShow();			
	//	}
	//}
	 
	 private function StartSlideShow():void {			
			picasa_positioning_flag = 0;
			if (PicasaLoaded == 1) {			
				if (SlideShowStarted == 0) {
					SlideShowRunning = 1; //set the flag so the analog and digital inputs do not go off
					myVid.visible = false; //hide the video
					pic.visible = true;
					trace(imageArray);
					URLString = imageArray[i];
					pic.source = URLString		
					//pic.rotation = 90;
					//pic.x = 820;			
					//pic.y = -100;							
					//imageTimer = new Timer(slide_delay_seconds);
					var sdelay:int = int(slide_duration_input.text) * 1000;
					imageTimer = new Timer(sdelay);
					imageTimer.addEventListener(TimerEvent.TIMER, switchImage);
					imageTimer.start();
					SlideShowStarted = 1;  //set this so this routine only runs once
				}
			}
			else {
				
			}
	}
	
	 private function StopSlideShow():void {			
			SlideShowRunning = 0; //set the flag so the analog and digital inputs do not go off
			SlideShowStarted = 0;
			myVid.visible = true; //hide the video
			pic.visible = false;
			imageTimer.stop();
			i=0;
			//if (myXML.slideshow_restart_switch == "on") {
				//i=0; //reset the slideshow
			//}
			//else {
				//keep the same i and continue the slideshow when the switch is flipped back again
			//}			
	}

	private function switchImage(e:TimerEvent):void {
					
			if(i < imageArray.length-1){ //check if its at the end and reset if so
				i++;
				URLString = imageArray[i];
				pic.source = URLString
			} else{  					//end of the line
				i = 0;
				URLString = imageArray[i];
				pic.source = URLString
			}										
	}
	
	  
	private function change_orientation_event(e:Event):void { //this is now really setting portrait and landscape parameters
	
		ScreenOrientationFlag = 1; //set this flag telling the user the program must be re-started
	
		if (screenMode_radio_p90.selected == true) { //default portrait mode
			picture_x_position = 1070;
			picture_y_position = -130;
			picture_rotation = 90;  
			picture_scale = 11.3;				
			alcohol_results_text_x = 820;
			alcohol_results_text_y = 350;
			alcohol_results_text_fontsize = 75;
			alcohol_results_text_rotation = 90;			
			stock_text_x = 750;
			stock_text_y = 471;
			stock_text_fontsize = 72;
			stock_text_rotation = 90;
			weather_text_fontsize = 29;
			weather_text_rotation = 90;		
			weather_text_x = 897;
			weather_text_y = 275.7;
			
			weather_image_x = 741;
			weather_image_y = 93;		
			weather_image_rotation = 90;		
			weather_image_scale = 1;
			
			frame_x = 900;
			frame_y = 33;		
			frame_rotation = 90;		
			frame_scale = 1.1;
			
			beer_image_x = 754;
			beer_image_y = 540;		
			beer_image_rotation = 90;		
			beer_image_scale = 1;
			
			twitterbird_image_x = 761;
			twitterbird_image_y = 63;		
			twitterbird_image_rotation = 90;		
			twitterbird_image_scale = .35;
			
			webcamvideo_x = 860;
			webcamvideo_y = 53;		
			webcamvideo_rotation = 90;		
			webcamvideo_scale = 1;
			
			video_scaling_factor = 2.6;
			x_position = 110;
			y_position = -20;
			video_rotation = 0;
			thoughts_image_x = 570;
			thoughts_image_y = 390;
			thoughts_image_scale = .9;
			thoughts_image_rotate = 90;
			doorcam_x = 800;
			doorcam_y = 250;
			doorcam_rotate = 90;
			doorcam_scale = .45;
			doorcam_video_x = 130;
			doorcam_video_y = 186;
			doorcam_video_scale = 1.27;	
			
			lip1_x = 457;
			lip1_y = 303;
			lip1_rotation = 90;
			lip1_scale = 1.2000000000000002;
			
			
		}
		
		if (screenMode_radio_p270.selected == true) { //default landscape mode
			picture_x_position = -60;
			picture_y_position = 940;
			picture_rotation = 270;  
			picture_scale = 11.35;							
			alcohol_results_text_x = 300;
			alcohol_results_text_y = 370;
			alcohol_results_text_fontsize = 75;
			alcohol_results_text_rotation = 270;			
			stock_text_x = 260;
			stock_text_y = 192;
			stock_text_fontsize = 72;
			stock_text_rotation = 270;
			weather_text_fontsize = 29;
			weather_text_rotation = 270;		
			weather_text_x = 214;
			weather_text_y = 389.7;
			
			weather_image_x = 231;
			weather_image_y = 672;		
			weather_image_rotation = 270;		
			weather_image_scale = 1;
			
			frame_x = 75;
			frame_y = 630;		
			frame_rotation = 90;		
			frame_scale = 1.1;
			
			beer_image_x = 290;
			beer_image_y = 185;		
			beer_image_rotation = 270;		
			beer_image_scale = 1;
			
			twitterbird_image_x = 191;
			twitterbird_image_y = 652;		
			twitterbird_image_rotation = 270;		
			twitterbird_image_scale = .35;
			
			webcamvideo_x = 110;
			webcamvideo_y = 610;		
			webcamvideo_rotation = 90;		
			webcamvideo_scale = 1;
						
			video_scaling_factor = 2.6;
			x_position = 920;
			y_position = 760;
			video_rotation = 180;
			thoughts_image_x = 430;
			thoughts_image_y = 370;
			thoughts_image_scale = .9;
			thoughts_image_rotate = 270;
			doorcam_x = 200;
			doorcam_y = 510;
			doorcam_rotate = 270;
			doorcam_scale = .45;
			doorcam_video_x = 830;
			doorcam_video_y = 566;
			doorcam_video_scale = 1.12;			
			
			lip1_x = 574;
			lip1_y = 438;
			lip1_rotation = 270;
			lip1_scale = 1.2000000000000002;
			
		}
			
		if (screenMode_radio_l0.selected == true) { //default landscape mode
			picture_x_position = -260;
			picture_y_position = -290;
			picture_rotation = 0;  
			picture_scale = 14;							
			alcohol_results_text_x = 500;
			alcohol_results_text_y = 100;
			alcohol_results_text_fontsize = 75;
			alcohol_results_text_rotation = 0;						
			stock_text_x = 643;
			stock_text_y = 85;
			stock_text_fontsize = 72;
			stock_text_rotation = 0;
			weather_text_fontsize = 29;
			weather_text_rotation = 0;		
			weather_text_x = 530;
			weather_text_y = 56.7;
			
			weather_image_x = 184;
			weather_image_y = 87;		
			weather_image_rotation = 0;		
			weather_image_scale = 1;
			
			frame_x = 776;
			frame_y = 40;		
			frame_rotation = 0;		
			frame_scale = .44;
			
			beer_image_x = 634;
			beer_image_y = 87;		
			beer_image_rotation = 0;		
			beer_image_scale = 1;
			
			twitterbird_image_x = 166;
			twitterbird_image_y = 73;		
			twitterbird_image_rotation = 0;		
			twitterbird_image_scale = .35;
			
			webcamvideo_x = 810;
			webcamvideo_y = 100;		
			webcamvideo_rotation = 0;		
			webcamvideo_scale = .55;			
			
			video_scaling_factor = 2.25;
			x_position= 140;
			y_position= 710;
			video_rotation = 270;
			thoughts_image_x = 550;
			thoughts_image_y = 260;
			thoughts_image_scale = .9;
			thoughts_image_rotate = 0;
			doorcam_x = 500;
			doorcam_y = 30;
			doorcam_rotate = 0;
			doorcam_scale = .45;
			doorcam_video_x = 280;
			doorcam_video_y = 726;
			doorcam_video_scale = 1.42;			
			
			lip1_x = 422;
			lip1_y = 412;
			lip1_rotation = 0;
			lip1_scale = 1;
		}
		
		if (screenMode_radio_l180.selected == true) { 
			
			picture_x_position = 1160;
			picture_y_position = 970;
			picture_rotation = 180;  
			picture_scale = 11.9;							
			alcohol_results_text_x = 630;
			alcohol_results_text_y = 550;
			alcohol_results_text_fontsize = 75;
			alcohol_results_text_rotation = 180;						
			stock_text_x = 395;
			stock_text_y = 532;
			stock_text_fontsize = 72;
			stock_text_rotation = 180;
			weather_text_fontsize = 29;
			weather_text_rotation = 180;		
			weather_text_x = 631;
			weather_text_y = 616.7;
			
			weather_image_x = 836;
			weather_image_y = 546;		
			weather_image_rotation = 180;		
			weather_image_scale = 1;
			
			frame_x = 929;
			frame_y = 627;		
			frame_rotation = 180;		
			frame_scale = 1.1;
			
			beer_image_x = 387;
			beer_image_y = 530;		
			beer_image_rotation = 180;		
			beer_image_scale = 1;
			
			twitterbird_image_x = 866;
			twitterbird_image_y = 576;		
			twitterbird_image_rotation = 180;		
			twitterbird_image_scale = .35;
			
			webcamvideo_x = 910;
			webcamvideo_y = 590;		
			webcamvideo_rotation = 180;		
			webcamvideo_scale = 1;
			
			
			video_scaling_factor = 2.25;
			x_position = 890;
			y_position = -10;
			video_rotation = 90;
			thoughts_image_x = 490;
			thoughts_image_y = 440;
			thoughts_image_scale = .9;
			thoughts_image_rotate = 180;
			doorcam_x = 530;
			doorcam_y = 660;
			doorcam_rotate = 180;
			doorcam_scale = .45;
			doorcam_video_x = 680;
			doorcam_video_y = 36;
			doorcam_video_scale = 1.12;		
			
			lip1_x = 612;
			lip1_y = 289;
			lip1_rotation = 180;
			lip1_scale = 1.05;
		}
			
	}
			
	public function switch_mode():void
        {	 							
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
				}
				
				trace ("idle clip" + idle_clip);
				
			//*** now reset things that were in a state of playing back to idle mode
			proximity_counter = 0;  //reset the proximity counter
			proximity1_do_not_play_again = 0; 
			proximity_flag = 0;
			video_playing = 0; 
			FirstProxVideoPlaying = 0;						
						
			//***************************************************************
			
			myVid.play("file:///"+idle_clip);
		    myVid.visible = false;
				
       }
		
	private function weatherUpdate():void {		
		//if (internet == 1) {  //only if we have internet
			//WeatherLoader.load(new URLRequest("http://weather.yahooapis.com/forecastrss?p=" + weather_zip + "&u=" + weather_reading));			
		//}
		//else {
			weather_code = 32;
			pictLdr.load(new URLRequest("file:///"+homepath + weather_images_url + String(weather_code) + "d.png"));  //load the yahoo weather icon graphic		
			WeatherForecastText = "Sunny All Day High: 80 Low:68";
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
				
				WeatherForecastText = (temp_text + "," + " High: " + temp_high + " Low: " + temp_low);
				pictLdr.load(new URLRequest("file:///"+homepath + weather_images_url + String(weather_code) + "d.png"));  //load the yahoo weather icon graphic	
			}
		}
		
		private function imgLoaded(event:Event):void
		{
			var theImage:DisplayObject = pictLdr.content; //have to do this due to some weird AS3 problem, documented here http://blog.morscad.com/code-snippets/argumenterror-error-2025-the-supplied-displayobject-must-be-a-child-of-the-caller/comment-page-1/#comment-3938
			pictLdr.unload();
			weather_image = theImage as Bitmap;			
			if (display_weather_image == "on") {
				weather_image.visible = false;						
			}
					
			WeatherdynImage.x = weather_image.x;
			WeatherdynImage.y = weather_image.y;
			weather_image.x = weather_image.y = 0;
			addChild(WeatherdynImage);				
			
			weather_image.x = weather_image_x;   //200 default for landscape
			weather_image.y = weather_image_y;   //150 default for landscape
			weather_image.rotation = weather_image_rotation;  //0 default for landscape
			weather_image.scaleX = weather_image_scale;
			weather_image.scaleY = weather_image_scale;		
			
			WeatherdynImage.addChild(weather_image);
			weather_image.visible = false;			
			weather(); //now call the weather function to play the weather video and show image, the error handler function will also call it in the event this image load fails
			
		}
		
			
		private function FrameImageLoaded(event:Event):void
		{
			var theImage:DisplayObject = Frame_Loader.content; //have to do this due to some weird AS3 problem, documented here http://blog.morscad.com/code-snippets/argumenterror-error-2025-the-supplied-displayobject-must-be-a-child-of-the-caller/comment-page-1/#comment-3938
			Frame_Loader.unload();
			frame = theImage as Bitmap;			
			
			FramedynImage.x = frame.x;
			FramedynImage.y = frame.y;
			frame.x = frame.y = 0;
			addChild(FramedynImage);				
			
			frame.x = frame_x;   //200 default for landscape
			frame.y = frame_y;   //150 default for landscape
			frame.rotation = frame_rotation;  //0 default for landscape
			frame.scaleX = frame_scale;
			frame.scaleY = frame_scale;			
			FramedynImage.addChild(frame);
			
			frame.visible = false; //make it false because we don't show at the initial admin screen
			
		}
		
		private function BeerImageLoaded(event:Event):void
		{
			var theImage:DisplayObject = Beer_Loader.content; //have to do this due to some weird AS3 problem, documented here http://blog.morscad.com/code-snippets/argumenterror-error-2025-the-supplied-displayobject-must-be-a-child-of-the-caller/comment-page-1/#comment-3938
			Beer_Loader.unload();
			beer_image = theImage as Bitmap;			
			
			BeerdynImage.x = beer_image.x;
			BeerdynImage.y = beer_image.y;
			beer_image.x = beer_image.y = 0;
			addChild(BeerdynImage);				
			
			beer_image.x = beer_image_x;   //200 default for landscape
			beer_image.y = beer_image_y;   //150 default for landscape
			beer_image.rotation = beer_image_rotation;  //0 default for landscape
			beer_image.scaleX = beer_image_scale;
			beer_image.scaleY = beer_image_scale;			
			BeerdynImage.addChild(beer_image);
			
			beer_image.visible = false; //make it false because we don't show at the initial admin screen
			
		}
		
		private function TwitterBirdImageLoaded(event:Event):void
		{
			var theImage:DisplayObject = TwitterBird_Loader.content; //have to do this due to some weird AS3 problem, documented here http://blog.morscad.com/code-snippets/argumenterror-error-2025-the-supplied-displayobject-must-be-a-child-of-the-caller/comment-page-1/#comment-3938
			TwitterBird_Loader.unload();
			twitterbird_image = theImage as Bitmap;			
			
			TwitterBirddynImage.x = twitterbird_image.x;
			TwitterBirddynImage.y = twitterbird_image.y;
			twitterbird_image.x = twitterbird_image.y = 0;
			addChild(TwitterBirddynImage);				
			
			twitterbird_image.x = twitterbird_image_x;   //200 default for landscape
			twitterbird_image.y = twitterbird_image_y;   //150 default for landscape
			twitterbird_image.rotation = twitterbird_image_rotation;  //0 default for landscape
			twitterbird_image.scaleX = twitterbird_image_scale;
			twitterbird_image.scaleY = twitterbird_image_scale;			
			TwitterBirddynImage.addChild(twitterbird_image);
			
			twitterbird_image.visible = false; //make it false because we don't show at the initial admin screen
			
		}
				
		
		private function Lip1ImageLoaded(event:Event):void
		{
			var theImage:DisplayObject = Lip1_Loader.content; //have to do this due to some weird AS3 problem, documented here http://blog.morscad.com/code-snippets/argumenterror-error-2025-the-supplied-displayobject-must-be-a-child-of-the-caller/comment-page-1/#comment-3938
			Lip1_Loader.unload();
			lip1 = theImage as Bitmap;			
			
			Lip1dynImage.x = lip1.x;
			Lip1dynImage.y = lip1.y;
			lip1.x = lip1.y = 0;
			addChild(Lip1dynImage);				
			
			lip1.x = lip1_x;   //200 default for landscape
			lip1.y = lip1_y;   //150 default for landscape
			lip1.rotation = lip1_rotation;  //0 default for landscape
			lip1.scaleX = lip1_scale;
			lip1.scaleY = lip1_scale;			
			Lip1dynImage.addChild(lip1);
			
			lip1.visible = false; //make it false because we don't show at the initial admin screen
			
		}
			
		private function weather():void {
			
		if (weather_first_time == 0) { //don't play on the first time
			switch (weather_code)  //sets the video playlists based on the mode
						{
					case "0": //tornado						
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "1": //tropical storm
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "2": //hurricane
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "3": //severe thunderstorms
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "4": //thunderstorms
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "5": //mixed rain and snow
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "6": //mised rain and sleet
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "7": //mised snow and sleet
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "8": //freezing drizzle
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "9": //drizzle
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "10": //freezing rain
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "11": //showers
						myVid.play("file:///"+weather_rain_clip);
						break;	
					case "12": //showers
						myVid.play("file:///"+weather_rain_clip);
						break;	
					case "13": //snow flurries
						myVid.play("file:///"+weather_rain_clip);
						break;	
					case "14": //light snow showers
						myVid.play("file:///"+weather_rain_clip);
						break;	
					case "15": //blowing snow
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "16": //snow
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "17": //hail
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "18": //sleet
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "19": //dust
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "20": //foggy
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "21": //haze
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "22": //smoky
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "23": //blustery
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "24": //windy
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "25": //cold
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "26": //cloudy
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;	
					case "27": //mostly cloudy (day)
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;	
					case "28": //mostly cloudy (night)
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;	
					case "29": //partly cloudy (night)
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;		
					case "30": //partly cloudy (day)
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "31": //clear (night)
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "32": //sunny
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "33": //fair (night)
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "34": //fair (day)
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "35": //mixed rain and hail
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "36": //hot
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;
					case "37": //isoldated thunderstorms
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "38": //scattered thunderstorms
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "39": //scattered thunderstorms
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "40": //scattered showers
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "41": //heavy snow
						myVid.play("file:///"+weather_rain_clip);
						break;	
					case "42": //scattered snow showers
						myVid.play(weather_rain_clip);
						break;	
					case "43": //heavy snow
						myVid.play("file:///"+weather_rain_clip);
						break;	
					case "44": //partly cloudy
						if (weather_high > good_weather_threshold) {
							myVid.play("file:///"+weather_good_clip); }
						else {myVid.play("file:///"+weather_ok_clip);}
						break;		
					case "45": //thundershowers
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "46": //snow showers
						myVid.play("file:///"+weather_rain_clip);
						break;
					case "47": //isoldated thundershowers
						myVid.play("file:///"+weather_rain_clip);
						break;	
					case "3200": //not available
						myVid.play("file:///"+weather_ok_clip);	
						break;
					default:
						myVid.play("file:///"+no_internet_clip);								
					}	//end case			
		} //end if
			
				weather_first_time = 0;
				WeatherDisplayTextTimer.start(); //start the timer to delay 1 second before displaying weather text 
			
	} //end weather function
	
	private function WeatherDisplayTextTimerEvent(e:TimerEvent):void { 	
			 weather_display2.text = WeatherForecastText;	
			 weather_display2.visible = false;											 
			 WeatherDisplayTextTimer.reset(); //reset the timer so it can play again			
			
	}
	
	private function WeatherDisplayTextTimerEvent5s(e:TimerEvent):void { 	
			 if (display_weather_text == "on") {
			 	weather_display2.visible = false;	//its been 5s so now turn off the text
			 }
			 
			 if (display_weather_image == "on") {
				 weather_image.visible = false;
			 }
			 else weather_image.visible = false;
			 WeatherDisplayTextTimer5s.reset(); //reset the 5 second timer
	}		
	
	private function WeatherLoaderioErrorHandler(event:IOErrorEvent):void {
          trace("Weather Loader Error Trapped ioErrorHandler: " + event);		
		  myVid.play("file:///"+no_internet_clip);
	}
	
	private function pictLdrioErrorHandler(event:IOErrorEvent):void {
		  trace("Weather Image Loader Error Trapped ioErrorHandler: " + event);
		  weather();		  
	}
	
	private function Frame_LoaderioErrorHandler(event:IOErrorEvent):void {
		  trace("Frame Image Loader Error Trapped ioErrorHandler: " + event);
	}
	
	private function Beer_LoaderioErrorHandler(event:IOErrorEvent):void {
		  trace("Beer Image Loader Error Trapped ioErrorHandler: " + event);
	}
	
	private function TwitterBird_LoaderioErrorHandler(event:IOErrorEvent):void {
		  trace("Twitter Bird Image Loader Error Trapped ioErrorHandler: " + event);
	}
	
	private function Lip1_LoaderioErrorHandler(event:IOErrorEvent):void {
		  trace("Lip1 Image Loader Error Trapped ioErrorHandler: " + event);
	}
		
	
	
	private function stockUpdate():void { //stockLoaded function will fire once the event is done from the event listener above		
		if (internet == 1) {	
			stockLoader.load(new URLRequest("http://download.finance.yahoo.com/d/quotes.csv?s=" + stock_string + "&f=c1&e=.csv"));		
		}
		else {
			stockPriceChange = 1;
			stock();			
		}
	}
	
	private function stockLoaded(evt:Event):void //triggered when file was loaded
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
			trace ("Stock Price Change Is: " + stockPriceChange);
			stock(); //call the main function to play the videos
			
	} // end stockLoaded function
			
	private function stock():void {
		
		if (stockPriceChange > stock_good_threshold) {
			
			if (first_time == 1) { //don't play on the first time
				StockTextFormat.color = 0x00CC33;  //green				
			}
			else {
				StockTextFormat.color = 0x00CC33;  //green
				myVid.play("file:///"+stock_up_clip);
			}
			
			
			//stock_display.backgroundColor = 0x00CC33; //green background			
		}
		if (stockPriceChange < stock_bad_threshold) {
			
			if (first_time == 1) {
				StockTextFormat.color = 0xFF0033; //red				
			}
			else {
				StockTextFormat.color = 0xFF0033; //red
				myVid.play("file:///"+stock_down_clip);							
			}		
		}
		
		if ((stockPriceChange < stock_good_threshold) && (stockPriceChange > stock_bad_threshold)) {
			
			if (first_time == 1) {
				StockTextFormat.color = 0xF5F5F5; //white
			}
			else {  //if its not the first time, then play the normal stuff
				StockTextFormat.color = 0xF5F5F5; //white
				myVid.play("file:///"+stock_no_change_clip);		
			}					
		}				
		first_time = 0;		
		StockDisplayTextTimer.start(); //start the timer to delay 1 second before displaying stock text
		
	}	
	
	private function StockDisplayTextTimerEvent(e:TimerEvent):void { 
	    //stock_display.visible = true;
		stock_display.defaultTextFormat = StockTextFormat; //need to reapply this again since we changed the font colors above
		if (display_stock_text == "on") {
			stock_display.visible = false;
		}
		if (stockPriceChange > 0) {  //the number is postive
			stock_display.text = ("+" + String(stockPriceChange)); //displays the stock text; 
			StockDisplayTextTimer.reset(); //reset the timer so it can play again			
		}
		
		else {
			stock_display.text = String(stockPriceChange); //displays the stock text; 
			StockDisplayTextTimer.reset(); //reset the timer so it can play again
		}
		//StockDisplayTextTimer5s.start();
	}
	
	private function StockDisplayTextTimerEvent5s(e:TimerEvent):void { 	
			 if (display_stock_text == "on") {
			 	//stock_display.visible = true;	//its been 5s so now turn off the text
			 }
			 	StockDisplayTextTimer5s.reset(); //start the 5 second timer			
			 
	}		
			
			
    private function stockLoaderioErrorHandler(event:IOErrorEvent):void {
		   myVid.play("file:///"+no_internet_clip);
	}
			
		private function al(event:MouseEvent):void {        //remove, this is an arduino simulator call
			//myVid.play(weather_good_clip);
			weatherUpdate();			
		}
		
				
		private function stock_button(event:MouseEvent):void {     //set a flag so when the user does again, stock goes away, better to set on timer
			stock_display.visible = false;	
			stockUpdate();			
		}
		
		private function door_button():void {     //set a flag so when the user does again, stock goes away, better to set on timer
			
			if (doorcam_on == "on") {   //show the doorcam while the doorbell video is playing if its on
				myVid.setScale(doorcam_video_scale,doorcam_video_scale); //scale the video down to make room for webcam
				myVid.x = doorcam_video_x;
				myVid.y = doorcam_video_y;		
				if (screen_mode == "potrait") {  //where to place the thoughts graphic which is a relative location to the doorcam coordinates
					myVid.rotation = 0;				
				}
				else {
					myVid.rotation = 270;				
				}		
				
				myVid.play("file:///"+doorbell_clip);
				doorcamTimer.start(); //need to add a delay here to the webcam and thoughts image pop up after the doorbell video is playing as opposed to before						
			}
			else {				
					myVid.play("file:///"+doorbell_clip); //just play the normal doorbell clip with no doorcam or thoughts graphic
				}
		}		
	
	private function doorcamTimerEvent(e:TimerEvent):void { 
		    // if we went here, then the doorcam is on
			doorcam.visible = true;  //show the doorcam
			thoughts_image.visible = true;  //show the thoughts image			
			trace ("doorcam width " + doorcam.width);
			//need to make the character smaller to make room for the webcam video feed
			
		doorcamTimer.reset();		  
	}
		
		
		///// ***************************************************
		
		private function onClipDone(e:fl.video.VideoEvent):void {   //loop to idle clip when nothing going on
				
				if (myVid2.source == "file:///"+doorbell_clip) {  //if idle clip reached the end which should never happen
					myVid2.play("file:///"+idle_clip);
				}
				
			if (myVid.source == "file:///"+proximity1_clip) {  //do this when the first proximity clip has finished playing
				proximity_flag = 1; //set the flag after the first proximity clip has played to allow the seoncd to play
				proximity_counter = 0;  //reset the counter for the first clip
				proximity1_do_not_play_again = 1;			
			}
			
			if (myVid.source == "file:///"+proximity2_clip ) {  // do this when the second proximity clip has finished playing
				proximity_counter = 0; //reset the proximity counter
				proximity1_do_not_play_again = 0; //set the flag after the second proxity clip has played so the first one doesn't play again interrupting		
				FirstProxVideoPlaying = 0; //flag for proximity led
				
			}
			
			
			if (myVid.source != proximity1_clip && myVid.source != proximity2_clip) {  //do this when the first proximity clip has finished playing
				proximity_counter = 0;  //reset the proximity counter
				proximity1_do_not_play_again = 0; 
				proximity_flag = 0;				
			}
			
					
			if (myVid.source == "file:///"+idle_clip) {  //if idle clip reached the end which should never happen
				trace("played dup clip");
				myVid.seek(0);
				idle_end_seek_flag = 1;							
			}
			else {		
					myVid.play("file:///"+idle_clip);
					trace("played idle clip");				
			}		
			
			video_playing = 0; //reset this now that the video has stopped playing, now another analog video can play
		}  // end on clip down function
		
		private function NavigationCuePoints(eventObject:MetadataEvent):void {   //loop to idle clip when nothing going on
		   var cue_point = eventObject.info.name;
		   
		   if (cue_point == "idle_end") { 		      
			   myVid.seek(0); // go to beginning of idle loop
			  // myVid2.seek(0); // go to beginning of idle loop
			   trace ("did a re-wind");			 
		   }	  
	     } //end function
		
		private function onSeekedEvent(e:fl.video.VideoEvent):void {   //when done seeking back to beginning, play the idle video
		 	
			trace("reached seek event");
			
			if (idle_end_seek_flag == 1) {
				
					myVid.play("file:///"+idle_clip);
				
				trace("reached seek event on idle end");
				
				
				idle_end_seek_flag = 0; //reset the flag
			}
			else   {			
				
					myVid.play("file:///"+idle_clip);
			}
			
	     }		
		

		// *** add initArduino() function here //////
	private function initArduino():void {
			initial_values(); //now that arduino is initialized, get the initial values for the digital switches
			
		} //end initarduino
		//  ******************************** //////
		
		public function initial_values():void
        {
         	 
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
			}
		
		//reset the proximity flags as the were playing earlier
		proximity_counter = 0;  //reset the proximity counter
		proximity1_do_not_play_again = 0; 
		proximity_flag = 0;
		//*************************************************
		myVid.play("file:///" + idle_clip);
		idle_start_playing = 1;
			
			
       } //end initial values
		
	
	}  // end class
}  // end package

