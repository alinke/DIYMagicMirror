package 
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import com.dynamicflash.util.Base64;
	
	/**
	 * This is a class used to view a MJPEG
	 * @author Josh Chernoff | GFX Complex
	 * 
	 */
	public class  MJPEG extends Loader
	{
		private var _user:String; 									//Auth user name
		private var _pass:String;									//Auth user password
		
		private var _host:String; 									//host server of stream
		private var _port:int;  									//port of stream		
		private var _file:String;									//Location of MJPEG
		private var _start:int = 0; 								//marker for start of jpg

		private var webcamSocket:Socket = new Socket();				//socket connection
		private var imageBuffer:ByteArray = new ByteArray();		//image holder
		
		/**
		 * Create's a new instance of the MJPEG class. Note that due a sandbox security problem, unless you can place a crossdomain.xml 
		 * on the host server you will only be able to use this class in your AIR applications.
		 * 
		 * @example import MJPEG;
		 *			var cam:MJPEG = new MJPEG("192.168.0.100", "/img/video.mjpeg", 80);
		 *			addChild(cam);
		 *			
		 * @param	host:String | Host of the server. Do not include protocol 
		 * @param	file:String | Path to the file on the server. Start with a forward slash
		 * @param	port:int    | Port of the host server;
		 * @param	user:String | User name for Auth
		 * @param	pass:String | User password for Auth
		 */
		public function MJPEG (host:String, file:String, port:int = 80, user:String = null, pass:String = null )
		{
			_host = host;
			_file = file;
			_port = port;
			_user = user;
			_pass = pass;
			
			webcamSocket.addEventListener(Event.CONNECT, handleConnect);
			webcamSocket.addEventListener(ProgressEvent.SOCKET_DATA, handleData);
			webcamSocket.connect(host, port);
			
		}
		
		private function handleConnect(e:Event):void 
		{
			// we're connected send a request
			var httpRequest:String = "GET "+_file+" HTTP/1.1\r\n";
			httpRequest+= "Host: localhost:80\r\n";
			if(_user != null && _pass != null){
							var source:String = String(_user + ":" + _pass);
							var auth:String = Base64.encode(source);
							httpRequest += "Authorization: Basic " + auth.toString()+ "\r\n";	//NOTE THIS MAY NEEED TO BE EDITED TO WORK WITH YOUR CAM
						}
			httpRequest+="Connection: keep-alive\r\n\r\n";
			webcamSocket.writeMultiByte(httpRequest, "us-ascii");
		}

		function handleData(e:ProgressEvent):void {
			//trace("Got Data!" + e);
			// get the data that we received.

			// append the data to our imageBuffer
			webcamSocket.readBytes(imageBuffer, imageBuffer.length);
			//trace(imageBuffer.length);
			while(findImages()){
			//donothing
			}

			
		}


		private function findImages():Boolean
		{

			var x:int = _start;
			var startMarker:ByteArray = new ByteArray();	
			var end:int = 0;
			var image:ByteArray;

			if (imageBuffer.length > 1) {
				if(_start == 0){
					//Check for start of JPG
					for (x; x < imageBuffer.length - 1; x++) {
						 
						// get the first two bytes.
						imageBuffer.position = x;
						imageBuffer.readBytes(startMarker, 0, 2);
						
						//Check for end of JPG
						if (startMarker[0] == 255 && startMarker[1] == 216) {
							_start = x;
							break;					
						}
					}
				}
				for (x; x < imageBuffer.length - 1; x++) {
					// get the first two bytes.
					imageBuffer.position = x;
					imageBuffer.readBytes(startMarker, 0, 2);
					if (startMarker[0] == 255 && startMarker[1] == 217){
						
						end = x;
										
						image = new ByteArray();
						imageBuffer.position = _start;
						imageBuffer.readBytes(image, 0, end - _start);
										
						displayImage(image);
										
						// truncate the imageBuffer
						var newImageBuffer:ByteArray = new ByteArray();
						
						imageBuffer.position = end;
						imageBuffer.readBytes(newImageBuffer, 0);
						imageBuffer = newImageBuffer;

						_start = 0;
						x = 0;
						return true;
					}
				}
			}

			return false;
		}

		private function displayImage(image:ByteArray):void
		{
			this.loadBytes(image);
		}
		
	}
	
}