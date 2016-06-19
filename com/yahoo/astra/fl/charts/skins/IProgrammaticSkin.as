/*
Copyright (c) 2009 Yahoo! Inc.  All rights reserved.  
The copyrights embodied in the content of this file are licensed under the BSD (revised) open source license
*/
﻿package com.yahoo.astra.fl.charts.skins
{
	/**
	 * A type of skin that supports color customization.
	 * 
	 * @author Josh Tynjala
	 */
	public interface IProgrammaticSkin
	{
		
	//--------------------------------------
	//  Properties
	//--------------------------------------
	
		/**
		 * The color used to draw the skin.
		 */
		function get fillColor():uint;
		
		/**
		 * @private
		 */
		function set fillColor(value:uint):void;
		
		/**
		 * The color used for the outline of the skin
		 */
		function get borderColor():uint;
		
		/**
		 * @private
		 */
		function set borderColor(value:uint):void; 
		
		/**
		 * The alpha value of the fill.
		 */
		function get fillAlpha():Number;
		
		/**
		 * @private
		 */
		function set fillAlpha(value:Number):void;
		
		/**
		 * The alpha value of the border.
		 */
		function get borderAlpha():Number;
		
		/**
		 * @private
		 */
		function set borderAlpha(value:Number):void; 
	}
}