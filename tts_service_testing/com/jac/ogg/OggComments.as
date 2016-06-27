/*
Copyright (c)2011 Hook L.L.C

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

package com.jac.ogg
{//Package
	/**
	 * OggComments is just a simple storage structure for the supported ogg comment tags.
	 * 
	 * Our encoder currently supports:
	 * TITLE
	 * VERSION
	 * ALBUM
	 * TRACKNUMBER
	 * ARTIST
	 * PERFORMER
	 * COPYRIGHT
	 * LICENSE
	 * ORGANIZATION
	 * DESCRIPTION
	 * GENRE
	 * DATE
	 * LOCATION
	 * CONTACT
	 * ISRC
	 * 
	 * @author Jake Callery
	 * Hook - http://www.byhook.com
	 */
	dynamic public class OggComments
	{//OggComments Class
	
		public var title:String = "";
		public var version:String = "";
		public var album:String = "";
		public var trackNumber:String = "";
		public var artist:String = "";
		public var performer:String = "";
		public var copyright:String = "";
		public var license:String = "";
		public var organization:String = ""
		public var description:String = "";
		public var genre:String = "";
		public var date:String = "";
		public var location:String = "";
		public var contact:String = "";
		public var isrc:String = "";
		
		public function OggComments() 
		{//OggComments
		}//OggComments
		
		public function populateFromCommentList($commentList:Array):void
		{//populateFromCommentList
			for (var i:int = 0; i < $commentList.length; i++)
			{//parse
				var prop:String;
				var value:String;
				var isKnown:Boolean = false;
				var tokens:Array = $commentList[i].split("=");
				
				prop = tokens[0] as String;
				if (tokens.length > 1)
				{//save value
					value = tokens[1];
				}//save value
				
				switch(prop)
				{//switch
					case "TITLE":
						title = value;
					break;
					
					case "VERSION":
						version = value;
					break;
					
					case "ALBUM":
						album = value;
					break;
					
					case "TRACKNUMBER":
						trackNumber = value;
					break;
					
					case "ARTIST":
						artist = value;
					break;
					
					case "PERFORMER":
						performer = value;
					break;
					
					case "COPYRIGHT":
						copyright = value;
					break;
					
					case "LICENSE":
						license = value;
					break;
					
					case "ORGANIZATION":
						organization = value;
					break;
					
					case "DESCRIPTION":
						description = value;
					break;
					
					case "GENRE":
						genre = value;
					break;
					
					case "DATE":
						date = value;
					break;
					
					case "LOCATION":
						location = value;
					break;
					
					case "CONTACT":
						contact = value;
					break;
					
					case "ISRC":
						isrc = value;
					break;
					
					default:
						this[prop] = value;
					break;
				}//switch
				
				
			}//parse
		}//populateFromCommentList
		
		
	}//OggComments Class

}//Package