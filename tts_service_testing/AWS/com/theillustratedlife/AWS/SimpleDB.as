package com.theillustratedlife.AWS{
	import com.hurlant.crypto.hash.HMAC;
	import com.hurlant.crypto.hash.SHA1;
	import com.hurlant.util.Base64;
	import com.theillustratedlife.AWS.AWSLoader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import flash.utils.ByteArray;
	
	public class SimpleDB extends AWSBase{
		
		/* This library is donation-ware.  Feel free to use it for noncommercial purposes, but please leave a tip
		 * at http://theillustratedlife.com/simpleDB/
		 * 
		 * Thanks!
		 * Brenton Simpson
		 * brenton@theillustratedlife.com */
		
		private var _domainName:String;
		private var _boxUsage:Number = 0;
		
		public function set domainName(newName:String){
			_domainName = newName;
		}
		
		public function get boxUsage():Number{
			return _boxUsage;
		}
		
		public function SimpleDB() {
			default xml namespace = "http://sdb.amazonaws.com/doc/2007-11-07/"; //Tells Flash to use the Amazon namespace, to enable things like XML(data)..DomainName
		}
		
		public function createDomain(domainName:String) {
			var urlVariables = new URLVariables;
			urlVariables.Action = "CreateDomain";
			urlVariables.DomainName = domainName;
			execute(urlVariables, "POST");
		}
		
		public function deleteDomain(domainName:String) {
			var urlVariables = new URLVariables;
			urlVariables.Action = "DeleteDomain";
			urlVariables.DomainName = domainName;
			execute(urlVariables, "POST");
		}
		
		public function listDomains() {
			var urlVariables = new URLVariables;
			urlVariables.Action = "ListDomains";
			execute(urlVariables, "GET");
		}
		
		public function getAttributes(itemName:String, attribute:String = null, domainName:String = null) {
			if (domainName == null && _domainName == null){
				throw new Error("No domainName supplied.");
			} else if (domainName){
				_domainName = domainName;
			}
			var urlVariables = new URLVariables;
			urlVariables.Action = "GetAttributes";
			urlVariables.DomainName = _domainName;
			urlVariables.ItemName = itemName;
			if (attribute)
				urlVariables.AttributeName = attribute;
			execute(urlVariables, "GET");
		}
		
		public function putAttributes(itemName:String, attributes:Object, replace:Boolean = true, domainName:String = null) {
			if (domainName == null && _domainName == null){
				throw new Error("No domainName supplied.");
			} else if (domainName){
				_domainName = domainName;
			}
			var urlVariables = new URLVariables;
			var i:uint = 1;
			
			for (var attName in attributes){
				urlVariables["Attribute."+i+".Name"] = attName;
				urlVariables["Attribute."+i+".Value"] = attributes[attName];
				urlVariables["Attribute."+i+".Replace"] = replace;
				i++
			}
			
			urlVariables.Action = "PutAttributes";
			urlVariables.DomainName = _domainName;
			urlVariables.ItemName = itemName;
			execute(urlVariables, "POST");
		}
		
		public function deleteAttributes(itemName:String, attributeNames:Array = null, attributeValues:Array=null, domainName:String = null) {
			if (domainName == null && _domainName == null){
				throw new Error("No domainName supplied.");
			} else if (domainName){
				_domainName = domainName;
			}
			var urlVariables = new URLVariables;
			
			if (attributeNames){
				var i:uint = 1;
				
				for (var j in attributeNames){
					urlVariables["Attribute."+i+".Name"] = attributeNames[j];
					if (attributeValues && attributeValues[j])
						urlVariables["Attribute."+i+".Value"] = attributeValues[j];
					i++
				}
			}
			
			urlVariables.Action = "DeleteAttributes";
			urlVariables.DomainName = _domainName;
			urlVariables.ItemName = itemName;
			execute(urlVariables, "POST");
		}
		
		public function query(query:String = null, maxItems:uint = 250, nextToken:String = null, domainName:String = null) {
			if (domainName == null && _domainName == null){
				throw new Error("No domainName supplied.");
			} else if (domainName){
				_domainName = domainName;
			}
			var urlVariables = new URLVariables;
			
			urlVariables.Action = "Query";
			urlVariables.DomainName = _domainName;
			if(query)
				urlVariables.Query = query;
			urlVariables.MaxNumberOfItems = maxItems;
			if (nextToken)
				urlVariables.NextToken = nextToken;
			execute(urlVariables, "GET");
		}
		
		private function execute(urlVariables:URLVariables, method:String):void {
				//If credentials are in SharedObject, interact directly with AWS  (requires AIR due to crossdomain)
			if (_credentials.data.secretKey) {
				var request = new URLRequest("http://sdb.amazonaws.com/");
				urlVariables.AWSAccessKeyId = _credentials.data.accessKey;
				urlVariables.Timestamp = getDateTime();
				urlVariables.Version = "2007-11-07";
				
				urlVariables = generateSignature(urlVariables, 0);
				
				request.data = urlVariables;
				request.method = method;
				
				var loader = new AWSLoader(request);
				loader.addEventListener(Event.COMPLETE, handleResponse);
				loader.addEventListener(IOErrorEvent.IO_ERROR, handleResponse);
			}
		}
		
		private function handleResponse(loaderEvent:Event){	
			//Should probably be done with XML(loaderEvent.target.data).name() rather than urlVariables.action,
			//but the namespaces thing makes that tricky
			
			if (XML(loaderEvent.target.data)..BoxUsage.length() > 0){
				var awsEvent:AWSEvent;
				switch (AWSLoader(loaderEvent.target).urlVariables.Action){
					case "CreateDomain":
						awsEvent = new AWSEvent(AWSEvent.DOMAIN_CREATED, XMLList("<DomainName>"+String(AWSLoader(loaderEvent.target).urlVariables.DomainName)+"</DomainName>"), XML(loaderEvent.target.data)..BoxUsage);
						break;
					case "DeleteDomain":
						awsEvent = new AWSEvent(AWSEvent.DOMAIN_DELETED, XMLList("<DomainName>"+String(AWSLoader(loaderEvent.target).urlVariables.DomainName)+"</DomainName>"), XML(loaderEvent.target.data)..BoxUsage);
						break;
					case "ListDomains":
						var domainList:XMLList = XML(loaderEvent.target.data)..DomainName;
						awsEvent = new AWSEvent(AWSEvent.DOMAINS_LISTED, domainList, XML(loaderEvent.target.data)..BoxUsage);
						break;
					case "GetAttributes":
						var attributeList:XMLList = XMLList("<Item name='"+URLVariables(loaderEvent.target.urlVariables).ItemName+"'>"+XML(loaderEvent.target.data)..Attribute+"</Item>");
						awsEvent = new AWSEvent(AWSEvent.ATTRIBUTES_GOT, attributeList, XML(loaderEvent.target.data)..BoxUsage);
						break;
					case "PutAttributes":
						var urlV:URLVariables = URLVariables(loaderEvent.target.urlVariables);
						var i:uint = 1;
						var attributeList:XMLList = new XMLList();
						while(urlV["Attribute."+i+".Name"]){
							attributeList += XMLList("<Attribute><Name>"+urlV["Attribute."+i+".Name"]+"</Name><Value>"+urlV["Attribute."+i+".Value"]+"</Value></Attribute>");
							i++;
						}
						attributeList = XMLList("<Item name='"+URLVariables(loaderEvent.target.urlVariables).ItemName+"'>"+attributeList+"</Item>");
						awsEvent = new AWSEvent(AWSEvent.ATTRIBUTES_PUT, attributeList, XML(loaderEvent.target.data)..BoxUsage);
						break;
					case "DeleteAttributes":
						var urlV:URLVariables = URLVariables(loaderEvent.target.urlVariables);
						var i:uint = 1;
						var attributeList:XMLList = new XMLList();
						while(urlV["Attribute."+i+".Name"]){
							attributeList += XMLList("<Attribute><Name>"+urlV["Attribute."+i+".Name"]+"</Name></Attribute>");
							i++;
						}
						attributeList = XMLList("<Item name='"+URLVariables(loaderEvent.target.urlVariables).ItemName+"'>"+attributeList+"</Item>");
						awsEvent = new AWSEvent(AWSEvent.ATTRIBUTES_DELETED, attributeList, XML(loaderEvent.target.data)..BoxUsage);
						break;
					case "Query":
						awsEvent = new AWSEvent(AWSEvent.QUERY_COMPLETED, XML(loaderEvent.target.data)..ItemName, XML(loaderEvent.target.data)..BoxUsage);
						break;
					default:
						awsEvent = new AWSEvent(AWSEvent.AWS_ERROR, loaderEvent.target.data, XML(loaderEvent.target.data)..BoxUsage);
						break;
				}
				_boxUsage += Number(XML(loaderEvent.target.data)..BoxUsage);
			} else if(loaderEvent is IOErrorEvent){
				awsEvent = new AWSEvent(AWSEvent.AWS_ERROR, "<Message>IOError:  Check your network connection.  If you have connectivity and still get this error, make sure you are targeting AIR.</Message>", 0);
			} else{
				awsEvent = new AWSEvent(AWSEvent.AWS_ERROR, loaderEvent.target.data, XML(loaderEvent.target.data)..BoxUsage);
			}
			trace("handleRequest()");
			this.dispatchEvent(awsEvent);
		}
		
		private function generateSignature(urlVariables:URLVariables, type:uint = 1):URLVariables{
			var dataBA:ByteArray = new ByteArray();
			var secretBA = new ByteArray();
			
			switch (type){
				case 0:	//encode Action+Timestamp
					dataBA.writeUTFBytes(urlVariables.Action + urlVariables.Timestamp);
					break;
				case 1: //encode alphabetized URLVariable pairs
					urlVariables.SignatureVersion = "1";
					var sortArray = new Array();
					for (var i in urlVariables)
						if (urlVariables[i])
							sortArray.push(i+urlVariables[i]);
					sortArray.sort(Array.CASEINSENSITIVE);
					var signatureToHash = new String();
					for each(var j in sortArray)
						signatureToHash += j;
					trace(signatureToHash);
					dataBA.writeUTFBytes(signatureToHash);
					break;
			}
			secretBA.writeUTFBytes(_credentials.data.secretKey);
			var hmacEncrypter = new HMAC(new SHA1());
			urlVariables.Signature = Base64.encodeByteArray(hmacEncrypter.compute(secretBA, dataBA));
			
			return urlVariables;
		}
	}
	
}