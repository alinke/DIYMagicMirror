package {
	import flash.display.MovieClip;
	
	import flash.net.*;
	import flash.events.*;
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.DisplayObject;	
	import fl.controls.TextArea;
	import fl.controls.Button;
	import fl.controls.RadioButton;
	import fl.controls.RadioButtonGroup;
	import fl.controls.ComboBox;
	import fl.controls.CheckBox;
	import net.eriksjodin.arduino.Arduino;
	import net.eriksjodin.arduino.events.ArduinoEvent;
	import flash.display.Sprite;
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
	import flash.net.Socket;
	import flash.utils.ByteArray;
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
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.events.HTTPStatusEvent;
	import flash.net.*;
	import com.yahoo.astra.fl.managers.AlertManager;
	import com.swfjunkie.tweetr.Tweetr;
    import com.swfjunkie.tweetr.oauth.OAuth;
    import com.swfjunkie.tweetr.oauth.events.OAuthEvent;
	import flash.display.Sprite;
    import flash.geom.Rectangle;
    import flash.html.HTMLLoader;
	import fl.controls.Slider;
	import fl.events.SliderEvent;
	import fl.controls.Label;
	import flash.display.NativeMenu; 
    import flash.display.NativeMenuItem; 
    import flash.display.NativeWindow;
	
	public class basic_config extends MovieClip {
	  private var xmlLoader:URLLoader;		 
	  private var foundArduino:int=0;
	  private var SerproxyRunning:int=0;
	
	  private var com_port;
		
	  private var aa:Arduino;
	  private var bb:Arduino;
	  private var cc:Arduino;
	  private var dd:Arduino;
	  private var ee:Arduino;
	  private var ff:Arduino;
	  private var gg:Arduino;
	  private var hh:Arduino;
	  private var ii:Arduino;
		
	private var noArduinoFoundTimer:Timer;
	private var myTimer:Timer = new Timer(3000, 1);
	private var myTimer2:Timer = new Timer(3000, 1);
	private var SerproxyCheckTimer:Timer;
	private var myFont:Font = new MyriadFont();	//used for stock text							
	private var admin_flag:int = 0;
	
	private var index_selected:int;
	private var stock_counter:int=0; //the total number of stocks
	private var first_stock:int=0;	
	private var temp_stock_array:Array = new Array(); //used as a temp holder for the stocks
	
	private var weather_code;	
	private var weather_high:int;
	private var good_weather_threshold:int;
	
	private var myXML:XML = new XML();
	private var myXMLold:XML = new XML();
	private var file:File = new File(); 
	private var file2:File = new File(); 
	private var file3:File = new File(); 
	private var PhotoSaveDir:File = new File(); 
	private var photoboothOverlayImagePath:File = new File();
	private var photoboothLogoPath:File = new File();
	private var filestream:FileStream = new FileStream();
	private var AlertTextFormat:TextFormat = new TextFormat();
	private var StartupTextFormat:TextFormat = new TextFormat(); //this is the formatter for the startup text field
	private var StartupText:TextField = new TextField;	
	private var ArduinoFound:TextArea = new TextArea;
	
	private var tweetr:Tweetr;
    private var oauth:OAuth;
    private var htmlLoader:HTMLLoader;
	
	private var radiotext:TextFormat = new TextFormat();
	
	private var switch5_radio_on:RadioButton = new RadioButton;
	private var switch5_radio_off:RadioButton = new RadioButton;
	private var switch5_rgb:RadioButtonGroup = new RadioButtonGroup("switch5_rgb");	
	private var switch4_radio_on:RadioButton = new RadioButton;
	private var switch4_radio_off:RadioButton = new RadioButton;
	private var switch4_rgb:RadioButtonGroup = new RadioButtonGroup("switch4_rgb");	
	private var analog1_radio_on:RadioButton = new RadioButton;
	private var analog1_radio_off:RadioButton = new RadioButton;
	private var analog1_rgb:RadioButtonGroup = new RadioButtonGroup("analog1_rgb");
	private var analog2_radio_on:RadioButton = new RadioButton;
	private var analog2_radio_off:RadioButton = new RadioButton;
	private var analog2_rgb:RadioButtonGroup = new RadioButtonGroup("analog2_rgb");
	private var analog3_radio_on:RadioButton = new RadioButton;
	private var analog3_radio_off:RadioButton = new RadioButton;
	private var analog3_rgb:RadioButtonGroup = new RadioButtonGroup("analog3_rgb");
	private var twitter_rbg:RadioButtonGroup = new RadioButtonGroup("twitter_rbg");
	private var twitter_mode_rbg:RadioButtonGroup = new RadioButtonGroup("twitter_mode_rbg");
	private var TTS_rbg:RadioButtonGroup = new RadioButtonGroup("TTS_rbg");
	
	private var tts_feature_radio_on:RadioButton = new RadioButton; 
	private var tts_feature_radio_off:RadioButton = new RadioButton;
	private var photobooth_printing_radio_on:RadioButton = new RadioButton; 
	private var photobooth_printing_radio_off:RadioButton = new RadioButton;
	
	
	private var twitter_mode_radio_user:RadioButton = new RadioButton; 
	private var twitter_mode_radio_search:RadioButton = new RadioButton;
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
	private var blow_tts:TextField = new TextField();
	private var wait_tts:TextField = new TextField();
	private var warning_tts:TextField = new TextField();
	private var TTSTextFormat:TextFormat = new TextFormat;	
	
	private var photoboothTextLabelFormat:TextFormat = new TextFormat;
	private var photobooth_Screen_Label:TextField = new TextField();
	private var photobooth_Screen_LabelFormat:TextFormat = new TextFormat;		
	
	private var tts_feature_label:TextField = new TextField();  //radio button
	private var tts_url_label:TextField = new TextField();
	private var tts_language_label:TextField = new TextField();  //drop down
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
	private var TTSTextLabelFormat:TextFormat = new TextFormat;
	
	private var only_my_tweets_checkbox:CheckBox = new CheckBox();
	private var do_not_speak_twitter_search_term_checkbox:CheckBox = new CheckBox();
	private var tweetBreathalyzer_checkbox:CheckBox = new CheckBox();
	

	private var TTS_Screen_Label:TextField = new TextField();
	private var TTS_Screen_LabelFormat:TextFormat = new TextFormat;		
	
	private var black_square:Sprite = new Sprite();
	
	private var onoff_house_code_input:ComboBox = new ComboBox();
	private var onoff_unit_code_input:ComboBox = new ComboBox();
	
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
	
	private var photobooth_printing_rbg:RadioButtonGroup = new RadioButtonGroup("photobooth_printing_rbg");
	
	private var SaveButton:Button = new Button();
	private var goBackMain:Button = new Button();
	private var twitterAuthButton:Button = new Button();
	
  private var flashPlayerVersion:String = Capabilities.version;
	  private var osArray:Array = flashPlayerVersion.split(' ');
	  private var osType:String = osArray[0]; //The operating system: WIN, MAC, LNX
	  private var versionArray:Array = osArray[1].split(',');//The player versions. 9,0,115,0
	  private var majorVersion:Number = parseInt(versionArray[0]);
	  private var majorRevision:Number = parseInt(versionArray[1]);
	  private var minorVersion:Number = parseInt(versionArray[2]);
	  
	  private var fileMenu:NativeMenuItem; 
	
	
	public function basic_config():void {
				
			//stage.align = StageAlign.TOP_LEFT;
			//stage.scaleMode = StageScaleMode.NO_BORDER;
			//var window:NativeWindow = stage.nativeWindow;
			//window.maximize();  
			
			AlertTextFormat.color = 0x000000; //black
			AlertTextFormat.font = myFont.fontName;
			AlertTextFormat.size = 30;  //70 default		
			AlertManager.overlayAlpha = .8;
			AlertManager.maxWidth = 800;
			AlertManager.hasDropShadow = true;
			AlertManager.setMessageBoxStyle("textFormat", AlertTextFormat);	
			//output.visible = false;
			
			file = File.documentsDirectory; 						
			file = file.resolvePath("diymagicmirror-settings/mirrorconfig.xml"); //now see if the config file is there				
			
			if (file.exists == false) {  //config file not there so create it
				CreateConfig();				
			}
								
			switch (osType) {
					case "MAC":					
						
						file2 = File.desktopDirectory;						
						file2 = file2.resolvePath("../../../Applications/DIY Magic Mirror/mirror.app/Contents/Resources/");	
						break;					
					case "WIN":													
						file3 = file3 = File.desktopDirectory;	
						file3 = file3.resolvePath("../../../Program Files/DIY Magic Mirror/mirror/mirror.exe");							
						
						file2 = File.desktopDirectory;	
						file2 = file2.resolvePath("../../../Program Files/DIY Magic Mirror/mirror/");							
						
						if (file3.exists == false) {  //if still false, then must be 64-bit
							file2 = File.desktopDirectory;						
							file2 = file2.resolvePath("../../../Program Files (x86)/DIY Magic Mirror/mirror/");							
						}
						break;						
					case "LNX":
						file2 =  File.desktopDirectory;
						file2 = file2.resolvePath("../../../opt/DIY Magic Mirror/mirror/share");	
						break;						
					default:
						output.text = "Unable to detect OS";
						trace ("Unable to detect OS");		
						file3 = file3 = File.desktopDirectory;	
						file3 = file3.resolvePath("../../../Program Files/DIY Magic Mirror/mirror/mirror.exe");							
						
						file2 = File.desktopDirectory;	
						file2 = file2.resolvePath("../../../Program Files/DIY Magic Mirror/mirror/");							
						
						if (file3.exists == false) {  //if still false, then must be 64-bit
							file2 = File.desktopDirectory;						
							file2 = file2.resolvePath("../../../Program Files (x86)/DIY Magic Mirror/mirror/");							
						}
						break;						
				}  //end switch
			
			saveButton.addEventListener(MouseEvent.CLICK, saveValue);
			updates_button.addEventListener(MouseEvent.CLICK,updates);
			
			add_stock_button.addEventListener(MouseEvent.CLICK, add_stock);
			clear_stock_button.addEventListener(MouseEvent.CLICK, clear_stock);
			twitterAuthButton.addEventListener(MouseEvent.CLICK,twitterOauthEvent);
			
			
			
			TTSButton.addEventListener(MouseEvent.CLICK, TTSButtonEvent);
			photoboothButton.addEventListener(MouseEvent.CLICK, photoboothButtonEvent);
			goBackMain.addEventListener(MouseEvent.CLICK, goBackMainScreen);
			
			
			RunMirror(); //configure the Arduino port and then can do the rest of the config
			
			
           
	}   // end mirror function *************************************
		
		public function RunMirror():void { //triggered after config file loaded
			
			PhotoSaveDir = File.documentsDirectory; //this is used later for the photobooth path
			PhotoSaveDir = PhotoSaveDir.resolvePath("diymagicmirror-settings/Photobooth/Photos");
			
			arduino_detected.text = "Searching...";
			
			radiotext.color = 0x333333;
			radiotext.font = "Arial";
			radiotext.size = 15;	
			
			switch5_radio_on.group = switch5_rgb;
			switch5_radio_off.group = switch5_rgb;
			switch4_radio_on.group = switch4_rgb;
			switch4_radio_off.group = switch4_rgb;
			analog1_radio_on.group = analog1_rgb;
			analog1_radio_off.group = analog1_rgb;
			analog2_radio_on.group = analog2_rgb;
			analog2_radio_off.group = analog2_rgb;
			analog3_radio_on.group = analog3_rgb;
			analog3_radio_off.group = analog3_rgb;
			tts_feature_radio_on.group = TTS_rbg; 
	    	tts_feature_radio_off.group = TTS_rbg;
			
			photobooth_printing_radio_on.group = photobooth_printing_rbg; 
	   		photobooth_printing_radio_off.group = photobooth_printing_rbg;
			
			StartupTextFormat.font = myFont.fontName;
			StartupTextFormat.size = 40; 
			StartupText.autoSize = TextFieldAutoSize.CENTER;		
			StartupText.embedFonts = true;
			StartupText.selectable = false;
			StartupTextFormat.color = 0x00CC33; //green			
			StartupText.antiAliasType = AntiAliasType.ADVANCED;		
			
			StartupText.x = 400;   //500 default for landscape
			StartupText.y = 250;    //120 default for landscape
						
			StartupText.defaultTextFormat = StartupTextFormat;
			addChild(StartupText);
			//StartupText.text = "Looking for the Magic Mirror Sensor Hub...";
			//StartupText.visible = true;
			//output.text = "Looking for the Magic Mirror Sensor Hub...";
			
			filestream.open(file, FileMode.READ);
			myXML = XML(filestream.readUTFBytes(filestream.bytesAvailable));			
			filestream.close();	
			
			CheckConfigVersion();			
			
			//trace(myXML);
			PopulateValues();
			BuildUI();
			
			twitter_mode_rbg.addEventListener(Event.CHANGE, TwitterModeChanged);	
			photoboothProofPreview_check.addEventListener(Event.CHANGE, photoboothProofPreview_checkChanged);	
			photobooth_printing_check.addEventListener(Event.CHANGE, photobooth_printing_checkChanged);		
						
			aa = new Arduino("127.0.0.1", 5331); //connect to serial proxy server
			aa.addEventListener(Event.CONNECT,onSocketConnect); 
			aa.addEventListener(Event.CLOSE,onSocketClose);			
			aa.addEventListener(ArduinoEvent.FIRMWARE_VERSION, onReceiveFirmwareVersion);			
			
			bb = new Arduino("127.0.0.1", 5332); //connect to serial proxy server
			bb.addEventListener(ArduinoEvent.FIRMWARE_VERSION, onReceiveFirmwareVersion);			
			
			cc = new Arduino("127.0.0.1", 5333); //connect to serial proxy server
			cc.addEventListener(ArduinoEvent.FIRMWARE_VERSION, onReceiveFirmwareVersion);			
			
			dd = new Arduino("127.0.0.1", 5334); //connect to serial proxy server
			dd.addEventListener(ArduinoEvent.FIRMWARE_VERSION, onReceiveFirmwareVersion);
			
			ee = new Arduino("127.0.0.1", 5335); //connect to serial proxy server
			ee.addEventListener(ArduinoEvent.FIRMWARE_VERSION, onReceiveFirmwareVersion);
			
			ff = new Arduino("127.0.0.1", 5336); //connect to serial proxy server
			ff.addEventListener(ArduinoEvent.FIRMWARE_VERSION, onReceiveFirmwareVersion);
			
			gg = new Arduino("127.0.0.1", 5337); //connect to serial proxy server
			gg.addEventListener(ArduinoEvent.FIRMWARE_VERSION, onReceiveFirmwareVersion);
			
			hh = new Arduino("127.0.0.1", 5338); //connect to serial proxy server
			hh.addEventListener(ArduinoEvent.FIRMWARE_VERSION, onReceiveFirmwareVersion);
			
			ii = new Arduino("127.0.0.1", 5339); //connect to serial proxy server
			ii.addEventListener(ArduinoEvent.FIRMWARE_VERSION, onReceiveFirmwareVersion);
			
			SerproxyCheckTimer = new Timer(3000,1); 
			SerproxyCheckTimer.addEventListener(TimerEvent.TIMER_COMPLETE, noSerproxyEvent);		  
			SerproxyCheckTimer.start();	
			
			noArduinoFoundTimer = new Timer(10000,1); 		
			noArduinoFoundTimer.addEventListener(TimerEvent.TIMER_COMPLETE, noArduinoFoundTimerEvent);		  
			noArduinoFoundTimer.start();	
			
			
			
				  
	        
	  } // ********end RunMirror initMediaPlayer function ***********
	   
	
	private function setupComboBox():void { //setup the combo boxes

			
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
			TTS_languages_dropdown.addItem( { label: "Vietnamese", data:"vi" } );
			
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
			
			photobooth_WebcamResolution_dropdown.addItem( { label: "160", data:0 } );
			photobooth_WebcamResolution_dropdown.addItem( { label: "320", data:1 } );
			photobooth_WebcamResolution_dropdown.addItem( { label: "480", data:2 } );
			photobooth_WebcamResolution_dropdown.addItem( { label: "640", data:3 } );
			photobooth_WebcamResolution_dropdown.addItem( { label: "720 HD", data:4 } );
			photobooth_WebcamResolution_dropdown.addItem( { label: "1080 HD", data:5 } );
			
			photobooth_PaperSize_dropdown.addItem( { label: "Photo Size 4 x 6", data:0 } );
			photobooth_PaperSize_dropdown.addItem( { label: "Letter 8.5 x 11", data:1 } );
	}
	
	private function BuildUI():void {
		
		
		
		TTSTextFormat.font = myFont.fontName;
		TTSTextFormat.size = 14;	
		TTSTextFormat.color = 0x000000; //black	
		
		TTSTextLabelFormat.font = myFont.fontName;
		TTSTextLabelFormat.size = 14;	
		TTSTextLabelFormat.color = 0xFFFFFF; //white	
		
		photoboothTextLabelFormat.font = myFont.fontName;
		photoboothTextLabelFormat.size = 14;	
		photoboothTextLabelFormat.color = 0xFFFFFF; //white	
		
		photobooth_Screen_LabelFormat.font = myFont.fontName;
		photobooth_Screen_LabelFormat.size = 36;	
		photobooth_Screen_LabelFormat.color =  0xFFFFFF; //white	
		
		TTS_Screen_LabelFormat.font = myFont.fontName;
		TTS_Screen_LabelFormat.size = 20;	
		TTS_Screen_LabelFormat.color =  0xFFFFFF; //white	
 
		SaveButton.x = 470.45;
		//SaveButton.y = 610;
		SaveButton.y = 610;
		SaveButton.width = 133.95;
		SaveButton.height = 36.10;
		SaveButton.label = "Save";
		addChild(SaveButton);
		SaveButton.visible = false;
		
		only_my_tweets_checkbox.x = 566.35;
		only_my_tweets_checkbox.y = 178.35;
		only_my_tweets_checkbox.width = 204.15;
		only_my_tweets_checkbox.height = 22;
		only_my_tweets_checkbox.label = "Speak Only Tweets Entered by Me";
		addChild(only_my_tweets_checkbox);
		only_my_tweets_checkbox.visible = true;
		
		do_not_speak_twitter_search_term_checkbox.x = 647.40;
		do_not_speak_twitter_search_term_checkbox.y = 201.91;
		do_not_speak_twitter_search_term_checkbox.width = 179.15;
		do_not_speak_twitter_search_term_checkbox.height = 22;
		do_not_speak_twitter_search_term_checkbox.label = "Don't Speak Search Term";
		addChild(do_not_speak_twitter_search_term_checkbox);
		do_not_speak_twitter_search_term_checkbox.visible = true;
		
		tweetBreathalyzer_checkbox.x = 439.90;
		tweetBreathalyzer_checkbox.y = 226.55;
		tweetBreathalyzer_checkbox.width = 186.85;
		tweetBreathalyzer_checkbox.height = 22;
		tweetBreathalyzer_checkbox.label = "Tweet My Breathalyzer Results";
		addChild(tweetBreathalyzer_checkbox);
		tweetBreathalyzer_checkbox.visible = true;
		
		SaveButton.addEventListener(MouseEvent.CLICK, saveValue); //this is the save button in the TTS screen
		
		goBackMain.x = 680;
		goBackMain.y = 4.85;
		goBackMain.width = 99.90;
		goBackMain.height = 22;
		goBackMain.label = "Go Back";
		addChild(goBackMain);
		goBackMain.visible = false;
		
		twitterAuthButton.x = 439.65;
		twitterAuthButton.y = 148.85;
		twitterAuthButton.width = 139.80;
		twitterAuthButton.height = 22;
		twitterAuthButton.label = "Link Twitter Account";
		addChild(twitterAuthButton);
		twitterAuthButton.visible = true;
		
		twitter_mode_radio_user.group = twitter_mode_rbg;
		twitter_mode_radio_search.group = twitter_mode_rbg;
		
		twitter_mode_radio_user.x = 439.90; 
	    twitter_mode_radio_user.y = 179.35;
		twitter_mode_radio_user.label = "";
		twitter_mode_radio_search.x = 439.90; 
	    twitter_mode_radio_search.y = 203;
		twitter_mode_radio_search.label = "";		
		
		addChild (twitter_mode_radio_user);
		addChild (twitter_mode_radio_search);		
		
		tts_feature_radio_on.group = TTS_rbg; 
	    tts_feature_radio_off.group = TTS_rbg;
		
		tts_feature_radio_on.x = 250; 
	    tts_feature_radio_on.y = 234.65;
		tts_feature_radio_on.setStyle("textFormat", radiotext);
		tts_feature_radio_on.textField.autoSize = TextFieldAutoSize.LEFT;
		tts_feature_radio_on.label = "ON";			
		tts_feature_radio_off.x = 330; 
	    tts_feature_radio_off.y = 234.65;
		tts_feature_radio_off.setStyle("textFormat", radiotext);
		tts_feature_radio_off.textField.autoSize = TextFieldAutoSize.LEFT;
		tts_feature_radio_off.label = "OFF";
		
		addChild (tts_feature_radio_on);
		addChild (tts_feature_radio_off);		
		
		setupComboBox();
		
		
		
		
		TTS_Screen_Label.embedFonts = true;
		TTS_Screen_Label.antiAliasType = AntiAliasType.ADVANCED;
		TTS_Screen_Label.defaultTextFormat = TTS_Screen_LabelFormat;
		TTS_Screen_Label.x = 10;
		TTS_Screen_Label.y = 10;
		TTS_Screen_Label.width = 400;
		TTS_Screen_Label.height = 22;
		TTS_Screen_Label.text = "Text to Speech Settings";			
		addChild(TTS_Screen_Label);	
		TTS_Screen_Label.visible = false;
		
		tts_feature_label.embedFonts = true;
		tts_feature_label.antiAliasType = AntiAliasType.ADVANCED;
		tts_feature_label.defaultTextFormat = TTSTextLabelFormat;
		tts_feature_label.x = 10;
		tts_feature_label.y = 40;
		tts_feature_label.width = 200;
		tts_feature_label.height = 18;
		tts_feature_label.text = "Text to Speech (TTS)";			
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
		
		tts_language_label.embedFonts = true;
		tts_language_label.antiAliasType = AntiAliasType.ADVANCED;
		tts_language_label.defaultTextFormat = TTSTextLabelFormat;
		tts_language_label.x = 10;
		tts_language_label.y = 60;
		tts_language_label.width = 200;
		tts_language_label.height = 18;
		tts_language_label.text = "TTS Language";			
		addChild(tts_language_label);	
		tts_language_label.visible = false;
		
		TTS_languages_dropdown.dropdownWidth = 210; 
		TTS_languages_dropdown.width = 200;  
		TTS_languages_dropdown.x = 200;  
		TTS_languages_dropdown.y = 60;  		
		//TTS_languages_dropdown.prompt = "Select Language"; 
		//TTS_languages_dropdown.addEventListener(Event.CHANGE, changeHandler); 
		addChild(TTS_languages_dropdown); 
		TTS_languages_dropdown.visible = false;
		
		
		
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
		weather_ok_tts.visible = false ;
		
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
		tts_instructions.width = 700;
		tts_instructions.height = 40;
		tts_instructions.text = "Add the text for the Magic Mirror to speak for the events above. TTS (Text to Speech) can handle a maximum of 100 characters for each event. The Magic Mirror automatically adds text to the end of the Weather and Stock events. To use TTS, run the Magic Mirror and turn the character select knob until you hear 'Custom Audio Mode'.";			
		addChild(tts_instructions);	
		tts_instructions.visible = false;
		
		photobooth_Screen_Label.embedFonts = true;
		photobooth_Screen_Label.antiAliasType = AntiAliasType.ADVANCED;
		photobooth_Screen_Label.defaultTextFormat = photobooth_Screen_LabelFormat;
		photobooth_Screen_Label.x = 77.50;
		photobooth_Screen_Label.y = 55;
		photobooth_Screen_Label.width = 350;
		photobooth_Screen_Label.height = 40;
		photobooth_Screen_Label.text = "Photobooth Settings";	
		addChild(photobooth_Screen_Label);	
		photobooth_Screen_Label.visible = false;	
		
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
		
		onoff_house_code_input.x = 416.05;
		onoff_house_code_input.y = 242.85;
		onoff_house_code_input.width = 48;
		onoff_house_code_input.height = 22;
		onoff_house_code_input.setStyle("textFormat", photoboothTextLabelFormat);
		addChild(onoff_house_code_input);
		onoff_house_code_input.visible = false;
		
		onoff_unit_code_input.x = 594.15;
		onoff_unit_code_input.y = 242.85;
		onoff_unit_code_input.width = 48;
		onoff_unit_code_input.height = 22;
		onoff_unit_code_input.setStyle("textFormat", photoboothTextLabelFormat);
		addChild(onoff_unit_code_input);
		onoff_unit_code_input.visible = false;
		
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
		
		addChild (photobooth_printing_radio_on);
		addChild (photobooth_printing_radio_off);	
		
		photobooth_printing_radio_on.visible = false;
		photobooth_printing_radio_off.visible = false;
		
		black_square.graphics.lineStyle(1,0x000000);
		black_square.graphics.beginFill(0x000000);
		black_square.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
		black_square.graphics.endFill();
		black_square.x = stage.stageWidth/2-black_square.width/2;
		black_square.y = stage.stageHeight/2-black_square.height/2;
		addChildAt(black_square,1);
		black_square.visible = false;
		
		twitter_username_input.text = myXML.twitter_username;
		//twitter_password_input.text = myXML.twitter_password; //no longer used with oAuth now
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
				
		
		if (myXML.twitter_feature == "on")  {
			twitter_radio_on.selected = true;			
		}
		else {twitter_radio_off.selected = true;			
		}
		
		if (myXML.twitter_breathalyzer == "on") {
			tweetBreathalyzer_checkbox.selected = true ;
		}
		else {
			tweetBreathalyzer_checkbox.selected = false ;			
		}		
		
		
		if (myXML.twitter_mode == "user")  {
			twitter_mode_radio_user.selected = true;	
			twitter_search_term_input.enabled = false;
			do_not_speak_twitter_search_term_checkbox.enabled = false;
		}
		else {
			twitter_mode_radio_search.selected = true; //we're in twitter search mode
			twitter_username_input.enabled = false;
			//twitter_password_input.enabled = false;
			only_my_tweets_checkbox.enabled = false;
		}
		
		  if (myXML.twitter_authenticated == "yes") {
				  twitterAuthButton.label = "Change Twitter Account";
				  twitter_username_input.text = myXML.twitter_username;
		  }
		  else {
			  twitterAuthButton.label = "Link Twitter Account";
			  twitter_username_input.text = "";
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
			
			if (myXML.photobooth_printing == "on")  { 
				photobooth_printing_radio_on.selected = true;			
			}
			else {photobooth_printing_radio_off.selected = true;			
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
		
	}
	
	
	
	private function TwitterModeChanged(event:Event):void {    
		if (twitter_mode_radio_user.selected == true)  {  //we're in twitter user mode so grey out the search stuff
			twitter_search_term_input.enabled = false;
			do_not_speak_twitter_search_term_checkbox.enabled = false;
			twitter_username_input.enabled = true;
			//twitter_password_input.enabled = true;
			only_my_tweets_checkbox.enabled = true;
		}
		else {
			twitter_username_input.enabled = false;
			//twitter_password_input.enabled = false;
			only_my_tweets_checkbox.enabled = false;
			twitter_search_term_input.enabled = true;
			do_not_speak_twitter_search_term_checkbox.enabled = true;
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
	
	private function PopulateValues():void {
		
			
			//*** now set the TTL language
		var language_temp:String;
		language_temp = myXML.tts_language;
		switch (language_temp)  
				{
				case "en": 			
					TTS_languages_dropdown.selectedIndex = 0;
					break;
				case "es":
					TTS_languages_dropdown.selectedIndex = 1;
					break;
				case "de": 
					TTS_languages_dropdown.selectedIndex = 2;
					break;
				case "fr": 
					TTS_languages_dropdown.selectedIndex = 3;
					break;	
				case "it": 			
					TTS_languages_dropdown.selectedIndex = 4;
					break;
				case "hi":
					TTS_languages_dropdown.selectedIndex = 5;
					break;
				case "af": 
					TTS_languages_dropdown.selectedIndex = 6;
					break;
				case "cs": 
					TTS_languages_dropdown.selectedIndex = 7;
					break;		
				case "hr": 
					TTS_languages_dropdown.selectedIndex = 8;
					break;			
				case "nl": 			
					TTS_languages_dropdown.selectedIndex = 9;
					break;
				case "da":
					TTS_languages_dropdown.selectedIndex = 10;
					break;
				case "fi": 
					TTS_languages_dropdown.selectedIndex = 11;
					break;
				case "el": 
					TTS_languages_dropdown.selectedIndex = 12;
					break;	
				case "ht": 			
					TTS_languages_dropdown.selectedIndex = 13;
					break;
				case "hu":
					TTS_languages_dropdown.selectedIndex = 14;
					break;
				case "id": 
					TTS_languages_dropdown.selectedIndex = 15;
					break;
				case "is": 
					TTS_languages_dropdown.selectedIndex = 16;
					break;		
				case "lv": 
					TTS_languages_dropdown.selectedIndex = 17;
					break;				
				case "mk": 			
					TTS_languages_dropdown.selectedIndex = 18;
					break;
				case "no":
					TTS_languages_dropdown.selectedIndex = 19;
					break;
				case "pl": 
					TTS_languages_dropdown.selectedIndex = 20;
					break;
				case "pt": 
					TTS_languages_dropdown.selectedIndex = 21;
					break;	
				case "ro": 			
					TTS_languages_dropdown.selectedIndex = 22;
					break;
				case "sr":
					TTS_languages_dropdown.selectedIndex = 23;
					break;
				case "sk": 
					TTS_languages_dropdown.selectedIndex = 24;
					break;
				case "ru": 
					TTS_languages_dropdown.selectedIndex = 25;
					break;		
				case "sw": 
					TTS_languages_dropdown.selectedIndex = 26;
					break;			
				case "sv": 			
					TTS_languages_dropdown.selectedIndex = 27;
					break;
				case "tr":
					TTS_languages_dropdown.selectedIndex = 28;
					break;
				case "vi": 
					TTS_languages_dropdown.selectedIndex = 29;
					break;
				default:
					TTS_languages_dropdown.selectedIndex = 0;
				}		
		
			
			if (myXML.tts_feature == "on")  {
				tts_feature_radio_on.selected = true;			
			}
				else {tts_feature_radio_off.selected = true;			
			}
			
			
			
			
			switch5_radio_on.x = 250;
			switch5_radio_on.y = 94;
			switch5_radio_on.setStyle("textFormat", radiotext);
			switch5_radio_on.textField.autoSize = TextFieldAutoSize.LEFT;		
			switch5_radio_on.label = "ON";		
			switch5_radio_off.x = 330;
			switch5_radio_off.y = 94;
			switch5_radio_off.setStyle("textFormat", radiotext);
			switch5_radio_off.textField.autoSize = TextFieldAutoSize.LEFT;
			switch5_radio_off.label = "OFF";		
			addChild (switch5_radio_on);
			addChild (switch5_radio_off);
			
			switch4_radio_on.x = 250;
			switch4_radio_on.y = 268;
			switch4_radio_on.setStyle("textFormat", radiotext);
			switch4_radio_on.textField.autoSize = TextFieldAutoSize.LEFT;		
			switch4_radio_on.label = "ON";		
			switch4_radio_off.x = 330;
			switch4_radio_off.y = 268;
			switch4_radio_off.setStyle("textFormat", radiotext);
			switch4_radio_off.textField.autoSize = TextFieldAutoSize.LEFT;
			switch4_radio_off.label = "OFF";		
			addChild (switch4_radio_on);
			addChild (switch4_radio_off);
			
			analog1_radio_on.x = 250;
			analog1_radio_on.y = 129;
			analog1_radio_on.setStyle("textFormat", radiotext);
			analog1_radio_on.textField.autoSize = TextFieldAutoSize.LEFT;		
			analog1_radio_on.label = "ON";		
			analog1_radio_off.x = 330;
			analog1_radio_off.y = 128;
			analog1_radio_off.setStyle("textFormat", radiotext);
			analog1_radio_off.textField.autoSize = TextFieldAutoSize.LEFT;
			analog1_radio_off.label = "OFF";		
			addChild (analog1_radio_on);
			addChild (analog1_radio_off);
			
			analog2_radio_on.x = 250;
			analog2_radio_on.y = 163;
			analog2_radio_on.setStyle("textFormat", radiotext);
			analog2_radio_on.textField.autoSize = TextFieldAutoSize.LEFT;		
			analog2_radio_on.label = "ON";		
			analog2_radio_off.x = 330;
			analog2_radio_off.y = 163;
			analog2_radio_off.setStyle("textFormat", radiotext);
			analog2_radio_off.textField.autoSize = TextFieldAutoSize.LEFT;
			analog2_radio_off.label = "OFF";		
			addChild (analog2_radio_on);
			addChild (analog2_radio_off);
			
			analog3_radio_on.x = 250;
			analog3_radio_on.y = 198;
			analog3_radio_on.setStyle("textFormat", radiotext);
			analog3_radio_on.textField.autoSize = TextFieldAutoSize.LEFT;		
			analog3_radio_on.label = "ON";		
			analog3_radio_off.x = 330;
			analog3_radio_off.y = 198;
			analog3_radio_off.setStyle("textFormat", radiotext);
			analog3_radio_off.textField.autoSize = TextFieldAutoSize.LEFT;
			analog3_radio_off.label = "OFF";		
			addChild (analog3_radio_on);
			addChild (analog3_radio_off);

			
			reg_code_input.text = myXML.reg_code;						
			zip_code_input.text = myXML.weather_zip;
			woeid_input.text = myXML.weather_woeid;
						
			stock_good_threshold_input.text = myXML.stock_good_threshold;
			stock_bad_threshold_input.text = myXML.stock_bad_threshold;
			
			if (reg_code_input.text == "add yours here") {
				registered.text = "REGISTERED"
				reg_code_input.editable = false;
				reg_code_input.enabled = false;
			} 	
			
			if (myXML.switch5 == "on")  {
				switch5_radio_on.selected = true;
			}
			else {switch5_radio_off.selected = true;
			}
			
			if (myXML.switch4 == "on")  {
				switch4_radio_on.selected = true;
			}
			else {
				switch4_radio_off.selected = true;
			}
			
			if (myXML.analog_input1 == "on")  {
				analog1_radio_on.selected = true;
			}
			else {analog1_radio_off.selected = true;
			}
		
			if (myXML.analog_input2 == "on")  {
				analog2_radio_on.selected = true;
				trace ("went here");
			}
			else {analog2_radio_off.selected = true;
			}
			
			if (myXML.analog3_prox == "on")  {
				analog3_radio_on.selected = true;
			}
			else {analog3_radio_off.selected = true;
			}
			
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
			
			tts_url.text = myXML.tts_url;			
			
			
	}
	
	private function noSerproxyEvent(e:TimerEvent):void {  //this will trigger once after the startup delay timer
		if (SerproxyRunning == 0) {  //show the error box if the Arduno was not found
			removeChild(StartupText);
			StartupTextFormat.size = 20; 
			StartupText.autoSize = TextFieldAutoSize.CENTER;		
			StartupText.embedFonts = true;
			StartupText.selectable = false;
			StartupTextFormat.color = 0xFF0033; //red
			StartupText.antiAliasType = AntiAliasType.ADVANCED;		
			StartupText.defaultTextFormat = StartupTextFormat;
			StartupText.wordWrap = true;
			addChild(StartupText);			
			//StartupText.text = "serproxy.exe is not running, exit this program, run serproxy.exe, and then run this program again.";			
			output.text = "serproxy.exe is not running, exit this program, run serproxy.exe, and then run this program again.";			
			arduino_detected.text = "Not Detected";
		}	
	}
	
	private function noArduinoFoundTimerEvent(e:TimerEvent):void {  //this will trigger once after the startup delay timer
		if (SerproxyRunning == 1 && foundArduino == 0) {  //serproxy is running but no Arduino found
			removeChild(StartupText);
			StartupTextFormat.size = 20; 
			StartupText.autoSize = TextFieldAutoSize.CENTER;		
			StartupText.embedFonts = true;
			StartupText.selectable = false;
			StartupTextFormat.color = 0xFF0033; //red	
			StartupText.antiAliasType = AntiAliasType.ADVANCED;		
			StartupText.defaultTextFormat = StartupTextFormat;
			StartupText.wordWrap = true;
			addChild(StartupText);			
			//StartupText.text = "I could not find the Magic Mirror Sensor Hub, please ensure the Firmata program has been uploaded to the Magic Mirror Sensor Hub. If you've already uploaded Firmata, then you'll need to set the port manually in the Configuration program.";		
			output.text = "The Magic Mirror Sensor Hub was not detected, please ensure its plugged into your computer's USB port and you've installed the OS driver. Also make sure the Firmata program has been uploaded to the Magic Mirror Sensor Hub. If you've done both, close the serproxy.exe program, unplug the Sensor Hub, plug back in, and then re-start this program. If its still not detected, then you'll need to set the port manually using the 'Magic Mirror Advanced Setup' program.";
			arduino_detected.text = "Not Detected";
		}	
	}
		
		private function onSocketConnect(e:Object):void {
			trace("Socket connected!");
			SerproxyRunning = 1;
			
			aa.requestFirmwareVersion();
			bb.requestFirmwareVersion();
			cc.requestFirmwareVersion();
			dd.requestFirmwareVersion();
			ee.requestFirmwareVersion();
			ff.requestFirmwareVersion();
			gg.requestFirmwareVersion();
			hh.requestFirmwareVersion();
			ii.requestFirmwareVersion();
		}
		
		private function onReceiveFirmwareVersion(e:ArduinoEvent):void {
			//StartupText.visible = false;
			foundArduino = 1;
			trace("Firmware version: " + e.value);		
			
			//here we will see if the firmware version is 5, if so, then it's an Arduino UNO board and we need to setup this in the config program
			
			trace("Port: " + e.port);		
			ArduinoFound.text = ("Magic Mirror Sensor Hub Found on Port: " + e.port);
			removeChild(StartupText);
			StartupTextFormat.size = 20; 
			StartupText.autoSize = TextFieldAutoSize.CENTER;		
			StartupText.embedFonts = true;
			StartupText.selectable = false;
			StartupTextFormat.color = 0x00CC33; //green			
			StartupText.antiAliasType = AntiAliasType.ADVANCED;		
			StartupText.defaultTextFormat = StartupTextFormat;
			StartupText.wordWrap = true;

			addChild(StartupText);
			
			//StartupText.text = "I've found the Magic Mirror Sensor Hub and have updated your settings to port: " + e.port + ". You may now exit this program and run the Configuration program.";
			//output.text = "I've found the Magic Mirror Sensor Hub and have updated your settings file.";
			//AlertManager.createAlert(this, "I've found the Magic Mirror Sensor Hub and have updated your settings to port: " + e.port + ". Please exit this program and run the Configuration program.");
			myXML.com_port = String(e.port);			
			trace(myXML.com_port);
			if (e.value == 5.0) {  //then it's an Arduino UNO and we need to make sure the board version is set to 5.0
				myXML.board_version = 5;
				//saveValues();				
			}
			
			if (e.value == 2.0) { 
				myXML.board_version = 4;
				//saveValues();				
			}
			
			
			ArduinoPortSave();
			arduino_detected.text = "Detected";
			
			//if (e.value == 5.0) {  //then it's an Arduino UNO and we need to make sure the board version is set to 5.0
				//myXML.board_version = 5;
				//saveValues();				
			//}
			
			//if (e.value == 2.0) {  //then it's an Arduino UNO and we need to make sure the board version is set to 5.0
				//myXML.board_version = 4;
				//saveValues();				
			//}
		}
		
		
		
		// triggered when a serial socket connection has been closed
	    private function onSocketClose(e:Object):void {
			trace("Socket closed!");
		}
	
	private function saveValue(event:MouseEvent):void {  
		saveValues();
	}
	
	private function saveValues():void {  		
		
		if ( TTS_languages_dropdown.selectedItem.data == null) {
			myXML.tts_language = "en";
		}
		
		else {
			myXML.tts_language = TTS_languages_dropdown.selectedItem.data;
		}
		
		myXML.tts_url = tts_url.text;		
		
		
		if (tts_feature_radio_on.selected == true) {
			myXML.tts_feature = "on"; 
		}
		else {myXML.tts_feature = "off";
		}
		
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
		
		if (twitter_radio_on.selected == true)  {   
			myXML.twitter_feature = "on";			
		}
		else {myXML.twitter_feature = "off"};			
		
		if (twitter_mode_radio_user.selected == true)  {   //twitter username and password mode
			myXML.twitter_mode = "user";			
		}
		else {myXML.twitter_mode = "search"};			
		
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
		
		if (tweetBreathalyzer_checkbox.selected == true) {
			myXML.twitter_breathalyzer = "on";
		}
		else {
			myXML.twitter_breathalyzer = "off";			
		}	
		
		//myXML.twitter_username = twitter_username_input.text;
		//myXML.twitter_password = twitter_password_input.text;
		myXML.twitter_frequency = twitter_frequency_input.text;		
		myXML.twitter_search_term = twitter_search_term_input.text;
		
		if (tts_feature_radio_on.selected == true) {
			myXML.tts_feature = "on"; 
		}
		else {myXML.tts_feature = "off";
		}
		
		///*******************************
		
		myXML.verbose = "no";		
		
		myXML.weather_zip = zip_code_input.text;
		myXML.weather_woeid = woeid_input.text;
		myXML.stock_good_threshold = stock_good_threshold_input.text;
		myXML.stock_bad_threshold = stock_bad_threshold_input.text;				
		myXML.reg_code = reg_code_input.text; 
				
		if (switch5_radio_on.selected == true) {  //this is the breathalyzer switch so also set the alcohol sensor to on
			myXML.switch5 = "on"; 
			myXML.alcohol_sensor = "on";
		}
		else {myXML.switch5 = "off";
			myXML.alcohol_sensor = "off";
		}
		
		if (switch4_radio_on.selected == true) {
			myXML.switch4 = "on"; 
			myXML.picasa_insteadofphotobooth = "off";
		}
		else {
			myXML.switch4 = "off";				
		}
		
		if (analog1_radio_on.selected == true) {
			myXML.analog_input1 = "on"; 
		}
		else {myXML.analog_input1 = "off";
		}
											  
		if (analog2_radio_on.selected == true) {
			myXML.analog_input2 = "on"; 
		}
		else {myXML.analog_input2 = "off"; 
		}
		
		if (analog3_radio_on.selected == true) {
			myXML.analog_input3 = "on"; 
			myXML.analog3_prox = "on";
		}
		else {
			myXML.analog_input3 = "off";			
			myXML.analog3_prox = "off";
		}
		
		if (photobooth_printing_radio_on.selected == true) { //photobooth printing is turned on
			myXML.photobooth_printing = "on"; 
		}
		else {
			myXML.photobooth_printing = "off";  //tts is off means custom mp3 is one
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
		
		var str:String = stock_list.text;  		
		temp_stock_array = str.split("+"); 
		var y:int = 0;
		for each (var item in temp_stock_array)
			{	
				myXML.stocks.symbol[y] = temp_stock_array[y];				
				y++;
			}
		
		var newXMLStr:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + myXML.toXMLString();
		//try {
                  filestream.open(file, FileMode.WRITE);
				  filestream.writeUTFBytes(newXMLStr);
                  saved.text = "Settings Saved";			
         //   } catch (error:IOError) {
               //   output.text = "IMPORTANT!!! Settings were not saved, re-start this program and Run as Administrator";			
				//   AlertManager.createAlert(this, "IMPORTANT!!! Settings were not saved, please re-start this program and Run as Administrator and then you will be able to Save");
				//  admin_flag = 1;
          //  }
		filestream.close(); 			
		
		var myTimer2:Timer = new Timer(3000, 1);
        myTimer2.addEventListener(TimerEvent.TIMER, ClearOutputText2);
        myTimer2.start();
		
	}
	
	private function twitterOauthEvent(event:MouseEvent):void { 
	
			    tweetr = new Tweetr();         
			    tweetr.serviceHost = myXML.twitter_serviceHost;            
			    oauth = new OAuth();			
			    oauth.addEventListener(OAuthEvent.COMPLETE, handleOAuthEvent, false, 0, true);
			    oauth.addEventListener(OAuthEvent.ERROR, handleOAuthEvent, false, 0, true);
				
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
				output.text = ""; //clear any error message that may have been there
				saveValues(); //save the settings
				
            }
			
            else
            {           
				 trace ("Twitter Authentication Error");
				 //output.text = "Twitter Authentication Error: " + event.type.toLocaleUpperCase();	
				 output.text = "Twitter Authentication Error. Most likely the Twitter service is having a hiccup, please try again";
            }
       }
	
	private function ArduinoPortSave():void {  
		
		var newXMLStr:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + myXML.toXMLString();
		//try {
                  filestream.open(file, FileMode.WRITE);
				  filestream.writeUTFBytes(newXMLStr);
                  //saved.text = "Settings Saved";			
       //     } catch (error:IOError) {
                 // output.text = "IMPORTANT!!! Settings were not saved, re-start this program and Run as Administrator";			
				 //  AlertManager.createAlert(this, "IMPORTANT!!! Settings were not saved, please re-start this program and Run as Administrator and then you will be able to Save");
				//  admin_flag = 1;
          //  }
		filestream.close(); 			
		
		var myTimer2:Timer = new Timer(6000, 1);
        myTimer2.addEventListener(TimerEvent.TIMER, ClearOutputText2);
        myTimer2.start();
		
	}
	
	private function ClearOutputText2 (event:TimerEvent):void {		
			 saved.text = "";
			 output.text = "";
			 myTimer.reset();		
	 }
	 
	
	private function TTSButtonEvent(event:Event):void {	
	
		setChildIndex(black_square,numChildren-1);
			   black_square.visible = true;
			   
			  
		  setChildIndex(SaveButton,getChildIndex(black_square));
		  setChildIndex(goBackMain,getChildIndex(black_square));				
		  
		  SaveButton.visible = true;
		  SaveButton.x = 470.45;
		  SaveButton.y = 610;
		  goBackMain.visible = true;		
		  
		  setChildIndex(TTS_Screen_Label,getChildIndex(black_square));
		  setChildIndex(tts_feature_label,getChildIndex(black_square));
		  setChildIndex(tts_url_label,getChildIndex(black_square));
		  setChildIndex(tts_language_label,getChildIndex(black_square));
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
		  //setChildIndex(tts_feature_radio_on,getChildIndex(black_square));
		  //setChildIndex(tts_feature_radio_off,getChildIndex(black_square));		
		  setChildIndex(tts_url,getChildIndex(black_square));	
		  setChildIndex(tts_instructions,getChildIndex(black_square));			  
		  setChildIndex(output,getChildIndex(black_square)); //remove this	  
		
		  
		  TTS_Screen_Label.visible = true;
		  proximity1_tts.visible = true;
		  proximity1_tts_label.visible = true;
		  proximity2_tts.visible = true;
		  proximity2_tts_label.visible = true;
		  proximity3_tts.visible = true;
	      proximity3_tts_label.visible = true;
		 // tts_feature_label.visible = true;
		//  tts_url_label.visible = true;
		  tts_language_label.visible = true;
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
		  //tts_feature_radio_on.visible = true;
		  //tts_feature_radio_off.visible = true;
		 // tts_url.visible = true;
		  tts_instructions.visible = true;
		  output.visible = true;		 
	}
	
	private function photoboothButtonEvent(event:Event):void {	
	
		  setChildIndex(black_square,numChildren-1);
			   black_square.visible = true;
			   
			//   if (SlideShowStarted == 1) {
			//		StopSlideShow();
			//	}
		  
		  setChildIndex(SaveButton,getChildIndex(black_square));
		  setChildIndex(goBackMain,getChildIndex(black_square));				
		  
		  SaveButton.x = 650;
		  SaveButton.y = 550;		
		  SaveButton.visible = true;
		 
		
		  
		  goBackMain.visible = true;	
		 // alcohol_help_button.visible = true;
		  
			  
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
		  
		//  onoff_house_code_input.move(416.05,242.85);
		//  onoff_unit_code_input.move(594.15,242.85);
			
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
		 onoff_house_code_input.visible = true;
		 onoff_unit_code_input.visible = true;
		 output.visible = true;
		 
	}
	
	private function goBackMainScreen(event:Event):void {  //back to main config screen so hide other stuff		
		
		
		goBackMain.visible = false;
		SaveButton.visible = false;		
		  
		  TTS_Screen_Label.visible = false;
		  proximity1_tts.visible = false;
		  proximity1_tts_label.visible = false;
		  proximity2_tts.visible = false;
		  proximity2_tts_label.visible = false;
		  proximity3_tts.visible = false;
		  proximity3_tts_label.visible = false;
		  tts_feature_label.visible = false;
		  tts_url_label.visible = false;
		  tts_language_label.visible = false;
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
		 // tts_feature_radio_on.visible = false;
		 // tts_feature_radio_off.visible = false;		 
		  tts_url.visible = false;
		  tts_instructions.visible = false;
		  blow_tts.visible = false;
		  blow_tts_label.visible = false;
		  wait_tts.visible = false;
		  wait_tts_label.visible = false;
		  
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
		 
		 onoff_house_code_input.visible = false;
		 onoff_unit_code_input.visible = false;
		
		output.visible = true;
		black_square.visible = false;		
		
	}		
	
	
	
	private function CreateConfig():void {
					
			var newconfigXML:XML =
			<mirror>
  <mirror_mode>princess</mirror_mode>
  <verbose>no</verbose>
  <screen_mode>landscape0</screen_mode>
  <display_mode_preset>0</display_mode_preset>
  <idle_videos>on</idle_videos>
  <video_resolution>high</video_resolution>
  <version>7.0</version>
  <digital_switches>on</digital_switches>
  <switch1>off</switch1>
  <switch2>off</switch2>
  <switch3>off</switch3>
  <switch4>off</switch4>
  <switch5>on</switch5>
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
  <alcohol_sensor>on</alcohol_sensor>
  <alcohol_no_switch>off</alcohol_no_switch>
  <alcohol_no_switch_interval>1000</alcohol_no_switch_interval>
  <alcohol_no_switch_trigger_delta>100</alcohol_no_switch_trigger_delta>
  <alcohol_sensor_pin>1</alcohol_sensor_pin>
  <alcohol_baseline>100</alcohol_baseline>
  <alcohol_baseline_difference_allowance>100</alcohol_baseline_difference_allowance>
  <alcohol_level1>100</alcohol_level1>
  <alcohol_level2>300</alcohol_level2>
  <alcohol_level3>500</alcohol_level3>
  <alcohol_countdown>5</alcohol_countdown>
  <alcohol_text_duration>6</alcohol_text_duration>
  <alcohol_display_value>off</alcohol_display_value>
  <beer_image_x>634</beer_image_x>
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
  <weather_woeid/>
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
  <doorcam_host>thepoolcam.dyndns.tv</doorcam_host>
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
  <stand_alone_weather>on</stand_alone_weather>
  <stand_alone_stock>on</stand_alone_stock>
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
  <tts_url>http://translate.google.com/translate_tts?q=</tts_url>
  <tts_language>en</tts_language>
  <tts_sendheader>on</tts_sendheader>
  <tts_headername>Referer</tts_headername>
  <tts_headervalue>http://translate.google.com/</tts_headervalue>
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
  <board_version>4</board_version>
  <atmega>m328p</atmega>
  <LED_mode>indicator</LED_mode>
  <branding>DIY</branding>
</mirror>;
		
		var newXMLStr:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + newconfigXML.toXMLString();
		try {
                  filestream.open(file, FileMode.WRITE); //save it or overwrite the old one
				  filestream.writeUTFBytes(newXMLStr);
                 // output.text = "New Configuration File Created";			
            } catch (error:IOError) {
                  output.text = "IMPORTANT!!! Settings were not saved, re-start this program and Run as Administrator";			
				  AlertManager.createAlert(this, "IMPORTANT!!! Settings were not saved, please re-start this program and Run as Administrator and then you will be able to Save");
				  admin_flag = 1;
            }
		filestream.close(); 	
		
		var myTimer:Timer = new Timer(3000, 1);
        myTimer.addEventListener(TimerEvent.TIMER, ClearOutputText);
        myTimer.start();
		
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
	
	private function ClearOutputText (event:TimerEvent):void {		
			 output.text = "";
			 myTimer.reset();	
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
	
	private function CheckConfigVersion():void {
		//let's check and make sure the user doesn't have an old version of the config file
			if (Number(myXML.version) < 7.0) {  //this means user's config file was old and needs to be updated but we'll also save the user's settings so they don't have to re-type
				//AlertManager.createAlert(this, "Your configuration file was an older version and has been updated, your current settings have been maintained");
				//before blowing the file away, let's read it into another XML so we have a record of the old settings
				filestream.open(file, FileMode.READ);
				myXMLold = XML(filestream.readUTFBytes(filestream.bytesAvailable));
				filestream.close();
							
				CreateConfig(); //create a new one if not the right one
				filestream.open(file, FileMode.READ);
				myXML = XML(filestream.readUTFBytes(filestream.bytesAvailable));
				filestream.close();
				
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
				
				//now save the newly created myXML to disk
				
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
	}
	
	}  // end class
}  // end package

