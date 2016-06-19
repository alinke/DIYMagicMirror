/*
Copyright (c) 2009 Yahoo! Inc.  All rights reserved.  
The copyrights embodied in the content of this file are licensed under the BSD (revised) open source license
*/
package com.yahoo.astra.fl.charts.axes
{
	import com.yahoo.astra.fl.charts.IChart;
	
	/**
	 * Data-only representation of a chart's axis.
	 * 
	 * @author Josh Tynjala
	 */
	public interface IAxis
	{
		/**
		 * The chart in which this axis appears.
		 */
		function get chart():IChart;
		
		/**
		 * @private
		 */
		function set chart(value:IChart):void;
		
		/**
		 * The visual renderer associated with this axis.
		 */
		function get renderer():IAxisRenderer;
		
		/**
		 * @private
		 */
		function set renderer(value:IAxisRenderer):void;
		
		/**
		 * Sets the direction of the labels and other visual objects along the axis.
		 * By default, vertical axes draw objects from bottom to top, and horizontal
		 * axes draw objects from left to right.
		 */
		function get reverse():Boolean;
		
		/**
		 * @private
		 */
		function set reverse(value:Boolean):void;
		
		/**
		 * The text that will appear next to the axis to indicate information
		 * about the data that it displays.
		 */
		function get title():String;
		
		/**
		 * @private
		 */
		function set title(value:String):void;
		
		/**
		 * A function may be set to determine the text value of the labels.
		 * 
		 * <pre>function labelFunction(value:Object):String</pre>
		 */
		function get labelFunction():Function;
		
		/**
		 * @private
		 */
		function set labelFunction(value:Function):void
		
		/**
		 * Gets or sets the maximum width of a label
		 */
		function get maxLabelWidth():Number;
		
		/**
		 * @private (setter)
		 */
		function set maxLabelWidth(value:Number):void;
		/**
		 * Gets or sets the maximum width of a label
		 */
		function get maxLabelHeight():Number;
		
		/**
		 * @private (setter)
		 */
		function set maxLabelHeight(value:Number):void;		

		/**
		 * Data used in determining the axis scale
		 */
		function get dataProvider():Array;
		
		/**
		 * @private (setter)
		 */
		function set dataProvider(value:Array):void;
		
		/**
		 * @private
		 */
		function get numLabels():Number;
		
		/**
		 * @private (setter)
		 */
		function set numLabels(value:Number):void;

		/**
		 * The space, in pixels, between labels on an axis.
		 */
		function get labelSpacing():Number;
		
		/**
		 * @private (setter)
		 */
		function set labelSpacing(value:Number):void; 
		
		/**
		 * Determines the axis scale based on the input data set.
		 * Seperating this function from the draw method optimizes processing time,
		 * and it allows the chart to synchronize its axes.
		 * 
		 */
		function updateScale():void;
		
		/**
		 * Calculates the position of a data point along the axis.
		 * 
		 * @param value		The data used to determine the position
		 * @return			The display position in pixels on the axis
		 */
		function valueToLocal(value:Object):Number;
		
		/**
		 * Converts a value on the axis to formatted label text.
		 * 
		 * @param value		the value of the item for which a label is needed
		 * @return			the formatted label text
		 */
		function valueToLabel(value:Object):String;
		
		/**
		 * Returns the maximum string length of a label on the axis.
		 *
		 * @return 			the formatted label
		 */
		function getMaxLabel():String;		
	}
}