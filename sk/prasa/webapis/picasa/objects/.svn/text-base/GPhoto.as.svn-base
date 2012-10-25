/*
 * The MIT License
 * 
 * Copyright (c) 2008 Michal Gron (michal.gron@gmail.com)
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package sk.prasa.webapis.picasa.objects 
{
	import sk.prasa.webapis.picasa.objects.FeedElement;	
	import sk.prasa.webapis.picasa.objects.Namespaces;	
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 * TODO: ... check types, Number, int, uint, use optimized types!
	 * 
	 */
	public class GPhoto extends FeedElement
	{
		public var kind : String;
	 
		// multiple kinds
		public var albumid : String;			// gphoto:albumid
		public var commentCount : int;			// gphoto:commentCount
		public var commentingEnabled : Boolean;	// gphoto:commentingEnabled
		public var id : String;					// gphoto:id
		
		// user kind
		public var maxPhotosPerAlbum : int;		// gphoto:maxPhotosPerAlbum
		public var nickname : String;			// gphoto:nickname
		public var quotacurrent : Number;		// gphoto:quotacurrent
		public var quotalimit : Number;			// gphoto:quotalimit
		public var thumbnail : String;			// gphoto:thumbnail
		public var user  :String;				// gphoto:user
		
		// album kind
		public var access : String; 			// gphoto:access
		public var bytesUsed : Number; 			// gphoto:bytesUsed
		public var location : String; 			// gphoto:location
		public var name : String; 				// gphoto:name
		public var numphotos : int; 			// gphoto:numphotos
		public var numphotosremaining : int;	//gphoto:numphotosremaining
	
		// photo kind
		public var checksum : String;			// gphoto:checksum
		public var client : String;				// gphoto:client
		public var height : Number;				// gphoto:height
		public var position : Number;			// gphoto:position
		public var rotation : Number;			// gphoto:rotation
		public var size : Number;				// gphoto:size
		public var timestamp : Number;			// gphoto:timestamp
		public var version : String;			// gphoto:version
		public var width : Number;				// gphoto:width
	
		// comment kind
		public var photoid : String; 			// gphoto:photoid
		
		// tag kind
		public var weight : Number; 			// gphoto:weight
		
		private var gphoto_ns : Namespace = Namespaces.GPHOTO_NS;

		public function GPhoto(xmllist : XMLList, k : String)
		{	
			super(xmllist);
			
			kind = k;
			
			// multiple kind
			albumid 			= Utils.parseString(this.data.gphoto_ns::albumid);
			commentCount 		= Utils.parseNumber(this.data.gphoto_ns::commentCount); 
			commentingEnabled 	= Utils.parseString(this.data.gphoto_ns::commentingEnabled) != "false"; 
			id 					= Utils.parseString(this.data.gphoto_ns::id);
			
			switch(kind)
			{
				case Kind.ALBUM: 	
					access 		= Utils.parseString(this.data.gphoto_ns::access); 
					bytesUsed 	= Utils.parseNumber(this.data.gphoto_ns::bytesUsed); 
					location 	= Utils.parseString(this.data.gphoto_ns::location); 
					name 		= Utils.parseString(this.data.gphoto_ns::name);
					numphotos 	= Utils.parseNumber(this.data.gphoto_ns::numphotos); 
					numphotosremaining = Utils.parseNumber(this.data.gphoto_ns::numphotosremaining);
					break;
				case Kind.PHOTO: 	
					checksum 	= Utils.parseString(this.data.gphoto_ns::checksum);
					client 		= Utils.parseString(this.data.gphoto_ns::client); 
					height 		= Utils.parseNumber(this.data.gphoto_ns::height); 
					position 	= Utils.parseNumber(this.data.gphoto_ns::position); 
					rotation 	= Utils.parseNumber(this.data.gphoto_ns::rotation); 
					size 		= Utils.parseNumber(this.data.gphoto_ns::size); 
					timestamp 	= Utils.parseNumber(this.data.gphoto_ns::timestamp); 
					version 	= Utils.parseString(this.data.gphoto_ns::version); 
					width 		= Utils.parseNumber(this.data.gphoto_ns::width);
					break;
				case Kind.USER:
					maxPhotosPerAlbum = Utils.parseNumber(this.data.gphoto_ns::maxPhotosPerAlbum); 
					nickname 	= Utils.parseString(this.data.gphoto_ns::nickname); 
					quotacurrent= Utils.parseNumber(this.data.gphoto_ns::quotacurrent); 
					quotalimit 	= Utils.parseNumber(this.data.gphoto_ns::quotalimit); 
					thumbnail 	= Utils.parseString(this.data.gphoto_ns::thumbnail); 
					user 		= Utils.parseString(this.data.gphoto_ns::user);
					break;
				case Kind.TAG:
					weight = Utils.parseNumber(this.data.gphoto_ns::weight);
					break;
				case Kind.COMMENT: 
					photoid = Utils.parseString(this.data.gphoto_ns::photoid);
					break;
				default: break; 
			}
		}
		
		public function toString() : String
		{
			var tRes : String = "" +
				" albumid=" + albumid +
				", commentCount=" + commentCount +
				", commentingEnabled=" + commentingEnabled +
				", id=" + id;
		
			switch(kind)
			{
				case Kind.ALBUM: 
					tRes += ", access=" + access +
							", bytesUsed=" + bytesUsed +
							", location=" + location +
							", name=" + name +
							", numphotos=" + numphotos +
							", numphotosremaining=" + numphotosremaining;
					break;
				case Kind.PHOTO:
					tRes += ", checksum=" + checksum +
							", client=" + client +
							", height=" + height +
							", position=" + position +
							", rotation=" + rotation +
							", size=" + size +
							", timestamp=" + timestamp +
							", version=" + version +
							", width=" + width;
					break; 
				case Kind.USER:
					tRes +=	", maxPhotosPerAlbum=" + maxPhotosPerAlbum + 
							", nickname=" + nickname +
							", quotacurrent=" + quotacurrent +
							", quotalimit=" + quotalimit +
							", thumbnail=" + thumbnail +
							", user=" + user;
					break;
				case Kind.TAG:
					tRes += ", weight=" + weight;
					break; 
				case Kind.COMMENT:
					tRes += ", photoid=" + photoid;
					break; 
			}
			
			return "[GPhoto " + tRes + "]";
		}			
	}
}
