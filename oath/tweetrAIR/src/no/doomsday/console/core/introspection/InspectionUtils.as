package no.doomsday.console.core.introspection 
{
	import no.doomsday.console.core.text.autocomplete.AutocompleteDictionary;
	import flash.display.DisplayObjectContainer;
	import flash.utils.describeType;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class InspectionUtils
	{
		private static var desc:XML;
		public function InspectionUtils() 
		{
			
		}
		public static function getAutoCompleteDictionary(o:*):AutocompleteDictionary {
			desc = describeType(o);
			var dict:AutocompleteDictionary = new AutocompleteDictionary();
			//get all methods
			var node:XML;
			var list:XMLList = desc..method;
			for each(node in list) {
				dict.addToDictionary(node.@name);
			}
			list = desc..variable;
			for each(node in list) {
				dict.addToDictionary(node.@name);
			}
			list = desc..method;
			for each(node in list) {
				dict.addToDictionary(node.@name);
			}
			list = desc..accessor;
			for each(node in list) {
				dict.addToDictionary(node.@name);
			}
			if (o is DisplayObjectContainer) {
				var i:int = o.numChildren;
				for (i > 0; i--; ) 
				{
					dict.addToDictionary(o.getChildAt(i).name);
				}
			}
			
			return dict;
		}
		public static function getAccessors(o:*):Vector.<AccessorDesc> {
			desc = describeType(o);
			var vec:Vector.<AccessorDesc> = new Vector.<AccessorDesc>();
			var node:XML;
			var list:XMLList = desc..accessor;
			for each(node in list) {
				vec.push(new AccessorDesc(node));
			}
			return vec;
		}
		public static function getMethods(o:*):Vector.<MethodDesc> {
			desc = describeType(o);
			var vec:Vector.<MethodDesc> = new Vector.<MethodDesc>();
			var node:XML;
			var list:XMLList = desc..method;
			for each(node in list) {
				vec.push(new MethodDesc(node));
			}
			return vec;
		}
		public static function getVariables(o:*):Vector.<VariableDesc> {
			desc = describeType(o);
			var vec:Vector.<VariableDesc> = new Vector.<VariableDesc>();
			var node:XML;
			var list:XMLList = desc..variable;
			for each(node in list) {
				vec.push(new VariableDesc(node));
			}
			return vec;
		}
		
		//thanks Paulo Fierro :)
		public static function getMethodTooltip(scope:Object, methodName:String):String {
			var tip:String = methodName+"( "; 
			var desc:XMLList = describeType(scope)..method.(attribute("name").toLowerCase() == methodName.toLowerCase());
			if (desc.length() == 0) {
				throw new Error("No description for method " + methodName);
			}
			//<parameter index="1" type="String" optional="false"/>
			var first:Boolean = true;
			for each(var attrib:XML in desc..parameter) {
				if(!first) tip += ", ";
				tip += attrib.@type.toString().toLowerCase();
				if (attrib.@optional == "true") {
					tip += "[optional]";
				}				
				first = false;
			}
			tip += " ):"+desc.@returnType;
			return tip;
		}
		public static function getAccessorTooltip(scope:Object, accessorName:String):String {
			var tip:String = accessorName; 
			var desc:XMLList = describeType(scope)..accessor.(attribute("name").toLowerCase() == accessorName.toLowerCase());
			if (desc.length() == 0) {
				desc = describeType(scope)..variable.(attribute("name").toLowerCase() == accessorName.toLowerCase());
				if (desc.length() == 0) {
					throw new Error("No description");
				}
			}
			tip += ":" + desc.@type;
			if (desc.@access == "readonly") {
				tip += " (read only)";
			}
			return tip;
		}
		
		public static function getMethodArgs(func:Object):Array {
			var desc:XML = describeType(func);
			var out:Array = [];
			for each(var attrib:XML in desc..parameter) {
				out.push(attrib);
			}
			return out;
		}
		
		
	}

}