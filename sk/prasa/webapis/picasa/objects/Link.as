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
	public class Link 
	{
		public static const REL_ALTERNATE : String = "alternate";
		public static const REL_RELATED : String = "related";
		public static const REL_SELF : String = "self";
		public static const REL_ENCLOSURE : String = "enclosure";
		public static const REL_VIA : String = "via";
		
		public static const REL_PREV : String = "prev";
		public static const REL_NEXT : String = "next";
		public static const REL_FEED : String = "http://schemas.google.com/g/2005#feed";
		public static const REL_SLIDESHOW : String = "http://schemas.google.com/photos/2007#slideshow"; 
		
		public var rel : String;
		public var type : String;
		public var hreflang : String;
		public var href : String;
		public var title : String;
		public var length : Number;
		
		public function Link(aRel : String = null, 
							aType : String = null, 
							aHrefLang : String = null, 
							aHref : String = null, 
							aTitle : String = null, 
							aLength : Number = 0)
		{
			rel = aRel;
			type = aType;
			hreflang = aHrefLang;
			href = aHref;
			title = aTitle;
			length = aLength;
		}
		
		public function toString() : String
		{
			return "[Link " +
				" rel=" + rel + 
				", type=" + type + 
				", hreflang=" + hreflang +
				", href=" + href + 
				", title=" + title +
				", length=" + length + "]";
		}
	}
}
