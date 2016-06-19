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
     * User Data Object
     * @author Sandro Ducceschi [swfjunkie.com, Switzerland]
     */
   
    public class UserData
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
        public function UserData( id:String = null,
                                    name:String = null,
                                    screenName:String = null,
                                    location:String = null,
                                    description:String = null,
                                    profileImageUrl:String = null,
                                    url:String = null,
                                    profileProtected:Boolean = false,
                                    followersCount:Number = 0,
                                    extended:ExtendedUserData = null,
                                    lastStatus:StatusData = null) 
        {
            this.id = id;
            this.name = name;
            this.screenName = screenName;
            this.location = location;
            this.description = description;
            this.profileImageUrl = profileImageUrl;
            this.url = url;
            this.profileProtected = profileProtected;
            this.followersCount = followersCount;
            this.extended = extended;
            this.lastStatus = lastStatus;
        }
        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------
        
        public var id:String;
        public var name:String;
        public var screenName:String;
        public var location:String;
        public var description:String;
        public var profileImageUrl:String;
        public var url:String;
        public var profileProtected:Boolean;
        public var followersCount:Number;
        
        // if we are dealing with extended user information you will
        // have to put it or find it within an ExtendedUserData Object
        public var extended:ExtendedUserData;
        
        public var lastStatus:StatusData;
        //--------------------------------------------------------------------------
        //
        //  API
        //
        //--------------------------------------------------------------------------
    }
}