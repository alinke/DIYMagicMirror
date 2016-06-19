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
package com.swfjunkie.tweetr.oauth
{
    import flash.net.URLVariables;
    
    /**
     * Interface for the OAuth Class
     * @author Sandro Ducceschi [swfjunkie.com, Switzerland]
     */ 
    
    public interface IOAuth
    {
        /**
         * Signs a Request and returns an proper encoded argument string.
         * @param method    The URLRequest Method used. Valid values are POST and GET
         * @param url       The Request URL
         * @param urlVars   URLVariables that need to be signed
         */ 
        function getSignedRequest(method:String, url:String, urlVars:URLVariables = null):String;
        /**
         * Get the twitter user_id (retrieval only available after successful user authorization)
         */
        function get userId():String;
        /**
         * Get/Set the twitter screen_name/username
         * <b>NOTICE:</b> Setting the username to a different user
         * than authorized via the tokens, may cause request to fail.
         */
        function get username():String;
        function set username(value:String):void;
    }
}