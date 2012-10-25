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
	import sk.prasa.webapis.picasa.objects.Kind;
	import sk.prasa.webapis.picasa.objects.Namespaces;
	import sk.prasa.webapis.picasa.objects.Utils;
	import sk.prasa.webapis.picasa.objects.feed.AlbumEntry;
	import sk.prasa.webapis.picasa.objects.feed.AlbumMeta;
	import sk.prasa.webapis.picasa.objects.feed.Parser;		
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * TODO: we should avoid more types of Feed, Meta and Entry. this is confusing.
	 * TODO: after receiving the entries in Array, the user doesn't now what kind of entries there are!
	 */
	public class AtomFeed extends Parser implements IAtom 
	{
		private var __meta : IMeta;
		private var __entries : Array;		//[ArrayElementType("sk.prasa.webapis.picasa.objects.feed.Entry")]
		
		private var atom_ns : Namespace = Namespaces.ATOM_NS;
		
		/**
		 * AtomFeed constructor.
		 * 
		 * @param xml XML Pass XML data to the constructor, to have it available in the this.data property 
		 */
		public function AtomFeed(xml : XML)
		{
			super(xml);
		}
		
		/**
		 * 
		 */
		public function get meta() : IMeta
		{
			if (__meta == null)
			{
				switch(Utils.parseString(this.data.atom_ns::category.@term))
				{
					case Kind.USER: 	__meta = new UserMeta(XMLList(this.data)); break;
					case Kind.ALBUM: 	__meta = new AlbumMeta(XMLList(this.data)); break;
					case Kind.PHOTO:	__meta = new PhotoMeta(XMLList(this.data)); break;
					// default, e.g. Community Meta doesn't have any meta category!	
					default: 			__meta = new Meta(XMLList(this.data)); break;
					
				}
			}
			
			return __meta;
		}
		
		/**
		 * 
		 */
		public function set meta(aMeta : IMeta) : void
		{
			// TODO: ...
		}
		
		/**
		 * 
		 */
		public function get entries() : Array
		{
			if (this.data.atom_ns::entry == null)
			{
				return null;
			}

			if (__entries == null)
			{
				__entries = new Array();
				
				for each (var node : XML in this.data.atom_ns::entry)
				{
					switch(Utils.parseString(node.atom_ns::category.@term))
					{
						case Kind.USER: 	__entries.push(new UserEntry(XMLList(node))); break;
						case Kind.ALBUM:	__entries.push(new AlbumEntry(XMLList(node))); break;
						case Kind.PHOTO: 	__entries.push(new PhotoEntry(XMLList(node))); break;
						case Kind.TAG: 		__entries.push(new TagEntry(XMLList(node))); break;
						case Kind.COMMENT: 	__entries.push(new CommentEntry(XMLList(node))); break;
						default: 			__entries.push(new Entry(XMLList(node))); break;			
					}
				}
			}
			
			return __entries;
		}
		
		/**
		 * 
		 */
		public function set entries(aEntries : Array) : void
		{
			// TODO: ...
		}
	}
}
