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
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class Namespaces 
	{
		public static var ATOM_NS : Namespace = new Namespace("http://www.w3.org/2005/Atom");
		public static var XHTML_NS : Namespace = new Namespace("http://www.w3.org/1999/xhtml");
		public static var GPHOTO_NS : Namespace = new Namespace("http://schemas.google.com/photos/2007");
		public static var OPENSEARCH_NS : Namespace = new Namespace("http://a9.com/-/spec/opensearchrss/1.0/");
		public static var EXIF_NS : Namespace = new Namespace("http://schemas.google.com/photos/exif/2007");
		public static var GEO_NS : Namespace = new Namespace("http://www.w3.org/2003/01/geo/wgs84_pos#");
		public static var GML_NS : Namespace = new Namespace("http://www.opengis.net/gml");
		public static var GEORSS_NS : Namespace = new Namespace("http://www.georss.org/georss");
		public static var PHOTO_NS : Namespace = new Namespace("http://www.pheed.com/pheed/");
		public static var MEDIA_NS : Namespace = new Namespace("http://search.yahoo.com/mrss/");
		public static var BATCH_NS : Namespace = new Namespace("http://schemas.google.com/gdata/batch");
	}
}
