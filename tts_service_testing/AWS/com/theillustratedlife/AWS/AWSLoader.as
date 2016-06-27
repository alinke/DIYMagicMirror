package com.theillustratedlife.AWS{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;

	
		//Enhanced version of URLLoader that exposes the originally passed urlVariables
	public class AWSLoader extends URLLoader{
		private var _urlRequest:URLRequest;
		
		public function get urlVariables():URLVariables{
			return URLVariables(_urlRequest.data);
		}
		
		public function AWSLoader(request:URLRequest){
			_urlRequest = request;
			
			super(request);
		}
	}
}