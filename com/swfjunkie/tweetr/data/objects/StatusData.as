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
package com.swfjunkie.tweetr.data.objects
{	
    /**
     * Twitter Status Data Object 
     * @author Sandro Ducceschi [swfjunkie.com, Switzerland]
     */
   
    public class StatusData
    {
        //--------------------------------------------------------------------------
        //
        //  Class variables
        //
        //--------------------------------------------------------------------------

        //--------------------------------------------------------------------------
        //
        //  Initialization
        //
        //--------------------------------------------------------------------------
        public function StatusData(createdAt:String = null, 
                                    id:String = null, 
                                    text:String = null,
                                    source:String = null,
                                    truncated:Boolean = false,
                                    inReplyToStatusId:String = null,
                                    inReplyToUserId:String = null,
                                    favorited:Boolean = false,
                                    inReplyToScreenName:String = null,
                                    user:UserData = null)
        {
            this.createdAt = createdAt;
            this.id = id;
            this.text = text;
            this.source = source;
            this.truncated = truncated;
            this.inReplyToStatusId = inReplyToStatusId;
            this.inReplyToUserId = inReplyToUserId;
            this.favorited = favorited;
            this.inReplyToScreenName = inReplyToScreenName;
            this.user = user;
        }
        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------
        
        public var createdAt:String;
        public var id:String;
        public var text:String;
        public var source:String;
        public var truncated:Boolean;
        public var inReplyToStatusId:String;
        public var inReplyToUserId:String;
        public var favorited:Boolean;
        public var inReplyToScreenName:String;
        public var retweetedStatus:StatusData;
        public var geoLat:Number;
        public var geoLong:Number;
        public var user:UserData;
        
        //--------------------------------------------------------------------------
        //
        //  API
        //
        //--------------------------------------------------------------------------
    }
}