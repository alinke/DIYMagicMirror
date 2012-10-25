package no.doomsday.console.core.introspection 
{
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class AccessorDesc
	{
		//<accessor name="stage" access="readonly" type="flash.display::Stage" declaredBy="flash.display::DisplayObject"/>
		public var name:String;
		public var access:String;
		public var type:String;
		public var declaredBy:String;
		public function AccessorDesc(xml:XML) 
		{
			name = xml.@name;
			access = xml.@access;
			type = xml.@type;
			declaredBy = xml.@declaredBy;
		}
		
	}

}