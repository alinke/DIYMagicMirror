/*
Copyright (c) 2009 Yahoo! Inc.  All rights reserved.  
The copyrights embodied in the content of this file are licensed under the BSD (revised) open source license
*/
package com.yahoo.astra.fl.charts.axes
{
	import flash.geom.Rectangle;
	
	/**
	 * Interface for a cartesian chart's axis renderers.
	 * 
	 * @see com.yahoo.astra.fl.charts.CartesianChart
	 */
	public interface ICartesianAxisRenderer extends IAxisRenderer
	{
		
	//--------------------------------------
	//  Properties
	//--------------------------------------
	
		/**
		 * Determines if the axis is displayed vertically or horizontally.
		 * 
		 * @see com.yahoo.astra.fl.charts.axes.AxisOrientation
		 */
		function get orientation():String;
		
		/**
		 * @private
		 */
		function set orientation(value:String):void;
		
		/**
		 * The title text to display on the axis.
		 */
		function get title():String;
		
		/**
		 * @private
		 */
		function set title(value:String):void;
		
		/**
		 * Represents the area where content should be drawn within the axis.
		 * This value is used to determine the containing chart's own
		 * <code>contentBounds</code> property.
		 */
		function get contentBounds():Rectangle;
		
		/**
		 * Indicates the number of pixels of an outer tick.
		 */
		function get outerTickOffset():Number
		
		/**
		 * @private (setter)
		 */
		function set outerTickOffset(value:Number):void		

		/**
		 * Indicates whether the user explicitly set a major unit for the axis of this renderer.
		 */
		function get majorUnitSetByUser():Boolean;
		
		/**
		 * @private (setter)
		 */
		function set majorUnitSetByUser(value:Boolean):void;
	//--------------------------------------
	//  Methods
	//--------------------------------------
	
		/**
		 * Calculates the <code>contentBounds</code> value for the axis renderer.
		 * Seperating this function from the draw method optimizes processing time,
		 * and it allows the chart to synchronize its axes.
		 */
		function updateAxis():void;
	}
}