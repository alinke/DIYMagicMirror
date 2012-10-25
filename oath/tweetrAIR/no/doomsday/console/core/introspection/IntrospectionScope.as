package no.doomsday.console.core.introspection 
{
	import no.doomsday.console.core.text.autocomplete.AutocompleteDictionary;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class IntrospectionScope
	{
		public var autoCompleteDict:AutocompleteDictionary = new AutocompleteDictionary();
		public var children:Vector.<ChildScopeDesc>;
		public var accessors:Vector.<AccessorDesc>;
		public var methods:Vector.<MethodDesc>;
		public var variables:Vector.<VariableDesc>;
		public var obj:Object;
		public function IntrospectionScope() 
		{
			
		}
		
	}

}