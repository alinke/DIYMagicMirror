package no.doomsday.console.core.introspection 
{
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class VariableDesc
	{
		public var name:String;
		public var type:String;
		public function VariableDesc(xml:XML) 
		{
			this.name = xml.@name;
			this.type = xml.@type;
		}
		
	}

}