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
     * Search Results Data Object
     * @author Sandro Ducceschi [swfjunkie.com, Switzerland]
     */
   
    public class SearchResultData
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
        public function SearchResultData(
                                         id:String = null, 
                                         link:String = null, 
                                         text:String = null, 
                                         createdAt:String = null, 
                                         userProfileImage:String = null, 
                                         user:String = null, 
                                         userLink:String = null) 
        {
            this.id = id;
            this.link = link;
            this.text = text;
            this.createdAt = createdAt;
            this.userProfileImage = userProfileImage;
            this.user = user;
            this.userLink = userLink;
        }
        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------
        public var id:String;
        public var link:String;
        public var text:String;
        public var createdAt:String;
        public var userProfileImage:String;
        public var user:String;
        public var userLink:String;
        //--------------------------------------------------------------------------
        //
        //  API
        //
        //--------------------------------------------------------------------------
    }
}