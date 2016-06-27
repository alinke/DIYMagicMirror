package com.theillustratedlife.AWS{
	import flash.events.Event;
	
	public class AWSEvent extends Event{
		private var _response:String;
		private var _boxUsage:Number;
		
		public static const DOMAIN_CREATED:String = "domainCreated";
		public static const DOMAIN_DELETED:String = "domainDeleted";
		public static const DOMAINS_LISTED:String = "domainsListed";
		
		public static const ATTRIBUTES_PUT:String = "attributesPut";
		public static const ATTRIBUTES_GOT:String = "attributesGot";
		public static const ATTRIBUTES_DELETED:String = "attributesDeleted";
		
		public static const QUERY_COMPLETED:String = "queryCompleted";
		
		public static const AWS_ERROR:String = "awsError";
		
		public function get response():String{
			return _response;
		}
		
		public function get boxUsage():Number{
			return _boxUsage;
		}
		
		public function AWSEvent(type:String, response:String, boxUsage:Number, bubbles:Boolean = false, cancelable:Boolean = false){
			_response = response;
			_boxUsage= boxUsage;
			super(type, bubbles, cancelable);
		}
		
		override public function toString():String{
			return '[AWSEvent type="'+type+'" response="'+_response+'" boxUsage="'+_boxUsage+'" bubbles='+bubbles+' cancelable='+cancelable+' eventPhase='+eventPhase+']';
		}
		
		override public function clone():Event{
			return new AWSEvent(type, _response, _boxUsage, bubbles, cancelable);
		}
	}
}