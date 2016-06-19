/*
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or 
 *  (at your option) any later version.
 * 
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/lgpl-3.0.txt>.
 */
package com.swfjunkie.tweetr.oauth.events
{
	import flash.events.Event;
	
    /**
     * Event Class Description
     * @author Sandro Ducceschi [swfjunkie.com, Switzerland]
     */
   
    public class OAuthEvent extends Event
    {
        //--------------------------------------------------------------------------
        //
        //  Class variables
        //
        //--------------------------------------------------------------------------
        /**
         * <p>The event returns the following properties:</p>
         * <table class=innertable>
         * <tr><th>Property</th><th>Value</th></tr>
         * <tr><td>url</td><td>Returns the Authorization URL when getAuthorizationRequest() was successful.</td></tr>
         * </table>
         *
         * @eventType complete
         */
        public static const COMPLETE:String = "complete";
        
        /**
         * <p>The event returns the following properties:</p>
         * <table class=innertable>
         * <tr><th>Property</th><th>Value</th></tr>
         * <tr><td>text</td><td>Contains an error message</td></tr>
         * </table>
         *
         * @eventType error
         */
        public static const ERROR:String = "error";
        //--------------------------------------------------------------------------
        //
        //  Initialization
        //
        //--------------------------------------------------------------------------
        public function OAuthEvent(type:String, url:String = null, text:String = null, bubbles:Boolean=false, cancelable:Boolean=false) 
        {
			super(type, bubbles, cancelable);
            this.url = url;
            this.text = text;
        }
        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------
        public var url:String;
        public var text:String;
        //--------------------------------------------------------------------------
        //
        //  Methods
        //
        //--------------------------------------------------------------------------
        override public function clone():Event
        {
        	return new OAuthEvent(type, url, text, bubbles, cancelable);
        }
    }
}