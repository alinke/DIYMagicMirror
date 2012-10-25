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

package sk.prasa.webapis.picasa.objects.feed 
{
	import flash.geom.Point;
	
	import sk.prasa.webapis.picasa.objects.Exif;
	import sk.prasa.webapis.picasa.objects.GPhoto;
	import sk.prasa.webapis.picasa.objects.Geo;
	import sk.prasa.webapis.picasa.objects.Kind;
	import sk.prasa.webapis.picasa.objects.Media;
	import sk.prasa.webapis.picasa.objects.Namespaces;
	import sk.prasa.webapis.picasa.objects.Utils;
	import sk.prasa.webapis.picasa.objects.feed.Entry;
	import sk.prasa.webapis.picasa.objects.feed.IEntry;		
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class PhotoEntry extends Entry implements IEntry 
	{
		private var exif_ns : Namespace = Namespaces.EXIF_NS;
		private var georss_ns : Namespace = Namespaces.GEORSS_NS;
		private var gml_ns : Namespace = Namespaces.GML_NS;
		
		public function PhotoEntry(xmllist : XMLList)
		{
			super(xmllist);
		}

		//dopisat metody typicke pre PhotoEntry
		
		public function get gphoto() : GPhoto
		{
			var tGPhoto : GPhoto = new GPhoto(this.data, Kind.PHOTO);
			return tGPhoto;
		}
		
		public function set gphoto(aGPhoto : GPhoto) : void
		{
			// TODO: ...
		}
		
		public function get media() : Media
		{
			var tMedia : Media = new Media(this.data);
			return tMedia;
		}
		
		public function set media(aMedia : Media) : void
		{
			// TODO: ...
		}
		
		public function get exif() : Exif
		{
			var tExif : Exif = new Exif();
				tExif.distance 		= Utils.parseNumber(this.data.exif_ns::tags.exif_ns::distance);
				tExif.exposure 		= Utils.parseNumber(this.data.exif_ns::tags.exif_ns::exposure);
				tExif.flash 		= this.data.exif_ns::tags.exif_ns::flash != "false";
				tExif.focallength 	= Utils.parseNumber(this.data.exif_ns::tags.exif_ns::focallength);
				tExif.fstop 		= Utils.parseNumber(this.data.exif_ns::tags.exif_ns::fstop);
				tExif.imageUniqueID = Utils.parseString(this.data.exif_ns::tags.exif_ns::imageUniqueID);
				tExif.iso 			= Utils.parseNumber(this.data.exif_ns::tags.exif_ns::iso);
				tExif.make 			= Utils.parseString(this.data.exif_ns::tags.exif_ns::make);
				tExif.model 		= Utils.parseString(this.data.exif_ns::tags.exif_ns::model);
				tExif.time 			= Utils.parseNumber(this.data.exif_ns::tags.exif_ns::time);
			
			return tExif;
		}
		
		public function set exif(aExif :Exif) : void
		{
			// TODO: ...
		}
		
		public function get geo() : Geo
		{
			var tGeo : Geo = new Geo();
			
			try
			{
				var tGeoArray : Array = this.data.georss_ns::where.gml_ns::Point.gml_ns::pos.split(" ");
				
				tGeo.latitude = tGeoArray[0];
				tGeo.longitude = tGeoArray[1];
				
			} catch(e : Error)
			{
				//if album/photo doesn't contains any geo info
			}
			
			return tGeo;
		}
		
		public function set get(aGeo : Geo) : void
		{
			// TODO: ...
		}
	}
}
