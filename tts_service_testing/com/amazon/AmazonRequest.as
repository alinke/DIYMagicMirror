package com.amazon
{
	import com.adobe.crypto.HMAC;
	import com.adobe.crypto.SHA256;

	import flash.net.URLRequest;
	import flash.utils.ByteArray;

	import mx.formatters.DateFormatter;
	import mx.utils.Base64Encoder;

	public class AmazonRequest
	{
		public static const AWS_NAMESPACE	: Namespace	= new Namespace("http://webservices.amazon.com/AWSECommerceService/2009-01-06");

		private static const AWS_KEY		: String	= "your_aws_api_key_here";
		private static const AWS_SECRET 	: String	= "your_aws_secret_key_here";
		private static const AWS_METHOD		: String	= "GET";
		private static const AWS_HOST		: String	= "ecs.amazonaws.com";
		private static const AWS_PATH		: String	= "/onca/xml";
		private static const AWS_URL		: String	= "http://" + AWS_HOST + AWS_PATH;

		private var _URLRequest		: URLRequest	= new URLRequest();
		private var _DateFormatter	: DateFormatter	= new DateFormatter();

		public function get url() : String {return (_URLRequest.url);}
		public function get data() : Object {return (_URLRequest.data);}
		public function get requestHeaders() : Array {return (_URLRequest.requestHeaders);}
		public function get urlRequest() : URLRequest {return (signRequest());}

		public function set url(value : String) : void {_URLRequest.url = value;}
		public function set data(value : Object) : void {_URLRequest.data = value;}
		public function set requestHeader(value : Array) : void {_URLRequest.requestHeaders = value;}

		public function AmazonRequest()
		{
			_URLRequest.url = AWS_URL;
			_DateFormatter.formatString = "YYYY-MM-DDTJJ:NN:SS.000Z";
		}

		private function parametersSort(s1 : Object, s2 : Object) : Number
		{
			var c1 : Number = (s1.name as String).charCodeAt(0);
			var c2 : Number = (s2.name as String).charCodeAt(0);

			return (c1 > c2 ? 1.0 : -1.0);
		}

		private function signRequest() : URLRequest
		{
			var vars : Array = [];
			var signature : String = AWS_METHOD + "\n" + AWS_HOST + "\n" + AWS_PATH + "\n";
			var timestamp : String = null;
			var encoder	 : Base64Encoder = new Base64Encoder();
			var secretBytes : ByteArray = new ByteArray();
			var requestBytes : ByteArray = new ByteArray();
			var now : Date = new Date();
			var hash : String = null;
			var hashBytes : ByteArray = new ByteArray();

			// build the timestamp
			now.setTime(now.getTime() + (now.getTimezoneOffset() * 60 * 1000));
			timestamp = _DateFormatter.format(now);

			vars.push({name: "Timestamp", value: encodeURIComponent(decodeURIComponent(timestamp))});

			// add the API Key
			_URLRequest.data.AWSAccessKeyId = AWS_KEY;

			// extract and sort parameters
			for (var o : Object in _URLRequest.data)
				vars.push({name: o, value: _URLRequest.data[o]});
			vars = vars.sortOn("name");

			// build the string to sign
			for (var i : int = 0; i < vars.length; i++)
				signature += (i ? "&" : "") + encodeURIComponent(decodeURIComponent(vars[i].name))
							 + "=" + encodeURIComponent(decodeURIComponent(vars[i].value));

			// build the signature
			hash = HMAC.hash(AWS_SECRET, signature, SHA256);
			for (i = 0; i < hash.length; i += 2)
				hashBytes.writeByte(parseInt(hash.charAt(i) + hash.charAt(i + 1), 16));

			// encode the signature to Base64
			encoder.encodeBytes(hashBytes);

			// the the Signature and Timestamp parameters
			_URLRequest.data.Signature = encodeURI(encoder.toString());
			_URLRequest.data.Timestamp = timestamp;

			return (_URLRequest);
		}

	}
}