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
     * Direct Message Data Object 
     * @author Sandro Ducceschi [swfjunkie.com, Switzerland]
     */
   
    public class DirectMessageData
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
        public function DirectMessageData(id:String = null,
                                           senderId:String = null,
                                           text:String = null,
                                           recipientId:String = null,
                                           createdAt:String = null,
                                           senderScreenName:String = null,
                                           recipientScreenName:String = null,
                                           sender:UserData = null,
                                           recipient:UserData = null ) 
        {
            this.id = id;
            this.senderId = senderId;
            this.text = text;
            this.recipientId = recipientId;
            this.createdAt = createdAt;
            this.senderScreenName = senderScreenName;
            this.recipientScreenName = recipientScreenName;
            this.sender = sender;
            this.recipient = recipient;
        }
        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------
        public var id:String;
        public var senderId:String;
        public var text:String;
        public var recipientId:String;
        public var createdAt:String;
        public var senderScreenName:String;
        public var recipientScreenName:String;
        public var sender:UserData;
        public var recipient:UserData;
        //--------------------------------------------------------------------------
        //
        //  API
        //
        //--------------------------------------------------------------------------
    }
}