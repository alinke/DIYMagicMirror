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
     * Object Class Description
     * @author Sandro Ducceschi [swfjunkie.com, Switzerland]
     */
   
    public class RelationData
    {
        //--------------------------------------------------------------------------
        //
        //  Class variables
        //
        //--------------------------------------------------------------------------
        public static const RELATION_TYPE_SOURCE:String = "source";
        public static const RELATION_TYPE_TARGET:String = "target";
        //--------------------------------------------------------------------------
        //
        //  Initialization
        //
        //--------------------------------------------------------------------------
        public function RelationData() 
        {
        }
        //--------------------------------------------------------------------------
        //
        //  Properties
        //
        //--------------------------------------------------------------------------
        public var type:String;
        public var id:String;
        public var screenName:String;
        public var following:Boolean;
        public var followedBy:Boolean;
        public var notificationsEnabled:Boolean
        //--------------------------------------------------------------------------
        //
        //  API
        //
        //--------------------------------------------------------------------------
    }
}