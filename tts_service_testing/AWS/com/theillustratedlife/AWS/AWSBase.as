package com.theillustratedlife.AWS{
	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.SharedObject;
	import Date;
	
	public class AWSBase extends EventDispatcher{
		protected var _credentials:SharedObject;
		
		public function set accessKey(key:String) {
			_credentials.data.accessKey = key;
		}
		
		public function set secretKey(key:String) {
			_credentials.data.secretKey = key;
		}
		
		public function AWSBase(accessKey:String = null, secretKey:String = null) {
			_credentials = SharedObject.getLocal("AWS");
			
			if (accessKey) {
				_credentials.data.accessKey = accessKey;
			} if (secretKey) {
				_credentials.data.secretKey = secretKey;
			}
			
			trace(_credentials.data.accessKey);
			trace(_credentials.data.secretKey);
		}
		
		public function getDateTime():String {
			var dateTime:String;
			
			var now = new Date();
			var month = addLeadingZero(String(now.monthUTC + 1));
			var date = addLeadingZero(String(now.dateUTC));
			var hours = addLeadingZero(String(now.hoursUTC));
			var minutes = addLeadingZero(String(now.minutesUTC));
			var seconds = addLeadingZero(String(now.secondsUTC));
				
			return(now.fullYearUTC + "-" + month + "-" + date + "T" + hours + ":" + minutes + ":" + seconds);
		}
		
		private function addLeadingZero(num:String):String {
			if (num.length < 2)
				num = 0 + num;
			return num;
		}
	}
	
}